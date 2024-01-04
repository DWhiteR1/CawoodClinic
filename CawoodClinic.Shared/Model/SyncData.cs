namespace CawoodClinic.Shared.Model;

public record SyncData
{
    public SyncData(string tableName, string receivedString)
    {
        TableName = tableName;
        ReceivedString = receivedString;
    }

    public string? TableName { get; set; }
    public string? ReceivedString { get; set; }
}
