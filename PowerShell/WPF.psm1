Function New-EphingWPFCode {
<#
    .SYNOPSIS
        Writes the code for a new WPF window in the ISE
 
    .DESCRIPTION
        The $xaml varialbe needs to be loaded in the session before this is run
        Make sure to highlight the $xaml varialbe and run it!
   
    .EXAMPLE
        New-EphingWPFCode -VariableName 'NewWindow' -xaml $xaml
        This will create WPF code with the variable name NewWindow
 
    .EXAMPLE
        New-EphingWPFCode -xaml $xaml
        This will create WPF code with the variable name Window
 
    .PARAMETER VariableName
        Specify the variable name
 
    .NOTES
        AUTHOR: Ryan Ephgrave
        LASTEDIT: 09/30/2015 10:26:11
 
   .LINK
        
#>
    Param ( 
        [string]$VariableName = 'Window',
        [xml]$xaml,
        [bool]$CreateClass
        #[bool]$HideConsoleWindow = $false,
        #[bool]$MultipleThreads
    )

    $EditorText =  @"
# Add assemblies
Add-Type -AssemblyName PresentationFramework,PresentationCore,WindowsBase

# Make window
`$$VariableName = [Windows.Markup.XamlReader]::Load((New-Object System.Xml.XmlNodeReader `$xaml))
`$xaml.SelectNodes("//*[@Name]") | Foreach-Object { Set-Variable -Name (("$VariableName" + "_" + `$_.Name)) -Value `$$VariableName.FindName(`$_.Name) }

"@

#region Create Class
if($CreateClass) {
$CreatedClass = $false
$VariablesAdded = @()
$ClassText = @'
#region CreateClass
Add-Type -Language CSharp @'
using System.ComponentModel;
public class WindowClass : INotifyPropertyChanged
{
'@
$xaml.SelectNodes("//*[@Title]") | Foreach-Object {
    If($_.Title.ToString().Contains('{Binding')) {
        $BindPath = $_.Title.ToString().Replace('{Binding Path=','').Replace('{Binding ','')
        $BindPath = $BindPath.Substring(0,$BindPath.Length - 1)
        if ($VariablesAdded -inotcontains $BindPath) {
            $PrivateVariable = "private" + $BindPath
            if(!($CreatedClass)) {
                $CreatedClass = $true
            }
            $ClassText = $ClassText + @"

    private string $PrivateVariable;
    public string $BindPath
    {
        get { return $PrivateVariable; }
        set
        {
            $PrivateVariable = value;
            NotifyPropertyChanged("$BindPath");
        }
    }

"@
            $VariablesAdded += @($BindPath)
        }
    }
}

$xaml.SelectNodes("//*[@Content]") | Foreach-Object {
    If($_.Content.ToString().Contains('{Binding')) {
        $BindPath = $_.Content.ToString().Replace('{Binding Path=','').Replace('{Binding ','')
        $BindPath = $BindPath.Substring(0,$BindPath.Length - 1)
        if ($VariablesAdded -inotcontains $BindPath) {
            $PrivateVariable = "private" + $BindPath
            if(!($CreatedClass)) {
                $CreatedClass = $true
            }
            $ClassText = $ClassText + @"

    private string $PrivateVariable;
    public string $BindPath
    {
        get { return $PrivateVariable; }
        set
        {
            $PrivateVariable = value;
            NotifyPropertyChanged("$BindPath");
        }
    }

"@
            $VariablesAdded += @($BindPath)
        }
    }
}

$xaml.SelectNodes("//*[@Text]") | Foreach-Object {
    If($_.Text.ToString().Contains('{Binding')) {
        $BindPath = $_.Text.ToString().Replace('{Binding Path=','').Replace('{Binding ','')
        $BindPath = $BindPath.Substring(0,$BindPath.Length - 1)
        if ($VariablesAdded -inotcontains $BindPath) {
            $PrivateVariable = "private" + $BindPath
            if(!($CreatedClass)) {
                $CreatedClass = $true
            }
            $ClassText = $ClassText + @"

    private string $PrivateVariable;
    public string $BindPath
    {
        get { return $PrivateVariable; }
        set
        {
            $PrivateVariable = value;
            NotifyPropertyChanged("$BindPath");
        }
    }

"@
            $VariablesAdded += @($BindPath)
        }
    }
}

$xaml.SelectNodes("//*[@ItemsSource]") | Foreach-Object {
    If($_.ItemsSource.ToString().Contains('{Binding')) {
        $BindPath = $_.ItemsSource.ToString().Replace('{Binding Path=','').Replace('{Binding ','')
        $BindPath = $BindPath.Substring(0,$BindPath.Length - 1)
        if ($VariablesAdded -inotcontains $BindPath) {
            $PrivateVariable = "private" + $BindPath
            if(!($CreatedClass)) {
                $CreatedClass = $true
            }
            $ClassText = $ClassText + @"

    private object $PrivateVariable;
    public object $BindPath
    {
        get { return $PrivateVariable; }
        set
        {
            $PrivateVariable = value;
            NotifyPropertyChanged("$BindPath");
        }
    }

"@
            $VariablesAdded += @($BindPath)
        }
    }
}


if($CreatedClass) {
    $ClassText = $ClassText + @"

    public event PropertyChangedEventHandler PropertyChanged;
    private void NotifyPropertyChanged(string property)
    {
        if(PropertyChanged != null)
        {
            PropertyChanged(this, new PropertyChangedEventArgs(property));
        }
    }
}

'@
#endregion


"@
    $EditorText = $EditorText + $ClassText
}
}
#endregion    
    $xaml.SelectNodes("//*[@Name]") | Foreach-Object {
        if (($_.LocalName -eq 'Button') -or ($_.LocalName -eq 'MenuItem')) {
            $NodeName = $VariableName + "_" + $_.Name
            $EditorText = $EditorText + @"
 
`$$NodeName.Add_Click({

})
 
"@
        }
    }
 
    $EditorText = $EditorText + [Environment]::NewLine + "`$$VariableName.ShowDialog() | Out-Null" + [Environment]::NewLine
 
    $psISE.CurrentFile.Editor.InsertText($EditorText)
 
}