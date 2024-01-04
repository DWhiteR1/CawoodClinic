using Microsoft.AspNetCore.SignalR;
using CawoodClinic.Blazor.Data;
using CawoodClinic.Blazor.Hubs;

namespace CawoodClinic.Blazor.ApiEndpoints;

internal static class SignalREndpoints
{
    public static void AddSignalREndpoints(this IEndpointRouteBuilder app)
    {
        app.MapPost("/broadcast-allclients", async (IHubContext<ApplicationChatHub> context, string message) =>
        {
            //await context.Clients.All.
            await context.Clients.All.SendAsync("ReceiveMessage", "WebAPI", message);
        })
          .WithTags("SignalR");

        app.MapGet("/broadcast-allclients", (RTMv3Context dbContext) =>
        {
            //await context.Clients.All.
            return dbContext.Database.CanConnect;
        })
          .WithTags("TestMigration"); 
    }
}
