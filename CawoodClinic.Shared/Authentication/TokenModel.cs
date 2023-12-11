namespace CawoodClinic.Shared.Authentication;
public class TokenModel
    {
    public TokenModel(string accessToken, DateTime accessTokenExpiration, string refreshToken, string deviceId)
    {
        AccessToken = accessToken;
        AccessTokenExpiration = accessTokenExpiration;
        RefreshToken = refreshToken;
        DeviceId = deviceId;
    } 

        public string? AccessToken { get; set; }
        public DateTime AccessTokenExpiration { get; set; }    
        public string? RefreshToken { get; set; }
        public string? DeviceId { get; set; }   
}

