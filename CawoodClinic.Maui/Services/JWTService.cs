using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;

namespace CawoodClinic.Maui.Services;

public interface IJWTService
{
    JwtSecurityToken CreateToken(IConfiguration configuration, List<Claim> authClaims);
    string GenerateRefreshToken();
    Guid GenerateDeviceId();
    ClaimsPrincipal? GetPrincipalFromExpiredToken(IConfiguration configuration, string? token);

}

public class JWTService : IJWTService
{

    JwtSecurityToken IJWTService.CreateToken(IConfiguration configuration, List<Claim> authClaims)
    {
        var authSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(configuration["Jwt:Key"]));
        _ = int.TryParse(configuration["Jwt:TokenValidityInMinutes"], out int tokenValidityInMinutes);

        var token = new JwtSecurityToken(
            issuer: configuration["Jwt:Issuer"],
            audience: configuration["Jwt:Audience"],
            expires: DateTime.Now.ToUniversalTime().AddMinutes(tokenValidityInMinutes),
            claims: authClaims,
            signingCredentials: new SigningCredentials(authSigningKey, SecurityAlgorithms.HmacSha256)
            );

        return token;
    }

    string IJWTService.GenerateRefreshToken()
    {
        var randomNumber = new byte[64];
        using var rng = RandomNumberGenerator.Create();
        rng.GetBytes(randomNumber);
        return Convert.ToBase64String(randomNumber);
    }

    Guid IJWTService.GenerateDeviceId()
    {
        return Guid.NewGuid();
    }

    ClaimsPrincipal? IJWTService.GetPrincipalFromExpiredToken(IConfiguration configuration, string? token)
    {
        var tokenValidationParameters = new TokenValidationParameters
        {
            ValidateAudience = false,
            ValidateIssuer = false,
            ValidateIssuerSigningKey = true,
            IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(configuration["Jwt:Key"])),
            ValidateLifetime = false
        };

        var tokenHandler = new JwtSecurityTokenHandler();
        var principal = tokenHandler.ValidateToken(token, tokenValidationParameters, out SecurityToken securityToken);
        if (securityToken is not JwtSecurityToken jwtSecurityToken || !jwtSecurityToken.Header.Alg.Equals(SecurityAlgorithms.HmacSha256, StringComparison.InvariantCultureIgnoreCase))
            throw new SecurityTokenException("Invalid token");

        return principal;

    }
}
