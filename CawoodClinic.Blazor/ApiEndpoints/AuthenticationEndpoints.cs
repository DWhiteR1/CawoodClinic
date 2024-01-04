using CawoodClinic.Shared.Authentication;
using Microsoft.AspNetCore.Identity;
using System.Text.Json;

namespace CawoodClinic.Blazor.ApiEndpoints
{
    internal static class AuthenticationEndpoints
    {
        public static void AddAuthenticationEndpoints(this IEndpointRouteBuilder app)
        {

            app.MapPost("/login", ([FromBody] AuthRequestInfo model, IUserService userService) => Login(model, userService))
                 .WithOpenApi()
                 .WithTags("Auth");

            async Task<IResult> Login(AuthRequestInfo model, IUserService userService)
            {
                var loginOneOf = await userService.AuthenticateUser(model);
                var jsonOptions = new JsonSerializerOptions
                {
                    Converters = { new OneOfConverterFactory() }
                };

                var loginOneOfSerialized = JsonSerializer.Serialize(loginOneOf, jsonOptions);
                return new JsonContentResult(loginOneOfSerialized, "application/json", StatusCodes.Status200OK);
            }


            app.MapPost("/register", ([FromBody] RegisterModel model, UserManager<IdentityUser> userManager, RoleManager<IdentityRole> roleManager, IConfiguration configuration) => Register(model, userManager, roleManager, configuration))
               .WithOpenApi()
               .WithTags("Auth");
            async Task<IResult> Register(RegisterModel model, UserManager<IdentityUser> userManager, RoleManager<IdentityRole> roleManager, IConfiguration configuration)
            {

                var userExists = await userManager.FindByNameAsync(model.Username);
                if (userExists != null)
                    return Results.StatusCode(StatusCodes.Status500InternalServerError);

                IdentityUser user = new()
                {
                    Id = Guid.NewGuid().ToString(),
                    AccessFailedCount = 0,
                    UserName = model.Username,
                    Email = model.Email,
                    EmailConfirmed = true,
                    LockoutEnabled = false,
                    SecurityStamp = Guid.NewGuid().ToString(),

                };
                var result = await userManager.CreateAsync(user, model.Password);
                if (!result.Succeeded)
                    return Results.StatusCode(StatusCodes.Status500InternalServerError);

                return Results.Ok();
            }

            app.MapPost("/register-admin", ([FromBody] RegisterModel model, UserManager<IdentityUser> userManager, RoleManager<IdentityRole> roleManager, IConfiguration configuration) => RegisterAdmin(model, userManager, roleManager, configuration))
               .WithOpenApi()
               .WithTags("Auth");
            async Task<IResult> RegisterAdmin(RegisterModel model, UserManager<IdentityUser> userManager, RoleManager<IdentityRole> roleManager, IConfiguration configuration)
            {
                var userExists = await userManager.FindByNameAsync(model.Username);
                if (userExists != null)
                    return Results.StatusCode(StatusCodes.Status500InternalServerError); //, new Response { Status = "Error", Message = "User already exists!" }

                IdentityUser user = new()
                {
                    Email = model.Email,
                    SecurityStamp = Guid.NewGuid().ToString(),
                    UserName = model.Username
                };
                var result = await userManager.CreateAsync(user, model.Password);
                if (!result.Succeeded)
                    return Results.StatusCode(StatusCodes.Status500InternalServerError); //, new Response { Status = "Error", Message = "User creation failed! Please check user details and try again." }

                if (!await roleManager.RoleExistsAsync(UserRoles.Admin))
                    await roleManager.CreateAsync(new IdentityRole(UserRoles.Admin));
                if (!await roleManager.RoleExistsAsync(UserRoles.User))
                    await roleManager.CreateAsync(new IdentityRole(UserRoles.User));

                if (await roleManager.RoleExistsAsync(UserRoles.Admin))
                {
                    await userManager.AddToRoleAsync(user, UserRoles.Admin);
                }
                if (await roleManager.RoleExistsAsync(UserRoles.Admin))
                {
                    await userManager.AddToRoleAsync(user, UserRoles.User);
                }
                return Results.Ok(); //new Response { Status = "Success", Message = "User created successfully!" }
            }


            app.MapPost("/refresh-token", ([FromBody] TokenModel tokenModel, IUserService userService) => RefreshToken(tokenModel, userService))
               .WithOpenApi()
               .WithTags("Auth");
            async Task<IResult> RefreshToken(TokenModel tokenModel, IUserService userService)
            {
                var refreshTokenOneOf = await userService.GetRefreshToken(tokenModel);

                var jsonOptions = new JsonSerializerOptions
                {
                    Converters = { new OneOfConverterFactory() }
                };
                var refreshTokenOneOfSerialized = JsonSerializer.Serialize(refreshTokenOneOf, jsonOptions);

                return new JsonContentResult(refreshTokenOneOfSerialized, "application/json", StatusCodes.Status200OK);
            }
        }
    }
}
