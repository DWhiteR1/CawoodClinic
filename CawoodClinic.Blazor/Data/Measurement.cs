﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace CawoodClinic.Blazor.Data;

public partial class Measurement
{
    public Guid Id { get; set; }

    public Guid PatientId { get; set; }

    public Guid MeasurementTypeId { get; set; }

    public DateTime DateOfMeasurement { get; set; }

    public string Value { get; set; }

    public virtual MeasurementType MeasurementType { get; set; }

    public virtual Patient Patient { get; set; }
}