﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace CawoodClinic.Blazor.Data;

public partial class MenuItem
{
    public int Id { get; set; }

    public string NameSpace { get; set; }

    public int ParentId { get; set; }

    public string PageName { get; set; }

    public string MenuName { get; set; }

    public string IconName { get; set; }

    public bool IsEnabled { get; set; }

    public int MenuOrder { get; set; }

    public bool MenuToggleEnabled { get; set; }

    public Guid? LastUpdatedDeviceId { get; set; }
}