using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CawoodClinic.Shared.Enums;

public enum SyncDirectionEnum
{
    None = 0,
    UpToServer = 1,
    DownToClient = 2,
}
