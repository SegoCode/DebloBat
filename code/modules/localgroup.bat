@echo off
title github.com/SegoCode
MODE 88,40
:: ----------------------------------------------------------
:: ----------------LOCAL GROUP POLICY START------------------
:: ----------------------------------------------------------
:LOCALGROUP
cls
echo.
echo    Deblo.bat -[1;36m Essentials Group Policy Tweaks [m
echo    Made with help from https://admx.help
echo    -----------------------------------------------
echo.

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v CEIPEnable > nul 2>&1
if not %errorlevel% == 1 (
	echo    [1]  Windows Customer Experience Improvement Program            = [[1;32m Disabled [m]
) else (
	echo    [1]  Windows Customer Experience Improvement Program            = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\AppV\CEIP" /v CEIPEnable > nul 2>&1
if not %errorlevel% == 1 (
	echo    [2]  Windows Customer Experience Improvement Virtual Program    = [[1;32m Disabled [m]
) else (
	echo    [2]  Windows Customer Experience Improvement Virtual Program    = [[1;31m Enabled [m]
)

reg query "HKLM\SOFTWARE\Microsoft\PolicyManager\default\System\AllowExperimentation" /v Value > nul 2>&1
if not %errorlevel% == 1 (
    echo    [3]  Microsoft Experimentation Features                         = [[1;31m Enabled [m]
) else (  
    echo    [3]  Microsoft Experimentation Features                         = [[1;32m Disabled [m]
)

reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate" /v UpdateNotificationLevel > nul 2>&1
if not %errorlevel% == 1 (
    echo    [4]  All Update notifications, including restart warnings       = [[1;32m Disabled [m]
) else (
    echo    [4]  All Update notifications, including restart warnings       = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v Disabled > nul 2>&1
if not %errorlevel% == 1 (
	echo    [5]  Windows Error Reporting                                    = [[1;32m Disabled [m]
) else (
	echo    [5]  Windows Error Reporting                                    = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v DisableUAR > nul 2>&1
if not %errorlevel% == 1 (
	echo    [6]  Steps Recorder                                             = [[1;32m Disabled [m]
) else (
	echo    [6]  Steps Recorder                                             = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\LocationAndSensors" /v DisableLocation > nul 2>&1
if not %errorlevel% == 1 (
    echo    [7]  Windows Location Sensors                                   = [[1;32m Disabled [m]
) else (
    echo    [7]  Windows Location Sensors                                   = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry > nul 2>&1
if not %errorlevel% == 1 (
	echo    [8]  Windows Telemetry                                          = [[1;32m Disabled [m]
) else (
	echo    [8]  Windows Telemetry                                          = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\InputPersonalization" /v RestrictImplicitTextCollection > nul 2>&1
if not %errorlevel% == 1 (
	echo    [9]  Handwriting automatic learning                             = [[1;32m Disabled [m]
) else (
	echo    [9]  Handwriting automatic learning                             = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\InputPersonalization" /v AllowInputPersonalization > nul 2>&1
if not %errorlevel% == 1 (
	echo    [10] Allow users to enable online speech recognition services   = [[1;32m Disabled [m]
) else (
	echo    [10] Allow users to enable online speech recognition services   = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}" /v ScenarioExecutionEnabled > nul 2>&1
if not %errorlevel% == 1 (
	echo    [11] Tracking of responsiveness events for privacy              = [[1;32m Disabled [m]
) else (
	echo    [11] Tracking of responsiveness events for privacy              = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v DisabledByGroupPolicy > nul 2>&1
if not %errorlevel% == 1 (
	echo    [12] Microsoft Advertising ID                                   = [[1;32m Disabled [m]
) else (
	echo    [12] Microsoft Advertising ID                                   = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsConsumerFeatures > nul 2>&1
if not %errorlevel% == 1 (
	echo    [13] Microsoft consumer experiences                             = [[1;32m Disabled [m]
) else (
	echo    [13] Microsoft consumer experiences                             = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v UploadUserActivities > nul 2>&1
if not %errorlevel% == 1 (
	echo    [14] Allow upload of User Activities                            = [[1;32m Disabled [m]
) else (
	echo    [14] Allow upload of User Activities                            = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\DeviceHealthAttestationService" /v EnableDeviceHealthAttestationService > nul 2>&1
if not %errorlevel% == 1 (
    echo    [15] Device Health Monitoring and Reporting                     = [[1;32m Disabled [m]
) else (
    echo    [15] Device Health Monitoring and Reporting                     = [[1;31m Enabled [m]
) 

reg query "HKCU\Control Panel\International\User Profile" /v HttpAcceptLanguageOptOut > nul 2>&1
if not %errorlevel% == 1 (
    echo    [16] Let websites access local language list                    = [[1;32m Disabled [m]
) else (
    echo    [16] Let websites access local language list                    = [[1;31m Enabled [m]
)

reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\OOBE" /v DisablePrivacyExperience > nul 2>&1
if not %errorlevel% == 1 (
    echo    [17] Disable OOBE Privacy Experience                            = [[1;32m Disabled [m]
) else (
    echo    [17] Disable OOBE Privacy Experience                            = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v RSoPLogging > nul 2>&1
if not %errorlevel% == 1 (
    echo    [18] Resultant Set of Policy RSoP Logging                       = [[1;32m Disabled [m]
) else (
    echo    [18] Resultant Set of Policy RSoP Logging                       = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v AllowTelemetry > nul 2>&1
if not %errorlevel% == 1 (
    echo    [19] Program Compatibility Assistant                            = [[1;32m Disabled [m]
) else (
    echo    [19] Program Compatibility Assistant                            = [[1;31m Enabled [m]
) 

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoInstrumentation > nul 2>&1
if not %errorlevel% == 1 (
    echo    [20] Most frequently used applications                          = [[1;32m Disabled [m]
) else (
    echo    [20] Most frequently used applications                          = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\TabletPC" /v PreventHandwritingDataSharing > nul 2>&1
if not %errorlevel% == 1 (
    echo    [21] Handwriting Data Sharing                                   = [[1;32m Disabled [m]
) else (
    echo    [21] Handwriting Data Sharing                                   = [[1;31m Enabled [m]
)


reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v PublishUserActivities > nul 2>&1
if not %errorlevel% == 1 (
    echo    [22] User Activities data collection                            = [[1;32m Disabled [m]
) else (
    echo    [22] User Activities data collection                            = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\TextInput" /v AllowLinguisticDataCollection > nul 2>&1
if not %errorlevel% == 1 (
    echo    [23] Linguistic Data Collection                                 = [[1;32m Disabled [m]
) else (
    echo    [23] Linguistic Data Collection                                 = [[1;31m Enabled [m]
)


reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsAI" /v DisableAIDataAnalysis > nul 2>&1
if not %errorlevel% == 1 (
    echo    [24] WindowsAI Data Collection                                  = [[1;32m Disabled [m]
) else (
    echo    [24] WindowsAI Data Collection                                  = [[1;31m Enabled [m]
)


echo    [25] Apply all                                                  = [[1;31m * [m]
echo.
echo    [0]  Exit

echo.

set /P N=Select your group policy and press Enter ^>

if %N%==1 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" && set key=CEIPEnable && set value=0)
if %N%==2 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\AppV\CEIP" && set key=CEIPEnable && set value=0)
if %N%==3 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\System\AllowExperimentation" && set key=Value && set value=0)
if %N%==4 (set path="HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate" && set key=UpdateNotificationLevel && set value=2)
if %N%==5 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" && set key=Disabled && set value=1)
if %N%==6 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" && set key=DisableUAR && set value=1)
if %N%==7 (set path="HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\LocationAndSensors" && set key=DisableLocation && set value=1)
if %N%==8 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" && set key=AllowTelemetry && set value=0)
if %N%==9 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\InputPersonalization" && set key=RestrictImplicitTextCollection && set value=1)
if %N%==10 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\InputPersonalization" && set key=AllowInputPersonalization && set value=0)
if %N%==11 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}" && set key=ScenarioExecutionEnabled && set value=0)
if %N%==12 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" && set key=DisabledByGroupPolicy && set value=1)
if %N%==13 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" && set key=DisableWindowsConsumerFeatures && set value=1)
if %N%==14 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" && set key=UploadUserActivities && set value=0)
if %N%==15 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\DeviceHealthAttestationService" && set key=EnableDeviceHealthAttestationService && set value=0)
if %N%==16 (set path="HKCU\Control Panel\International\User Profile" && set key=HttpAcceptLanguageOptOut && set value=1)
if %N%==17 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OOBE" && set key=DisablePrivacyExperience && set value=1)
if %N%==18 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" && set key=RSoPLogging && set value=0)
if %N%==19 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" && set key=AllowTelemetry && set value=0)
if %N%==20 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" && set key=NoInstrumentation && set value=1)
if %N%==21 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\TabletPC" && set key=PreventHandwritingDataSharing && set value=1)
if %N%==22 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" && set key=PublishUserActivities && set value=0)
if %N%==23 (set path="HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\TextInput" && set key=AllowLinguisticDataCollection && set value=0)
if %N%==24 (set path="HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsAI" && set key=DisableAIDataAnalysis && set value=1)

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
if %loopcount%==2 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\AppV\CEIP" && set key=CEIPEnable && set value=0)
if %loopcount%==3 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\System\AllowExperimentation" && set key=Value && set value=0)
if %loopcount%==4 (set path="HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate" && set key=UpdateNotificationLevel && set value=2)
if %loopcount%==5 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" && set key=Disabled && set value=1)
if %loopcount%==6 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" && set key=DisableUAR && set value=1)
if %loopcount%==7 (set path="HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\LocationAndSensors" && set key=DisableLocation && set value=1)
if %loopcount%==8 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" && set key=AllowTelemetry && set value=0)
if %loopcount%==9 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\InputPersonalization" && set key=RestrictImplicitTextCollection && set value=1)
if %loopcount%==10 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\InputPersonalization" && set key=AllowInputPersonalization && set value=0)
if %loopcount%==11 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}" && set key=ScenarioExecutionEnabled && set value=0)
if %loopcount%==12 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" && set key=DisabledByGroupPolicy && set value=1)
if %loopcount%==13 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" && set key=DisableWindowsConsumerFeatures && set value=1)
if %loopcount%==14 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" && set key=UploadUserActivities && set value=0)
if %loopcount%==15 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\DeviceHealthAttestationService" && set key=EnableDeviceHealthAttestationService && set value=0)
if %loopcount%==16 (set path="HKCU\Control Panel\International\User Profile" && set key=HttpAcceptLanguageOptOut && set value=1)
if %loopcount%==17 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OOBE" && set key=DisablePrivacyExperience && set value=1)
if %loopcount%==18 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" && set key=RSoPLogging && set value=0)
if %loopcount%==19 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" && set key=AllowTelemetry && set value=0)
if %loopcount%==20 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" && set key=NoInstrumentation && set value=1)
if %loopcount%==21 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\TabletPC" && set key=PreventHandwritingDataSharing && set value=1)
if %loopcount%==22 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" && set key=PublishUserActivities && set value=0)
if %loopcount%==23 (set path="HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\TextInput" && set key=AllowLinguisticDataCollection && set value=0)
if %loopcount%==24 (set path="HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsAI" && set key=DisableAIDataAnalysis && set value=1)


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
:INIT
exit
