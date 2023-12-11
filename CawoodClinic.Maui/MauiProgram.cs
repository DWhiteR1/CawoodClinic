using Microsoft.Extensions.Logging;
using CawoodClinic.Maui.ViewModels;
using CawoodClinic.Maui.Views;
using DevExpress.Maui;
using CommunityToolkit.Maui;

namespace CawoodClinic.Maui
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .UseMauiCommunityToolkit()
                .UseDevExpress()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                });

#if DEBUG
    		builder.Logging.AddDebug();
#endif
            builder.Services.AddSingleton<WeightlossProgressionViewModel>();
            builder.Services.AddSingleton<WeightlossProgressionPage>();

            DevExpress.Maui.Charts.Initializer.Init();

            return builder.Build();
        }
    }
}
