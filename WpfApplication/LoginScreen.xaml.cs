using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace WpfApplication
{
    /// <summary>
    /// Interaction logic for Window1.xaml
    /// </summary>
    public partial class Login : Window
    {
        public Login()
        {
            InitializeComponent();
            buttonCancel.Click += buttonCancel_Click;
            textBoxUserName.GotFocus += textBoxUserName_GotFocus;
            checkBoxSSO.Checked += CheckBoxSSO_Checked;
            checkBoxSSO.Unchecked += CheckBoxSSO_Checked;
        }

        private void CheckBoxSSO_Checked(object sender, RoutedEventArgs e)
        {
            switch (checkBoxSSO.IsChecked.Value)
            {
                case true:
                    textBoxUserName.Text = System.Security.Principal.WindowsIdentity.GetCurrent().Name;
                    textBoxUserName.IsReadOnly = true;
                    textBoxUserName.IsReadOnly = true;
                    passwordBox.IsEnabled = false;
                    textBoxPassword.IsEnabled = true;
                    textBoxUserName.UpdateLayout();
                    break;
                case false:
                    textBoxUserName.Text = "";
                    passwordBox.IsEnabled = true;
                    textBoxPassword.IsEnabled = false;
                    break;
            }
            
        }

        private void textBoxUserName_GotFocus(object sender, RoutedEventArgs e)
        {
            if (this.checkBoxSSO.IsChecked == false)
            {
                textBoxUserName.Text = "";
            }
        }
        private void buttonCancel_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
