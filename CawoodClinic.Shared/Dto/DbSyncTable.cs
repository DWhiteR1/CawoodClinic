using CawoodClinic.Shared.Enums;

namespace CawoodClinic.Shared.Dto;

public record DBSyncTable
{
    public DBSyncTable(int id, string tableName, long lastSyncVersion, DateTime lastSyncDate, int syncOrder, int retentionDays, SyncDirectionEnum syncDirection, bool isDeleted)
    { 
        Id = id;
        TableName = tableName;
        LastSyncVersion = lastSyncVersion;
        LastSyncDate = lastSyncDate;
        SyncOrder = syncOrder; 
        RetentionDays = retentionDays;
        SyncDirection = syncDirection;
        IsDeleted = isDeleted;
    }

    public int Id { get; set; }

    public string TableName { get; set; }

    public long LastSyncVersion { get; set; }

    public DateTime LastSyncDate { get; set; }

    public int SyncOrder { get; set; }

    public int RetentionDays { get; set; }

    public SyncDirectionEnum SyncDirection { get; set; }

    public bool IsDeleted { get; set; }
}
