
namespace CawoodClinic.Shared.Message;

public record AuthenticationFailed : MessageBase
{
    public AuthenticationFailed()
    {
        Title = "AuthenticationFailedTitle";
        Message = "AuthenticationFailedMessage";
        Error = GetType().Name;
    }
    public string Error { get; }

}
public record InvalidToken : MessageBase
{
    public InvalidToken()
    {
        Title = "InvalidTokenTitle";
        Message = "InvalidTokenMessage";
        Error = GetType().Name;
    }
    public string Error { get; }

}
public record InvalidRefreshToken : MessageBase
{
    public InvalidRefreshToken()
    {
        Title = "InvalidRefreshTokenTitle";
        Message = "InvalidRefreshTokenMessage";
        Error = GetType().Name;
    }
    public string Error { get; }

}
public record UserNotFound : MessageBase
{
    public UserNotFound()
    {
        Title = "UserNotFoundTitle";
        Message = "UserNotFoundMessage";
        Error = GetType().Name;
    }
    public string Error { get; }

}
public record TokenExpired : MessageBase
{
    public TokenExpired()
    {
        Title = "TokenExpiredTitle";
        Message = "TokenExpiredMessage";
        Error = GetType().Name;
    }
    public string Error { get; }

}
public record RefreshTokenExpired : MessageBase
{
    public RefreshTokenExpired()
    {
        Title = "RefreshTokenExpiredTitle";
        Message = "RefreshTokenExpiredMessage";
        Error = GetType().Name;
    }
    public string Error { get; }
}

public record InternetUnavailable : MessageBase
{
    public InternetUnavailable()
    {
        Title = "InternetUnavailableTitle";
        Message = "InternetUnavailableMessage";
        Error = GetType().Name;
    }
    public string Error { get; }
}

public record WebApiException : MessageBase
{
    public WebApiException(string message)
    {
        Title = "WebApiExceptionTitle";
        Message = message;
        Error = GetType().Name;
    }
    public string Error { get; }
}
