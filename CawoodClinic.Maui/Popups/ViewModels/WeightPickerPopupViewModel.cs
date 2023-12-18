using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CawoodClinic.Maui.Popups
{
    public partial class WeightPickerPopupViewModel : ObservableObject
    {
        public WeightPickerPopupViewModel()
        {
            MinDate = DateTime.Today.AddYears(-1);
            MaxDate = DateTime.Today;
            SelectedDate = DateTime.Today;
            Weight = 0;
            WeightMinValue = 0;
            WeightMaxValue = 250;
            WeightStepValue = 0.1;

        }

        [ObservableProperty]
        private DateTime minDate;
        [ObservableProperty]
        private DateTime maxDate;
        [ObservableProperty]
        private DateTime selectedDate;
        [ObservableProperty]
        private double weight;
        [ObservableProperty]
        private double weightMinValue;
        [ObservableProperty]
        private double weightMaxValue;
        [ObservableProperty]
        private double weightStepValue;


    }

}
