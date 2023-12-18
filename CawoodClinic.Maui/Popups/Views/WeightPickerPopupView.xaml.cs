using CommunityToolkit.Maui;
using CommunityToolkit.Maui.Alerts;
using CommunityToolkit.Maui.Behaviors;
using CommunityToolkit.Maui.Views;
namespace CawoodClinic.Maui.Popups;

public partial class WeightPickerPopupView : Popup
{
    public WeightPickerPopupView(WeightPickerPopupViewModel viewModel)
    {
        InitializeComponent();
        BindingContext = viewModel;
    }
    void OnOKButtonClicked(object? sender, EventArgs e) => Close();

}