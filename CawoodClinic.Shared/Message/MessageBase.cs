﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CawoodClinic.Shared.Message;

public abstract record MessageBase
{
    public string Title { get; set; } = string.Empty;
    public string Message { get; set; } = string.Empty;

}
