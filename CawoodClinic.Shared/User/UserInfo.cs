using CawoodClinic.Shared.Authentication;
using System.Data;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using CawoodClinic.Shared.Constants;

namespace CawoodClinic.Shared.User
{
    public  class UserInfo
    {
        public  string UserID { get; set; }
        public  string FullName { get; set; }
        public  string Email { get; set; }
        public  string Token { get; set; }
        public  string RefreshToken { get; set; }
        public  DateTime TokenExpireTime { get; set; }
        public  bool IsLoggedIn { get; set; }
        public bool CanTryAuthenticate { get; set; } = true;
        public bool IsPrimary { get; set; } = true;
        public bool ShowFullScreen { get; set; } = false;
        public string DeviceId { get; set; }
        public List<string> Roles { get; set; }
        public List<string> MenuItems { get; set; }
        public List<string> Permissions { get; set; }
        
        public event Action OnChange;

        public void SetUserInfo(TokenModel tokenModel)
        {
            var jwt = GetJwtSecurityToken(tokenModel.AccessToken);
            string userId = GetClaimValue(jwt, ApplicationClaimTypes.NameIdentifier);
            string fullName = GetClaimValue(jwt, ApplicationClaimTypes.Name);
            string email = GetClaimValue(jwt, ApplicationClaimTypes.Email);
            List<string> roles = GetClaimValues(jwt, ApplicationClaimTypes.Role);
            List<string> menuItems = GetClaimValues(jwt, ApplicationClaimTypes.MenuItem);
            List<string> permissions = GetClaimValues(jwt, ApplicationClaimTypes.Permission);


            SetUserInfo(userId, fullName, email, tokenModel.AccessToken, tokenModel.RefreshToken, tokenModel.AccessTokenExpiration, true, tokenModel.DeviceId, roles, menuItems, permissions);
            NotifyUserInfoChanged();
        }

        public void SetUserInfo(AuthResult authResult)
        {

            var jwt = GetJwtSecurityToken(authResult.Token);
            string userId = GetClaimValue(jwt, ApplicationClaimTypes.NameIdentifier);
            string fullName = GetClaimValue(jwt, ApplicationClaimTypes.Name);
            string email = GetClaimValue(jwt, ApplicationClaimTypes.Email);
            List<string> roles = GetClaimValues(jwt, ApplicationClaimTypes.Role);
            List<string> menuItems = GetClaimValues(jwt, ApplicationClaimTypes.MenuItem);
            List<string> permissions = GetClaimValues(jwt, ApplicationClaimTypes.Permission);

            SetUserInfo(userId, fullName, email, authResult.Token, authResult.RefreshToken, authResult.TokenExpiration, true, authResult.DeviceId, roles, menuItems, permissions);
            NotifyUserInfoChanged();

        }

        public void SetUserInfo(string userID, string fullName, string email, string token, string refreshToken, DateTime tokenExpireTime, bool isLoggedIn, string deviceId, List<string> roles, List<string> menuItems, List<string> permissions)
        {
            UserID = userID;
            FullName = fullName;
            Email = email;  
            Token = token;
            RefreshToken = refreshToken;
            TokenExpireTime = tokenExpireTime;
            IsLoggedIn = isLoggedIn;
            DeviceId = deviceId;
            Roles = roles;
            MenuItems = menuItems;
            Permissions = permissions;

            var hasMenuItems = MenuItems.Any();
            if (!hasMenuItems)
            {
                MenuItems.Add("About");
            }

            NotifyUserInfoChanged();
        }

        private JwtSecurityToken GetJwtSecurityToken(string TokenString)
        {
              return new JwtSecurityTokenHandler().ReadJwtToken(TokenString);
        }

        private string GetClaimValue(JwtSecurityToken jwt, string claimType)
        {
            return jwt.Claims.FirstOrDefault(claim => claim.Type == claimType)?.Value;
        }   

        private List<string> GetClaimValues(JwtSecurityToken jwt, string claimType)
        {
            return jwt.Claims.Where(claim => claim.Type == claimType)?.Select(claim => claim.Value).ToList();
        }

        private void NotifyUserInfoChanged()
        {
            OnChange?.Invoke();
        }

        public void ClearUserInfo()
        {
            this.Roles.Clear();
            this.MenuItems.Clear();
            this.Permissions.Clear();
            SetUserInfo(this.UserID, this.FullName, this.Email, string.Empty,string.Empty, DateTime.MinValue, false, this.DeviceId, this.Roles, this.MenuItems, this.Permissions);
        }
    }
}
