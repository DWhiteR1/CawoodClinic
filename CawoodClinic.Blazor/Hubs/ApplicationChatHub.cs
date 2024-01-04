using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Newtonsoft.Json;
//using Newtonsoft.Json.Linq;
using CawoodClinic.Shared.Authentication;
using CawoodClinic.Shared.Devices;
using CawoodClinic.Shared.Dto;
using CawoodClinic.Shared.Enums;
using CawoodClinic.Shared.Model;
using CawoodClinic.Shared.User;
using CawoodClinic.Blazor.Data;
using CawoodClinic.Blazor.Data.Extensions;
using CawoodClinic.Blazor.Data.Models;
using CawoodClinic.Blazor.Models;
using System.Diagnostics;
using System.Runtime.CompilerServices;
using System.Security.Claims;
using System.Text;
using System.Threading;

namespace CawoodClinic.Blazor.Hubs;

[Authorize]
public class ApplicationChatHub : Hub
{
    private readonly static ApplicationChatHubConnectionManager _chatUsers = new ApplicationChatHubConnectionManager();
    private readonly ApplicationDbContext _DbContext;

    //Add Constructor
    public ApplicationChatHub(ApplicationDbContext DbContext)
    {
        _DbContext = DbContext;
    }

    public void SendMessage(string userId, string message)
    {
        ApplicationChatUser user = _chatUsers.GetUser(u => u.UserId == userId);

        foreach (var device in _chatUsers.ConnectedDevices(user))
        {
            Clients.Client(device.ConnectionId).SendAsync("ReceiveMessage", userId, message);
        }
    }





    public void ClientPing()
    {
        //This method is used by the client for the initial connection to the hub.
        //to catch errors and reconnect if required. 
    }




    public async IAsyncEnumerable<byte[]> GetUserList()
    {
        ApplicationChatUser rtmUser = CreateUserFromContext(Context);

        int MaxChunkSize = 16384;
        var retval = "";

        var aspNetUsers = await _DbContext.GetCompanyUserListAsync(rtmUser.UserId);

        List<ApplicationChatInfo> applicationChatInfo = new List<ApplicationChatInfo>();
        foreach (var user in aspNetUsers)
        {
            var chatInfo = new ApplicationChatInfo(user.Id, user.UserName, "");
            var connectedUser = _chatUsers.GetUser(u => u.UserId == user.Id);

            if (connectedUser != null)
            {
                chatInfo.IsOnline = true;
                chatInfo.Role = connectedUser.Role;
                chatInfo.Devices = _chatUsers.ConnectedDevices(connectedUser).ToList();
            }

            applicationChatInfo.Add(chatInfo);
        }


        retval = JsonConvert.SerializeObject(applicationChatInfo);
        var bytes = Encoding.UTF8.GetBytes(retval);

        // Send data to the specific client in smaller chunks
        for (int i = 0; i < bytes.Length; i += MaxChunkSize)
        {
            int chunkSize = Math.Min(MaxChunkSize, bytes.Length - i);
            byte[] chunk = new byte[chunkSize];
            Array.Copy(bytes, i, chunk, 0, chunkSize);

            yield return chunk;
        }
    }

    public async IAsyncEnumerable<byte[]> SyncDbTableAsync(DBSyncTable table, [EnumeratorCancellation] CancellationToken cancellationToken)
    {

        ApplicationChatDevice rtmClientDevice = CreateDeviceFromContext(Context);
        ApplicationChatUser rtmUser = CreateUserFromContext(Context);

        int MaxChunkSize = 16384;

        var syncCount = await _DbContext.GetSyncDataRowCountByTableAsync(rtmUser.UserId, rtmClientDevice.DeviceID, table.LastSyncVersion, rtmClientDevice.NameSpace, table.TableName);

        var retval = await _DbContext.GetSyncDataByTableAsync(rtmUser.UserId, rtmClientDevice.DeviceID, table.LastSyncVersion, rtmClientDevice.NameSpace, table.TableName);

        var bytes = Encoding.UTF8.GetBytes(retval);

        // Send data to the specific client in smaller chunks
        for (int i = 0; i < bytes.Length; i += MaxChunkSize)
        {
            int chunkSize = Math.Min(MaxChunkSize, bytes.Length - i);
            byte[] chunk = new byte[chunkSize];
            Array.Copy(bytes, i, chunk, 0, chunkSize);

            yield return chunk;
        }

        DBSyncInfo dBSyncInfo = new DBSyncInfo(table.TableName, syncCount, DateTime.Now, Shared.Enums.SyncDirectionEnum.DownToClient);
        var chatDevice = _chatUsers.UpdateDeviceSyncInfo(rtmUser, rtmClientDevice, dBSyncInfo);

        var roles = Context.User.Claims.Where(x => x.Type == ClaimTypes.Role).Select(x => x.Value).ToList();
        foreach (var role in roles)
        {
            await Clients.Group(role).SendAsync("ApplicationChatDeviceUpdated", chatDevice);
        }
    }

