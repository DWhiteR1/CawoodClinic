using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Claims;

namespace CawoodClinic.Shared.Constants
{
    public static class ApplicationClaimTypes
    {

        // Custom claim types
        public const string MenuItem = "MenuItem";

        public const string Permission = "Permission";
        public const string DeviceInfo = "DeviceInfo";


        // Include the standard claim types from System.Security.Claims.ClaimTypes
        // as static properties in this custom class for convenient access.
        public static string Actor => ClaimTypes.Actor;
        public static string PostalCode => ClaimTypes.PostalCode;
        public static string PrimaryGroupSid => ClaimTypes.PrimaryGroupSid;
        public static string PrimarySid => ClaimTypes.PrimarySid;
        public static string Role => ClaimTypes.Role;
        public static string Rsa => ClaimTypes.Rsa;
        public static string SerialNumber => ClaimTypes.SerialNumber;
        public static string Sid => ClaimTypes.Sid;
        public static string Spn => ClaimTypes.Spn;
        public static string StateOrProvince => ClaimTypes.StateOrProvince;
        public static string StreetAddress => ClaimTypes.StreetAddress;
        public static string Surname => ClaimTypes.Surname;
        public static string System => ClaimTypes.System;
        public static string Thumbprint => ClaimTypes.Thumbprint;
        public static string Upn => ClaimTypes.Upn;
        public static string Uri => ClaimTypes.Uri;
        public static string UserData => ClaimTypes.UserData;
        public static string Version => ClaimTypes.Version;
        public static string Webpage => ClaimTypes.Webpage;
        public static string WindowsAccountName => ClaimTypes.WindowsAccountName;
        public static string WindowsDeviceClaim => ClaimTypes.WindowsDeviceClaim;
        public static string WindowsDeviceGroup => ClaimTypes.WindowsDeviceGroup;
        public static string WindowsFqbnVersion => ClaimTypes.WindowsFqbnVersion;
        public static string WindowsSubAuthority => ClaimTypes.WindowsSubAuthority;
        public static string OtherPhone => ClaimTypes.OtherPhone;
        public static string NameIdentifier => ClaimTypes.NameIdentifier;
        public static string Name => ClaimTypes.Name;
        public static string MobilePhone => ClaimTypes.MobilePhone;
        public static string Anonymous => ClaimTypes.Anonymous;
        public static string Authentication => ClaimTypes.Authentication;
        public static string AuthenticationInstant => ClaimTypes.AuthenticationInstant;
        public static string AuthenticationMethod => ClaimTypes.AuthenticationMethod;
        public static string AuthorizationDecision => ClaimTypes.AuthorizationDecision;
        public static string CookiePath => ClaimTypes.CookiePath;
        public static string Country => ClaimTypes.Country;
        public static string DateOfBirth => ClaimTypes.DateOfBirth;
        public static string DenyOnlyPrimaryGroupSid => ClaimTypes.DenyOnlyPrimaryGroupSid;
        public static string DenyOnlyPrimarySid => ClaimTypes.DenyOnlyPrimarySid;
        public static string DenyOnlySid => ClaimTypes.DenyOnlySid;
        public static string WindowsUserClaim => ClaimTypes.WindowsUserClaim;
        public static string DenyOnlyWindowsDeviceGroup => ClaimTypes.DenyOnlyWindowsDeviceGroup;
        public static string Dsa => ClaimTypes.Dsa;
        public static string Email => ClaimTypes.Email;
        public static string Expiration => ClaimTypes.Expiration;
        public static string Expired => ClaimTypes.Expired;
        public static string Gender => ClaimTypes.Gender;
        public static string GivenName => ClaimTypes.GivenName;
        public static string GroupSid => ClaimTypes.GroupSid;
        public static string Hash => ClaimTypes.Hash;
        public static string HomePhone => ClaimTypes.HomePhone;
        public static string IsPersistent => ClaimTypes.IsPersistent;
        public static string Locality => ClaimTypes.Locality;
        public static string Dns => ClaimTypes.Dns;
        public static string X500DistinguishedName => ClaimTypes.X500DistinguishedName;
    }
}
