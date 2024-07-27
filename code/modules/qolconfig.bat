@echo off
title github.com/SegoCode
MODE 88,35
setlocal enabledelayedexpansion
:: ----------------------------------------------------------
:: -------------------QOL SETTINGS START---------------------
:: ----------------------------------------------------------
:QOLCONFIG
cls
echo.
echo    Deblo.bat -[1;36m QoL Settings [m
echo    Quality of life configurations
echo    -----------------------------------------------
echo.

reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt > nul 2>&1 && (
	reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt | find "0x0" > nul 2>&1
)
if not %errorlevel% == 1 (
	echo    [1]  Hide file extensions                      = [[1;32m Disabled [m]
) else (
	echo    [1]  Hide file extensions                      = [[1;31m Enabled [m]
)


reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode > nul 2>&1 && (
    reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode | find "0x0" > nul 2>&1
)
if not %errorlevel% == 1 (
    echo    [2]  Show search box in taskbar                = [[1;32m Disabled [m]
) else (
    echo    [2]  Show search box in taskbar                = [[1;31m Enabled [m]
)

reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton > nul 2>&1 && (
    reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton | find "0x0" > nul 2>&1
)
if not %errorlevel% == 1 (
    echo    [3]  Show virtual desktop button               = [[1;32m Disabled [m]
) else (
    echo    [3]  Show virtual desktop button               = [[1;31m Enabled [m]
)

reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAl > nul 2>&1 && (
    reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAl | find "0x0" > nul 2>&1
)
if not %errorlevel% == 1 (
    echo    [4]  Center taskbar alignment                  = [[1;32m Disabled [m]
) else (
    echo    [4]  Center taskbar alignment                  = [[1;31m Enabled [m]
)

reg query "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" > nul 2>&1 && (
    reg query "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" | find "InprocServer32" > nul 2>&1
)
if not %errorlevel% == 1 (
    echo    [5]  Windows 11 contextual menu                = [[1;32m Disabled [m]
) else (
    echo    [5]  Windows 11 contextual menu                = [[1;31m Enabled [m]
)

reg query "HKCU\Control Panel\Desktop" /v Wallpaper > nul 2>&1 && (
    reg query "HKCU\Control Panel\Desktop" /v Wallpaper | find "Deblobat" > nul 2>&1
)
if not %errorlevel% == 1 (
    echo    [6]  Default wallpaper and theme               = [[1;32m Disabled [m]
) else (
    echo    [6]  Default wallpaper and theme               = [[1;31m Enabled [m]
)


reg query "HKEY_CURRENT_USER\Control Panel\Mouse" /v MouseThreshold1 > nul 2>&1 && (
    reg query "HKEY_CURRENT_USER\Control Panel\Mouse" /v MouseThreshold1 | find "0" > nul 2>&1
)
if not %errorlevel% == 1 (
    echo    [7]  Mouse Acceleration                        = [[1;32m Disabled [m]
) else (
    echo    [7]  Mouse Acceleration                        = [[1;31m Enabled [m]
)

reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL > nul 2>&1 && (
    reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL  | find "0x40" > nul 2>&1
)
if not %errorlevel% == 1 (
    echo    [8]  Default windows TTL                       = [[1;32m Disabled [m]
) else (
    echo    [8]  Default windows TTL                       = [[1;31m Enabled [m]
)

if exist %systemroot%\system32\VBoxDisp.dll (
    echo    [9]  Not simulate VM state to avoid malware    = [[1;32m Disabled [m]
) else (
    echo    [9]  Not simulate VM state to avoid malware    = [[1;31m Enabled [m]
)

reg query "HKCU\Control Panel\Desktop" /v JPEGImportQuality > nul 2>&1 && (
    reg query "HKCU\Control Panel\Desktop" /v JPEGImportQuality | find "0x64" > nul 2>&1
)
if not %errorlevel% == 1 (
    echo    [10] Wallpaper compression                     = [[1;32m Disabled [m]
) else (
    echo    [10] Wallpaper compression                     = [[1;31m Enabled [m]
)


reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile" /v EnableFirewall > nul 2>&1 && (
    reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile" /v EnableFirewall | find "0x0" > nul 2>&1
)
if not %errorlevel% == 1 (
    echo    [11] Windows firewall                          = [[1;32m Disabled [m]
) else (
    echo    [11] Windows firewall                          = [[1;31m Enabled [m]
)


reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_IrisRecommendations > nul 2>&1 && (
    reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_IrisRecommendations  | find "0x0" > nul 2>&1
)
if not %errorlevel% == 1 (
    echo    [12] Recommendations in the Start Menu         = [[1;32m Disabled [m]
) else (
    echo    [12] Recommendations in the Start Menu         = [[1;31m Enabled [m]
)

reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo > nul 2>&1 && (
    reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo | find "0x1" > nul 2>&1
)
if not %errorlevel% == 1 (
    echo    [13] File Explorer opens to This PC            = [[1;32m Disabled [m]
) else (
    echo    [13] File Explorer opens to This PC            = [[1;31m Enabled [m]
)

reg query "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v FolderType > nul 2>&1 && (
    reg query "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v FolderType | find "NotSpecified" > nul 2>&1
)
if not %errorlevel% == 1 (
    echo    [14] Folder Type determination in Explorer     = [[1;32m Disabled [m]
) else (
    echo    [14] Folder Type determination in Explorer     = [[1;31m Enabled [m]
)

reg query "HKCU\Software\Microsoft\Personalization\Settings" /v AcceptedPrivacyPolicy > nul 2>&1 && (
    reg query "HKCU\Software\Microsoft\Personalization\Settings" /v AcceptedPrivacyPolicy | find "0x0" > nul 2>&1
)
if not %errorlevel% == 1 (
    echo    [15] Accepted Privacy Policy                   = [[1;32m Disabled [m]
) else (
    echo    [15] Accepted Privacy Policy                   = [[1;31m Enabled [m]
)

reg query "HKCU\Control Panel\Accessibility\StickyKeys" /v Flags > nul 2>&1 && (
    reg query "HKCU\Control Panel\Accessibility\StickyKeys" /v Flags | find "0x0" > nul 2>&1
)
if not %errorlevel% == 1 (
    echo    [16] Sticky Keys                               = [[1;32m Disabled [m]
) else (
    echo    [16] Sticky Keys                               = [[1;31m Enabled [m]
)




echo.
echo    [0]  Return to menu

echo.

set /P N=Select your task and press Enter ^>
setlocal EnableDelayedExpansion
if %N%==1 (
	reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt | find "0x0" > nul 2>&1
	if not !ERRORLEVEL! == 1 (
		reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 1 /f > nul 2>&1
	) else (
		reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f > nul 2>&1
	)
)


if %N%==2 (
    reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode | find "0x0" > nul 2>&1
    if not !ERRORLEVEL! == 1 (
        reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /f > nul 2>&1
    ) else (
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d 0 /f > nul 2>&1
    )
)


if %N%==3 (
    reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton | find "0x0" > nul 2>&1
    if not !ERRORLEVEL! == 1 (
        reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton /t REG_DWORD /d 1 /f > nul 2>&1
    ) else (
        reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton /t REG_DWORD /d 0 /f > nul 2>&1
    )
)

if %N%==4 (
    reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAl | find "0x0" > nul 2>&1
    if not !ERRORLEVEL! == 1 (
        reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAl /t REG_DWORD /d 1 /f > nul 2>&1
    ) else (
        reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAl /t REG_DWORD /d 0 /f > nul 2>&1
    )
)

if %N%==5 (
    reg query "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" | find "InprocServer32" > nul 2>&1
    if not !ERRORLEVEL! == 1 (
        reg delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f > nul 2>&1
    ) else (
        reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve > nul 2>&1
    )
)

if %N%==6 (
    reg query "HKCU\Control Panel\Desktop" /v Wallpaper | find "Deblobat" > nul 2>&1
    if not !ERRORLEVEL! == 1 (
        reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "" /f > nul 2>&1
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v ColorPrevalence /t REG_DWORD /d 0 /f > nul 2>&1
        reg add "HKCU\Software\Microsoft\Windows\DWM" /v ColorPrevalence /t REG_DWORD /d 0 /f > nul 2>&1
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 1 /f > nul 2>&1
    ) else (
        if exist "%~dp0\sources\Deblobat.deskthemepack" (
            "%~dp0\sources\Deblobat.deskthemepack" & timeout /t 03 /nobreak > nul 2>&1 & taskkill /f /im systemsettings.exe > nul 2>&1
            reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v ColorPrevalence /t REG_DWORD /d 1 /f > nul 2>&1
            reg add "HKCU\Software\Microsoft\Windows\DWM" /v ColorPrevalence /t REG_DWORD /d 1 /f > nul 2>&1
            reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f > nul 2>&1
        ) else (
            cls
            echo.
            echo    Deblo.bat -[1;36m QoL Settings [m
            echo    Quality of life configurations
            echo    -----------------------------------------------
            echo.
            echo    Your version of Deblobat is corrupted or not 
            echo    working properly, it is not recommended to proceed 
            echo    with its use.
            echo.
            pause
        )
    )
)

if %N%==7 (
    reg query "HKEY_CURRENT_USER\Control Panel\Mouse" /v MouseThreshold1 | find "0"
    if not !ERRORLEVEL! == 1 (
        reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 6 /f > nul 2>&1
        reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 10 /f > nul 2>&1
        reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 1 /f > nul 2>&1
    ) else (
        reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 0 /f > nul 2>&1
        reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 0 /f > nul 2>&1
        reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 0 /f > nul 2>&1
        reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v MouseSensitivity /t REG_SZ /d 0 /f > nul 2>&1
    )
)

if %N%==8 (
    reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL  > nul 2>&1
    if !ERRORLEVEL! NEQ 0 (
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL /t REG_DWORD /d 128 /f > nul 2>&1
    )
    reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL  | find "0x80" > nul 2>&1
    if not !ERRORLEVEL! == 1 (
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL /t REG_DWORD /d 64 /f > nul 2>&1
    ) else (
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL /t REG_DWORD /d 128 /f > nul 2>&1
    )
)

if %N%==9 (
    if exist %systemroot%\system32\VBoxDisp.dll (
        goto DELTEVM
    ) else (
        goto ADDVM
    )
)


if %N%==10 (
    reg query "HKCU\Control Panel\Desktop" /v JPEGImportQuality | find "0x64" > nul 2>&1
    if not !ERRORLEVEL! == 1 (
        reg add "HKCU\Control Panel\Desktop" /v JPEGImportQuality /t REG_DWORD /d 50 /f > nul 2>&1
    ) else (
        reg add "HKCU\Control Panel\Desktop" /v JPEGImportQuality /t REG_DWORD /d 100 /f > nul 2>&1
    )
)


if %N%==11 (
    reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile" /v EnableFirewall | find "0x0" > nul 2>&1
    if not !ERRORLEVEL! == 1 (
        cls
        echo.
        echo    Deblo.bat -[1;36m QoL Settings [m
        echo    Quality of life configurations
        echo    -----------------------------------------------
        echo.
        echo    Loading, Please wait...

        :: Enable Firewall notifications on network profiles
        reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile" /v DisableNotifications /t REG_DWORD /d 0 /f > nul 2>&1
        reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile" /v DisableNotifications /t REG_DWORD /d 0 /f > nul 2>&1
        reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v DisableNotifications /t REG_DWORD /d 0 /f > nul 2>&1

        :: Enable Windows Defender Security Center notifications
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender Security Center\Notifications" /v DisableNotifications /t REG_DWORD /d 0 /f > nul 2>&1
        reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Notifications" /v DisableNotifications /f > nul 2>&1

        :: If Firewall is disabled, enable it
        powershell -Command "Set-NetFirewallProfile -Profile Private -Enabled True"
        powershell -Command "Set-NetFirewallProfile -Profile Public -Enabled True"
        powershell -Command "Set-NetFirewallProfile -Profile Domain -Enabled True"
        reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile" /v EnableFirewall /f > nul 2>&1
        reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile" /v EnableFirewall /f > nul 2>&1
    ) else (
        cls
        echo.
        echo    Deblo.bat -[1;36m QoL Settings [m
        echo    Quality of life configurations
        echo    -----------------------------------------------
        echo.
        echo    Loading, Please wait...

        :: Disable Firewall notifications on network profiles
        reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile" /v DisableNotifications /t REG_DWORD /d 1 /f > nul 2>&1
        reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile" /v DisableNotifications /t REG_DWORD /d 1 /f > nul 2>&1
        reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v DisableNotifications /t REG_DWORD /d 1 /f > nul 2>&1

        :: Disable Windows Defender Security Center notifications
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender Security Center\Notifications" /v DisableNotifications /t REG_DWORD /d 1 /f > nul 2>&1
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Notifications" /v DisableNotifications /t REG_DWORD /d 1 /f > nul 2>&1

        :: If Firewall is enabled, disable it
        powershell -Command "Set-NetFirewallProfile -Profile Private -Enabled False"
        powershell -Command "Set-NetFirewallProfile -Profile Public -Enabled False"
        powershell -Command "Set-NetFirewallProfile -Profile Domain -Enabled False"
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile" /v EnableFirewall /t REG_DWORD /d 0 /f > nul 2>&1
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile" /v EnableFirewall /t REG_DWORD /d 0 /f > nul 2>&1
    )
)

if %N%==12 (
    reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_IrisRecommendations | find "0x0" > nul 2>&1
    if not !ERRORLEVEL! == 1 (
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_IrisRecommendations /t REG_DWORD /d 1 /f > nul 2>&1
    ) else (
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_IrisRecommendations /t REG_DWORD /d 0 /f > nul 2>&1
    )
)

if %N%==13 (
    reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo | find "0x1" > nul 2>&1
    if not !ERRORLEVEL! == 1 (
        reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo /t REG_DWORD /d 0 /f > nul 2>&1
    ) else (
        reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo /t REG_DWORD /d 1 /f > nul 2>&1
    )
)

if %N%==14 (
    reg query "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v FolderType | find "NotSpecified" > nul 2>&1
    if not !ERRORLEVEL! == 1 (
        reg add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v FolderType /t REG_SZ /d "" /f > nul 2>&1
    ) else (
        reg add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v FolderType /t REG_SZ /d "NotSpecified" /f > nul 2>&1
    )
)


if %N%==15 (
    reg query "HKCU\Software\Microsoft\Personalization\Settings" /v AcceptedPrivacyPolicy | find "0x0" > nul 2>&1
    if not !ERRORLEVEL! == 1 (
        reg add "HKCU\Software\Microsoft\InputPersonalization" /v RestrictImplicitTextCollection /t REG_DWORD /d 0 /f > nul 2>&1
        reg add "HKCU\Software\Microsoft\InputPersonalization" /v RestrictImplicitInkCollection /t REG_DWORD /d 0 /f > nul 2>&1
        reg add "HKCU\Software\Microsoft\InputPersonalization\TrainedDataStore" /v HarvestContacts /t REG_DWORD /d 1 /f > nul 2>&1
        reg add "HKCU\Software\Microsoft\Personalization\Settings" /v AcceptedPrivacyPolicy /t REG_DWORD /d 1 /f > nul 2>&1
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CPSS\Store\InkingAndTypingPersonalization" /v Value /t REG_DWORD /d 1 /f > nul 2>&1
    ) else (
        reg add "HKCU\Software\Microsoft\InputPersonalization" /v RestrictImplicitTextCollection /t REG_DWORD /d 1 /f > nul 2>&1
        reg add "HKCU\Software\Microsoft\InputPersonalization" /v RestrictImplicitInkCollection /t REG_DWORD /d 1 /f > nul 2>&1
        reg add "HKCU\Software\Microsoft\InputPersonalization\TrainedDataStore" /v HarvestContacts /t REG_DWORD /d 0 /f > nul 2>&1
        reg add "HKCU\Software\Microsoft\Personalization\Settings" /v AcceptedPrivacyPolicy /t REG_DWORD /d 0 /f > nul 2>&1
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CPSS\Store\InkingAndTypingPersonalization" /v Value /t REG_DWORD /d 0 /f > nul 2>&1
    )
)


if %N%==16 (
    reg query "HKCU\Control Panel\Accessibility\StickyKeys" /v Flags | find "0x0" > nul 2>&1
    if not !ERRORLEVEL! == 1 (
        reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_DWORD /d 511 /f > nul 2>&1
    ) else (
        reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_DWORD /d 0 /f > nul 2>&1
    )
)



endlocal

if %N%==0 (
    taskkill /f /im explorer.exe > nul 2>&1
    start explorer.exe > nul 2>&1
    goto EOF
)
goto QOLCONFIG


:: ===================================================================
:: ======================= OPTION 9 SELECTED =========================
:: ===================================================================

:: This script adds and deletes virtual machine signatures and files.
:: Sections are clearly marked for readability and maintenance.

:: ===================================================================
:: ======================== ADD VM SECTION ===========================
:: ===================================================================

:ADDVM
SET sys32=%systemroot%\system32
SET drivers=%systemroot%\system32\drivers

:: Adding registry keys to simulate a virtual machine environment
reg add "HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\BIOS" /v SystemVersion /t REG_SZ /d "Virtual Machine" /f > nul 2>&1
reg add "HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\BIOS" /v SystemSKU /t REG_SZ /d "Microsoft Corporation" /f > nul 2>&1
reg add "HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\BIOS" /v SystemProductName /t REG_SZ /d "Virtual Machine" /f > nul 2>&1
reg add "HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\BIOS" /v SystemManufacturer /t REG_SZ /d "None" /f > nul 2>&1
reg add "HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\BIOS" /v SystemFamily /t REG_SZ /d "Hyper-V UEFI Release v4.1" /f > nul 2>&1

:: Adding registry keys related to VMware
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\VMware, Inc.\VMware Tools" /v InstallPath /t REG_SZ /d "C:\Program Files\VMware\VMware Tools" /f > nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmci" /v DisplayName /t REG_SZ /d "VMware vmci" /f > nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmxnet3" /v DisplayName /t REG_SZ /d "VMware vmxnet3" /f > nul 2>&1

:: Adding registry keys related to VirtualBox
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Oracle\VirtualBox Guest Additions" /v InstallDir /t REG_SZ /d "C:\Program Files\Oracle\VirtualBox Guest Additions" /f > nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\VBoxGuest" /v DisplayName /t REG_SZ /d "VirtualBox Guest Additions" /f > nul 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\VBoxMouse" /v DisplayName /t REG_SZ /d "VirtualBox Mouse" /f > nul 2>&1

:: Creating honeypot DLL files in system32 directory
cd %sys32%
set listDll=VBoxDisp VBoxHook VBoxMRXNP VBoxOGL VBoxOGLarrayspu VBoxOGLcrutil VBoxOGLerrorspu VBoxOGLfeedbackspu VBoxOGLpackspu VBoxOGLpassthroughspu
for %%a in (%listDll%) do (
   echo Honeypot> %%a.dll
)

:: Creating honeypot EXE files in system32 directory
set listEXE=VBoxControl VBoxService VBoxTray VBoxDrvInst VBoxWHQLFake
for %%b in (%listEXE%) do (
   echo Honeypot> %%b.exe
)

:: Creating honeypot SYS files in drivers directory
cd %drivers%
set listSYS=VBoxSF vboxmouse vboxguest vboxvideo Vmmouse
for %%c in (%listSYS%) do (
   echo Honeypot> %%c.sys
)

:: Additional honeypot DLL files for VMware
cd %sys32%
set listDllVM=vmGuestLib.dll vmGuestLibJava.dll vmhgfs.dll vmusrvc.dll
for %%d in (%listDllVM%) do (
   echo Honeypot> %%d
)

:: Additional honeypot EXE files for VMware
set listEXEVM=vmtoolsd.exe vmwaretray.exe vmacthlp.exe vmtoolsd64.exe
for %%e in (%listEXEVM%) do (
   echo Honeypot> %%e
)

:: Additional honeypot SYS files for VMware
cd %drivers%
set listSYSVM=vmhgfs.sys vmmouse.sys vm3dmp.sys vmusbmouse.sys
for %%f in (%listSYSVM%) do (
   echo Honeypot> %%f
)

:: Move to QOLCONFIG section after adding VM
goto QOLCONFIG

:: ===================================================================
:: ===================== END ADD VM SECTION ==========================
:: ===================================================================

:: ===================================================================
:: ======================== DELETE VM SECTION ========================
:: ===================================================================

:DELTEVM
SET sys32=%systemroot%\system32
SET drivers=%systemroot%\system32\drivers

:: Removing registry keys to revert the virtual machine environment
reg add "HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\BIOS" /v SystemVersion /t REG_SZ /d "" /f > nul 2>&1
reg add "HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\BIOS" /v SystemSKU /t REG_SZ /d "" /f > nul 2>&1
reg add "HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\BIOS" /v SystemProductName /t REG_SZ /d "" /f > nul 2>&1
reg add "HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\BIOS" /v SystemManufacturer /t REG_SZ /d "" /f > nul 2>&1
reg add "HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\BIOS" /v SystemFamily /t REG_SZ /d "" /f > nul 2>&1

:: Removing registry keys related to VMware
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\VMware, Inc.\VMware Tools" /f > nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmci" /f > nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmxnet3" /f > nul 2>&1

:: Removing registry keys related to VirtualBox
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Oracle\VirtualBox Guest Additions" /f > nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\VBoxGuest" /f > nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\VBoxMouse" /f > nul 2>&1

:: Deleting honeypot DLL files from system32 directory
cd %sys32%
set listDll=VBoxDisp VBoxHook VBoxMRXNP VBoxOGL VBoxOGLarrayspu VBoxOGLcrutil VBoxOGLerrorspu VBoxOGLfeedbackspu VBoxOGLpackspu VBoxOGLpassthroughspu
for %%a in (%listDll%) do (
   del /f /q %%a.dll
)

:: Deleting honeypot EXE files from system32 directory
set listEXE=VBoxControl VBoxService VBoxTray VBoxDrvInst VBoxWHQLFake
for %%b in (%listEXE%) do (
   del /f /q %%b.exe
)

:: Deleting honeypot SYS files from drivers directory
cd %drivers%
set listSYS=VBoxSF vboxmouse vboxguest vboxvideo Vmmouse
for %%c in (%listSYS%) do (
   del /f /q %%c.sys
)

:: Deleting additional honeypot DLL files for VMware
cd %sys32%
set listDllVM=vmGuestLib.dll vmGuestLibJava.dll vmhgfs.dll vmusrvc.dll
for %%d in (%listDllVM%) do (
   del /f /q %%d
)

:: Deleting additional honeypot EXE files for VMware
set listEXEVM=vmtoolsd.exe vmwaretray.exe vmacthlp.exe vmtoolsd64.exe
for %%e in (%listEXEVM%) do (
   del /f /q %%e
)

:: Deleting additional honeypot SYS files for VMware
cd %drivers%
set listSYSVM=vmhgfs.sys vmmouse.sys vm3dmp.sys vmusbmouse.sys
for %%f in (%listSYSVM%) do (
   del /f /q %%f
)

:: Move to QOLCONFIG section after deleting VM
goto QOLCONFIG

:: ===================================================================
:: ===================== END DELETE VM SECTION =======================
:: ===================================================================

:: ===================================================================
:: ========================== OPTION 9 END ===========================
:: ===================================================================
:EOF
exit