    public async Task SyncDbTableFromClientAsync(IAsyncEnumerable<byte[]> stream)
    {
        ApplicationChatDevice device = CreateDeviceFromContext(Context);
        ApplicationChatUser rtmUser = CreateUserFromContext(Context);

        List<byte> receivedData = new List<byte>();

        await foreach (var data in stream)
        {
            receivedData.AddRange(data);
        }

        string receivedString = Encoding.UTF8.GetString(receivedData.ToArray());

        var syncData = JsonConvert.DeserializeObject<SyncData>(receivedString);

        try
        {
            receivedData.Clear();

            var retval = await _DbContext.MergeSyncDataByTableAsync(device.DeviceID, syncData.ReceivedString, device.NameSpace, syncData.TableName);
            MergeResult result = JsonConvert.DeserializeObject<MergeResult>(retval);
            var syncCount = result.Inserted + result.Updated;

            DBSyncInfo dBSyncInfo = new DBSyncInfo(syncData.TableName, syncCount, DateTime.Now, CawoodClinic.Shared.Enums.SyncDirectionEnum.UpToServer);
            var chatDevice = _chatUsers.UpdateDeviceSyncInfo(rtmUser, device, dBSyncInfo);

            var roles = Context.User.Claims.Where(x => x.Type == ClaimTypes.Role).Select(x => x.Value).ToList();
            foreach (var role in roles)
            {
                await Clients.Group(role).SendAsync("ApplicationChatDeviceUpdated", chatDevice);
            }

        }
        catch (Exception ex)
        {
            var message = ex.Message;
        }

    }

    private void ClientConnected(string ConnectionId)
    {
        Clients.Client(ConnectionId).SendAsync("Connected", ConnectionId);
    }

    private void RequestDbSync(string ConnectionId)
    {
        Clients.Client(ConnectionId).SendAsync("RequestDbSync");
    }

    public void SendDbSyncRequestToCaller()
    {
        Clients.Client(Context.ConnectionId).SendAsync("RequestDbSync");
    }

    private async Task SetClientLogLevel(string ConnectionId, LogEventLevel logLevel)
    {
        await Clients.Client(ConnectionId).SendAsync("SetLogLevel", logLevel);
        await Clients.Client(ConnectionId).SendAsync("RequestLogLevel");
    }

    private async void RequestLogLevel(string ConnectionId)
    {
        await Clients.Client(ConnectionId).SendAsync("RequestLogLevel");
    }
    public void LogLevelRequested(LogEventLevel logLevel)
    {
        ApplicationChatUser user = CreateUserFromContext(Context);
        ApplicationChatDevice device = CreateDeviceFromContext(Context);
        _ = _chatUsers.UpdateDeviceLogLevel(user, device, logLevel);

    }

    public async Task SetDeviceLogLevel(LogEventLevel logLevel, string deviceId)
    {
        var device = _chatUsers.GetDeviceById(deviceId);
        if (device is null)
        {
            return;
        }
; await SetClientLogLevel(device.ConnectionId, logLevel);
    }

    private void PublishConnectedUsers()
    {
        try
        {
            List<ApplicationChatUser> users = _chatUsers.GetUsers(u => true).ToList();

            Clients.All.SendAsync("ReceiveConnectedClients", users);
        }
        catch (Exception ex)
        {
            var message = ex.Message;
        }
    }

    private void PublishUserConnected(ApplicationChatUser user)
    {
        try
        {
            ApplicationChatInfo applicationChatInfo = new ApplicationChatInfo(user.UserId, user.UserName, user.Role);
            applicationChatInfo.IsOnline = true;
            applicationChatInfo.Devices = _chatUsers.ConnectedDevices(user).ToList();

            Clients.All.SendAsync("ReceiveConnectedClientsChanged", applicationChatInfo);
        }
        catch (Exception ex)
        {
            var message = ex.Message;
        }
    }

    private void PublishConnectedDevices()
    {
        try
        {
            var devices = _chatUsers.GetAllDevices();

            Clients.All.SendAsync("ReceiveConnectedDevices", devices);
        }
        catch (Exception ex)
        {
            var message = ex.Message;
        }
    }

