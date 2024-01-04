using CawoodClinic.Shared.Enums;
using CawoodClinic.Shared.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CawoodClinic.Shared.Model
{
    public class DBSyncInfo : IEquatable<DBSyncInfo>
    {
        public DBSyncInfo(string tableName, int syncCount, DateTime lastSyncTime, SyncDirectionEnum syncDirection)
        {
            TableName = tableName;
            SyncCount = syncCount;
            LastSyncTime = lastSyncTime;
            SyncDirection = syncDirection;

        }
        public string TableName { get; private set; }
        public SyncDirectionEnum SyncDirection { get; private set; }
        public int SyncCount { get; private set; }
        public DateTime LastSyncTime { get; private set; }

        public override int GetHashCode()
        {
            return TableName.GetHashCode();
        }

        public bool Equals(DBSyncInfo? other)
        {
            if (other == null || !(other is DBSyncInfo))
                return false;
            DBSyncInfo otherDBSyncInfo = (DBSyncInfo)other;
            return TableName == otherDBSyncInfo.TableName && SyncDirection == otherDBSyncInfo.SyncDirection;
        }
    }
}
