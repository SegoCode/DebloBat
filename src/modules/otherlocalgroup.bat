@echo off
title github.com/SegoCode
MODE 88,40

:: ----------------------------------------------------------
:: -------------OTHER LOCAL GROUP POLICY START---------------
:: ----------------------------------------------------------
:OTHERLOCALGROUP
cls
echo.
echo    Deblo.bat -[1;36m Extended Group Policy Tweaks [m
echo    My personal preference
echo    -----------------------------------------------
echo.

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v NoLockScreen > nul 2>&1
if not %errorlevel% == 1 (
	echo    [1]  Windows lock screen                          = [[1;32m Disabled [m]
) else (
	echo    [1]  Windows lock screen                          = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v DisableLogonBackgroundImage > nul 2>&1
if not %errorlevel% == 1 (
    echo    [2]  Windows lock screen image                    = [[1;32m Disabled [m]
) else (
    echo    [2]  Windows lock screen image                    = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Systray" /v HideSystray > nul 2>&1
if not %errorlevel% == 1 (
	echo    [3]  Windows security systray                     = [[1;32m Disabled [m]
) else (
	echo    [3]  Windows security systray                     = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\UX Configuration" /v Notification_Suppress > nul 2>&1
if not %errorlevel% == 1 (
	echo    [4]  Windows defender notifications               = [[1;32m Disabled [m]
) else (
	echo    [4]  Windows defender notifications               = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v EnableFeeds > nul 2>&1
if not %errorlevel% == 1 (
    echo    [5]  Windows feeds                                = [[1;32m Disabled [m]
) else (
    echo    [5]  Windows feeds                                = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v MSAOptional > nul 2>&1
if %errorlevel% == 1 (
    echo    [6]  Microsoft accounts required in store         = [[1;31m Enabled [m]
) else (
    echo    [6]  Microsoft accounts required in store         = [[1;32m Disabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsSpotlightFeatures > nul 2>&1
if not %errorlevel% == 1 (
    echo    [7]  Windows Spotlight                            = [[1;32m Disabled [m]
) else (
    echo    [7]  Windows Spotlight                            = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v NoUseStoreOpenWith > nul 2>&1
if not %errorlevel% == 1 (
	echo    [8]  Option "Look for an app in the store"        = [[1;32m Disabled [m]
) else (
	echo    [8]  Option "Look for an app in the store"        = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v VerboseStatus > nul 2>&1
if not %errorlevel% == 1 (
    echo    [9]  Windows verbose startup                      = [[1;32m Disabled [m]
) else (
    echo    [9]  Windows verbose startup                      = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v EnableSmartScreen > nul 2>&1
if not %errorlevel% == 1 (
    echo    [10] Windows defender smartScreen                 = [[1;32m Disabled [m]
) else (
    echo    [10] Windows defender smartScreen                 = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Dsh" /v AllowNewsAndInterests > nul 2>&1
if not %errorlevel% == 1 (
    echo    [11] News and interests task button               = [[1;32m Disabled [m]
) else (
    echo    [11] News and interests task button               = [[1;31m Enabled [m]
) 


reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v DisableSearchBoxSuggestions > nul 2>&1
if not %errorlevel% == 1 (
	echo    [12] Web suggestions for search                   = [[1;32m Disabled [m]
) else (
	echo    [12] Web suggestions for search                   = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v DisableFileSyncNGSC > nul 2>&1
if not %errorlevel% == 1 (
	echo    [13] Microsoft OneDrive                           = [[1;32m Disabled [m]
) else (
	echo    [13] Microsoft OneDrive                           = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v InPrivateModeAvailability > nul 2>&1
if not %errorlevel% == 1 (
    echo    [14] Microsoft Edge always InPrivate mode         = [[1;32m Disabled [m]
) else (  
    echo    [14] Microsoft Edge always InPrivate mode         = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" /v TurnOffWindowsCopilot > nul 2>&1
if not %errorlevel% == 1 (
	echo    [15] Windows Copilot                              = [[1;32m Disabled [m]
) else (
	echo    [15] Windows Copilot                              = [[1;31m Enabled [m]
)


reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v DisableNotificationCenter > nul 2>&1
if not %errorlevel% == 1 (
    echo    [16] Windows notifications center                 = [[1;32m Disabled [m]
) else (
    echo    [16] Windows notifications center                 = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate > nul 2>&1
if not %errorlevel% == 1 (
    echo    [17] Windows automatic updates                    = [[1;32m Disabled [m]
) else (
    echo    [17] Windows automatic updates                    = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v ExcludeWUDriversInQualityUpdate > nul 2>&1
if not %errorlevel% == 1 (
    echo    [18] Windows update include drivers               = [[1;32m Disabled [m]
) else (
    echo    [18] Windows update include drivers               = [[1;31m Enabled [m]
)


echo    [19] Apply all                                    = [[1;31m * [m]
echo.
echo    [0]  Exit

echo.

set /P N=Select your group policy and press Enter ^>

if %N%==1 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization" && set key=NoLockScreen && set value=1)
if %N%==2 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" && set key=DisableLogonBackgroundImage && set value=1)
if %N%==3 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Systray" && set key=HideSystray && set value=1)
if %N%==4 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\UX Configuration" && set key=Notification_Suppress && set value=1)
if %N%==5 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" && set key=EnableFeeds && set value=0)
if %N%==6 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" && set key=MSAOptional && set value=1) 
if %N%==7 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" && set key=DisableWindowsSpotlightFeatures && set value=1)
if %N%==8 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer" && set key=NoUseStoreOpenWith && set value=1)
if %N%==9 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" && set key=VerboseStatus && set value=1)
if %N%==10 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" && set key=EnableSmartScreen && set value=0)
if %N%==11 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Dsh" && set key=AllowNewsAndInterests && set value=0)
if %N%==12 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer" && set key=DisableSearchBoxSuggestions && set value=1)
if %N%==13 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive" && set key=DisableFileSyncNGSC && set value=1)
if %N%==14 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" && set key=InPrivateModeAvailability && set value=2)
if %N%==15 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" && set key=TurnOffWindowsCopilot && set value=1)
if %N%==16 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer" && set key=DisableNotificationCenter && set value=1)
if %N%==17 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" && set key=NoAutoUpdate && set value=1)
if %N%==18 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" && set key=ExcludeWUDriversInQualityUpdate && set value=1)

if %N%==19 (set loopcount=18 && goto APPLYALLOTHERLOCALGROUP)
if %N%==0 (goto EOF)

reg query %path% /v %key% > nul 2>&1
if not %errorlevel% == 1 (
		reg delete %path% /v %key% /f > nul 2>&1
) else (
		reg add %path% /v %key% /t REG_DWORD /d %value% /f > nul 2>&1
)

goto OTHERLOCALGROUP

:APPLYALLOTHERLOCALGROUP
if %loopcount%==1 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization" && set key=NoLockScreen && set value=1)
if %loopcount%==2 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" && set key=DisableLogonBackgroundImage && set value=1)
if %loopcount%==3 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Systray" && set key=HideSystray && set value=1)
if %loopcount%==4 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\UX Configuration" && set key=Notification_Suppress && set value=1)
if %loopcount%==5 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" && set key=EnableFeeds && set value=0)
if %loopcount%==6 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" && set key=MSAOptional && set value=1) 
if %loopcount%==7 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" && set key=DisableWindowsSpotlightFeatures && set value=1)
if %loopcount%==8 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer" && set key=NoUseStoreOpenWith && set value=1)
if %loopcount%==9 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" && set key=VerboseStatus && set value=1)
if %loopcount%==10 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" && set key=EnableSmartScreen && set value=0)
if %loopcount%==11 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Dsh" && set key=AllowNewsAndInterests && set value=0)
if %loopcount%==12 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer" && set key=DisableSearchBoxSuggestions && set value=1)
if %loopcount%==13 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive" && set key=DisableFileSyncNGSC && set value=1)
if %loopcount%==14 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" && set key=InPrivateModeAvailability && set value=2)
if %loopcount%==15 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" && set key=TurnOffWindowsCopilot && set value=1)
if %loopcount%==16 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer" && set key=DisableNotificationCenter && set value=1)
if %loopcount%==17 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" && set key=NoAutoUpdate && set value=1)
if %loopcount%==18 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" && set key=ExcludeWUDriversInQualityUpdate && set value=1)


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
:EOF
exit
