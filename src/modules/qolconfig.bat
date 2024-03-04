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


reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton > nul 2>&1 && (
	reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton | find "0x0" > nul 2>&1
)
if not %errorlevel% == 1 (
	echo    [4]  Hide task timeline button                 = [[1;32m Enabled [m]
) else (
	echo    [4]  Hide task timeline button                 = [[1;31m Disabled [m]
)


reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL > nul 2>&1 && (
	reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL  | find "0x40" > nul 2>&1
)
if not %errorlevel% == 1 (
	echo    [5]  Change TTL to 64 for security reasons     = [[1;32m Enabled [m]
) else (
	echo    [5]  Change TTL to 64 for security reasons     = [[1;31m Disabled [m]
)

reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v PeopleBand > nul 2>&1 && (
	reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v PeopleBand | find "0x0" > nul 2>&1
)
if not %errorlevel% == 1 (
	echo    [6]  Hide the people from the taskbar          = [[1;32m Enabled [m]
) else (
	echo    [6]  Hide the people from the taskbar          = [[1;31m Disabled [m]
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

reg query "HKCU\Control Panel\Desktop" /v Wallpaper > nul 2>&1 && (
    reg query "HKCU\Control Panel\Desktop" /v Wallpaper | find "Deblobat" > nul 2>&1
)
if not %errorlevel% == 1 (
    echo    [13] Deblobat wallpaper and theme              = [[1;32m Enabled [m]
) else (
    echo    [13] Deblobat wallpaper and theme              = [[1;31m Disabled [m]
)


reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode > nul 2>&1 && (
    reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode | find "0x0" > nul 2>&1
)
if not %errorlevel% == 1 (
    echo    [14] Hide Searchbox Taskbar                    = [[1;32m Enabled [m]
) else (
    echo    [14] Hide Searchbox Taskbar                    = [[1;31m Disabled [m]
)

reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarGlomLevel > nul 2>&1 && (
    reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarGlomLevel | find "0x2" > nul 2>&1
)
if not %errorlevel% == 1 (
    echo    [15] No grouping in taskbar                    = [[1;32m Enabled [m]
) else (
    echo    [15] No grouping in taskbar                    = [[1;31m Disabled [m]
)


reg query "HKEY_CURRENT_USER\Control Panel\Mouse" /v MouseThreshold1 > nul 2>&1 && (
	reg query "HKEY_CURRENT_USER\Control Panel\Mouse" /v MouseThreshold1 | find "0" > nul 2>&1
)
if not %errorlevel% == 1 (
	echo    [16] Disable Mouse Acceleration                = [[1;32m Enabled [m]
) else (
	echo    [16] Disable Mouse Acceleration                = [[1;31m Disabled [m]
)


if exist "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe_bak" (
	echo    [17] Disable Edge                              = [[1;32m Enabled [m]
) else (
	echo    [17] Disable Edge                              = [[1;31m Disabled [m]
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
    if !ERRORLEVEL! NEQ 0 (
        reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarSmallIcons /t REG_DWORD /d 0 /f > nul 2>&1
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
    reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton > nul 2>&1
    if !ERRORLEVEL! NEQ 0 (
        reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton /t REG_DWORD /d 1 /f > nul 2>&1
    )

    reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton | find "0x0" > nul 2>&1
    if not !ERRORLEVEL! == 1 (
        reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton /t REG_DWORD /d 1 /f > nul 2>&1
    ) else (
        reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton /t REG_DWORD /d 0 /f > nul 2>&1
    )
)


if %N%==5 (
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
    if !ERRORLEVEL! NEQ 0 (
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
    reg query "HKCU\Control Panel\Desktop" /v Wallpaper | find "Deblobat" > nul 2>&1
    if not !ERRORLEVEL! == 1 (
        reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "" /f > nul 2>&1
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v ColorPrevalence /t REG_DWORD /d 0 /f > nul 2>&1
        reg add "HKCU\Software\Microsoft\Windows\DWM" /v ColorPrevalence /t REG_DWORD /d 0 /f > nul 2>&1
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 1 /f > nul 2>&1
    ) else (
        "%~dp0\sources\Deblobat.deskthemepack" & timeout /t 03 /nobreak > nul 2>&1 & taskkill /f /im systemsettings.exe > nul 2>&1
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v ColorPrevalence /t REG_DWORD /d 1 /f > nul 2>&1
        reg add "HKCU\Software\Microsoft\Windows\DWM" /v ColorPrevalence /t REG_DWORD /d 1 /f > nul 2>&1
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f > nul 2>&1
    )
)

if %N%==14 (
    reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode | find "0x0" > nul 2>&1
    if not !ERRORLEVEL! == 1 (
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d 1 /f > nul 2>&1
    ) else (
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d 0 /f > nul 2>&1
    )
)

if %N%==15 (
    reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarGlomLevel | find "0x2" > nul 2>&1
    if not !ERRORLEVEL! == 1 (
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarGlomLevel /t REG_DWORD /d 0 /f > nul 2>&1
    ) else (
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarGlomLevel /t REG_DWORD /d 2 /f > nul 2>&1
    )
)


if %N%==16 (
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

if %N%==17 (
	if exist "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe_bak" (
		rename "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe_bak" "msedge.exe" > nul 2>&1
	) else (
		rename "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe" "msedge.exe_bak" > nul 2>&1
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