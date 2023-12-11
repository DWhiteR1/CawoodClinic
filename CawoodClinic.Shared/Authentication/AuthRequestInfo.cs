using CawoodClinic.Shared.Enums;
using System.ComponentModel.DataAnnotations;

namespace CawoodClinic.Shared.Authentication;

public class AuthRequestInfo
{
    [Required(ErrorMessage = "User Name is required")]
    public string? UserName { get; set; }
    [Required(ErrorMessage = "Password is required")]
    public string? Password { get; set; }
    public string? NameSpace { get; set; }
    public string? DeviceModel { get; set; }
    public string? DeviceManufacturer { get; set; }
    public string? DeviceName { get; set; }
    public string? OSVersion { get; set; }
    public string? Idiom { get; set; }
    public string? Platform { get; set; }
    public string? Version { get; set; }
    public string? DeviceID { get; set; }
    public string? ApplicationName { get; set; }
    public bool? IsPrimaryDevice { get; set; } 
    public LogEventLevel? LogLevel { get; set; }
}

