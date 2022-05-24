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

MODE 88,35
title github.com/SegoCode 

:: ----------------------------------------------------------
:: ---------------GET SYSTEM INFORMATION START---------------
:: ----------------------------------------------------------
set logo1=  [48;5;202m  [48;5;202m  [48;5;202m  [48;5;202m  [48;5;202m  [48;5;202m  [m  [48;5;41m  [48;5;41m  [48;5;41m  [48;5;41m  [48;5;41m  [48;5;41m  [m
set logo2=  [48;5;32m  [48;5;32m  [48;5;32m  [48;5;32m  [48;5;32m  [48;5;32m  [m  [48;5;220m  [48;5;220m  [48;5;220m  [48;5;220m  [48;5;220m  [48;5;220m  [m

cls
echo.
echo    Windows Tool Box for[1;36m Windows 10 [m
echo    Yet another (and ugly) debloat suite. 
echo    -----------------------------------------------
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
cls
echo.
echo    Windows Tool Box for[1;36m Windows 10 [m
echo    Yet another (and ugly) debloat suite. 
echo    -----------------------------------------------
echo.  
echo    [1]  Privacy Local Group Policy   
echo    [2]  Other Local Group Policy          
echo    [3]  Windows Tasks 
echo    [4]  Windows Services     
echo    [5]  Windows online activator    
echo    [6]  Unistall Windows apps     
echo    [7]  Domain Blocker    
echo    [8]  System information  
echo    [9]  Exit                 
echo.

set /P N=Select your option and press Enter ^> 
if %N%==1 (goto LOCALGROUP)
if %N%==2 (goto OTHERLOCALGROUP)
if %N%==3 (goto TASKSCHEDULER)
if %N%==4 (goto SERVICES)
if %N%==5 (goto WINDOWSACTIVATOR)
if %N%==6 (start https://github.com/Teraskull/PyDebloatX/)
if %N%==7 (goto BLOCKHOSTS)


if %N%==8 (goto SYSINFO)
if %N%==9 (exit)

goto INIT
:: ----------------------------------------------------------
:: -----------------------MAIN MENU END----------------------
:: ----------------------------------------------------------




:: ----------------------------------------------------------
:: -----------------LOCAL GROUP POLICY START-----------------
:: ----------------------------------------------------------
:LOCALGROUP
cls
echo.
echo    Windows Tool Box -[1;36m Local Group Policy [m
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
echo    Windows Tool Box -[1;36m Other Local Group Policy [m
echo    My personal preference 
echo    -----------------------------------------------
echo.  



reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v NoLockScreen > nul 2>&1
if not %errorlevel% == 1 (
	echo    [1]  Disable lock screen                          = [[1;32m Enabled [m]
) else (
	echo    [1]  Disable lock screen                          = [[1;31m Disabled [m]
)

reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\UX Configuration" /v UILockdown > nul 2>&1
if not %errorlevel% == 1 (
	echo    [2]  Windows Defender headless UI mode            = [[1;32m Enabled [m]
) else (
	echo    [2]  Windows Defender headless UI mode            = [[1;31m Disabled [m]
)

reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\UX Configuration" /v Notification_Suppress > nul 2>&1
if not %errorlevel% == 1 (
	echo    [3]  Windows Defender suppress all notifications  = [[1;32m Enabled [m]
) else (
	echo    [3]  Windows Defender suppress all notifications  = [[1;31m Disabled [m]
)

reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\CloudContent" /v DisableSoftLanding > nul 2>&1
if not %errorlevel% == 1 (
	echo    [4]  Do not show Windows Tips                     = [[1;32m Enabled [m]
) else (
	echo    [4]  Do not show Windows Tips                     = [[1;31m Disabled [m]
)

reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\FileHistory" /v Disabled > nul 2>&1
if not %errorlevel% == 1 (
	echo    [5]  Turn off File History                        = [[1;32m Enabled [m]
) else (
	echo    [5]  Turn off File History                        = [[1;31m Disabled [m]
)


reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Systray" /v HideSystray > nul 2>&1
if not %errorlevel% == 1 (
	echo    [6]  Hide Windows Security Systray                = [[1;32m Enabled [m]
) else (
	echo    [6]  Hide Windows Security Systray                = [[1;31m Disabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v NoUseStoreOpenWith > nul 2>&1
if not %errorlevel% == 1 (
	echo    [7]  Turn off access to the Store                 = [[1;32m Enabled [m]
) else (
	echo    [7]  Turn off access to the Store                 = [[1;31m Disabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware > nul 2>&1
if not %errorlevel% == 1 (
	echo    [8]  Turn off Microsoft Defender Antivirus        = [[1;32m Enabled [m]
) else (
	echo    [8]  Turn off Microsoft Defender Antivirus        = [[1;31m Disabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Policies" /v NtfsEncryptPagingFile > nul 2>&1
if not %errorlevel% == 1 (
	echo    [9]  Turn off NTFS pagefile encryption            = [[1;32m Enabled [m]
) else (
	echo    [9]  Turn off NTFS pagefile encryption            = [[1;31m Disabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Policies" /v DisableDeleteNotification > nul 2>&1
if not %errorlevel% == 1 (
	echo    [10] Turn off TRIM on SSD                         = [[1;32m Enabled [m]
) else (
	echo    [10] Turn off TRIM on SSD                         = [[1;31m Disabled [m]
)


echo    [11] Apply all                                    = [[1;31m * [m]
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
if %N%==8 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" && set key=DisableAntiSpyware && set value=1)
if %N%==9 (set path="HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Policies" && set key=NtfsEncryptPagingFile && set value=1)
if %N%==10 (set path="HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Policies" && set key=DisableDeleteNotification && set value=1)


if %N%==11 (set loopcount=10 && goto APPLYALLOTHERLOCALGROUP)
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
if %loopcount%==8 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" && set key=DisableAntiSpyware && set value=1)
if %loopcount%==9 (set path="HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Policies" && set key=NtfsEncryptPagingFile && set value=1)
if %loopcount%==10 (set path="HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Policies" && set key=DisableDeleteNotification && set value=1)


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
echo    Windows Tool Box -[1;36m Task Scheduler [m
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
echo    Windows Tool Box -[1;36m Task Scheduler [m
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
echo    Windows Tool Box -[1;36m Windows Services [m
echo    Yet another (and ugly) debloat suite.
echo    -----------------------------------------------
echo.  


%powershell% -Command "If ((Get-Service -Name "DiagTrack").StartType -eq 'Disabled') {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [1]   Diagnostics Tracking Service                = [[1;32m Disabled [m]
) else (
	echo    [1]   Diagnostics Tracking Service                = [[1;31m Enabled [m]
)

%powershell% -Command "If ((Get-Service -Name "lfsvc").StartType -eq 'Disabled') {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [2]   Geolocation Service                         = [[1;32m Disabled [m]
) else (
	echo    [2]   Geolocation Service                         = [[1;31m Enabled [m]
)

%powershell% -Command "If ((Get-Service -Name "MapsBroker").StartType -eq 'Disabled') {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [3]   Downloaded Maps Manager                     = [[1;32m Disabled [m]
) else (
	echo    [3]   Downloaded Maps Manager                     = [[1;31m Enabled [m]
)

%powershell% -Command "If ((Get-Service -Name "RemoteRegistry").StartType -eq 'Disabled') {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [4]   Remote Registry                             = [[1;32m Disabled [m]
) else (
	echo    [4]   Remote Registry                             = [[1;31m Enabled [m]
)

%powershell% -Command "If ((Get-Service -Name "SharedAccess").StartType -eq 'Disabled') {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [5]   Internet Connection Sharing                 = [[1;32m Disabled [m]
) else (
	echo    [5]   Internet Connection Sharing                 = [[1;31m Enabled [m]
)

%powershell% -Command "If ((Get-Service -Name "TrkWks").StartType -eq 'Disabled') {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [6]   Distributed Link Tracking Client            = [[1;32m Disabled [m]
) else (
	echo    [6]   Distributed Link Tracking Client            = [[1;31m Enabled [m]
)

%powershell% -Command "If ((Get-Service -Name "WSearch").StartType -eq 'Disabled') {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [7]   Windows Search                              = [[1;32m Disabled [m]
) else (
	echo    [7]   Windows Search                              = [[1;31m Enabled [m]
)


%powershell% -Command "If ((Get-Service -Name "WerSvc").StartType -eq 'Disabled') {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [8]   Disables windows error reporting            = [[1;32m Disabled [m]
) else (
	echo    [8]   Disables windows error reporting            = [[1;31m Enabled [m]
)

%powershell% -Command "If ((Get-Service -Name "RemoteAccess").StartType -eq 'Disabled') {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [9]   Routing and Remote Access                   = [[1;32m Disabled [m]
) else (
	echo    [9]   Routing and Remote Access                   = [[1;31m Enabled [m]
)

%powershell% -Command "If ((Get-Service -Name "ndu").StartType -eq 'Disabled') {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [10]  Windows Network Data Usage Monitor          = [[1;32m Disabled [m]
) else (
	echo    [10]  Windows Network Data Usage Monitor          = [[1;31m Enabled [m]
)

%powershell% -Command "If ((Get-Service -Name "NetTcpPortSharing").StartType -eq 'Disabled') {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [11]  Net.Tcp Port Sharing Service                = [[1;32m Disabled [m]
) else (
	echo    [11]  Net.Tcp Port Sharing Service                = [[1;31m Enabled [m]
)

%powershell% -Command "If ((Get-Service -Name "diagnosticshub.standardcollector.service").StartType -eq 'Disabled') {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [12]  Diagnostics Hub Standard Collector Service  = [[1;32m Disabled [m]
) else (
	echo    [12]  Diagnostics Hub Standard Collector Service  = [[1;31m Enabled [m]
)

echo    [13]  Apply all                                   = [[1;31m * [m]
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

if %N%==13 (set loopcount=12 && goto APPLYALLSERVICESMIDDLE)
if %N%==0 (goto INIT)


%powershell% -Command "If ((Get-Service -Name %serviceName%).StartType -eq 'Disabled') {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	sc config %serviceName% start= AUTO
) else (
    sc stop %serviceName%
	sc config %serviceName% start= DISABLED
)

goto SERVICES

:APPLYALLSERVICESMIDDLE
cls
echo.
echo    Windows Tool Box -[1;36m Windows Services [m
echo    Yet another (and ugly) debloat suite.
echo    -----------------------------------------------
echo.  

:APPLYALLSERVICES

if %loopcount%==1 (set serviceName="DiagTrack")
if %loopcount%==2 (set serviceName="lfsvc")
if %loopcount%==3 (set serviceName="MapsBroker")
if %loopcount%==4 (set serviceName="RemoteRegistry")
if %loopcount%==5 (set serviceName="SharedAccess")
if %loopcount%==6 (set serviceName="TrkWks")
if %loopcount%==7 (set serviceName="WSearch")
if %loopcount%==8 (set serviceName="WerSvc")
if %loopcount%==9 (set serviceName="RemoteAccess")
if %loopcount%==10 (set serviceName="ndu")
if %loopcount%==11 (set serviceName="NetTcpPortSharing")
if %loopcount%==12 (set serviceName="diagnosticshub.standardcollector.service")

set /a numcount= 12 - %loopcount% + 1
echo    Working, Please wait...  = [[1;31m %numcount%/12 [m]

%powershell% -Command "If ((Get-Service -Name %serviceName%).StartType -eq 'Disabled') {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	sc config %serviceName% start= AUTO > nul 2>&1
) else (
    sc stop %serviceName% > nul 2>&1
	sc config %serviceName% start= DISABLED > nul 2>&1
)

set /a loopcount=loopcount-1
if %loopcount%==0 goto SERVICES
goto APPLYALLSERVICES

:: ----------------------------------------------------------
:: -----------------------SERVICES END-----------------------
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------WINDOWS ONLINE ACTIVATOR------------------
:: ----------------------------------------------------------
:WINDOWSACTIVATOR
cls
echo.
echo    Windows Tool Box -[1;36m Windows online activator [m
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
echo    Windows Tool Box -[1;36m Windows online activator [m
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
echo    Windows Tool Box -[1;36m Windows online activator [m
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

%powershell% -Command "If ([int]([System.Net.WebRequest]::Create('http://kms.loli.beer').GetResponse().StatusCode) -eq 200) {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	set serverKms="kms.loli.beer"
) else (
	set serverKms="kms.digiboy.ir"
)

cscript //nologo "%systemroot%\system32\slmgr.vbs" /ipk %key% > nul
cscript //nologo "%systemroot%\system32\slmgr.vbs" /skms %serverKms% > nul
cscript //nologo "%systemroot%\system32\slmgr.vbs" /ato > nul 

cls
echo.
echo    Windows Tool Box -[1;36m Windows online activator [m
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
echo    Windows Tool Box -[1;36m Domain Blocker [m
echo    Powered by energized.pro and WindowsSpyBlocker
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
findstr /r "E5P4RK-P" %SystemRoot%\System32\Drivers\etc\hosts > nul 2>&1
if not %errorlevel% == 1 (
	echo    [1]  True lightweight protection, Spark           = [[1;32m Enabled [m]
) else (
	echo    [1]  True lightweight protection, Spark           = [[1;31m Disabled [m]
)

findstr /r "E8LUG0-P" %SystemRoot%\System32\Drivers\etc\hosts > nul 2>&1
if not %errorlevel% == 1 (
	echo    [2]  Mid range lightweight protection-go!, BluGo  = [[1;32m Enabled [m]
) else (
	echo    [2]  Mid range lightweight protection-go!, BluGo  = [[1;31m Disabled [m]
)

findstr /r "E8LU-P" %SystemRoot%\System32\Drivers\etc\hosts > nul 2>&1
if not %errorlevel% == 1 (
	echo    [3]  Mid range lightweight protection, Blu        = [[1;32m Enabled [m]
) else (
	echo    [3]  Mid range lightweight protection, Blu        = [[1;31m Disabled [m]
)

findstr /r "E84S1C-P" %SystemRoot%\System32\Drivers\etc\hosts > nul 2>&1
if not %errorlevel% == 1 (
	echo    [4]  Balanced protection, Basic                   = [[1;32m Enabled [m]
) else (
	echo    [4]  Balanced protection, Basic                   = [[1;31m Disabled [m]
)

findstr /r "EP0R9-P" %SystemRoot%\System32\Drivers\etc\hosts > nul 2>&1
if not %errorlevel% == 1 (
	echo    [5]  Pornware blocking, Porn                      = [[1;32m Enabled [m]
) else (
	echo    [5]  Pornware blocking, Porn                      = [[1;31m Disabled [m]
)

findstr /r "EUL71M473-P" %SystemRoot%\System32\Drivers\etc\hosts > nul 2>&1
if not %errorlevel% == 1 (
	echo    [6]  Flagship protection, Ultimate                = [[1;32m Enabled [m]
) else (
	echo    [6]  Flagship protection, Ultimate                = [[1;31m Disabled [m]
)

findstr /r "WindowsSpyBlocker" %SystemRoot%\System32\Drivers\etc\hosts > nul 2>&1
if not %errorlevel% == 1 (
	echo    [7]  WindowsSpyBlocker, Just block spy            = [[1;32m Enabled [m]
) else (
	echo    [7]  WindowsSpyBlocker, Just block spy            = [[1;31m Disabled [m]
)

echo    [8]  Disable all                                  = [[1;31m * [m]
echo    [0]  Return to menu                                                       

echo.

set /P N=Select your task and press Enter ^> 

if %N%==1 (set url="https://energized.pro/spark/formats/hosts.txt")
if %N%==2 (set url="https://energized.pro/bluGo/formats/hosts.txt")
if %N%==3 (set url="https://energized.pro/blu/formats/hosts.txt")
if %N%==4 (set url="https://energized.pro/basic/formats/hosts.txt")
if %N%==5 (set url="https://energized.pro/porn/formats/hosts.txt")
if %N%==6 (set url="https://energized.pro/ultimate/formats/hosts.txt")
if %N%==7 (set url="https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt")
if %N%==8 (set url="")
if %N%==0 (goto INIT)


findstr /r "energized.pro" %SystemRoot%\System32\Drivers\etc\hosts > nul 2>&1
if not %errorlevel% == 1 (
	del %SystemRoot%\System32\Drivers\etc\hosts /f > nul 2>&1 
	echo # This is a sample HOSTS file used by Microsoft TCP/IP for Windows. > %SystemRoot%\System32\Drivers\etc\hosts
	if %N%==8 (goto BLOCKHOSTS)
)

cd %~dp0
%powershell% -Command "Invoke-WebRequest -Uri %url% -OutFile hosts" > nul 2>&1
del %SystemRoot%\System32\Drivers\etc\hosts /f > nul 2>&1 
move hosts %SystemRoot%\System32\Drivers\etc\ > nul 2>&1

goto BLOCKHOSTS

:: ----------------------------------------------------------
:: ---------------------HOSTS BLOCK END----------------------
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------SYSTEM SHOW INFORMATION START----------------
:: ----------------------------------------------------------
:SYSINFO
cls
echo.
echo    Windows Tool Box -[1;36m System information [m
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
echo  %logo2%      

pause > nul
goto INIT
:: ----------------------------------------------------------
:: --------------SYSTEM SHOW INFORMATION END-----------------
:: ----------------------------------------------------------

