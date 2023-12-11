using CawoodClinic.Maui.ViewModels;

namespace CawoodClinic.Maui.Views;

public partial class WeightlossProgressionPage : ContentPage
{
	public WeightlossProgressionPage(WeightlossProgressionViewModel viewModel)
	{
		InitializeComponent();
		BindingContext = viewModel;
	}
}