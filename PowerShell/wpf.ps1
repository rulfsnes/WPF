#Build the GUI
Import-Module "C:\Users\Rasmus\Source\Repos\WPF\PowerShell\WPF.psm1"

Add-Type -Language CSharp @"
 
 public class FrontendContext
{
    private string CompName="Computer Name";

    public string ComputerName{
        get{
            return this.CompName;
        }
        set{
            this.CompName=value;
        }
    }
    private string myMacAddress="MacAddress";
    public string MacAddress{
        get{return myMacAddress;} set{myMacAddress=value;}
    }
    private string myStartStyle="Italic";
    public string StartStyle{
        get{return myStartStyle;} set{myStartStyle=value;}
    }
    private string mySiteServer;
    public string SiteServer{
        get{return mySiteServer;} set{mySiteServer=value;}
    }
}
"@
Class AnotherContext{
    [string]$ComputerName
}
$AnotherContext = New-Object -TypeName AnotherContext
$WindowDataContext = New-Object -TypeName FrontendContext
[xml]$xaml = Get-Content "C:\Users\Rasmus\Source\Repos\WPF\WpfApplication\MainWindow.xaml"
$xaml.DocumentElement.RemoveAttribute("x:Class")
$xaml.DocumentElement.RemoveAttribute("mc:Ignorable")
$xaml.DocumentElement.RemoveAttribute("xmlns:d")

# Add assemblies
Add-Type -AssemblyName PresentationFramework,PresentationCore,WindowsBase

# Make window
$Window = [Windows.Markup.XamlReader]::Load((New-Object System.Xml.XmlNodeReader $xaml))
$xaml.SelectNodes("//*[@Name]") | Foreach-Object { Set-Variable -Name (("Window" + "_" + $_.Name)) -Value $Window.FindName($_.Name) }
$Window.DataContext = $WindowDataContext

$Window_menuItemComputerName.add_click({
    $Window_popUpConnect.IsOpen = $true
})
$Window_buttonpopOutCancel.add_Click({
    $Window_popUpConnect.IsOpen = $false
})

$Window_menuItemExit.add_click({
    $Window.Close()
})
$Window.ShowDialog() | Out-Null