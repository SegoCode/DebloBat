@echo off

:: Ensure admin privileges
fltmc >nul 2>&1 || (
    echo Administrator privileges are required.
    PowerShell Start -Verb RunAs '%0' 2> nul || (
        echo Right-click on the script and select "Run as administrator".
        pause & exit 1
    )
    exit 0
)

:LOCALGROUP
MODE 100,35
title github.com/SegoCode 
cls
echo.
echo    Local Group Policy[1;36m Based on 1.5.2042 RC 1 [m
echo    Reverse engineer WPD app by github.com/SegoCode 
echo    -----------------------------------------------
echo.

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v CEIPEnable > nul 2>&1
if not %errorlevel% == 1 (
	echo    [1]  Windows Customer Experience Improvement Program            = [[1;32m Enabled [m]
) else (
	echo    [1]  Windows Customer Experience Improvement Program            = [[1;31m Disabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\SQM" /v DisableCustomerImprovementProgram > nul 2>&1
if not %errorlevel% == 1 (
	echo    [2]  Internet Explorer Customer Experience Improvement Program  = [[1;32m Enabled [m]
) else (
	echo    [2]  Internet Explorer Customer Experience Improvement Program  = [[1;31m Disabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Messenger\Client" /v CEIP > nul 2>&1
if not %errorlevel% == 1 (
	echo    [3]  Windows Messenger Customer Experience Improvement Program  = [[1;32m Enabled [m]
) else (
	echo    [3]  Windows Messenger Customer Experience Improvement Program  = [[1;31m Disabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana > nul 2>&1
if not %errorlevel% == 1 (
	echo    [4]  Allow Cortana                                              = [[1;32m Enabled [m]
) else (
	echo    [4]  Allow Cortana                                              = [[1;31m Disabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowSearchToUseLocation > nul 2>&1
if not %errorlevel% == 1 (
	echo    [5]  Allow search and Cortana to use location                   = [[1;32m Enabled [m]
) else (
	echo    [5]  Allow search and Cortana to use location                   = [[1;31m Disabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v Disabled > nul 2>&1
if not %errorlevel% == 1 (
	echo    [6]  Windows Error Reporting                                    = [[1;32m Enabled [m]
) else (
	echo    [6]  Windows Error Reporting                                    = [[1;31m Disabled [m]
)


reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v DisableUAR > nul 2>&1
if not %errorlevel% == 1 (
	echo    [7]  Steps Recorder                                             = [[1;32m Enabled [m]
) else (
	echo    [7]  Steps Recorder                                             = [[1;31m Disabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v DisableInventory > nul 2>&1
if not %errorlevel% == 1 (
	echo    [8]  Inventory Collector                                        = [[1;32m Enabled [m]
) else (
	echo    [8]  Inventory Collector                                        = [[1;31m Disabled [m]
)


reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry > nul 2>&1
if not %errorlevel% == 1 (
	echo    [9]  Telemetry                                                  = [[1;32m Enabled [m]
) else (
	echo    [9]  Telemetry                                                  = [[1;31m Disabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\InputPersonalization" /v RestrictImplicitTextCollection > nul 2>&1
if not %errorlevel% == 1 (
	echo    [10] Handwriting automatic learning                             = [[1;32m Enabled [m]
) else (
	echo    [10] Handwriting automatic learning                             = [[1;31m Disabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\InputPersonalization" /v AllowInputPersonalization > nul 2>&1
if not %errorlevel% == 1 (
	echo    [11] Allow users to enable online speech recognition services   = [[1;32m Enabled [m]
) else (
	echo    [11] Allow users to enable online speech recognition services   = [[1;31m Disabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\TextInput" /v AllowLinguisticDataCollection > nul 2>&1
if not %errorlevel% == 1 (
	echo    [12] Improve inking and typing recognition                      = [[1;32m Enabled [m]
) else (
	echo    [12] Improve inking and typing recognition                      = [[1;31m Disabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}" /v ScenarioExecutionEnabled > nul 2>&1
if not %errorlevel% == 1 (
	echo    [13] PerfTrack                                                  = [[1;32m Enabled [m]
) else (
	echo    [13] PerfTrack                                                  = [[1;31m Disabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy" /v DisableQueryRemoteServer > nul 2>&1
if not %errorlevel% == 1 (
	echo    [14] Microsoft Support Diagnostic Tool                          = [[1;32m Enabled [m]
) else (
	echo    [14] Microsoft Support Diagnostic Tool                          = [[1;31m Disabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v DisabledByGroupPolicy > nul 2>&1
if not %errorlevel% == 1 (
	echo    [15] Advertising ID                                             = [[1;32m Enabled [m]
) else (
	echo    [15] Advertising ID                                             = [[1;31m Disabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SearchCompanion" /v DisableContentFileUpdates > nul 2>&1
if not %errorlevel% == 1 (
	echo    [16] Search Companion                                           = [[1;32m Enabled [m]
) else (
	echo    [16] Search Companion                                           = [[1;31m Disabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsConsumerFeatures > nul 2>&1
if not %errorlevel% == 1 (
	echo    [17] Microsoft consumer experiences                             = [[1;32m Enabled [m]
) else (
	echo    [17] Microsoft consumer experiences                             = [[1;31m Disabled [m]
)


reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v UploadUserActivities > nul 2>&1
if not %errorlevel% == 1 (
	echo    [18] Allow upload of User Activities                            = [[1;32m Enabled [m]
) else (
	echo    [18] Allow upload of User Activities                            = [[1;31m Disabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v EnableActivityFeed > nul 2>&1
if not %errorlevel% == 1 (
	echo    [19] Enables Activities Feed                                    = [[1;32m Enabled [m]
) else (
	echo    [19] Enables Activities Feed                                    = [[1;31m Disabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v AllowClipboardHistory > nul 2>&1
if not %errorlevel% == 1 (
	echo    [20] Allow Clipboard History                                    = [[1;32m Enabled [m]
) else (
	echo    [20] Allow Clipboard History                                    = [[1;31m Disabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v AllowCrossDeviceClipboard > nul 2>&1
if not %errorlevel% == 1 (
	echo    [21] Allow Clipboard synchronized across devices                = [[1;32m Enabled [m]
) else (
	echo    [21] Allow Clipboard synchronized across devices                = [[1;31m Disabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SettingSync" /v DisableSettingSync > nul 2>&1
if not %errorlevel% == 1 (
	echo    [22] Sync your settings                                         = [[1;32m Enabled [m]
) else (
	echo    [22] Sync your settings                                         = [[1;31m Disabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v DisableFileSyncNGSC > nul 2>&1
if not %errorlevel% == 1 (
	echo    [23] Use OneDrive for file storage                              = [[1;32m Enabled [m]
) else (
	echo    [23] Use OneDrive for file storage                              = [[1;31m Disabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v EnableSmartScreen > nul 2>&1
if not %errorlevel% == 1 (
	echo    [24] Windows Defender SmartScreen                               = [[1;32m Enabled [m]
) else (
	echo    [24] Windows Defender SmartScreen                               = [[1;31m Disabled [m]
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