    public override async Task OnConnectedAsync()
    {

        ApplicationChatUser applicationChatUser = CreateUserFromContext(Context);
        ApplicationChatDevice applicationChatDevice = CreateDeviceFromContext(Context);

        _chatUsers.Add(applicationChatUser, applicationChatDevice);

        var roles = Context.User.Claims.Where(x => x.Type == ClaimTypes.Role).Select(x => x.Value).ToList();
        foreach (var role in roles)
        {
            await Groups.AddToGroupAsync(Context.ConnectionId, role);
        }
        ClientConnected(Context.ConnectionId);

        PublishConnectedUsers();
        PublishUserConnected(applicationChatUser);
        PublishConnectedDevices();
        RequestLogLevel(Context.ConnectionId);
        RequestDbSync(Context.ConnectionId);

        await base.OnConnectedAsync();
    }

    public override async Task OnDisconnectedAsync(Exception exception)
    {
        ApplicationChatUser applicationChatUser = CreateUserFromContext(Context);
        ApplicationChatDevice applicationChatDevice = CreateDeviceFromContext(Context);

        _chatUsers.Remove(applicationChatUser, applicationChatDevice);

        var roles = Context.User.Claims.Where(x => x.Type == ClaimTypes.Role).ToList();
        foreach (var role in roles)
        {
            await Groups.RemoveFromGroupAsync(Context.ConnectionId, role.Value);
        }

        PublishConnectedUsers();
        PublishConnectedDevices();
        await base.OnDisconnectedAsync(exception);
    }

    private ApplicationChatUser CreateUserFromContext(HubCallerContext context)
    {
        var userName = Context.User.Claims.Where(x => x.Type == ClaimTypes.Name).Select(x => x.Value).FirstOrDefault();
        var userId = Context.User.Claims.Where(x => x.Type == ClaimTypes.NameIdentifier).Select(x => x.Value).FirstOrDefault();
        var roles = Context.User.Claims.Where(x => x.Type == ClaimTypes.Role).Select(x => x.Value).ToList();
        var role = string.Join("; ", roles);


        var user = new ApplicationChatUser(userId, userName, role);
        return user;
    }

    private ApplicationChatDevice CreateDeviceFromContext(HubCallerContext context)
    {
        try
        {

            var infoProps = Context.User.Claims
                .Where(x => x.Type == "DeviceInfo")
                .Select(x => x.Value)
                .ToDictionary(
                    x => x.Split('|')[0], // Key: The part before the first pipe (|)
                    x => x.Split('|')[1]  // Value: The part after the first pipe (|)
                );

            Type authRequestInfo = typeof(AuthRequestInfo);

            var userDevicepermissions = Context.User.Claims.Where(x => x.Type == "Permission").Select(x => x.Value).ToList();

            var device = new ApplicationChatDevice(context.ConnectionId
                                            , infoProps[authRequestInfo.GetProperty(nameof(AuthRequestInfo.DeviceID)).Name]
                                            , Context.User.Claims.Where(x => x.Type == ClaimTypes.NameIdentifier).Select(x => x.Value).FirstOrDefault()
                                            , Context.User.Claims.Where(x => x.Type == ClaimTypes.Name).Select(x => x.Value).FirstOrDefault()
                                            , infoProps[authRequestInfo.GetProperty(nameof(AuthRequestInfo.DeviceModel)).Name]
                                            , infoProps[authRequestInfo.GetProperty(nameof(AuthRequestInfo.DeviceManufacturer)).Name]
                                            , infoProps[authRequestInfo.GetProperty(nameof(AuthRequestInfo.DeviceName)).Name]
                                            , infoProps[authRequestInfo.GetProperty(nameof(AuthRequestInfo.OSVersion)).Name]
                                            , infoProps[authRequestInfo.GetProperty(nameof(AuthRequestInfo.Idiom)).Name]
                                            , infoProps[authRequestInfo.GetProperty(nameof(AuthRequestInfo.Platform)).Name]
                                            , infoProps[authRequestInfo.GetProperty(nameof(AuthRequestInfo.Version)).Name]
                                            , infoProps[authRequestInfo.GetProperty(nameof(AuthRequestInfo.ApplicationName)).Name]
                                            , infoProps[authRequestInfo.GetProperty(nameof(AuthRequestInfo.NameSpace)).Name]
                                            );
            return device;
        }
        catch (Exception ex)
        {
            var message = ex.Message;
            return null;
        }
    }
}
