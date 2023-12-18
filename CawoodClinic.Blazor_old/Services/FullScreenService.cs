namespace CawoodClinic.Blazor.Services
{
    public class FullScreenService
    {
        public event Action OnChange;

        public bool ShowFullScreen { get; set; } = false;

    }
}
