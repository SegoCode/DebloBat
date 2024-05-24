Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.Windows.Forms

# Define the GUI XML in a multi-line string
$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Installed Apps" Height="550" Width="800" ResizeMode="NoResize"
        Background="#FF2B2B2B" Foreground="#E0E0E0">
    <Window.Resources>
        <Style TargetType="TextBlock">
            <Setter Property="Foreground" Value="#E0E0E0"/>
        </Style>
        <Style TargetType="CheckBox">
            <Setter Property="Foreground" Value="#E0E0E0"/>
        </Style>
        <Style TargetType="Button">
            <Setter Property="Background" Value="#003366"/>
            <Setter Property="Foreground" Value="#E0E0E0"/>
            <Setter Property="BorderBrush" Value="#1E90FF"/>
            <Setter Property="Padding" Value="5"/>
        </Style>
    </Window.Resources>
    <StackPanel>
        <ListBox x:Name="AppListBox" Margin="10" Height="350" Background="#333333" Foreground="#FFFFFF">
            <ListBox.ItemTemplate>
                <DataTemplate>
                    <StackPanel Orientation="Horizontal">
                        <CheckBox IsChecked="{Binding IsSelected}" Margin="5" VerticalAlignment="Center"/>
                        <TextBlock Text="{Binding Name}" VerticalAlignment="Center" TextWrapping="Wrap" Margin="5"/>
                    </StackPanel>
                </DataTemplate>
            </ListBox.ItemTemplate>
        </ListBox>
        <Button x:Name="ToggleSelectButton" Content="Select/Deselect All" Margin="10" Padding="5"/>
        <Button x:Name="UninstallButton" Content="Uninstall Selected" Margin="10" Padding="5"/>
        <Button x:Name="RestoreButton" Content="Restore Apps" Margin="10" Padding="5"/>
        <ProgressBar x:Name="ProgressBar" Height="20" Margin="10" Minimum="0" Maximum="100"/>
    </StackPanel>
</Window>
"@

# Load the XAML from the string
$reader = New-Object System.Xml.XmlNodeReader ([xml]$xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)

# Reference GUI elements
$appListBox = $window.FindName("AppListBox")
$toggleButton = $window.FindName("ToggleSelectButton")
$uninstallButton = $window.FindName("UninstallButton")
$restoreButton = $window.FindName("RestoreButton")
$progressBar = $window.FindName("ProgressBar")

# Function for the toggle button
$toggleButton.Add_Click({
    $allChecked = $true
    foreach ($item in $appListBox.Items) {
        if (-not $item.IsSelected) {
            $allChecked = $false
            break
        }
    }
    $newValue = -not $allChecked
    foreach ($item in $appListBox.Items) {
        $item.IsSelected = $newValue
    }
    $appListBox.Items.Refresh()
})

# Function for the uninstall button
$uninstallButton.Add_Click({
    $selectedItems = $appListBox.Items | Where-Object { $_.IsSelected -eq $true -and $_.PackageFullName -notmatch "Microsoft.WindowsStore" }
    $totalItems = $selectedItems.Count
    $progressCounter = 0
    foreach ($item in $selectedItems) {
        Remove-AppxPackage -Package $item.PackageFullName -AllUsers -Confirm:$false
        $progressCounter++
        $progressBar.Value = ($progressCounter / $totalItems) * 100
    }
    Update-AppList
})

# Function for the restore button
$restoreButton.Add_Click({
    Get-AppxPackage -AllUsers | Foreach {
        Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"
    }
    Update-AppList
})

# Function to update the application list
function Update-AppList {
    $packages = Get-AppxPackage -AllUsers -PackageTypeFilter Bundle |
        Where-Object { $_.NonRemovable -eq $False } |
        Select-Object Name, PackageFullName, @{Name="IsSelected"; Expression={ $false }}
    $appListBox.ItemsSource = $packages
    $appListBox.Items.Refresh()
}

# Initialize the application list
Update-AppList

# Display the window
$window.ShowDialog()
