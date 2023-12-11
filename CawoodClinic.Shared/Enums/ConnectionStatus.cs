namespace CawoodClinic.Shared.Enums;

public enum ConnectionStatus
{
    Unknown = 0,
    ConnectedSignalR,
    ConnectingSignalR,
    ReconnectingSignalR,
    DisconnectedSignalR,
    Connected,
    Disconnected
}
