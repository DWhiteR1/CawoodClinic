using CawoodClinic.Shared.Authentication;
using CawoodClinic.Shared.Dto;
using CawoodClinic.Shared.Enums;
using CawoodClinic.Shared.Model;

namespace CawoodClinic.Shared.Devices;

public class ApplicationChatDevice
{
    public ApplicationChatDevice(string connectionId, string deviceID, string deviceOwnerID, string deviceOwner, string deviceModel, string deviceManufacturer, string deviceName, string oSVersion, string idiom, string platform, string rTMVersion, string applicationName, string nameSpace)
    {
        ConnectionId        = connectionId;
        DeviceID            = deviceID;
        DeviceOwnerID       = deviceOwnerID;
        DeviceOwner         = deviceOwner;  
        DeviceModel         = deviceModel;
        DeviceManufacturer  = deviceManufacturer;
        DeviceName          = deviceName;
        OSVersion           = oSVersion;
        Idiom               = idiom;
        Platform            = platform;
        RTMVersion          = rTMVersion;
        ApplicationName     = applicationName;
        NameSpace           = nameSpace;
    }

    public string ConnectionId { get; set; }
    public string DeviceID { get; set; }
    public string DeviceOwnerID { get; set; }
    public string DeviceOwner { get; set; }
    public string DeviceModel { get; set; }
    public string DeviceManufacturer { get; set; }
    public string DeviceName { get; set; }
    public string OSVersion { get; set; }
    public string Idiom { get; set; }
    public string Platform { get; set; }
    public string RTMVersion { get; set; }
    public string ApplicationName{ get; set; }
    public string NameSpace { get; set; }
    public LogEventLevel LogLevel { get; set; } = LogEventLevel.Error;
    public List<DBSyncInfo> SyncInfo { get; set; } = new List<DBSyncInfo>();

    public override int GetHashCode()
    {
            return ConnectionId.GetHashCode();
    }

    public override bool Equals(object obj)
    {
        if (obj == null || GetType() != obj.GetType())
            return false;

        ApplicationChatDevice other = (ApplicationChatDevice)obj;
        return ConnectionId == other.ConnectionId;
    }
}
