using CawoodClinic.Shared.Devices;
using CawoodClinic.Shared.Enums;
using CawoodClinic.Shared.Model;
using CawoodClinic.Shared.User;
using CawoodClinic.Blazor.ExtensionMethods;
using System.Collections.Concurrent;
using System.Collections.Generic;

namespace CawoodClinic.Blazor.Hubs;

public class ApplicationChatHubConnectionManager : IDisposable
{
    private readonly ConcurrentDictionary<ApplicationChatUser, HashSet<ApplicationChatDevice>> _connectedDevices = new ConcurrentDictionary<ApplicationChatUser, HashSet<ApplicationChatDevice>>();
    public int Count { get { return _connectedDevices.Count; } }

    /// <summary>
    /// Attempts to add the specified userid and connectionid
    /// </summary>
    public void Add(ApplicationChatUser user, ApplicationChatDevice device)
    {
        HashSet<ApplicationChatDevice> connections = _connectedDevices.GetOrAdd(user, new HashSet<ApplicationChatDevice>());
        lock (connections)
        {
            connections.Add(device);
        }
    }

    public IEnumerable<ApplicationChatDevice> ConnectedDevices(ApplicationChatUser user)
    {
        HashSet<ApplicationChatDevice> connectedDevices;
        if (_connectedDevices.TryGetValue(user, out connectedDevices))
        {
            return connectedDevices;
        }

        return Enumerable.Empty<ApplicationChatDevice>();
    }

    public ApplicationChatDevice? UpdateDeviceSyncInfo(ApplicationChatUser user, ApplicationChatDevice device, DBSyncInfo syncInfo)
    {
        ApplicationChatDevice chatDevice = null; 
        HashSet<ApplicationChatDevice> connectedDevices;
        if (_connectedDevices.TryGetValue(user, out connectedDevices))
        {
            if(connectedDevices.TryGetValue(device, out chatDevice))
            {
                if(syncInfo.TableName == "DBSync")
                {
                    chatDevice.SyncInfo.Clear();
                }    
                chatDevice.SyncInfo.AddOrUpdate(syncInfo);
            }
        }
        return chatDevice;
    }

    public ApplicationChatDevice? UpdateDeviceLogLevel(ApplicationChatUser user, ApplicationChatDevice device, LogEventLevel logLevel)
    {
        ApplicationChatDevice chatDevice = null;
        HashSet<ApplicationChatDevice> connectedDevices;
        if (_connectedDevices.TryGetValue(user, out connectedDevices))
        {
            if (connectedDevices.TryGetValue(device, out chatDevice))
            {
                    chatDevice.LogLevel = logLevel;
            }
        }
        return chatDevice;
    }


    public IEnumerable<ApplicationChatDevice> GetAllDevices()
    {
        IEnumerable<ApplicationChatDevice> connectedDevices = _connectedDevices.Values.SelectMany(devices => devices);
        if (connectedDevices.Any())
        {
            return connectedDevices;
        }
        return Enumerable.Empty<ApplicationChatDevice>();
    }

    public IEnumerable<ApplicationChatUser> Users()
    {
        return _connectedDevices.Keys;
    }

    public ApplicationChatUser GetUser(Func<ApplicationChatUser, bool> getUserQuery)
    {
        return _connectedDevices.Keys.FirstOrDefault(getUserQuery);
    }


    public ApplicationChatDevice? GetDeviceById(string deviceId)
    {
        return _connectedDevices.Values.SelectMany(devices => devices).FirstOrDefault(device => device.DeviceID == deviceId);
    }

    public IEnumerable<ApplicationChatUser> GetUsers(Func<ApplicationChatUser, bool> getUsersQuery)
    {
        return _connectedDevices.Keys.Where(getUsersQuery);
    }

    /// <summary>
    /// Attempts to remove a connectionid that has the specified userid
    /// </summary>
    public void Remove(ApplicationChatUser user, ApplicationChatDevice connectedDevice)
    {
        HashSet<ApplicationChatDevice> connectedDevices;
        if (!_connectedDevices.TryGetValue(user, out connectedDevices))
        {
            return;
        }

        lock (connectedDevices)
        {
            connectedDevices.Remove(connectedDevice);

            if (connectedDevices.Count == 0)
            {
                HashSet<ApplicationChatDevice> emptyConnections;
                _connectedDevices.TryRemove(user, out emptyConnections);
            }
        }
    }

    #region IDisposable Support

    private bool disposedValue = false; // To detect redundant calls

    protected virtual void Dispose(bool disposing)
    {
        if (!disposedValue)
        {
            if (disposing)
            {
                _connectedDevices.Clear();
            }

            // TODO: free unmanaged resources (unmanaged objects) and override a finalizer below.
            // TODO: set large fields to null.

            disposedValue = true;
        }
    }

    // This code added to correctly implement the disposable pattern.
    public void Dispose()
    {
        // Do not change this code. Put cleanup code in Dispose(bool disposing) above.
        Dispose(true);
        // TODO: uncomment the following line if the finalizer is overridden above.
        // GC.SuppressFinalize(this);
    }



    #endregion IDisposable Support
}