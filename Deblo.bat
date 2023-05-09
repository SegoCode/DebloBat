@echo off
set powershell=%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe


:: Ensure admin privileges
fltmc >nul 2>&1 || (
    echo Administrator privileges are required.
    %powershell% Start -Verb RunAs '%0' 2> nul || (
        echo Right-click on the script and select "Run as administrator".
        pause & exit 1
    )
    exit 0
)
%powershell% -Command "& {Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force}"

MODE 88,35
title github.com/SegoCode 

:: ----------------------------------------------------------
:: ---------------GET SYSTEM INFORMATION START---------------
:: ----------------------------------------------------------
set logo1=  [48;5;202m  [48;5;202m  [48;5;202m  [48;5;202m  [48;5;202m  [48;5;202m  [m  [48;5;41m  [48;5;41m  [48;5;41m  [48;5;41m  [48;5;41m  [48;5;41m  [m
set logo2=  [48;5;32m  [48;5;32m  [48;5;32m  [48;5;32m  [48;5;32m  [48;5;32m  [m  [48;5;220m  [48;5;220m  [48;5;220m  [48;5;220m  [48;5;220m  [48;5;220m  [m

cls
echo.
set white=[0m
set blue=[96m
set -=%blue%-%white%
echo %blue%      ,-----.     ____       _     _       _           _   
echo %blue%     / ,---. \   ^|  _ \  ___^| ^|__ ^| ^| ___ ^| ^|__   __ _^| ^|_ 
echo %blue%    / /     \ \  ^| ^| ^| ^|/ _ ^| '_ \^| ^|/ _ \^| '_ \ / _` ^| __^|
echo %blue%    \ \     / /  ^| ^|_^| ^|  __^| ^|_) ^| ^| (_) ^| ^|_) ^| (_^| ^| ^|_ 
echo %blue%     \ `---' /   ^|____/ \___^|_.__/^|_^|\___/^|_.__/ \__,_^|\__^|
echo %blue%      `-----'                                          
echo %white%   --------------------------------------------------------
echo.  
echo    Loading, Please wait...  = [[1;31m 1/7 [m]


:: Windows version
for /f "usebackq delims=" %%a in (`%powershell% -Command "(Get-CimInstance Win32_OperatingSystem).Caption;"`) do Set version=%%a
for /f "usebackq delims=" %%a in (`%powershell% -Command "(Get-CimInstance Win32_OperatingSystem).OSArchitecture;"`) do Set bits=%%a
for /f "usebackq delims=" %%a in (`%powershell% -Command "(Get-CimInstance  Win32_OperatingSystem).Version;"`) do Set kernel=%%a

echo    Loading, Please wait...  = [[1;31m 2/7 [m]

::CPU
for /f "usebackq delims=" %%a in (`%powershell% -Command "(((Get-CimInstance Win32_Processor).Name) -replace '\s+', ' ');"`) do Set cpu=%%a

echo    Loading, Please wait...  = [[1;31m 3/7 [m]

::GPU
for /f "usebackq delims=" %%a in (`%powershell% -Command "(Get-CimInstance Win32_DisplayConfiguration).DeviceName;"`) do Set gpu=%%a

echo    Loading, Please wait...  = [[1;31m 4/7 [m]

::Board
for /f "usebackq delims=" %%a in (`%powershell% -Command "(Get-CimInstance Win32_BaseBoard | Select-Object Manufacturer, Product).Product;"`) do Set moboP=%%a
for /f "usebackq delims=" %%a in (`%powershell% -Command "(Get-CimInstance Win32_BaseBoard | Select-Object Manufacturer, Product).Manufacturer;"`) do Set moboM=%%a

echo    Loading, Please wait...  = [[1;31m 5/7 [m]

::Names
for /f "usebackq delims=" %%a in (`%powershell% -Command "[System.Net.Dns]::GetHostName();"`) do Set userinfo=%%a
for /f "usebackq delims=" %%a in (`%powershell% -Command "$env:USERNAME"`) do Set username=%%a

echo    Loading, Please wait...  = [[1;31m 6/7 [m]

::Screen
for /f "usebackq delims=" %%a in (`%powershell% -Command "(Get-WmiObject -Class Win32_VideoController).CurrentRefreshRate"`) do Set hz=%%a
for /f "usebackq delims=" %%a in (`%powershell% -Command "(Get-WmiObject -Class Win32_VideoController).CurrentHorizontalResolution"`) do Set hozrs=%%a
for /f "usebackq delims=" %%a in (`%powershell% -Command "(Get-WmiObject -Class Win32_VideoController).CurrentVerticalResolution"`) do Set verrs=%%a

echo    Loading, Please wait...  = [[1;31m 7/7 [m]

:: UpTime
for /f %%a in ('WMIC OS GET lastbootuptime ^| find "."') DO set DTS=%%a 
set boot=%DTS:~0,4%-%DTS:~4,2%-%DTS:~6,2%  %DTS:~8,2%:%DTS:~10,2%
:: ----------------------------------------------------------
:: ----------------GET SYSTEM INFORMATION END----------------
:: ----------------------------------------------------------




:: ----------------------------------------------------------
:: ----------------------MAIN MENU START---------------------
:: ----------------------------------------------------------
:INIT
cd %systemroot%\System32
cls
echo.
echo    Deblo.bat for[1;36m Windows 10 [m
echo    Yet another (and ugly) debloat suite. 
echo    -----------------------------------------------
echo.  
echo    [1]  Privacy Local Group Policy   
echo    [2]  Other Local Group Policy          
echo    [3]  Windows Tasks 
echo    [4]  Windows Services
echo    [5]  QoL Customizations
echo    [6]  Non-Restorable Settings
echo    [7]  Windows online activator    
echo    [8]  Domain Blocker    
echo    [9]  Download center    
echo    [10] System information  
echo.
echo    [11] System reboot 
echo    [12] Github
echo    [13] Exit                 
echo.



set /P N=Select your option and press Enter ^> 
::DO NOT
if %N%==1 (goto LOCALGROUP)
::DELETE
if %N%==2 (goto OTHERLOCALGROUP)
::THIS
if %N%==3 (goto TASKSCHEDULER)
::COMMENTS 
if %N%==4 (goto SERVICES)
::BECAUSE 
if %N%==5 (goto QOLCONFIG)
::THIS
if %N%==6 (goto PERMANENTCONFIG)
::MENU
if %N%==7 (goto WINDOWSACTIVATOR)
::STOP 
if %N%==8 (goto BLOCKHOSTS)
::WORKING
if %N%==9 (goto DOWNLOADCENTER)
::I
if %N%==10 (goto SYSINFO)
::DONT
if %N%==11 (shutdown /r /t 0)
::KNOW
if %N%==12 (start https://github.com/SegoCode/DebloBat)
::WHY
if %N%==13 (exit)
:: ¯\_(ツ)_/¯
else (
	goto INIT
)

:: Actually the truncation process can potentially cause issues with certain 
:: jumps in the script, such as :GOTO or :CALL, as the split batches may not
:: include all necessary information for the script to execute correctly. 
:: It's important to be aware of this potential issue when working with 
:: large script files on Windows systems.

:: ----------------------------------------------------------
:: -----------------------MAIN MENU END----------------------
:: ----------------------------------------------------------




:: ----------------------------------------------------------
:: -----------------LOCAL GROUP POLICY START-----------------
:: ----------------------------------------------------------
:LOCALGROUP
cls
echo.
echo    Deblo.bat -[1;36m Local Group Policy [m
echo    Reverse engineer WPD app based on 1.5.2042 RC 1 
echo    -----------------------------------------------
echo.  

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v CEIPEnable > nul 2>&1
if not %errorlevel% == 1 (
	echo    [1]  Windows Customer Experience Improvement Program            = [[1;32m Disabled [m]
) else (
	echo    [1]  Windows Customer Experience Improvement Program            = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\SQM" /v DisableCustomerImprovementProgram > nul 2>&1
if not %errorlevel% == 1 (
	echo    [2]  Internet Explorer Customer Experience Improvement Program  = [[1;32m Disabled [m]
) else (
	echo    [2]  Internet Explorer Customer Experience Improvement Program  = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Messenger\Client" /v CEIP > nul 2>&1
if not %errorlevel% == 1 (
	echo    [3]  Windows Messenger Customer Experience Improvement Program  = [[1;32m Disabled [m]
) else (
	echo    [3]  Windows Messenger Customer Experience Improvement Program  = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana > nul 2>&1
if not %errorlevel% == 1 (
	echo    [4]  Allow Cortana                                              = [[1;32m Disabled [m]
) else (
	echo    [4]  Allow Cortana                                              = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowSearchToUseLocation > nul 2>&1
if not %errorlevel% == 1 (
	echo    [5]  Allow search and Cortana to use location                   = [[1;32m Disabled [m]
) else (
	echo    [5]  Allow search and Cortana to use location                   = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v Disabled > nul 2>&1
if not %errorlevel% == 1 (
	echo    [6]  Windows Error Reporting                                    = [[1;32m Disabled [m]
) else (
	echo    [6]  Windows Error Reporting                                    = [[1;31m Enabled [m]
)


reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v DisableUAR > nul 2>&1
if not %errorlevel% == 1 (
	echo    [7]  Steps Recorder                                             = [[1;32m Disabled [m]
) else (
	echo    [7]  Steps Recorder                                             = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v DisableInventory > nul 2>&1
if not %errorlevel% == 1 (
	echo    [8]  Inventory Collector                                        = [[1;32m Disabled [m]
) else (
	echo    [8]  Inventory Collector                                        = [[1;31m Enabled [m]
)


reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry > nul 2>&1
if not %errorlevel% == 1 (
	echo    [9]  Telemetry                                                  = [[1;32m Disabled [m]
) else (
	echo    [9]  Telemetry                                                  = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\InputPersonalization" /v RestrictImplicitTextCollection > nul 2>&1
if not %errorlevel% == 1 (
	echo    [10] Handwriting automatic learning                             = [[1;32m Disabled [m]
) else (
	echo    [10] Handwriting automatic learning                             = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\InputPersonalization" /v AllowInputPersonalization > nul 2>&1
if not %errorlevel% == 1 (
	echo    [11] Allow users to enable online speech recognition services   = [[1;32m Disabled [m]
) else (
	echo    [11] Allow users to enable online speech recognition services   = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\TextInput" /v AllowLinguisticDataCollection > nul 2>&1
if not %errorlevel% == 1 (
	echo    [12] Improve inking and typing recognition                      = [[1;32m Disabled [m]
) else (
	echo    [12] Improve inking and typing recognition                      = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}" /v ScenarioExecutionEnabled > nul 2>&1
if not %errorlevel% == 1 (
	echo    [13] PerfTrack                                                  = [[1;32m Disabled [m]
) else (
	echo    [13] PerfTrack                                                  = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy" /v DisableQueryRemoteServer > nul 2>&1
if not %errorlevel% == 1 (
	echo    [14] Microsoft Support Diagnostic Tool                          = [[1;32m Disabled [m]
) else (
	echo    [14] Microsoft Support Diagnostic Tool                          = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v DisabledByGroupPolicy > nul 2>&1
if not %errorlevel% == 1 (
	echo    [15] Advertising ID                                             = [[1;32m Disabled [m]
) else (
	echo    [15] Advertising ID                                             = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SearchCompanion" /v DisableContentFileUpdates > nul 2>&1
if not %errorlevel% == 1 (
	echo    [16] Search Companion                                           = [[1;32m Disabled [m]
) else (
	echo    [16] Search Companion                                           = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsConsumerFeatures > nul 2>&1
if not %errorlevel% == 1 (
	echo    [17] Microsoft consumer experiences                             = [[1;32m Disabled [m]
) else (
	echo    [17] Microsoft consumer experiences                             = [[1;31m Enabled [m]
)


reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v UploadUserActivities > nul 2>&1
if not %errorlevel% == 1 (
	echo    [18] Allow upload of User Activities                            = [[1;32m Disabled [m]
) else (
	echo    [18] Allow upload of User Activities                            = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v EnableActivityFeed > nul 2>&1
if not %errorlevel% == 1 (
	echo    [19] Enables Activities Feed                                    = [[1;32m Disabled [m]
) else (
	echo    [19] Enables Activities Feed                                    = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v AllowClipboardHistory > nul 2>&1
if not %errorlevel% == 1 (
	echo    [20] Allow Clipboard History                                    = [[1;32m Disabled [m]
) else (
	echo    [20] Allow Clipboard History                                    = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v AllowCrossDeviceClipboard > nul 2>&1
if not %errorlevel% == 1 (
	echo    [21] Allow Clipboard synchronized across devices                = [[1;32m Disabled [m]
) else (
	echo    [21] Allow Clipboard synchronized across devices                = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /v DisableSettingSync > nul 2>&1
if not %errorlevel% == 1 (
	echo    [22] Sync your settings                                         = [[1;32m Disabled [m]
) else (
	echo    [22] Sync your settings                                         = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v DisableFileSyncNGSC > nul 2>&1
if not %errorlevel% == 1 (
	echo    [23] Use OneDrive for file storage                              = [[1;32m Disabled [m]
) else (
	echo    [23] Use OneDrive for file storage                              = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v EnableSmartScreen > nul 2>&1
if not %errorlevel% == 1 (
	echo    [24] Windows Defender SmartScreen                               = [[1;32m Disabled [m]
) else (
	echo    [24] Windows Defender SmartScreen                               = [[1;31m Enabled [m]
)

echo    [25] Apply all                                                  = [[1;31m * [m]
echo.
echo    [0]  Return to menu                                                       

echo.

set /P N=Select your group policy and press Enter ^> 

if %N%==1 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" && set key=CEIPEnable && set value=0)
if %N%==2 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\SQM" && set key=DisableCustomerImprovementProgram && set value=0)
if %N%==3 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Messenger\Client" && set key=CEIP && set value=2)
if %N%==4 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" && set key=AllowCortana && set value=0)
if %N%==5 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" && set key=AllowSearchToUseLocation && set value=0)
if %N%==6 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" && set key=Disabled && set value=1)
if %N%==7 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" && set key=DisableUAR && set value=1)
if %N%==8 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" && set key=DisableInventory && set value=1)
if %N%==9 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" && set key=AllowTelemetry && set value=0)
if %N%==10 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\InputPersonalization" && set key=RestrictImplicitTextCollection && set value=1)
if %N%==11 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\InputPersonalization" && set key=AllowInputPersonalization && set value=0)
if %N%==12 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\TextInput" && set key=AllowLinguisticDataCollection && set value=0)
if %N%==13 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}" && set key=ScenarioExecutionEnabled && set value=0)
if %N%==14 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy" && set key=DisableQueryRemoteServer && set value=0)
if %N%==15 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" && set key=DisabledByGroupPolicy && set value=1)
if %N%==16 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SearchCompanion" && set key=DisableContentFileUpdates && set value=1)
if %N%==17 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" && set key=DisableWindowsConsumerFeatures && set value=1)
if %N%==18 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" && set key=UploadUserActivities && set value=0)
if %N%==19 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" && set key=EnableActivityFeed && set value=0)
if %N%==20 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" && set key=AllowClipboardHistory && set value=0)
if %N%==21 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" && set key=AllowCrossDeviceClipboard && set value=0)
if %N%==22 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SettingSync" && set key=DisableSettingSync && set value=2)
if %N%==23 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive" && set key=DisableFileSyncNGSC && set value=1)
if %N%==24 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" && set key=EnableSmartScreen && set value=0)

if %N%==25 (set loopcount=24 && goto APPLYALLLOCALGROUP)
if %N%==0 (goto INIT)

reg query %path% /v %key% > nul 2>&1
if not %errorlevel% == 1 (
		reg delete %path% /v %key% /f > nul 2>&1	
) else (
		reg add %path% /v %key% /t REG_DWORD /d %value% /f > nul 2>&1
)

goto LOCALGROUP

:APPLYALLLOCALGROUP
if %loopcount%==1 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" && set key=CEIPEnable && set value=0)
if %loopcount%==2 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\SQM" && set key=DisableCustomerImprovementProgram && set value=0)
if %loopcount%==3 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Messenger\Client" && set key=CEIP && set value=2)
if %loopcount%==4 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" && set key=AllowCortana && set value=0)
if %loopcount%==5 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" && set key=AllowSearchToUseLocation && set value=0)
if %loopcount%==6 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" && set key=Disabled && set value=1)
if %loopcount%==7 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" && set key=DisableUAR && set value=1)
if %loopcount%==8 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" && set key=DisableInventory && set value=1)
if %loopcount%==9 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" && set key=AllowTelemetry && set value=0)
if %loopcount%==10 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\InputPersonalization" && set key=RestrictImplicitTextCollection && set value=1)
if %loopcount%==11 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\InputPersonalization" && set key=AllowInputPersonalization && set value=0)
if %loopcount%==12 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\TextInput" && set key=AllowLinguisticDataCollection && set value=0)
if %loopcount%==13 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}" && set key=ScenarioExecutionEnabled && set value=0)
if %loopcount%==14 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy" && set key=DisableQueryRemoteServer && set value=0)
if %loopcount%==15 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" && set key=DisabledByGroupPolicy && set value=1)
if %loopcount%==16 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SearchCompanion" && set key=DisableContentFileUpdates && set value=1)
if %loopcount%==17 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" && set key=DisableWindowsConsumerFeatures && set value=1)
if %loopcount%==18 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" && set key=UploadUserActivities && set value=0)
if %loopcount%==19 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" && set key=EnableActivityFeed && set value=0)
if %loopcount%==20 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" && set key=AllowClipboardHistory && set value=0)
if %loopcount%==21 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" && set key=AllowCrossDeviceClipboard && set value=0)
if %loopcount%==22 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SettingSync" && set key=DisableSettingSync && set value=2)
if %loopcount%==23 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive" && set key=DisableFileSyncNGSC && set value=1)
if %loopcount%==24 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" && set key=EnableSmartScreen && set value=0)

reg query %path% /v %key% > nul 2>&1
if not %errorlevel% == 1 (
		reg delete %path% /v %key% /f > nul 2>&1	
) else (
		reg add %path% /v %key% /t REG_DWORD /d %value% /f > nul 2>&1
)

set /a loopcount=loopcount-1
if %loopcount%==0 goto LOCALGROUP
goto APPLYALLLOCALGROUP
:: ----------------------------------------------------------
:: -----------------LOCAL GROUP POLICY END-------------------
:: ----------------------------------------------------------

:: ----------------------------------------------------------
:: -------------OTHER LOCAL GROUP POLICY START---------------
:: ----------------------------------------------------------
:OTHERLOCALGROUP
cls
echo.
echo    Deblo.bat -[1;36m Other Local Group Policy [m
echo    My personal preference 
echo    -----------------------------------------------
echo.  

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v NoLockScreen > nul 2>&1
if not %errorlevel% == 1 (
	echo    [1]  Windows lock screen                          = [[1;32m Disabled [m]
) else (
	echo    [1]  Windows lock screen                          = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\UX Configuration" /v UILockdown > nul 2>&1
if not %errorlevel% == 1 (
	echo    [2]  Windows Defender full UI mode                = [[1;32m Disabled [m]
) else (
	echo    [2]  Windows Defender full UI mode                = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\UX Configuration" /v Notification_Suppress > nul 2>&1
if not %errorlevel% == 1 (
	echo    [3]  Windows Defender notifications               = [[1;32m Disabled [m]
) else (
	echo    [3]  Windows Defender notifications               = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\CloudContent" /v DisableSoftLanding > nul 2>&1
if not %errorlevel% == 1 (
	echo    [4]  Windows Tips                                 = [[1;32m Disabled [m]
) else (
	echo    [4]  Windows Tips                                 = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\FileHistory" /v Disabled > nul 2>&1
if not %errorlevel% == 1 (
	echo    [5]  Windows file history                         = [[1;32m Disabled [m]
) else (
	echo    [5]  Windows file history                         = [[1;31m Enabled [m]
)


reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Systray" /v HideSystray > nul 2>&1
if not %errorlevel% == 1 (
	echo    [6]  Windows Security systray                     = [[1;32m Disabled [m]
) else (
	echo    [6]  Windows Security systray                     = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v NoUseStoreOpenWith > nul 2>&1
if not %errorlevel% == 1 (
	echo    [7]  Open with the store                          = [[1;32m Disabled [m]
) else (
	echo    [7]  Open with the store                          = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-time Protection" /v DisableRealtimeMonitoring > nul 2>&1
if not %errorlevel% == 1 (
	echo    [8]  Microsoft Defender Antivirus Real-time       = [[1;32m Disabled [m]
) else (
	echo    [8]  Microsoft Defender Antivirus Real-time       = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Policies" /v NtfsEncryptPagingFile > nul 2>&1
if not %errorlevel% == 1 (
	echo    [9]  NTFS pagefile encryption                     = [[1;32m Disabled [m]
) else (
	echo    [9]  NTFS pagefile encryption                     = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Policies" /v DisableDeleteNotification > nul 2>&1
if not %errorlevel% == 1 (
	echo    [10] TRIM on SSD                                  = [[1;32m Disabled [m]
) else (
	echo    [10] TRIM on SSD                                  = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR > nul 2>&1
if not %errorlevel% == 1 (
	echo    [11] Game recording and broadcasting, GameDVR     = [[1;32m Disabled [m]
) else (
	echo    [11] Game recording and broadcasting, GameDVR     = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Messaging" /v AllowMessageSync > nul 2>&1
if not %errorlevel% == 1 (
	echo    [12] Message service cloud sync                   = [[1;32m Disabled [m]
) else (
	echo    [12] Message service cloud sync                   = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v PublishUserActivities > nul 2>&1
if not %errorlevel% == 1 (
	echo    [13] Collect activity history                     = [[1;32m Disabled [m]
) else (
	echo    [13] Collect activity history                     = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCloudSearch > nul 2>&1
if not %errorlevel% == 1 (
	echo    [14] Cloud content in search results              = [[1;32m Disabled [m]
) else (
	echo    [14] Cloud content in search results              = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v ConnectedSearchUseWeb > nul 2>&1
if not %errorlevel% == 1 (
	echo    [15] Web search in start menu                     = [[1;32m Disabled [m]
) else (
	echo    [15] Web search in start menu                     = [[1;31m Enabled [m]
)


reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v DODownloadMode > nul 2>&1
if not %errorlevel% == 1 (
	echo    [16] Delivery optimization in updates             = [[1;32m Disabled [m]
) else (
	echo    [16] Delivery optimization in updates             = [[1;31m Enabled [m]
)


reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v DisableSearchBoxSuggestions > nul 2>&1
if not %errorlevel% == 1 (
	echo    [17] News and interests on the taskbar            = [[1;32m Disabled [m]
) else (
	echo    [17] News and interests on the taskbar            = [[1;31m Enabled [m]
)


reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v SubmitSamplesConsent > nul 2>&1
if not %errorlevel% == 1 (
	echo    [18] File reporting in Windows Defender           = [[1;32m Disabled [m]
) else (
	echo    [18] File reporting in Windows Defender           = [[1;31m Enabled [m]
)

reg query "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v DisableSearchBoxSuggestions > nul 2>&1
if not %errorlevel% == 1 (
	echo    [19] Search box suggestions in Explorer           = [[1;32m Disabled [m]
) else (
	echo    [19] Search box suggestions in Explorer           = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v LimitDiagnosticLogCollection > nul 2>&1
if not %errorlevel% == 1 (
	echo    [20] Limit diagnostic log collection              = [[1;32m Disabled [m]
) else (
	echo    [20] Limit diagnostic log collection              = [[1;31m Enabled [m]
)




echo    [21] Apply all                                    = [[1;31m * [m]
echo.
echo    [0]  Return to menu                                                       

echo.

set /P N=Select your group policy and press Enter ^> 

if %N%==1 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization" && set key=NoLockScreen && set value=1)
if %N%==2 (set path="HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\UX Configuration" && set key=UILockdown && set value=1)
if %N%==3 (set path="HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\UX Configuration" && set key=Notification_Suppress && set value=1)
if %N%==4 (set path="HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\CloudContent" && set key=DisableSoftLanding && set value=1)
if %N%==5 (set path="HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\FileHistory" && set key=Disabled && set value=1)
if %N%==6 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Systray" && set key=HideSystray && set value=1)
if %N%==7 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer" && set key=NoUseStoreOpenWith && set value=1)
if %N%==8 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-time Protection" && set key=DisableRealtimeMonitoring && set value=1)
if %N%==9 (set path="HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Policies" && set key=NtfsEncryptPagingFile && set value=1)
if %N%==10 (set path="HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Policies" && set key=DisableDeleteNotification && set value=1)
if %N%==11 (set path="HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\GameDVR" && set key=AllowGameDVR && set value=0)
if %N%==12 (set path="HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Messaging" && set key=AllowMessageSync && set value=0)
if %N%==13 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" && set key=PublishUserActivities && set value=0)
if %N%==14 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" && set key=AllowCloudSearch && set value=0)
if %N%==15 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" && set key=ConnectedSearchUseWeb && set value=0)
if %N%==16 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" && set key=DODownloadMode && set value=0)
if %N%==17 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" && set key=DisableSearchBoxSuggestions && set value=0)
if %N%==18 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" && set key=SubmitSamplesConsent && set value=2)
if %N%==19 (set path="HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\Explorer" && set key=DisableSearchBoxSuggestions && set value=1)
if %N%==20 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" && set key=LimitDiagnosticLogCollection && set value=1)


if %N%==21 (set loopcount=20 && goto APPLYALLOTHERLOCALGROUP)
if %N%==0 (goto INIT)

reg query %path% /v %key% > nul 2>&1
if not %errorlevel% == 1 (
		reg delete %path% /v %key% /f > nul 2>&1	
) else (
		reg add %path% /v %key% /t REG_DWORD /d %value% /f > nul 2>&1
)

goto OTHERLOCALGROUP

:APPLYALLOTHERLOCALGROUP
if %loopcount%==1 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization" && set key=NoLockScreen && set value=1)
if %loopcount%==2 (set path="HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\UX Configuration" && set key=UILockdown && set value=1)
if %loopcount%==3 (set path="HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\UX Configuration" && set key=Notification_Suppress && set value=1)
if %loopcount%==4 (set path="HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\CloudContent" && set key=DisableSoftLanding && set value=1)
if %loopcount%==5 (set path="HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\FileHistory" && set key=Disabled && set value=1)
if %loopcount%==6 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Systray" && set key=HideSystray && set value=1)
if %loopcount%==7 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer" && set key=NoUseStoreOpenWith && set value=1)
if %loopcount%==8 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-time Protection" && set key=DisableRealtimeMonitoring && set value=1)
if %loopcount%==9 (set path="HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Policies" && set key=NtfsEncryptPagingFile && set value=1)
if %loopcount%==10 (set path="HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Policies" && set key=DisableDeleteNotification && set value=1)
if %loopcount%==11 (set path="HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\GameDVR" && set key=AllowGameDVR && set value=0)
if %loopcount%==12 (set path="HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Messaging" && set key=AllowMessageSync && set value=0)
if %loopcount%==13 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" && set key=PublishUserActivities && set value=0)
if %loopcount%==14 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" && set key=AllowCloudSearch && set value=0)
if %loopcount%==15 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" && set key=ConnectedSearchUseWeb && set value=0)
if %loopcount%==16 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" && set key=DODownloadMode && set value=0)
if %loopcount%==17 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" && set key=DisableSearchBoxSuggestions && set value=0)
if %loopcount%==18 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" && set key=SubmitSamplesConsent && set value=2)
if %loopcount%==19 (set path="HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\Explorer" && set key=DisableSearchBoxSuggestions && set value=1)
if %loopcount%==20 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" && set key=LimitDiagnosticLogCollection && set value=1)


reg query %path% /v %key% > nul 2>&1
if not %errorlevel% == 1 (
		reg delete %path% /v %key% /f > nul 2>&1	
) else (
		reg add %path% /v %key% /t REG_DWORD /d %value% /f > nul 2>&1
)

set /a loopcount=loopcount-1
if %loopcount%==0 goto OTHERLOCALGROUP
goto APPLYALLOTHERLOCALGROUP
:: ----------------------------------------------------------
:: -------------OTHER LOCAL GROUP POLICY END---------------
:: ----------------------------------------------------------




:: ----------------------------------------------------------
:: ------------------TASK SCHEDULER START--------------------
:: ----------------------------------------------------------
:TASKSCHEDULER
cls
echo.
echo    Deblo.bat -[1;36m Task Scheduler [m
echo    Reverse engineer WPD app based on 1.5.2042 RC 1 
echo    -----------------------------------------------
echo.  


schtasks /query /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [1]  Consolidator                 = [[1;32m Disabled [m]
) else (
	echo    [1]  Consolidator                 = [[1;31m Enabled [m]
)

schtasks /query /tn "\Microsoft\Windows\PI\Sqm-Tasks" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [2]  Sqm-Tasks                    = [[1;32m Disabled [m]
) else (
	echo    [2]  Sqm-Tasks                    = [[1;31m Enabled [m]
)


schtasks /query /tn "\Microsoft\Windows\Autochk\Proxy" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [3]  Proxy                        = [[1;32m Disabled [m]
) else (
	echo    [3]  Proxy                        = [[1;31m Enabled [m]
)


schtasks /query /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [4]  DiskDiagnosticDataCollector  = [[1;32m Disabled [m]
) else (
	echo    [4]  DiskDiagnosticDataCollector  = [[1;31m Enabled [m]
)

schtasks /query /tn "\Microsoft\Windows\NetTrace\GatherNetworkInfo" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [5]  GatherNetworkInfo            = [[1;32m Disabled [m]
) else (
	echo    [5]  GatherNetworkInfo            = [[1;31m Enabled [m]
)

schtasks /query /tn "\Microsoft\Windows\Device Information\Device" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [6]  Device Census                = [[1;32m Disabled [m]
) else (
	echo    [6]  Device Census                = [[1;31m Enabled [m]
)


schtasks /query /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [7]  Windows Error Reporting      = [[1;32m Disabled [m]
) else (
	echo    [7]  Windows Error Reporting      = [[1;31m Enabled [m]
)

schtasks /query /tn "\Microsoft\Windows\Feedback\Siuf\DmClient" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [8]  DmClient                     = [[1;32m Disabled [m]
) else (
	echo    [8]  DmClient                     = [[1;31m Enabled [m]
)

echo    [9]  Apply all                    = [[1;31m * [m]
echo.
echo    [0]  Return to menu                                                       

echo.

set /P N=Select your task and press Enter ^> 

if %N%==1 (set service="Consolidator")
if %N%==2 (set service="Sqm-Tasks")
if %N%==3 (set service="Proxy")
if %N%==4 (set service="Microsoft-Windows-DiskDiagnosticDataCollector")
if %N%==5 (set service="GatherNetworkInfo")
if %N%==6 (set service="device")
if %N%==7 (set service="QueueReporting")
if %N%==8 (set service="DmClient")

if %N%==9 (set loopcount=8 && goto APPLYALLTASKSCHEDULERMIDDLE)
if %N%==0 (goto INIT)


%powershell% -Command "If ((Get-ScheduledTask %service%).state -eq 'Disabled') {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	%powershell% -Command "Enable-ScheduledTask (Get-ScheduledTask %service%)" > nul 2>&1
) else (
	%powershell% -Command "Disable-ScheduledTask (Get-ScheduledTask %service%)" > nul 2>&1
)

goto TASKSCHEDULER

:APPLYALLTASKSCHEDULERMIDDLE
cls
echo.
echo    Deblo.bat -[1;36m Task Scheduler [m
echo    Reverse engineer WPD app based on 1.5.2042 RC 1 
echo    -----------------------------------------------
echo.  

:APPLYALLTASKSCHEDULER
if %loopcount%==1 (set service="Consolidator")
if %loopcount%==2 (set service="Sqm-Tasks")
if %loopcount%==3 (set service="Proxy")
if %loopcount%==4 (set service="Microsoft-Windows-DiskDiagnosticDataCollector")
if %loopcount%==5 (set service="GatherNetworkInfo")
if %loopcount%==6 (set service="device")
if %loopcount%==7 (set service="QueueReporting")
if %loopcount%==8 (set service="DmClient")

set /a numcount= 8 - %loopcount% + 1
echo    Working, Please wait...  = [[1;31m %numcount%/8 [m]

%powershell% -Command "If ((Get-ScheduledTask %service%).state -eq 'Disabled') {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	%powershell% -Command "Enable-ScheduledTask (Get-ScheduledTask %service%)" > nul 2>&1
) else (
	%powershell% -Command "Disable-ScheduledTask (Get-ScheduledTask %service%)" > nul 2>&1
)

set /a loopcount=loopcount-1
if %loopcount%==0 goto TASKSCHEDULER
goto APPLYALLTASKSCHEDULER
:: ----------------------------------------------------------
:: ------------------TASK SCHEDULER END--------------------
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------------SERVICES START----------------------
:: ----------------------------------------------------------

:SERVICES
cls
echo.
echo    Deblo.bat -[1;36m Windows Services [m
echo    Yet another (and ugly) debloat suite.
echo    -----------------------------------------------
echo.  

sc qc "DiagTrack" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [1]   Diagnostics Tracking Service                = [[1;32m Disabled [m]
) else (
	echo    [1]   Diagnostics Tracking Service                = [[1;31m Enabled [m]
)

sc qc "lfsvc" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [2]   Geolocation Service                         = [[1;32m Disabled [m]
) else (
	echo    [2]   Geolocation Service                         = [[1;31m Enabled [m]
)

sc qc "MapsBroker" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [3]   Downloaded Maps Manager                     = [[1;32m Disabled [m]
) else (
	echo    [3]   Downloaded Maps Manager                     = [[1;31m Enabled [m]
)

sc qc "RemoteRegistry" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [4]   Remote Registry                             = [[1;32m Disabled [m]
) else (
	echo    [4]   Remote Registry                             = [[1;31m Enabled [m]
)

sc qc "SharedAccess" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [5]   Internet Connection Sharing                 = [[1;32m Disabled [m]
) else (
	echo    [5]   Internet Connection Sharing                 = [[1;31m Enabled [m]
)

sc qc "TrkWks" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [6]   Distributed Link Tracking Client            = [[1;32m Disabled [m]
) else (
	echo    [6]   Distributed Link Tracking Client            = [[1;31m Enabled [m]
)

sc qc "WSearch" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [7]   Windows Search                              = [[1;32m Disabled [m]
) else (
	echo    [7]   Windows Search                              = [[1;31m Enabled [m]
)

sc qc "WerSvc" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [8]   Disables windows error reporting            = [[1;32m Disabled [m]
) else (
	echo    [8]   Disables windows error reporting            = [[1;31m Enabled [m]
)

sc qc "RemoteAccess" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [9]   Routing and Remote Access                   = [[1;32m Disabled [m]
) else (
	echo    [9]   Routing and Remote Access                   = [[1;31m Enabled [m]
)

sc qc "ndu" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [10]  Windows Network Data Usage Monitor          = [[1;32m Disabled [m]
) else (
	echo    [10]  Windows Network Data Usage Monitor          = [[1;31m Enabled [m]
)

sc qc "NetTcpPortSharing" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [11]  Net.Tcp Port Sharing Service                = [[1;32m Disabled [m]
) else (
	echo    [11]  Net.Tcp Port Sharing Service                = [[1;31m Enabled [m]
)

sc qc "diagnosticshub.standardcollector.service" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [12]  Diagnostics Hub Standard Collector Service  = [[1;32m Disabled [m]
) else (
	echo    [12]  Diagnostics Hub Standard Collector Service  = [[1;31m Enabled [m]
)

echo    [13]  Apply all                                   = [[1;31m * [m]
echo.
echo    [0]   Return to menu                     
echo.
set /P N=Select your service and press Enter ^> 



if %N%==1 (set serviceName="DiagTrack")
if %N%==2 (set serviceName="lfsvc")
if %N%==3 (set serviceName="MapsBroker")
if %N%==4 (set serviceName="RemoteRegistry")
if %N%==5 (set serviceName="SharedAccess")
if %N%==6 (set serviceName="TrkWks")
if %N%==7 (set serviceName="WSearch")
if %N%==8 (set serviceName="WerSvc")
if %N%==9 (set serviceName="RemoteAccess")
if %N%==10 (set serviceName="ndu")
if %N%==11 (set serviceName="NetTcpPortSharing")
if %N%==12 (set serviceName="diagnosticshub.standardcollector.service")

setlocal enabledelayedexpansion
set services= DiagTrack lfsvc MapsBroker RemoteRegistry SharedAccess TrkWks WSearch WerSvc RemoteAccess ndu NetTcpPortSharing diagnosticshub.standardcollector.service
set /A count=1

if %N%==13 (
	for %%s in (%services%) do (
		sc qc %%s | findstr /r "DISABLED" > nul 2>&1
		if !errorlevel! equ 0 (
			sc config %%s start= auto > nul 2>&1
		) else (
		    sc config %%s start= disabled > nul 2>&1
		)
		set /A count+=1
	)
	goto SERVICES
)
if %N%==0 (goto INIT)

%powershell% -Command "If ((Get-Service -Name %serviceName%).StartType -eq 'Disabled') {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	sc config %serviceName% start= AUTO
) else (
    sc stop %serviceName%
	sc config %serviceName% start= DISABLED
)

goto SERVICES
:: ----------------------------------------------------------
:: -----------------------SERVICES END-----------------------
:: ----------------------------------------------------------


:PERMANENTCONFIG
cls
echo.
echo    Deblo.bat -[1;36m Non-Restorable Settings [m
echo    It should not break your system in any case
echo    -----------------------------------------------
echo.  

echo    This section contains scripts that cant be undone, also some 
echo    tweaks attack directly the configuration registry that may  
echo    change depending the windows version, if you want to proceed 
echo    really recommend create a restore point.
echo.

%powershell% -Command "If ((Get-ComputerRestorePoint).Description -Contains 'DebloBatRestorePoint') {exit 0} Else {exit 1}"
if not %errorlevel% == 1 (
	echo    Restore Point Status                          = [[1;32m Found [m]
) else (
	echo    Restore Point Status                          = [[1;31m Not Found [m]
	echo    [1]  Create restore point
)
echo.

echo.
echo    [2] OneDrive removal script                   = [[1;32m Ready [m]
echo    [3] Edge removal script                       = [[1;32m Ready [m]
echo    [4] Windows cleaner script                    = [[1;32m Ready [m]
echo    [5] Games optimizer script                    = [[1;32m Ready [m]
echo    [6] Uninstall default apps script             = [[1;32m Ready [m]
echo.

echo    [0]  Return to menu                                                       

echo.
set /P N=Select your task and press Enter ^> 

setlocal enabledelayedexpansion

if %N%==1 (
	%powershell% -Command "Checkpoint-Computer -Description 'DebloBatRestorePoint' -RestorePointType 'MODIFY_SETTINGS'"
)

if %N%==2 (
	cls
	echo.
	echo    Deblo.bat -[1;36m Non-Restorable Settings [m
	echo    OneDrive removal script
	echo    -----------------------------------------------
	echo.  
	echo    Kill OneDrive process, Please wait...               = [[1;31m 1/8 [m]
	taskkill /f /im OneDrive.exe > nul 2>&1

	echo    Run OneDrive unistaller, Please wait...             = [[1;31m 2/8 [m]
	%SystemRoot%\System32\OneDriveSetup.exe /uninstall > nul 2>&1
	%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall > nul 2>&1

	echo    Remove OneDrive leftovers, Please wait...           = [[1;31m 3/8 [m]
	rd "%UserProfile%\OneDrive" /q /s > nul 2>&1
	rd "%LocalAppData%\Microsoft\OneDrive" /q /s > nul 2>&1
	rd "%ProgramData%\Microsoft OneDrive" /q /s > nul 2>&1
	rd "%SystemDrive%\OneDriveTemp" /q /s > nul 2>&1
	for /f "usebackq delims=" %%a in (`dir /b /a:d "!SystemDrive!\Users"`) do (
		rmdir /q /s "!SystemDrive!\Users\%%a\AppData\Local\Microsoft\OneDrive" > nul 2>&1
		rmdir /q /s "!SystemDrive!\Users\%%a\OneDrive" > nul 2>&1
		del /q /f "!SystemDrive!\Users\%%a\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk" > nul 2>&1
	)

	echo    Prevent OneDrive install, Please wait...            = [[1;31m 4/8 [m]
	reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "OneDriveSetup" /f > nul 2>&1

	echo    Remove OneDrive from explorer, Please wait...       = [[1;31m 5/8 [m]
	reg delete "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f > nul 2>&1
	reg delete "HKCR\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f > nul 2>&1
	reg add "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v System.IsPinnedToNameSpaceTree /d "0" /t REG_DWORD /f > nul 2>&1
	reg add "HKCR\Wow6432Node\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v System.IsPinnedToNameSpaceTree /d "0" /t REG_DWORD /f > nul 2>&1

	echo    Delete OneDrive path from registry, Please wait...  = [[1;31m 6/8 [m]
	reg delete "HKCU\Environment" /v "OneDrive" /f > nul 2>&1

	echo    Delete OneDrive task, Please wait...                = [[1;31m 7/8 [m]
	for /f "tokens=1 delims=," %%x in ('schtasks /query /fo csv ^| find "OneDrive"') do schtasks /Delete /TN %%x /F > nul 2>&1
	
	echo    Remove residual files, Please wait...               = [[1;31m 8/8 [m]

	for /f "usebackq tokens=2 delims=\" %%a in (`reg query "HKEY_USERS" ^| findstr /r /x /c:"HKEY_USERS\\S-.*" /c:"HKEY_USERS\\AME_UserHive_[^_]*"`) do (
	:: If the "Volatile Environment" key exists, that means it is a proper user. Built in accounts/SIDs do not have this key.
	reg query "HKU\%%a" | findstr /c:"Volatile Environment" /c:"AME_UserHive_" > nul 2>&1
	if not !errorlevel! == 1 (
			call :USERREG "%%a"
		)
	)
	:USERREG
	for /f "usebackq delims=" %%a in (`reg query "HKU\%~1\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\BannerStore" ^| findstr /i /c:"OneDrive"`) do (
		reg delete "%%a" /f > nul 2>&1
	)
	for /f "usebackq delims=" %%a in (`reg query "HKU\%~1\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\Handlers" ^| findstr /i /c:"OneDrive"`) do (
		reg delete "%%a" /f > nul 2>&1
	)
	for /f "usebackq delims=" %%a in (`reg query "HKU\%~1\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths" ^| findstr /i /c:"OneDrive"`) do (
		reg delete "%%a" /f > nul 2>&1
	)
	for /f "usebackq delims=" %%a in (`reg query "HKU\%~1\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" ^| findstr /i /c:"OneDrive"`) do (
		reg delete "%%a" /f > nul 2>&1
	)

	reg delete "HKU\%~1\Environment" /v "OneDrive" /f > nul 2>&1

	echo.
	echo    One drive killer Script                             = [[1;32m DONE [m]
	echo    Press any key for return to menu . . . 
	pause > nul
)



if %N%==3 (
	cls
	echo.
	echo    Deblo.bat -[1;36m Non-Restorable Settings [m
	echo    Edge removal script
	echo    -----------------------------------------------
	echo.  
	echo    Run Edge unistaller, Please wait...    = [[1;31m 1/2 [m]
	%powershell% -Command "$installer = (Get-ChildItem "^""$env:ProgramFiles*\Microsoft\Edge\Application\*\Installer\setup.exe"^""); if (!$installer) {; Write-Host 'Could not find the installer'; } else {; & $installer.FullName -Uninstall -System-Level -Verbose-Logging -Force-Uninstall; }"> nul 2>&1
	
	echo    Remove residual files, Please wait...  = [[1;31m 2/2 [m]
	for /f "usebackq delims=" %%a in (`dir /b /a:d "!SystemDrive!\Users" ^| findstr /v /i /x /c:"Public" /c:"Default User" /c:"All Users"`) do (
		del /q /f "!SystemDrive!\Users\%%a\Desktop\Microsoft Edge.lnk" > nul 2>&1
		del /q /f "!SystemDrive!\Users\%%a\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Microsoft Edge.lnk" > nul 2>&1
		rmdir /q /s "!SystemDrive!\Users\%%a\AppData\Local\Microsoft\EdgeWebView" > nul 2>&1
		rmdir /q /s "!SystemDrive!\Users\%%a\AppData\Local\Microsoft\Edge" > nul 2>&1
		rmdir /q /s "!SystemDrive!\Users\%%a\AppData\Local\Microsoft\EdgeUpdate" > nul 2>&1
		rmdir /q /s "!SystemDrive!\Users\%%a\AppData\Local\Microsoft\EdgeCore" > nul 2>&1
	)
	
	echo.
	echo    Edge removal script                    = [[1;32m DONE [m]
	echo    Press any key for return to menu . . . 
	pause > nul
)


if %N%==4 (
	cls
	echo.
	echo    Deblo.bat -[1;36m Non-Restorable Settings [m
	echo    Windows cleaner script from privacy.sexy
	echo    -----------------------------------------------
	echo.  
	
	echo    Clear Listary indexes                           = [[1;31m 1/31 [m]
	::Clear Listary indexes, removes Listary search indexes for privacy and space
	del /f /s /q %appdata%\Listary\UserData > nul 2>&1
	
	echo    Clear list of Recent Files Opened, by Filetype  = [[1;31m 2/31 [m]
	::Delete RecentDocs key from local machine user to remove recent documents list for all users
	reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /va /f > nul 2>&1
	::Delete RecentDocs key from current user to remove recent documents list for the current user
	reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /va /f > nul 2>&1
	::Delete OpenSaveMRU key to remove recent documents list in common dialog boxes
	reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU" /va /f > nul 2>&1

	echo    Clear Windows Search Assistant history          = [[1;31m 3/31 [m]
	::Delete ACMru key to clear Windows Search Assistant history for the current user
	reg delete "HKCU\Software\Microsoft\Search Assistant\ACMru" /va /f > nul 2>&1

	echo    Clear MSPaint MRU                               = [[1;31m 4/31 [m]
	::Delete Recent File List key for MSPaint from current user to remove list of recent files
	reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\Recent File List" /va /f > nul 2>&1
	::Delete Recent File List key for MSPaint from local machine user to remove list of recent files for all users
	reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Paint\Recent File List" /va /f > nul 2>&1

	echo    Clear Dotnet CLI telemetry                      = [[1;31m 5/31 [m]
	::Remove TelemetryStorageService directory to delete .NET CLI telemetry data
	rmdir /s /q "%USERPROFILE%\.dotnet\TelemetryStorageService" > nul 2>&1

	echo    Clear regedit favorites                         = [[1;31m 6/31 [m]
	::Delete Favorites key from current user's regedit to clear favorites list
	reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit\Favorites" /va /f > nul 2>&1
	::Delete Favorites key from local machine user's regedit to clear favorites list for all users
	reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Regedit\Favorites" /va /f > nul 2>&1

	echo    Clear regedit last key                          = [[1;31m 7/31 [m]
	::Delete last accessed key, removing regedit's memory of last accessed registry key
	reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit" /va /f > nul 2>&1
	reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Regedit" /va /f > nul 2>&1

	echo    Clear recently accessed files                   = [[1;31m 8/31 [m]
	::Clear recently accessed files, removing traces of recently opened documents
	del /f /q "%APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations\*" > nul 2>&1

	echo    Network Setup Service Events Logs               = [[1;31m 9/31 [m]
	::Clear Network Setup Service Events Logs, removing network setup history
	del /f /q "%SystemRoot%\Logs\NetSetup\*" > nul 2>&1

	echo    Common Language Runtime Logs                    = [[1;31m 10/31 [m]
	::Clear Common Language Runtime Logs, erasing .NET Framework usage history
	del /f /q "%LocalAppData%\Microsoft\CLR_v4.0\UsageTraces\*" > nul 2>&1
	del /f /q "%LocalAppData%\Microsoft\CLR_v4.0_32\UsageTraces\*" > nul 2>&1

	echo    Clear Server initiated Healing Events Logs      = [[1;31m 11/31 [m]
	::Clear Server initiated Healing Events Logs, removing system repair history
	del /f /q "%SystemRoot%\Logs\SIH\*" > nul 2>&1

	echo    Clear DISM                                      = [[1;31m 12/31 [m]
	::Delete CBS.log file, removing Component-Based Servicing log
	del /f /q  %SystemRoot%\Logs\CBS\CBS.log > nul 2>&1
	::Delete DISM.log file, removing Deployment Image Servicing and Management log
	del /f /q  %SystemRoot%\Logs\DISM\DISM.log > nul 2>&1

	echo    Clear Windows temp files                        = [[1;31m 13/31 [m]
	::Clear Windows temp files
	del /f /q %SystemRoot%\ServiceProfiles\LocalService\AppData\Local\Temp\*.* > nul 2>&1
	del /f /q %localappdata%\Temp\* > nul 2>&1
	rd /s /q "%WINDIR%\Temp" > nul 2>&1
	rd /s /q "%TEMP%" > nul 2>&1

	echo    Clear user web cache database                   = [[1;31m 14/31 [m]
	::Clear user web cache database, helps maintain privacy and free up space
	del /f /q %localappdata%\Microsoft\Windows\WebCache\*.* > nul 2>&1

	echo    Clear Password change events                    = [[1;31m 15/31 [m]
	::Clear Password change events, removes traces of password changes
	del /f /q %SystemRoot%\debug\PASSWD.LOG > nul 2>&1

	echo    Clear Windows System Assessment Tool logs       = [[1;31m 16/31 [m]
	::Clear Windows System Assessment Tool logs, removes performance scores history
	del /f /q %SystemRoot%\Performance\WinSAT\winsat.log > nul 2>&1

	echo    Clear Windows Setup Logs                        = [[1;31m 17/31 [m]
	::Clear Windows Setup Logs, removes logs related to Windows installation and setup
	del /f /q %SystemRoot%\setupapi.log > nul 2>&1
	del /f /q %SystemRoot%\Panther\* > nul 2>&1
	del /f /q %SystemRoot%\inf\setupapi.app.log > nul 2>&1
	del /f /q %SystemRoot%\inf\setupapi.dev.log > nul 2>&1
	del /f /q %SystemRoot%\inf\setupapi.offline.log > nul 2>&1

	echo    Clear Windows Deployment Upgrade Process Logs   = [[1;31m 18/31 [m]
	::Remove upgrade process logs, info about setup, errors, driver installation, and software compatibility checks during upgrade. Safe to delete.
	del /f /q %SystemRoot%\setupact.log > nul 2>&1
	del /f /q %SystemRoot%\setuperr.log > nul 2>&1

	echo    Clear Pending File Rename Operations logs       = [[1;31m 19/31 [m]
	::Clear Pending File Rename Operations logs, removes logs of pending file operations
	del /f /q %SystemRoot%\PFRO.log > nul 2>&1

	echo    Clear DNS cache                                  = [[1;31m 20/31 [m]
	::Clear DNS cache, improves privacy and can fix DNS-related issues
	ipconfig /flushdns > nul 2>&1

	echo    Clear Distributed Transaction Coordinator logs  = [[1;31m 21/31 [m]
	::Clear Distributed Transaction Coordinator logs, removes transaction coordination logs
	del /f /q %SystemRoot%\DtcInstall.log > nul 2>&1

	echo    Clear Optional Component Manager and COM logs   = [[1;31m 22/31 [m]
	::Clear Optional Component Manager and COM logs, removes logs related to optional components and COM
	del /f /q %SystemRoot%\comsetup.log > nul 2>&1

	echo    Windows Update Logs                             = [[1;31m 23/31 [m]
	::Clear Windows Update Logs, removes logs of Windows updates for privacy and space
	del /f /q "%SystemRoot%\Traces\WindowsUpdate\*" > nul 2>&1


	echo    Windows Update Events Logs                      = [[1;31m 24/31 [m]
	::Clear Windows Update Events Logs, removes logs of Windows update events
	del /f /q "%SystemRoot%\Logs\SIH\*" > nul 2>&1

	
	echo.
	echo    Windows cleaner script                          = [[1;32m DONE [m]
	echo    Press any key for return to menu . . . 
	pause > nul
)

if %N%==5 (
	cls
	echo.
	echo    Deblo.bat -[1;36m Non-Restorable Settings [m
	echo    Windows games optimizer script
	echo    -----------------------------------------------
	echo.  
	
	::Reset mouse sensitivity, default value is 10
	echo    Reset mouse sensitivity, Please wait...            = [[1;31m 1/6 [m]
	reg add "HKCU\Control Panel\Mouse" /v "MouseSensitivity" /t REG_SZ /d "10" /f > nul 2>&1
	
	::Reset mouse speed, default value is 0
	echo    Reset mouse speed, Please wait...                  = [[1;31m 2/6 [m]
	reg add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f > nul 2>&1
	
	::Reset MouseThreshold1, default value is 0, determines how fast the mouse pointer moves
	echo    Reset MouseThreshold1, Please wait...              = [[1;31m 3/6 [m]
	reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f > nul 2>&1
	
	::Reset MouseThreshold2, default value is 0, determines how fast the mouse pointer moves
	echo    Reset MouseThreshold2, Please wait...              = [[1;31m 4/6 [m]
	reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f > nul 2>&1
	
	::Set CPU Priority for games, GPU Priority to 8, Priority to 6 for better gaming performance
	echo    Set CPU Priority, Please wait...                   = [[1;31m 5/6 [m]
	reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_SZ /d "8" /f > nul 2>&1
	reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_SZ /d "6" /f > nul 2>&1


	echo    Set AtlasOs power profile, Please wait...          = [[1;31m 6/6 [m]
	setlocal EnableDelayedExpansion
	:: Detect if user uses laptop device or personal computer
	for /f "delims=:{}" %%a in ('wmic path Win32_SystemEnclosure get ChassisTypes ^| findstr [0-9]') do set "CHASSIS=%%a" > nul 2>&1
	for %%a in (8 9 10 11 12 13 14 18 21 30 31 32) do if "!CHASSIS!" == "%%a" (set "DEVICE_TYPE=LAPTOP") else (set "DEVICE_TYPE=PC") > nul 2>&1

	:: Disable Hibernation and Fast Startup
	:: Disabling makes NTFS accessable outside of Windows
	powercfg -h off > nul 2>&1

	:: Disable SleepStudy (UserNotPresentSession.etl)
	wevtutil set-log "Microsoft-Windows-SleepStudy/Diagnostic" /e:false > nul 2>&1
	wevtutil set-log "Microsoft-Windows-Kernel-Processor-Power/Diagnostic" /e:false > nul 2>&1
	wevtutil set-log "Microsoft-Windows-UserModePowerService/Diagnostic" /e:false > nul 2>&1

	:: Duplicate Ultimate Performance power scheme, customize it and make it the Atlas power scheme
	powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 11111111-1111-1111-1111-111111111111 > nul 2>&1
	powercfg -setactive 11111111-1111-1111-1111-111111111111 > nul 2>&1

	:: Set current power scheme to Atlas
	powercfg -changename scheme_current "Atlas Power Scheme" "Power scheme optimized for optimal latency and performance." > nul 2>&1
	:: Secondary NVMe Idle Timeout - 0 miliseconds
	powercfg -setacvalueindex scheme_current 0012ee47-9041-4b5d-9b77-535fba8b1442 d3d55efd-c1ff-424e-9dc3-441be7833010 0 > nul 2>&1
	:: Primary NVMe Idle Timeout - 0 miliseconds
	powercfg -setacvalueindex scheme_current 0012ee47-9041-4b5d-9b77-535fba8b1442 d639518a-e56d-4345-8af2-b9f32fb26109 0 > nul 2>&1
	:: NVME NOPPME - Off
	powercfg -setacvalueindex scheme_current 0012ee47-9041-4b5d-9b77-535fba8b1442 fc7372b6-ab2d-43ee-8797-15e9841f2cca 0 > nul 2>&1
	:: Slide show - Paused
	powercfg -setacvalueindex scheme_current 0d7dbae2-4294-402a-ba8e-26777e8488cd 309dce9b-bef4-4119-9921-a851fb12f0f4 1 > nul 2>&1
	:: Allow Away Mode Policy - No
	powercfg -setacvalueindex scheme_current 238c9fa8-0aad-41ed-83f4-97be242c8f20 25dfa149-5dd1-4736-b5ab-e8a37b5b8187 0 > nul 2>&1
	:: System unattended sleep timeout - 0 seconds
	powercfg -setacvalueindex scheme_current 238c9fa8-0aad-41ed-83f4-97be242c8f20 7bc4a2f9-d8fc-4469-b07b-33eb785aaca0 0 > nul 2>&1
	:: Allow hybrid sleep - Off
	powercfg -setacvalueindex scheme_current 238c9fa8-0aad-41ed-83f4-97be242c8f20 94ac6d29-73ce-41a6-809f-6363ba21b47e 0 > nul 2>&1
	:: Allow Standby States - Off
	powercfg -setacvalueindex scheme_current 238c9fa8-0aad-41ed-83f4-97be242c8f20 abfc2519-3608-4c2a-94ea-171b0ed546ab 0 > nul 2>&1
	:: Allow wake timers - Disable
	powercfg -setacvalueindex scheme_current 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 0 > nul 2>&1
	:: Hub Selective Suspend Timeout - 0 miliseconds
	powercfg -setacvalueindex scheme_current 2a737441-1930-4402-8d77-b2bebba308a3 0853a681-27c8-4100-a2fd-82013e970683 0 > nul 2>&1
	:: USB selective suspend setting - Disabled
	powercfg -setacvalueindex scheme_current 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0 > nul 2>&1
	:: USB 3 Link Power Mangement - Off
	powercfg -setacvalueindex scheme_current 2a737441-1930-4402-8d77-b2bebba308a3 d4e98f31-5ffe-4ce1-be31-1b38b384c009 0 > nul 2>&1
	:: Deep Sleep Enabled/Disabled - Deep Sleep Disabled
	powercfg -setacvalueindex scheme_current 2e601130-5351-4d9d-8e04-252966bad054 d502f7ee-1dc7-4efd-a55d-f04b6f5c0545 0 > nul 2>&1
	:: Allow Throttle States - Off
	powercfg -setacvalueindex scheme_current 54533251-82be-4824-96c1-47b60b740d00 3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb 0 > nul 2>&1
	:: Dim display after - 0 seconds
	powercfg -setacvalueindex scheme_current 7516b95f-f776-4464-8c53-06167f40cc99 17aaa29b-8b43-4b94-aafe-35f64daaf1ee 0 > nul 2>&1
	:: Turn off display after - 0 seconds
	powercfg -setacvalueindex scheme_current 7516b95f-f776-4464-8c53-06167f40cc99 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 0 > nul 2>&1
	
	:: Prevents parking of multi-threads (do not confuse it with cores parking)
	:: Prefers to use Performance-cores for foreground applications and heavy load situations
	:: Credit: Revision Team
	PowerShell -NoP -C "$cpu = Get-CimInstance Win32_Processor; $cpuName = $cpu.Name; $cpuGen = [int]($cpuName.Substring(0, 2)); if ($cpuGen -gt 11) { powercfg -setacvalueindex scheme_current sub_processor HETEROPOLICY 0; powercfg -setacvalueindex scheme_current sub_processor SCHEDPOLICY 2; }" > nul 2>&1

	:: Set the active scheme as the current scheme
	powercfg -setactive scheme_current > nul 2>&1
		
	if "!DEVICE_TYPE!" == "PC" (
		:: Disable Advanced Configuration and Power Interface (ACPI) devices
		call toggleDev.cmd "ACPI Processor Aggregator" "Microsoft Windows Management Interface for ACPI" > nul 2>&1

		:: Disable driver power saving
		PowerShell -NoP -C "$usb_devices = @('Win32_USBController', 'Win32_USBControllerDevice', 'Win32_USBHub'); $power_device_enable = Get-WmiObject MSPower_DeviceEnable -Namespace root\wmi; foreach ($power_device in $power_device_enable){$instance_name = $power_device.InstanceName.ToUpper(); foreach ($device in $usb_devices){foreach ($hub in Get-WmiObject $device){$pnp_id = $hub.PNPDeviceID; if ($instance_name -like \"*$pnp_id*\"){$power_device.enable = $False; $power_device.psbase.put()}}}}" > nul 2>&1

		for %%a in (
			"AllowIdleIrpInD3"
			"D3ColdSupported"
			"DeviceSelectiveSuspended"
			"EnableIdlePowerManagement"
			"EnableSelectiveSuspend"
			"EnhancedPowerManagementEnabled"
			"IdleInWorkingState"
			"SelectiveSuspendEnabled"
			"SelectiveSuspendOn"
			"WaitWakeEnabled"
			"WakeEnabled"
			"WdfDirectedPowerTransitionEnable"
		) do (
			for /f "delims=" %%b in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum" /s /f "%%~a" ^| findstr "HKEY"') do (
				reg add "%%b" /v "%%~a" /t REG_DWORD /d "0" /f > nul 2>&1
			)
		)

		:: Disable D3 support on SATA/NVMEs while using Modern Standby
		:: https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/power-management-for-storage-hardware-devices-intro#d3-support
		reg add "HKLM\SYSTEM\CurrentControlSet\Control\Storage" /v "StorageD3InModernStandby" /t REG_DWORD /d "0" /f > nul 2>&1

		:: Disable IdlePowerMode for stornvme.sys (storage devices) - the device will never enter a low-power state
		reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters\Device" /v "IdlePowerMode" /t REG_DWORD /d "0" /f > nul 2>&1

		:: Disable power throttling
		:: https://blogs.windows.com/windows-insider/2017/04/18/introducing-power-throttling
		reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f > nul 2>&1
	)
	echo.
	echo    Windows games optimizer script     = [[1;32m DONE [m]
	echo    Press any key for return to menu . . . 
	pause > nul
)

if %N%==6 (
	for %%p in (
		"*Microsoft.BioEnrollment*",
		"*Microsoft.ECApp*",
		"*Microsoft.Windows.NarratorQuickStart*",
		"*Microsoft.549981C3F5F10*",
		"*Microsoft.MixedReality.Portal*",
		"*Microsoft.Windows.AssignedAccessLockApp*",
		"*Microsoft.Windows.ContentDeliveryManager*",
		"*Microsoft.Windows.OOBENetworkCaptivePortal*",
		"*Microsoft.Windows.OOBENetworkConnectionFlow*",
		"*microsoft.windowscommunicationsapps*",
		"*Microsoft.Windows.SecureAssessmentBrowser*",
		"*Microsoft.Advertising.Xaml*",
		"*Microsoft.BingWeather*",
		"*Microsoft.GetHelp*",
		"*Microsoft.Getstarted*",
		"*Microsoft.Microsoft3DViewer*",
		"*Microsoft.MicrosoftEdge*",
		"*microsoft.microsoftedge.stable*",
		"*Microsoft.MicrosoftEdgeDevToolsClient*",
		"*Microsoft.MicrosoftOfficeHub*",
		"*Microsoft.MicrosoftSolitaireCollection*",
		"*Microsoft.MicrosoftStickyNotes*",
		"*Microsoft.MSPaint*",
		"*Microsoft.Office.OneNote*",
		"*Microsoft.People*",
		"*Microsoft.Windows.PeopleExperienceHost*",
		"*Microsoft.ScreenSketch*",
		"*Microsoft.SkypeApp*",
		"*Microsoft.Wallet*",
		"*Microsoft.Windows.ParentalControls*",
		"*Microsoft.Windows.Photos*",
		"*Microsoft.WindowsAlarms*",
		"*Microsoft.WindowsCamera*",
		"*Microsoft.WindowsFeedbackHub*",
		"*Microsoft.WindowsMaps*",
		"*Microsoft.WindowsSoundRecorder*",
		"*Microsoft.YourPhone*",
		"*Microsoft.ZuneMusic*",
		"*Microsoft.ZuneVideo*",
		"Microsoft.549981C3F5F10",
		"Microsoft.3DBuilder",
		"Microsoft.Appconnector",
		"Microsoft.BingFinance",
		"Microsoft.BingNews",
		"Microsoft.BingSports",
		"Microsoft.BingTranslator",
		"Microsoft.BingWeather",
		"Microsoft.FreshPaint",
		"Microsoft.GamingServices",
		"Microsoft.MicrosoftOfficeHub",
		"Microsoft.MicrosoftPowerBIForWindows",
		"Microsoft.MicrosoftSolitaireCollection",
		"Microsoft.MicrosoftStickyNotes",
		"Microsoft.MinecraftUWP",
		"Microsoft.NetworkSpeedTest",
		"Microsoft.Office.OneNote",
		"Microsoft.People",
		"Microsoft.Print3D",
		"Microsoft.SkypeApp",
		"Microsoft.Wallet",
		"Microsoft.WindowsAlarms",
		"Microsoft.WindowsCamera",
		"microsoft.windowscommunicationsapps",
		"Microsoft.WindowsMaps",
		"Microsoft.WindowsPhone",
		"Microsoft.WindowsSoundRecorder",
		"Microsoft.YourPhone",
		"Microsoft.ZuneMusic",
		"Microsoft.ZuneVideo",
		"Microsoft.CommsPhone",
		"Microsoft.ConnectivityStore",
		"Microsoft.GetHelp",
		"Microsoft.Getstarted",
		"Microsoft.Messaging",
		"Microsoft.Office.Sway",
		"Microsoft.OneConnect",
		"Microsoft.WindowsFeedbackHub",
		"Microsoft.Microsoft3DViewer",
		"Microsoft.BingFoodAndDrink",
		"Microsoft.BingHealthAndFitness",
		"Microsoft.BingTravel",
		"Microsoft.WindowsReadingList",
		"Microsoft.MixedReality.Portal",
		"Microsoft.ScreenSketch",
		"Microsoft.XboxGamingOverlay",
		"2FE3CB00.PicsArt-PhotoStudio",
		"46928bounde.EclipseManager",
		"4DF9E0F8.Netflix",
		"613EBCEA.PolarrPhotoEditorAcademicEdition",
		"6Wunderkinder.Wunderlist",
		"7EE7776C.LinkedInforWindows",
		"89006A2E.AutodeskSketchBook",
		"9E2F88E3.Twitter",
		"A278AB0D.DisneyMagicKingdoms",
		"A278AB0D.MarchofEmpires",
		"ActiproSoftwareLLC.562882FEEB491",
		"CAF9E577.Plex",
		"ClearChannelRadioDigital.iHeartRadio",
		"D52A8D61.FarmVille2CountryEscape",
		"D5EA27B7.Duolingo-LearnLanguagesforFree",
		"DB6EA5DB.CyberLinkMediaSuiteEssentials",
		"DolbyLaboratories.DolbyAccess",
		"DolbyLaboratories.DolbyAccess",
		"Drawboard.DrawboardPDF",
		"Facebook.Facebook",
		"Fitbit.FitbitCoach",
		"Flipboard.Flipboard",
		"GAMELOFTSA.Asphalt8Airborne",
		"KeeperSecurityInc.Keeper",
		"NORDCURRENT.COOKINGFEVER",
		"PandoraMediaInc.29680B314EFC2",
		"Playtika.CaesarsSlotsFreeCasino",
		"ShazamEntertainmentLtd.Shazam",
		"SlingTVLLC.SlingTV",
		"SpotifyAB.SpotifyMusic",
		"ThumbmunkeysLtd.PhototasticCollage",
		"TuneIn.TuneInRadio",
		"WinZipComputing.WinZipUniversal",
		"XINGAG.XING",
		"flaregamesGmbH.RoyalRevolt2",
		"king.com.*",
		"king.com.BubbleWitch3Saga",
		"king.com.CandyCrushSaga",
		"king.com.CandyCrushSodaSaga",
		"A025C540.Yandex.Music"
	) do %powershell% -Command "Get-AppxPackage -AllUsers %%p | Remove-AppxPackage" > nul 2>&1
)

if %N%==0 (goto INIT)
goto PERMANENTCONFIG

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
    reg query "HKCU\Control Panel\Desktop" /v Wallpaper | find "wallpaper_tmp.png" > nul 2>&1
)
if not %errorlevel% == 1 (
    echo    [14] Custom Deblobat wallpaper                 = [[1;32m Enabled [m]
) else (
    echo    [14] Custom Deblobat wallpaper                 = [[1;31m Disabled [m]
)




echo.
echo    [0]  Return to menu                                                       

echo.

set /P N=Select your task and press Enter ^> 

setlocal enabledelayedexpansion


if %N%==1 (
	reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt | find "0x0" 
	if not !ERRORLEVEL! == 1 (
		reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 1 /f 
	) else (
		reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f 
	)
)

if %N%==2 (
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
	reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v NoUseStoreOpenWith  | find "0x1" > nul 2>&1
	if not !ERRORLEVEL! == 1 (
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v NoUseStoreOpenWith /t REG_DWORD /d 0 /f > nul 2>&1
	) else (
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v NoUseStoreOpenWith /t REG_DWORD /d 1 /f > nul 2>&1
	)
)

if %N%==5 (
	reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL  | find "0x40" > nul 2>&1
	if not !ERRORLEVEL! == 1 (
		reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL /t REG_DWORD /d 128 /f > nul 2>&1
	) else (
		reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL /t REG_DWORD /d 64 /f > nul 2>&1
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
    reg query "HKCU\Control Panel\Desktop" /v JPEGImportQuality | find "0x64" > nul 2>&1
    if not !ERRORLEVEL! == 1 (
        reg add "HKCU\Control Panel\Desktop" /v JPEGImportQuality /t REG_DWORD /d 0 /f > nul 2>&1
    ) else (
        reg add "HKCU\Control Panel\Desktop" /v JPEGImportQuality /t REG_DWORD /d 100 /f > nul 2>&1
    )
)

if %N%==14 (
    reg query "HKCU\Control Panel\Desktop" /v Wallpaper | find "wallpaper_tmp.png" > nul 2>&1
    if not !ERRORLEVEL! == 1 (
        reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "" /f > nul 2>&1
    ) else (
        %powershell% -Command "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\", CharSet = CharSet.Auto)] public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni); }'; $SPI_SETDESKWALLPAPER = 0x0014; $SPIF_UPDATEINIFILE = 0x01; $SPIF_SENDCHANGE = 0x02; $imageUrl = 'https://raw.githubusercontent.com/SegoCode/DebloBat/main/media/wallpaper.png'; $TempImagePath = [System.IO.Path]::Combine($env:TEMP, 'wallpaper_tmp.png'); Invoke-WebRequest -Uri $imageUrl -OutFile $TempImagePath; [Wallpaper]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $TempImagePath, $SPIF_UPDATEINIFILE -bor $SPIF_SENDCHANGE);"
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




:: ----------------------------------------------------------
:: ----------------WINDOWS ONLINE ACTIVATOR------------------
:: ----------------------------------------------------------
:WINDOWSACTIVATOR
cls
echo.
echo    Deblo.bat -[1;36m Windows online activator [m
echo    Using KMS public servers
echo    -----------------------------------------------
echo.  

:: Check internet connection
ping -n 2 8.8.8.8 > nul
if not %errorlevel% == 1 (
	echo    Internet Status  = [[1;32m Online [m]
) else (
	echo    Internet Status  = [[1;31m Offline [m]
)
:: Check licese status
for /f %%i in ('cscript //nologo "%systemroot%\system32\slmgr.vbs" /dli') do set licenseStatus=%%i

if not "%licenseStatus%"=="Error:" (
	echo    Windows  Status  = [[1;32m Licensed [m]
	echo    Windows  Edition = [ %version% ]
	goto LICENSED

) else (
	echo    Windows  Status  = [[1;31m Unlicensed [m]
	echo    Windows  Edition = [ %version% ]
	goto UNLICENSED
)

:: Start license status section
:LICENSED
echo.
set /P N=You have a[1;32m license[m, select (Y)es and press enter to[1;31m remove [mthe license (Y/N) ^> 
if %N%==N (goto INIT)
if %N%==n (goto INIT)
cscript //nologo "%systemroot%\system32\slmgr.vbs" /upk > nul
goto WINDOWSACTIVATOR
:: End license status section

:: Start unlicense status section
:UNLICENSED
echo.
set /P N=Your Windows is[1;31m unlicensed[m, select (Y)es and press enter to [1;32mactivate[m (Y/N) ^> 
if %N%==N (goto INIT)
if %N%==n (goto INIT)

::🔑 Windows 10 Home: TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
::🔑 Windows 10 Home N: 3KHY7-WNT83-DGQKR-F7HPR-844BM
::🔑 Windows 10 Home Single Language: 7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH
::🔑 Windows 10 Home Country Specific: PVMJN-6DFY6-9CCP6-7BKTT-D3WVR

::🔑 Windows 10 Professional: W269N-WFGWX-YVC9B-4J6C9-T83GX
::🔑 Windows 10 Professional N: MH37W-N47XK-V7XM9-C7227-GCQG9
::🔑 Windows 10 Professional Workstation: NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J

::🔑 Windows 10 Enterprise: NPPR9-FWDCX-D2C8J-H872K-2YT43
::🔑 Windows 10 Enterprise N: DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4
::🔑 Windows 10 Enterprise 2015 LTSB: WNMTR-4C88C-JK8YV-HQ7T2-76DF9
::🔑 Windows 10 Enterprise 2015 LTSB N: 2F77B-TNFGY-69QQF-B8YKP-D69TJ
::🔑 Windows 10 Enterprise 2016 LTSB:  DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ
::🔑 Windows 10 Enterprise 2016 LTSB N: QFFDN-GRT3P-VKWWX-X7T3R-8B639
::🔑 Windows 10 Enterprise LTSC 2019: M7XTQ-FN8P6-TTKYV-9D4CC-J462D
::🔑 Windows 10 Enterprise N LTSC 2019: 92NFX-8DJQP-P6BBQ-THF9C-7CG2H

::🔑 Windows 10 Education: NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
::🔑 Windows 10 Education N: 2WH4N-8QGBV-H22JP-CT43Q-MDWWJ

cls
echo.
echo    Deblo.bat -[1;36m Windows online activator [m
echo    Using KMS public servers
echo    -----------------------------------------------
echo.  
echo    [1] [1;30m Windows Home[m
echo    [2] [1;30m Windows Home N[m
echo    [3] [1;30m Windows Home Single Language[m
echo    [4] [1;30m Windows Home Country Specific[m
echo    [5] [1;34m Windows Professional[m
echo    [6] [1;34m Windows Professional N[m
echo    [7] [1;34m Windows Professional Workstation[m
echo    [8] [1;35m Windows Enterprise[m
echo    [9] [1;35m Windows Enterprise N[m
echo    [10] [1;35mWindows Enterprise 2015 LTSB[m
echo    [11] [1;35mWindows Enterprise 2015 LTSB N[m
echo    [12] [1;35mWindows Enterprise 2016 LTSB[m
echo    [13] [1;35mWindows Enterprise 2016 LTSB N[m
echo    [14] [1;35mWindows Enterprise LTSC 2019[m
echo    [15] [1;35mWindows Enterprise N LTSC 2019[m
echo    [16] [1;33mWindows Education[m
echo    [17] [1;33mWindows Education N[m
echo.
set /P N=Select your windows and press Enter ^> 
:: Generic Windows keys 
if %N%==1 (set key=TX9XD-98N7V-6WMQ6-BX7FG-H8Q99)
if %N%==2 (set key=3KHY7-WNT83-DGQKR-F7HPR-844BM)
if %N%==3 (set key=7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH)
if %N%==4 (set key=PVMJN-6DFY6-9CCP6-7BKTT-D3WVR)
if %N%==5 (set key=W269N-WFGWX-YVC9B-4J6C9-T83GX)
if %N%==6 (set key=MH37W-N47XK-V7XM9-C7227-GCQG9)
if %N%==7 (set key=NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J)
if %N%==8 (set key=NPPR9-FWDCX-D2C8J-H872K-2YT43)
if %N%==9 (set key=DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4)
if %N%==10 (set key=WNMTR-4C88C-JK8YV-HQ7T2-76DF9)
if %N%==11 (set key=2F77B-TNFGY-69QQF-B8YKP-D69TJ)
if %N%==12 (set key=DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ)
if %N%==13 (set key=QFFDN-GRT3P-VKWWX-X7T3R-8B639)
if %N%==14 (set key=M7XTQ-FN8P6-TTKYV-9D4CC-J462D)
if %N%==15 (set key=92NFX-8DJQP-P6BBQ-THF9C-7CG2H)
if %N%==16 (set key=NW6C2-QMPVW-D7KKK-3GKT6-VCFB2)
if %N%==17 (set key=2WH4N-8QGBV-H22JP-CT43Q-MDWWJ)
cls 

cls
echo.
echo    Deblo.bat -[1;36m Windows online activator [m
echo    Using KMS public servers
echo    -----------------------------------------------
echo. 
echo    Working, Please wait... 

::🔗 kms.loli.beer
::🔗 kms.digiboy.ir
::🔗 kms.library.hk
::🔗 kms.jm33.me
::🔗 kms.cangshui.net
::🔗 kms7.msguides.com
::🔗 kms8.msguides.com
::🔗 kms9.msguides.com
::TODO: Menu for select a server

%powershell% -Command "If ([int]([System.Net.WebRequest]::Create('http://kms.loli.beer').GetResponse().StatusCode) -eq 200) {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	set serverKms="kms.cangshui.net"
) else (
	set serverKms="kms.loli.beer"
)

cscript //nologo "%systemroot%\system32\slmgr.vbs" /ipk %key% > nul
cscript //nologo "%systemroot%\system32\slmgr.vbs" /skms %serverKms% > nul
cscript //nologo "%systemroot%\system32\slmgr.vbs" /ato > nul 

cls
echo.
echo    Deblo.bat -[1;36m Windows online activator [m
echo    Using KMS public servers
echo    -----------------------------------------------
echo.  

:: Check licese status
for /f %%i in ('cscript //nologo "%systemroot%\system32\slmgr.vbs" /dli') do set licenseStatus=%%i
if not "%licenseStatus%"=="Error:" (
	echo    Your Windows status changed to[1;32m licensed [msuccessfully, press any key to continue
) else (
	echo    [1;31m Error found[m, did you select the correct Windows edition?
)
pause > nul 
goto WINDOWSACTIVATOR
:: ----------------------------------------------------------
:: --------------END WINDOWS ONLINE ACTIVATOR----------------
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------------------HOSTS BLOCK END----------------------
:: ----------------------------------------------------------
:BLOCKHOSTS
cls
echo.
echo    Deblo.bat -[1;36m Domain Blocker [m
echo    Powered by oisd.nl, WindowsSpyBlocker and StevenBlack/hosts
echo    -----------------------------------------------
echo.  

echo    Using windows hosts file create a list of domains that serve ads, 
echo    tracking scripts and malware from multiple reputable sources and
echo    creates protection packs that prevents your system from connecting
echo    to them. Only one can be activated simultaneously.
echo.
:: Check internet connection
ping -n 2 8.8.8.8 > nul
if not %errorlevel% == 1 (
	echo    Internet Status                                   = [[1;32m Online [m]
) else (
	echo    Internet Status                                   = [[1;31m Offline [m]
)
echo.
findstr /r "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts" %SystemRoot%\System32\Drivers\etc\hosts > nul 2>&1
if not %errorlevel% == 1 (
	echo    [1]  StevenBlack/hosts, adware, malware           = [[1;32m Enabled [m]
) else (
	echo    [1]  StevenBlack/hosts, adware, malware           = [[1;30m Disabled [m]
)

findstr /r "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts" %SystemRoot%\System32\Drivers\etc\hosts > nul 2>&1
if not %errorlevel% == 1 (
	echo    [2]  StevenBlack/hosts, fakenews, gambling, porn  = [[1;32m Enabled [m]
) else (
	echo    [2]  StevenBlack/hosts, fakenews, gambling, porn  = [[1;30m Disabled [m]
)

findstr /r "bad-hosts" %SystemRoot%\System32\Drivers\etc\hosts > nul 2>&1
if not %errorlevel% == 1 (
	echo    [3]  bad-hosts, blocking ads, malware             = [[1;32m Enabled [m]
) else (
	echo    [3]  bad-hosts, blocking ads, malware             = [[1;30m Disabled [m]
)

findstr /r "30B31BDA" %SystemRoot%\System32\Drivers\etc\hosts > nul 2>&1
if not %errorlevel% == 1 (
	echo    [4]  Threat-Intel malware domains list            = [[1;32m Enabled [m]
) else (
	echo    [4]  Threat-Intel malware domains list            = [[1;30m Disabled [m]
)

findstr /r "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/porn/hosts" %SystemRoot%\System32\Drivers\etc\hosts > nul 2>&1
if not %errorlevel% == 1 (
	echo    [5]  StevenBlack/hosts porn domains list          = [[1;32m Enabled [m]
) else (
	echo    [5]  StevenBlack/hosts porn domains list          = [[1;30m Disabled [m]
)

findstr /r "WindowsSpyBlocker" %SystemRoot%\System32\Drivers\etc\hosts > nul 2>&1
if not %errorlevel% == 1 (
	echo    [6]  WindowsSpyBlocker, Just block spy            = [[1;32m Enabled [m]
) else (
	echo    [6]  WindowsSpyBlocker, Just block spy            = [[1;30m Disabled [m]
)

findstr /r "https://oisd.nl" %SystemRoot%\System32\Drivers\etc\hosts > nul 2>&1
if not %errorlevel% == 1 (
	echo    [7]  oisd.nl, basic list to work for everyone     = [[1;32m Enabled [m]
) else (
	echo    [7]  oisd.nl, basic list to work for everyone     = [[1;30m Disabled [m]
)


echo    [8]  Disable all                                  = [[1;31m * [m]
echo.
echo    [0]  Return to menu                                                       

echo.

set /P N=Select your task and press Enter ^> 

if %N%==1 (set url="https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts")
if %N%==2 (set url="https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts")
if %N%==3 (set url="https://raw.githubusercontent.com/cenk/bad-hosts/main/hosts")
if %N%==4 (set url="https://raw.githubusercontent.com/davidonzo/Threat-Intel/master/lists/latestdomains.piHole.txt")
if %N%==5 (set url="https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/porn/hosts")
if %N%==6 (set url="https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt")
if %N%==7 (set url="https://hosts.oisd.nl/basic/")
if %N%==8 (set url="")
if %N%==0 (goto INIT)


cd %~dp0
%powershell% -Command "Invoke-WebRequest -Uri %url% -OutFile hosts" > nul 2>&1
del %SystemRoot%\System32\Drivers\etc\hosts /f > nul 2>&1 
move hosts %SystemRoot%\System32\Drivers\etc\ > nul 2>&1

goto BLOCKHOSTS

:: ----------------------------------------------------------
:: ---------------------HOSTS BLOCK END----------------------
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------------DOWNLOAD CENTER START--------------------
:: ----------------------------------------------------------
:DOWNLOADCENTER
cls
echo.
echo    Deblo.bat -[1;36m Download center [m
echo    Always latest version and oficial links
echo    -----------------------------------------------
echo.  

ping -n 2 8.8.8.8 > nul
if not %errorlevel% == 1 (
	echo    Internet Status           = [[1;32m Online [m]
) else (
	echo    Internet Status           = [[1;31m Offline [m]
)
echo.

cd %~dp0

::TODO: Auto install and config firefox
if exist firefox-latest.exe (
	echo    [1] Mozilla Firefox       = [[1;32m %~dp0firefox-latest.exe [m]
) else (
	echo    [1] Mozilla Firefox       = [[1;32m Ready [m]
)

if exist brave-latest.exe (
	echo    [2] Chromium Brave        = [[1;32m %~dp0brave-latest.exe [m]
) else (
	echo    [2] Chromium Brave        = [[1;32m Ready [m]
)

if exist iridiumbrowser-latest.msi (
	echo    [3] Chromium iridium      = [[1;32m %~dp0iridiumbrowser-latest.msi [m]
) else (
	echo    [3] Chromium iridium      = [[1;32m Ready [m]
)

if exist SteamSetup.exe (
	echo    [4] Steam client          = [[1;32m %~dp0SteamSetup.exe [m]
) else (
	echo    [4] Steam client          = [[1;32m Ready [m]
)

if exist simplewallSetup.exe (
	echo    [5] Simplewall            = [[1;32m %~dp0simplewallSetup.exe [m]
) else (
	echo    [5] Simplewall            = [[1;32m Ready [m]
)

if exist qViewSetup.exe (
	echo    [6] qView                 = [[1;32m %~dp0qViewSetup.exe [m]
) else (
	echo    [6] qView                 = [[1;32m Ready [m]
)


if exist Battle.net-Setup.exe (
	echo    [7] Battle.net            = [[1;32m %~dp0Battle.net-Setup.exe [m]
) else (
	echo    [7] Battle.net            = [[1;32m Ready [m]
)

if exist VSCodeUserSetup-x64.exe (
	echo    [8] VSCode                = [[1;32m %~dp0VSCodeUserSetup-x64.exe [m]
) else (
	echo    [8] VSCode                = [[1;32m Ready [m]
)

if exist PicoTorrent-x64.exe (
	echo    [9] PicoTorrent           = [[1;32m %~dp0PicoTorrent-x64.exe [m]
) else (
	echo    [9] PicoTorrent           = [[1;32m Ready [m]
)





echo.
echo    [0]  Return to menu                                                       

echo.

set /P N=Select your task and press Enter ^> 

if %N%==1 (
	%powershell% -Command "Invoke-WebRequest -Uri 'https://download.mozilla.org/?product=firefox-latest-ssl&os=win64' -OutFile firefox-latest.exe" > nul 2>&1
)

if %N%==2 (
	%powershell% -Command "Invoke-WebRequest -Uri 'https://laptop-updates.brave.com/latest/winx64' -OutFile brave-latest.exe" > nul 2>&1
)

if %N%==3 (
	%powershell% -Command "Invoke-WebRequest -Uri 'https://downloads.iridiumbrowser.de/windows/iridiumbrowser-latest-x64.msi' -OutFile iridiumbrowser-latest.msi" > nul 2>&1
)

if %N%==4 (
	%powershell% -Command "Invoke-WebRequest -Uri 'https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe' -OutFile SteamSetup.exe" > nul 2>&1
)

if %N%==5 (
	%powershell% -Command "Invoke-WebRequest -Uri ((((Invoke-WebRequest -UseBasicParsing -Uri 'https://api.github.com/repos/henrypp/simplewall/releases/latest' | Select-Object).Content) | ConvertFrom-Json).assets[1].browser_download_url) -OutFile simplewallSetup.exe"
)

if %N%==6 (
	%powershell% -Command "Invoke-WebRequest -Uri ((((Invoke-WebRequest -UseBasicParsing -Uri 'https://api.github.com/repos/jurplel/qView/releases/latest' | Select-Object).Content) | ConvertFrom-Json).assets[5].browser_download_url) -OutFile qViewSetup.exe"
)

if %N%==7 (
	%powershell% -Command "Invoke-WebRequest -Uri 'https://eu.battle.net/download/getInstaller?os=win&installer=Battle.net-Setup.exe' -OutFile Battle.net-Setup.exe" > nul 2>&1
)

if %N%==8 (
	%powershell% -Command "Invoke-WebRequest -Uri 'https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user' -OutFile VSCodeUserSetup-x64.exe" > nul 2>&1
)

if %N%==9 (
	%powershell% -Command "Invoke-WebRequest -Uri ((((Invoke-WebRequest -UseBasicParsing -Uri 'https://api.github.com/repos/picotorrent/picotorrent/releases/latest' | Select-Object).Content) | ConvertFrom-Json).assets[0].browser_download_url) -OutFile PicoTorrent-x64.exe"
)

if %N%==0 (goto INIT)
goto DOWNLOADCENTER

:: ----------------------------------------------------------
:: -------------------DOWNLOAD CENTER END--------------------
:: ----------------------------------------------------------



:: ----------------------------------------------------------
:: -------------SYSTEM SHOW INFORMATION START----------------
:: ----------------------------------------------------------
:SYSINFO
cls
echo.
echo    Deblo.bat -[1;36m System information [m
echo    Yet another (and not than ugly) Screenfetch. 
echo    -----------------------------------------------
echo  [m 
echo  %logo1%      [1;34m%username%[m@[1;34m%userinfo%[m        
echo  %logo1%      ---------------------
echo  %logo1%      [1;34mOS[m: %version% %bits%
echo  %logo1%      [1;34mKernel[m: %kernel%
echo  %logo1%      [1;34mCPU[m: %cpu% 
echo [m                                   [1;34mMotherboard[m: %moboM% %moboP% 
echo  %logo2%	   [1;34mGPU[m: %gpu%
echo  %logo2%      [1;34mResolution[m: %hozrs% x %verrs% (%hz% Hz)
echo  %logo2%      [1;34mBoot[m: %boot%
echo  %logo2%      
echo  %logo2%      Press any key for return to menu . . . 
pause > nul
goto INIT
:: ----------------------------------------------------------
:: --------------SYSTEM SHOW INFORMATION END-----------------
:: ----------------------------------------------------------

