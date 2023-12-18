using CawoodClinic.Maui.Popups;
using CommunityToolkit.Maui.Core;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CawoodClinic.Maui.ViewModels;

public partial class WeightlossProgressionViewModel : ObservableObject
{
    public CountryGdp GdpValueForChina { get; }
    private readonly IPopupService popupService;
    public WeightlossProgressionViewModel(IPopupService popupService)
    {

        GdpValueForChina = new CountryGdp(
            "Dean White",
            new GdpValue(new DateTime(2023, 11, 1), 102.7),
            new GdpValue(new DateTime(2023, 11, 4), 104.3),
            new GdpValue(new DateTime(2023, 11, 7), 101.8),
            new GdpValue(new DateTime(2023, 11, 10), 98.2),
            new GdpValue(new DateTime(2023, 11, 12), 98.1),
            new GdpValue(new DateTime(2023, 11, 15), 96.0),
            new GdpValue(new DateTime(2023, 11, 18), 97.4),
            new GdpValue(new DateTime(2023, 11, 20), 95.6),
            new GdpValue(new DateTime(2023, 11, 23), 91.5),
            new GdpValue(new DateTime(2023, 11, 27), 93.5),
            new GdpValue(new DateTime(2023, 11, 30), 91.1),
            new GdpValue(new DateTime(2023, 12, 1), 90.7),
            new GdpValue(new DateTime(2023, 12, 4), 89.3),
            new GdpValue(new DateTime(2023, 12, 7), 88.8),
            new GdpValue(new DateTime(2023, 12, 10), 89.2),
            new GdpValue(new DateTime(2023, 12, 12), 88.1)
        );
        this.popupService = popupService;
    }

    [RelayCommand]
    public void AddWeight()
    {
        this.popupService.ShowPopup<WeightPickerPopupViewModel>();
    }

}

public class CountryGdp
{
    public string CountryName { get; }
    public IList<GdpValue> Values { get; }

    public CountryGdp(string country, params GdpValue[] values)
    {
        this.CountryName = country;
        this.Values = new List<GdpValue>(values);
    }
}

public class GdpValue
{
    public DateTime Year { get; }
    public double Value { get; }

    public GdpValue(DateTime year, double value)
    {
        this.Year = year;
        this.Value = value;
    }
}

