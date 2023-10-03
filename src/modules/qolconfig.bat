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


::TODO: Implement
:: echo --- Disable Firewall through registry
:: Policy based
:: reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile" /v "EnableFirewall" /t REG_DWORD /d 0 /f
:: reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile" /v "EnableFirewall" /t REG_DWORD /d 0 /f
:: reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile" /v "EnableFirewall" /t REG_DWORD /d 0 /f
:: reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile" /v "EnableFirewall" /t REG_DWORD /d 0 /f


reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt > nul 2>&1 && (
	reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt | find "0x0" > nul 2>&1
)
if not %errorlevel% == 1 (
	echo    [1]  Show file extensions                      = [[1;32m Enabled [m]
) else (
	echo    [1]  Show file extensions                      = [[1;31m Disabled [m]
)


reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarSmallIcons > nul 2>&1 && (
	reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarSmallIcons | find "0x1" > nul 2>&1
)
if not %errorlevel% == 1 (
	echo    [2]  Small taskbar                             = [[1;32m Enabled [m]
) else (
	echo    [2]  Small taskbar                             = [[1;31m Disabled [m]
)


reg query "HKCU\SOFTWARE\Microsoft\Personalization\Settings" /v AcceptedPrivacyPolicy > nul 2>&1 && (
	reg query "HKCU\SOFTWARE\Microsoft\Personalization\Settings" /v AcceptedPrivacyPolicy | find "0x0" > nul 2>&1
)
if not %errorlevel% == 1 (
	echo    [3]  Deny Windows privacy consent              = [[1;32m Enabled [m]
) else (
	echo    [3]  Deny Windows privacy consent              = [[1;31m Disabled [m]
)


reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v NoUseStoreOpenWith > nul 2>&1 && (
	reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v NoUseStoreOpenWith  | find "0x1" > nul 2>&1
)
if not %errorlevel% == 1 (
	echo    [4]  Turn off "Look For An App In The Store"   = [[1;32m Enabled [m]
) else (
	echo    [4]  Turn off "Look For An App In The Store"   = [[1;31m Disabled [m]
)


reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL > nul 2>&1 && (
	reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL  | find "0x40" > nul 2>&1
)

if not %errorlevel% == 1 (
	echo    [5]  Change TTL to 64                          = [[1;32m Enabled [m]
) else (
	echo    [5]  Change TTL to 64                          = [[1;31m Disabled [m]
)

reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v PeopleBand > nul 2>&1 && (
	reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v PeopleBand | find "0x0" > nul 2>&1
)
if not %errorlevel% == 1 (
	echo    [6]  Remove the people from the taskbar        = [[1;32m Enabled [m]
) else (
	echo    [6]  Remove the people from the taskbar        = [[1;31m Disabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled > nul 2>&1 && (
	reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled | find "0x0" > nul 2>&1
)
if not %errorlevel% == 1 (
	echo    [7]  Disable Windows fast startup              = [[1;32m Enabled [m]
) else (
	echo    [7]  Disable Windows fast startup              = [[1;31m Disabled [m]
)


if exist %systemroot%\system32\VBoxDisp.dll (
	echo    [8]  Simulate VM to avoid malware              = [[1;32m Enabled [m]
) else (
	echo    [8]  Simulate VM to avoid malware              = [[1;31m Disabled [m]
)


reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo > nul 2>&1 && (
	reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo | find "0x1" > nul 2>&1
)
if not %errorlevel% == 1 (
	echo    [9]  Open This PC instead quick access         = [[1;32m Enabled [m]
) else (
	echo    [9]  Open This PC instead quick access         = [[1;31m Disabled [m]
)


reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\MTCUVC" /v EnableMtcUvc > nul 2>&1 && (
	reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\MTCUVC" /v EnableMtcUvc | find "0x0" > nul 2>&1
)
if not %errorlevel% == 1 (
	echo    [10] Use old volume control                    = [[1;32m Enabled [m]
) else (
	echo    [10] Use old volume control                    = [[1;31m Disabled [m]
)

reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v EnableAutoTray > nul 2>&1 && (
    reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v EnableAutoTray | find "0x0" > nul 2>&1
)
if not %errorlevel% == 1 (
    echo    [11] Show All System Tray Icons                = [[1;32m Enabled [m]
) else (
    echo    [11] Show All System Tray Icons                = [[1;31m Disabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v HubMode > nul 2>&1 && (
    reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v HubMode | find "0x0" > nul 2>&1
)
if not %errorlevel% == 1 (
    echo    [12] Quick-Access in Explorer                  = [[1;32m Enabled [m]
) else (
    echo    [12] Quick-Access in Explorer                  = [[1;31m Disabled [m]
)

reg query "HKCU\Control Panel\Desktop" /v JPEGImportQuality > nul 2>&1 && (
    reg query "HKCU\Control Panel\Desktop" /v JPEGImportQuality | find "0x0" > nul 2>&1
)
if not %errorlevel% == 1 (
    echo    [13] Desktop wallpaper quality reduction       = [[1;31m Disabled [m]
) else (
    echo    [13] Desktop wallpaper quality reduction       = [[1;32m Enabled [m]
)


reg query "HKCU\Control Panel\Desktop" /v Wallpaper > nul 2>&1 && (
    reg query "HKCU\Control Panel\Desktop" /v Wallpaper | find "wallpaper_deblobat.png" > nul 2>&1
)
if not %errorlevel% == 1 (
    echo    [14] Custom Deblobat wallpaper                 = [[1;32m Enabled [m]
) else (
    echo    [14] Custom Deblobat wallpaper                 = [[1;31m Disabled [m]
)

reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HideSCAMeetNow > nul 2>&1 && (
	reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HideSCAMeetNow | find "0x0" > nul 2>&1
)
if not %errorlevel% == 1 (
	echo    [15] Hide Meet Now icon in Taskbar             = [[1;32m Enabled [m]
) else (
	echo    [15] Hide Meet Now icon in Taskbar             = [[1;31m Disabled [m]
)

reg query "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v HidePeopleBar > nul 2>&1 && (
	reg query "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v HidePeopleBar | find "0x0" > nul 2>&1
)
if not %errorlevel% == 1 (
	echo    [16] Hide People Bar in taskbar                = [[1;32m Enabled [m]
) else (
	echo    [16] Hide People Bar in taskbar                = [[1;31m Disabled [m]
)


echo.
echo    [0]  Return to menu

echo.

set /P N=Select your task and press Enter ^>




if %N%==1 (
	reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt | find "0x0"
	if not !ERRORLEVEL! == 1 (
		reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 1 /f
	) else (
		reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f
	)
)

if %N%==2 (
    reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarSmallIcons > nul 2>&1
    if %ERRORLEVEL% NEQ 0 (
        reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarSmallIcons /t REG_DWORD /d 1 /f > nul 2>&1
    )
    reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarSmallIcons | find "0x1" > nul 2>&1
    if not !ERRORLEVEL! == 1 (
        reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarSmallIcons /t REG_DWORD /d 0 /f > nul 2>&1
    ) else (
        reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarSmallIcons /t REG_DWORD /d 1 /f > nul 2>&1
    )
)


if %N%==3 (
	reg query "HKCU\SOFTWARE\Microsoft\Personalization\Settings" /v AcceptedPrivacyPolicy | find "0x1" > nul 2>&1
	if not !ERRORLEVEL! == 1 (
		reg add "HKCU\SOFTWARE\Microsoft\Personalization\Settings" /v AcceptedPrivacyPolicy /t REG_DWORD /d 0 /f > nul 2>&1
	) else (
		reg add "HKCU\SOFTWARE\Microsoft\Personalization\Settings" /v AcceptedPrivacyPolicy /t REG_DWORD /d 1 /f > nul 2>&1
	)
)



if %N%==4 (
    reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v NoUseStoreOpenWith > nul 2>&1
    if %ERRORLEVEL% NEQ 0 (
        reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v NoUseStoreOpenWith /t REG_DWORD /d 1 /f > nul 2>&1
    )
	reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v NoUseStoreOpenWith  | find "0x1" > nul 2>&1
	if not !ERRORLEVEL! == 1 (
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v NoUseStoreOpenWith /t REG_DWORD /d 0 /f > nul 2>&1
	) else (
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v NoUseStoreOpenWith /t REG_DWORD /d 1 /f > nul 2>&1
	)
)

if %N%==5 (
    reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL  > nul 2>&1
    if %ERRORLEVEL% NEQ 0 (
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL /t REG_DWORD /d 128 /f > nul 2>&1
    )
    reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL  | find "0x80" > nul 2>&1
    if not !ERRORLEVEL! == 1 (
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL /t REG_DWORD /d 64 /f > nul 2>&1
    ) else (
        reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL /t REG_DWORD /d 128 /f > nul 2>&1
    )
)

if %N%==6 (
	reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v PeopleBand | find "0x0" > nul 2>&1
	if not !ERRORLEVEL! == 1 (
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v PeopleBand /t REG_DWORD /d 1 /f > nul 2>&1
	) else (
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v PeopleBand /t REG_DWORD /d 0 /f > nul 2>&1
	)
)

if %N%==7 (
	reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled | find "0x0" > nul 2>&1
	if not !ERRORLEVEL! == 1 (
		reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t REG_DWORD /d 1 /f > nul 2>&1
	) else (
		reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t REG_DWORD /d 0 /f > nul 2>&1
	)
)

if %N%==8 (
	if exist %systemroot%\system32\VBoxDisp.dll (
		goto DELTEVM
	) else (
		goto ADDVM
	)
)


if %N%==9 (
    reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo > nul 2>&1
    if %ERRORLEVEL% NEQ 0 (
        reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo /t REG_DWORD /d 1 /f > nul 2>&1
    )
	reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo | find "0x1" > nul 2>&1
	if not !ERRORLEVEL! == 1 (
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo /t REG_DWORD /d 2 /f > nul 2>&1
	) else (
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo /t REG_DWORD /d 1 /f > nul 2>&1
	)
)


if %N%==10 (
	reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\MTCUVC" /v EnableMtcUvc | find "0x0" > nul 2>&1
	if not !ERRORLEVEL! == 1 (
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\MTCUVC" /v EnableMtcUvc /t REG_DWORD /d 1 /f > nul 2>&1
	) else (
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\MTCUVC" /v EnableMtcUvc /t REG_DWORD /d 0 /f > nul 2>&1
	)
)

if %N%==11 (
    reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v EnableAutoTray | find "0x0" > nul 2>&1
    if not !ERRORLEVEL! == 1 (
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v EnableAutoTray /t REG_DWORD /d 1 /f > nul 2>&1
    ) else (
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v EnableAutoTray /t REG_DWORD /d 0 /f > nul 2>&1
    )
)

if %N%==12 (
    reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v HubMode | find "0x0" > nul 2>&1
    if not !ERRORLEVEL! == 1 (
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v HubMode /t REG_DWORD /d 1 /f > nul 2>&1
    ) else (
        reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v HubMode /t REG_DWORD /d 0 /f > nul 2>&1
    )
)

if %N%==13 (
   reg query "HKCU\Control Panel\Desktop" /v JPEGImportQuality > nul 2>&1
    if %ERRORLEVEL% NEQ 0 (
        reg add "HKCU\Control Panel\Desktop" /v JPEGImportQuality /t REG_DWORD /d 0 /f > nul 2>&1
    )
    reg query "HKCU\Control Panel\Desktop" /v JPEGImportQuality | find "0x64" > nul 2>&1
    if not !ERRORLEVEL! == 1 (
        reg add "HKCU\Control Panel\Desktop" /v JPEGImportQuality /t REG_DWORD /d 0 /f > nul 2>&1
    ) else (
        reg add "HKCU\Control Panel\Desktop" /v JPEGImportQuality /t REG_DWORD /d 100 /f > nul 2>&1
    )
)
if %N%==14 (
    reg query "HKCU\Control Panel\Desktop" /v Wallpaper | find "wallpaper_deblobat.png" > nul 2>&1
    if not !ERRORLEVEL! == 1 (
        reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "" /f > nul 2>&1
    ) else (
    :: Create DebloBat directory in %APPDATA% if it doesn't exist
    IF NOT EXIST "%APPDATA%\DebloBat" mkdir "%APPDATA%\DebloBat"

    :: Download image using Powershell and save it in the DebloBat directory
    PowerShell -Command "$imageUrl = 'https://raw.githubusercontent.com/SegoCode/DebloBat/main/media/wallpaper.png'; $DebloBatPath = [System.IO.Path]::Combine($env:APPDATA, 'DebloBat', 'wallpaper_deblobat.png'); Invoke-WebRequest -Uri $imageUrl -OutFile $DebloBatPath;"

    :: Change registry key using Reg command
    reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d %APPDATA%\DebloBat\wallpaper_deblobat.png /f

    :: Apply the wallpaper change using Powershell
    PowerShell -Command "Add-Type -TypeDefinition 'namespace Wallpaper{using System;using System.Runtime.InteropServices;public class Setter{[DllImport(\"user32.dll\", CharSet = CharSet.Auto)] public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);}}';$SPI_SETDESKWALLPAPER = 0x0014;$SPIF_UPDATEINIFILE = 0x01;$SPIF_SENDCHANGE = 0x02;[Wallpaper.Setter]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, '%APPDATA%\DebloBat\wallpaper_deblobat.png', $SPIF_UPDATEINIFILE -bor $SPIF_SENDCHANGE);"
    )
)


if %N%==15 (
	reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HideSCAMeetNow | find "0x0" > nul 2>&1
	if not !ERRORLEVEL! == 1 (
		reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HideSCAMeetNow /t REG_DWORD /d 1 /f > nul 2>&1
	) else (
		reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HideSCAMeetNow /t REG_DWORD /d 0 /f > nul 2>&1
	)
)

if %N%==16 (
	reg query "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v HidePeopleBar | find "0x0" > nul 2>&1
	if not !ERRORLEVEL! == 1 (
		reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v HidePeopleBar /t REG_DWORD /d 1 /f > nul 2>&1
	) else (
		reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v HidePeopleBar /t REG_DWORD /d 0 /f > nul 2>&1
	)
)

if %N%==0 (
    taskkill /f /im explorer.exe > nul 2>&1
    start explorer.exe > nul 2>&1
    goto INIT
)
goto QOLCONFIG

:: Have problems with the loops inside if, I take out the code temporarily here
:: ADD VM --------------------------------------------
:ADDVM
SET sys32=%systemroot%\system32
SET drivers=%systemroot%\system32\drivers

cd %sys32%
set listDll=VBoxDisp VBoxHook VBoxMRXNP VBoxOGL VBoxOGLarrayspu VBoxOGLcrutil VBoxOGLerrorspu VBoxOGLfeedbackspu VBoxOGLpackspu VBoxOGLpassthroughspu
for %%a in (%listDll%) do (
   echo Honeypot> %%a.dll
)

set listEXE=VBoxControl VBoxService VBoxTray VBoxDrvInst VBoxWHQLFake
for %%b in (%listEXE%) do (
   echo Honeypot> %%b.exe
)

cd %drivers%
set listSYS=VBoxSF vboxmouse vboxguest vboxvideo Vmmouse
for %%c in (%listSYS%) do (
   echo Honeypot> %%c.sys
)
goto QOLCONFIG
:: END ADD VM ----------------------------------------

:: DELETE VM --------------------------------------------
:DELTEVM
SET sys32=%systemroot%\system32
SET drivers=%systemroot%\system32\drivers

cd %sys32%
set listDll=VBoxDisp VBoxHook VBoxMRXNP VBoxOGL VBoxOGLarrayspu VBoxOGLcrutil VBoxOGLerrorspu VBoxOGLfeedbackspu VBoxOGLpackspu VBoxOGLpassthroughspu
for %%a in (%listDll%) do (
   del /f /q %%a.dll
)

set listEXE=VBoxControl VBoxService VBoxTray VBoxDrvInst VBoxWHQLFake
for %%b in (%listEXE%) do (
   del /f /q %%b.exe
)

cd %drivers%
set listSYS=VBoxSF vboxmouse vboxguest vboxvideo Vmmouse
for %%c in (%listSYS%) do (
   del /f /q %%c.sys
)
goto QOLCONFIG
:: END DELETE VM ----------------------------------------


:: ----------------------------------------------------------
:: -------------------QOL SETTINGS END-----------------------
:: ----------------------------------------------------------
:INIT