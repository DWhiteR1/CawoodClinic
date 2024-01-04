using CawoodClinic.Shared.Authentication;
using CawoodClinic.Shared.Message;
using OneOf;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CawoodClinic.Shared.User;


[GenerateOneOf]
public partial class AuthenticateUserResult : OneOfBase<AuthResult, UserNotFound, AuthenticationFailed, WebApiException> { }

[GenerateOneOf]
public partial class GetRefreshTokenResult : OneOfBase<AuthResult, RefreshTokenExpired, WebApiException> { }

[GenerateOneOf]
public partial class AuthUserResult : OneOfBase<AuthResult, AuthenticationFailed> { }

[GenerateOneOf]
public partial class RegisterUserResult : OneOfBase<AuthResult, AuthenticationFailed> { }