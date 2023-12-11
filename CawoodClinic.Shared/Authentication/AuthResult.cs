namespace CawoodClinic.Shared.Authentication;

public class AuthResult
{
    public AuthResult()
    {
    }   
    public AuthResult(string _token, string _refreshToken, DateTime _expiration, string deviceId)
    {
        Token = _token;
        RefreshToken = _refreshToken;
        TokenExpiration = _expiration;
        DeviceId = deviceId;    
    }
    public string Token { get; set; }
    public string RefreshToken { get; set; }
    public DateTime TokenExpiration { get; set; }
    public string DeviceId { get; set; }    
}
