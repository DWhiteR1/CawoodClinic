﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace CawoodClinic.Maui.Data.Models;

public partial class Region
{
    public Guid Id { get; set; }

    public string Name { get; set; }

    public Guid? ParentId { get; set; }

    public bool IsDeleted { get; set; }

    public virtual ICollection<Region> InverseParent { get; set; } = new List<Region>();

    public virtual Region Parent { get; set; }

    public virtual ICollection<Patient> Patients { get; set; } = new List<Patient>();
}