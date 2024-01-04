using CawoodClinic.Blazor.Auth.Models;
using CawoodClinic.Blazor.Models;
using CawoodClinic.Shared.Authentication;
using CawoodClinic.Shared.Constants;
using CawoodClinic.Shared.Message;
using CawoodClinic.Shared.User;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;

namespace CawoodClinic.Blazor.Services;

public interface IUserService
{
    Task<AuthenticateUserResult> AuthenticateUser(AuthRequestInfo loginModel);
    Task<GetRefreshTokenResult> GetRefreshToken(TokenModel tokenModel);

}
public class UserService : IUserService
{
    private UserManager<IdentityUser> _userManager { get; }
    private RoleManager<IdentityRole> _roleManager { get; }
    private IConfiguration _configuration { get; }
    private IJWTService _jWTService { get; }
    private AuthDbContext _authDbContext { get; }

    public UserService(UserManager<IdentityUser> userManager, RoleManager<IdentityRole> roleManager, IConfiguration configuration, IJWTService jWTService, AuthDbContext authDbContext)
    {
        _userManager = userManager;
        _roleManager = roleManager;
        _configuration = configuration;
        _jWTService = jWTService;
        _authDbContext = authDbContext;
    }


    async Task<AuthenticateUserResult> IUserService.AuthenticateUser(AuthRequestInfo loginModel)
    {

        if (loginModel is null || loginModel.UserName is null || loginModel.Password is null)
        {
            return new WebApiException("Invalid login model...");
        }

        var user = await _userManager.FindByNameAsync(loginModel.UserName);

        if (user is null || user.UserName is null)
        {
            return new UserNotFound();
        }

        if (!await _userManager.CheckPasswordAsync(user, loginModel.Password))
        {
            return new AuthenticationFailed();
        }

        var userRoles = await _userManager.GetRolesAsync(user);

        _ = Guid.TryParse(loginModel.DeviceID, out Guid deviceId);


        if (deviceId == Guid.Empty)
        {
            deviceId = _jWTService.GenerateDeviceId();
        }


        var authClaims = new List<Claim>
                {
                    new Claim(ApplicationClaimTypes.Name, user.UserName),
                    new Claim(ApplicationClaimTypes.NameIdentifier, user.Id),
                    new Claim(ApplicationClaimTypes.Email, user.Email),
                    new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                    new Claim(ApplicationClaimTypes.DeviceInfo, $"{nameof(loginModel.DeviceID)}|{deviceId.ToString()}"),
                    new Claim(ApplicationClaimTypes.DeviceInfo, $"{nameof(loginModel.DeviceManufacturer)}|{loginModel.DeviceManufacturer}"),
                    new Claim(ApplicationClaimTypes.DeviceInfo, $"{nameof(loginModel.DeviceModel)}|{loginModel.DeviceModel}"),
                    new Claim(ApplicationClaimTypes.DeviceInfo, $"{nameof(loginModel.DeviceName)}|{loginModel.DeviceName}"),
                    new Claim(ApplicationClaimTypes.DeviceInfo, $"{nameof(loginModel.Idiom)}|{loginModel.Idiom}"),
                    new Claim(ApplicationClaimTypes.DeviceInfo, $"{nameof(loginModel.OSVersion)}|{loginModel.OSVersion}"),
                    new Claim(ApplicationClaimTypes.DeviceInfo, $"{nameof(loginModel.Platform)}|{loginModel.Platform}"),
                    new Claim(ApplicationClaimTypes.DeviceInfo, $"{nameof(loginModel.Version)}|{loginModel.Version}"),
                    new Claim(ApplicationClaimTypes.DeviceInfo, $"{nameof(loginModel.NameSpace)}|{loginModel.NameSpace}"),
                    new Claim(ApplicationClaimTypes.DeviceInfo, $"{nameof(loginModel.ApplicationName)}|{loginModel.ApplicationName}")
                };

        foreach (var userRole in userRoles)
        {
            authClaims.Add(new Claim(ClaimTypes.Role, userRole));
        }



        foreach (var roleName in userRoles)
        {

            var role = await _roleManager.FindByNameAsync(roleName);
            var claims = await _roleManager.GetClaimsAsync(role);

            foreach (var claim in claims)
            {
                if (claim.Type.StartsWith(loginModel.NameSpace))
                {
                    authClaims.Add(new Claim(claim.Type.Replace(string.Concat(loginModel.NameSpace, "."), ""), claim.Value));
                }
            }
        }



        var token = _jWTService.CreateToken(_configuration, authClaims);

        var refreshToken = _jWTService.GenerateRefreshToken();

        _ = int.TryParse(_configuration["JWT:RefreshTokenValidityInDays"], out int refreshTokenValidityInDays);
        //_ = Guid.TryParse(loginModel.DeviceID, out Guid deviceId);


        //if (deviceId == Guid.Empty)
        //{
        //   deviceId = _jWTService.GenerateDeviceId();
        var userDevice = new AspNetUserDevice
        {
            DeviceId = deviceId,
            RefreshToken = refreshToken,
            RefreshTokenExpiryTime = DateTime.UtcNow.AddDays(refreshTokenValidityInDays),
            UserId = user.Id,
            Idiom = loginModel.Idiom
        };
        // add to db and save
        _ = await _authDbContext.AspNetUserDevices.AddAsync(userDevice);
        _ = await _authDbContext.SaveChangesAsync();
        //}

        var res = await _userManager.UpdateAsync(user);

        var tokenString = new JwtSecurityTokenHandler().WriteToken(token);

        return new AuthResult(tokenString, refreshToken, token.ValidTo, deviceId.ToString());

    }
    async Task<GetRefreshTokenResult> IUserService.GetRefreshToken(TokenModel tokenModel)
    {
        if (tokenModel is null)
        {
            return new WebApiException("Invalid token model...");
        }

        string? accessToken = tokenModel.AccessToken;
        string? refreshToken = tokenModel.RefreshToken;

        var principal = _jWTService.GetPrincipalFromExpiredToken(_configuration, accessToken);
        if (principal == null)
        {
            return new WebApiException("Invalid token principal is null...");
        }

#pragma warning disable CS8600 // Converting null literal or possible null value to non-nullable type.
#pragma warning disable CS8602 // Dereference of a possibly null reference.
        string username = principal.Identity.Name;
#pragma warning restore CS8602 // Dereference of a possibly null reference.
#pragma warning restore CS8600 // Converting null literal or possible null value to non-nullable type.
        if (string.IsNullOrEmpty(username))
        {
            return new WebApiException("Invalid token user not found...");
        }

        _ = Guid.TryParse(tokenModel.DeviceId, out Guid deviceId);
        //Get the user refresh token from AspNetUserDevice

        var user = await _userManager.FindByNameAsync(username);
        AspNetUserDevice? userDevice = null;
        if (user is not null)
        {
            userDevice = await _authDbContext.AspNetUserDevices.FirstOrDefaultAsync(x => x.UserId == user.Id && x.DeviceId == deviceId);
        }



        if (user is null || userDevice is null || userDevice.RefreshToken != refreshToken)
        {
            return new WebApiException("Invalid Refresh Token, out of sync");
        }

        if (userDevice.RefreshTokenExpiryTime <= DateTime.Now)
        {
            return new RefreshTokenExpired();
        }
        var newAccessToken = _jWTService.CreateToken(_configuration, principal.Claims.ToList());
        var newRefreshToken = _jWTService.GenerateRefreshToken();

        var tokenString = new JwtSecurityTokenHandler().WriteToken(newAccessToken);
        userDevice.RefreshToken = newRefreshToken;
        userDevice.RefreshTokenExpiryTime = DateTime.Now.AddDays(Convert.ToDouble(_configuration["JWT:RefreshTokenValidityInDays"]));

        _ = await _authDbContext.SaveChangesAsync();
        var Res = await _userManager.UpdateAsync(user);

        return new AuthResult(tokenString, newRefreshToken, newAccessToken.ValidTo, userDevice.DeviceId.ToString());
    }
}