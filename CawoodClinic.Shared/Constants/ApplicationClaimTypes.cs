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
        public static string Actor => ApplicationClaimTypes.Actor;
        public static string PostalCode => ApplicationClaimTypes.PostalCode;
        public static string PrimaryGroupSid => ApplicationClaimTypes.PrimaryGroupSid;
        public static string PrimarySid => ApplicationClaimTypes.PrimarySid;
        public static string Role => ApplicationClaimTypes.Role;
        public static string Rsa => ApplicationClaimTypes.Rsa;
        public static string SerialNumber => ApplicationClaimTypes.SerialNumber;
        public static string Sid => ApplicationClaimTypes.Sid;
        public static string Spn => ApplicationClaimTypes.Spn;
        public static string StateOrProvince => ApplicationClaimTypes.StateOrProvince;
        public static string StreetAddress => ApplicationClaimTypes.StreetAddress;
        public static string Surname => ApplicationClaimTypes.Surname;
        public static string System => ApplicationClaimTypes.System;
        public static string Thumbprint => ApplicationClaimTypes.Thumbprint;
        public static string Upn => ApplicationClaimTypes.Upn;
        public static string Uri => ApplicationClaimTypes.Uri;
        public static string UserData => ApplicationClaimTypes.UserData;
        public static string Version => ApplicationClaimTypes.Version;
        public static string Webpage => ApplicationClaimTypes.Webpage;
        public static string WindowsAccountName => ApplicationClaimTypes.WindowsAccountName;
        public static string WindowsDeviceClaim => ApplicationClaimTypes.WindowsDeviceClaim;
        public static string WindowsDeviceGroup => ApplicationClaimTypes.WindowsDeviceGroup;
        public static string WindowsFqbnVersion => ApplicationClaimTypes.WindowsFqbnVersion;
        public static string WindowsSubAuthority => ApplicationClaimTypes.WindowsSubAuthority;
        public static string OtherPhone => ApplicationClaimTypes.OtherPhone;
        public static string NameIdentifier => ApplicationClaimTypes.NameIdentifier;
        public static string Name => ApplicationClaimTypes.Name;
        public static string MobilePhone => ApplicationClaimTypes.MobilePhone;
        public static string Anonymous => ApplicationClaimTypes.Anonymous;
        public static string Authentication => ApplicationClaimTypes.Authentication;
        public static string AuthenticationInstant => ApplicationClaimTypes.AuthenticationInstant;
        public static string AuthenticationMethod => ApplicationClaimTypes.AuthenticationMethod;
        public static string AuthorizationDecision => ApplicationClaimTypes.AuthorizationDecision;
        public static string CookiePath => ApplicationClaimTypes.CookiePath;
        public static string Country => ApplicationClaimTypes.Country;
        public static string DateOfBirth => ApplicationClaimTypes.DateOfBirth;
        public static string DenyOnlyPrimaryGroupSid => ApplicationClaimTypes.DenyOnlyPrimaryGroupSid;
        public static string DenyOnlyPrimarySid => ApplicationClaimTypes.DenyOnlyPrimarySid;
        public static string DenyOnlySid => ApplicationClaimTypes.DenyOnlySid;
        public static string WindowsUserClaim => ApplicationClaimTypes.WindowsUserClaim;
        public static string DenyOnlyWindowsDeviceGroup => ApplicationClaimTypes.DenyOnlyWindowsDeviceGroup;
        public static string Dsa => ApplicationClaimTypes.Dsa;
        public static string Email => ApplicationClaimTypes.Email;
        public static string Expiration => ApplicationClaimTypes.Expiration;
        public static string Expired => ApplicationClaimTypes.Expired;
        public static string Gender => ApplicationClaimTypes.Gender;
        public static string GivenName => ApplicationClaimTypes.GivenName;
        public static string GroupSid => ApplicationClaimTypes.GroupSid;
        public static string Hash => ApplicationClaimTypes.Hash;
        public static string HomePhone => ApplicationClaimTypes.HomePhone;
        public static string IsPersistent => ApplicationClaimTypes.IsPersistent;
        public static string Locality => ApplicationClaimTypes.Locality;
        public static string Dns => ApplicationClaimTypes.Dns;
        public static string X500DistinguishedName => ApplicationClaimTypes.X500DistinguishedName;
    }
}
