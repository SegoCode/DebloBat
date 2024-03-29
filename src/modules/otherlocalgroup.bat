@echo off
title github.com/SegoCode
MODE 88,40
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

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana > nul 2>&1
if not %errorlevel% == 1 (
	echo    [2]  Allow Cortana                                = [[1;32m Disabled [m]
) else (
	echo    [2]  Allow Cortana                                = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\UX Configuration" /v Notification_Suppress > nul 2>&1
if not %errorlevel% == 1 (
	echo    [3]  Windows Defender notifications               = [[1;32m Disabled [m]
) else (
	echo    [3]  Windows Defender notifications               = [[1;31m Enabled [m]
)

reg query "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v NoToastApplicationNotification > nul 2>&1
if not %errorlevel% == 1 (
    echo    [4]  Turn off toast notifications                 = [[1;32m Disabled [m]
) else (
    echo    [4]  Turn off toast notifications                 = [[1;31m Enabled [m]
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
	echo    [7]  Option "Look For An App In The Store"        = [[1;32m Disabled [m]
) else (
	echo    [7]  Option "Look For An App In The Store"        = [[1;31m Enabled [m]
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

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v DisableFileSyncNGSC > nul 2>&1
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


reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v EnableSmartScreen > nul 2>&1
if not %errorlevel% == 1 (
    echo    [17] Windows Defender SmartScreen                 = [[1;32m Disabled [m]
) else (
    echo    [17] Windows Defender SmartScreen                 = [[1;31m Enabled [m]
)

reg query "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" /v DisableNotificationCenter > nul 2>&1
if not %errorlevel% == 1 (
    echo    [18] Windows Notifications                        = [[1;32m Disabled [m]
) else (
    echo    [18] Windows Notifications                        = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v VerboseStatus > nul 2>&1
if not %errorlevel% == 1 (
    echo    [19] Simple Verbose in loader                     = [[1;32m Disabled [m]
) else (
    echo    [19] Simple Verbose in loader                     = [[1;31m Enabled [m]
)

reg query "HKCU\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsSpotlightFeatures > nul 2>&1
if not %errorlevel% == 1 (
    echo    [20] Windows Spotlight Features                   = [[1;32m Disabled [m]
) else (
    echo    [20] Windows Spotlight Features                   = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v MSAOptional > nul 2>&1
if %errorlevel% == 1 (
    echo    [21] Microsoft accounts required in store         = [[1;31m Enabled [m]
) else (
    echo    [21] Microsoft accounts required in store         = [[1;32m Disabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile" /v EnableFirewall > nul 2>&1
if not %errorlevel% == 1 (
    echo    [22] Windows Firewall                             = [[1;32m Disabled [m]
) else (
    echo    [22] Windows Firewall                             = [[1;31m Enabled [m] 
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v DisableLogonBackgroundImage > nul 2>&1
if not %errorlevel% == 1 (
    echo    [23] Logon Background Image                       = [[1;32m Disabled [m]
) else (
    echo    [23] Logon Background Image                       = [[1;31m Enabled [m]
)

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v EnableFeeds > nul 2>&1
if not %errorlevel% == 1 (
    echo    [24] Windows Feeds                                = [[1;32m Disabled [m]
) else (
    echo    [24] Windows Feeds                                = [[1;31m Enabled [m]
)

reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HideSCAMeetNow > nul 2>&1
if not %errorlevel% == 1 (
    echo    [25] Meet Now icon                                = [[1;32m Disabled [m]
) else (
    echo    [25] Meet Now icon                                = [[1;31m Enabled [m]
)


echo    [26] Apply all                                    = [[1;31m * [m]
echo.
echo    [0]  Exit

echo.

set /P N=Select your group policy and press Enter ^>

if %N%==1 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization" && set key=NoLockScreen && set value=1)
if %N%==2 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" && set key=AllowCortana && set value=0)
if %N%==3 (set path="HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\UX Configuration" && set key=Notification_Suppress && set value=1)
if %N%==4 (set path="HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" && set key=NoToastApplicationNotification && set value=1)
if %N%==5 (set path="HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\FileHistory" && set key=Disabled && set value=1)
if %N%==6 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Systray" && set key=HideSystray && set value=1)
if %N%==7 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer" && set key=NoUseStoreOpenWith && set value=1)
if %N%==8 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-time Protection" && set key=DisableRealtimeMonitoring && set value=1)
if %N%==9 (set path="HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Policies" && set key=NtfsEncryptPagingFile && set value=1)
if %N%==10 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive" && set key=DisableFileSyncNGSC && set value=1)
if %N%==11 (set path="HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\GameDVR" && set key=AllowGameDVR && set value=0)
if %N%==12 (set path="HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Messaging" && set key=AllowMessageSync && set value=0)
if %N%==13 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" && set key=PublishUserActivities && set value=0)
if %N%==14 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" && set key=AllowCloudSearch && set value=0)
if %N%==15 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" && set key=ConnectedSearchUseWeb && set value=1)
if %N%==16 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" && set key=DODownloadMode && set value=0)
if %N%==17 (set path="HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\System" && set key=EnableSmartScreen && set value=0)
if %N%==18 (set path="HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" && set key=DisableNotificationCenter && set value=1)
if %N%==19 (set path="HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" && set key=VerboseStatus && set value=1)
if %N%==20 (set path="HKCU\SOFTWARE\Policies\Microsoft\Windows\CloudContent" && set key=DisableWindowsSpotlightFeatures && set value=1)
if %N%==21 (set path="HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" && set key=MSAOptional && set value=1) 
if %N%==22 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile" && set key=EnableFirewall && set value=0)
if %N%==23 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" && set key=DisableLogonBackgroundImage && set value=1)
if %N%==24 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" && set key=EnableFeeds && set value=0)
if %N%==25 (set path="HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" && set key=HideSCAMeetNow && set value=1)

if %N%==26 (set loopcount=25 && goto APPLYALLOTHERLOCALGROUP)
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
if %loopcount%==2 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" && set key=AllowCortana && set value=0)
if %loopcount%==3 (set path="HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows Defender\UX Configuration" && set key=Notification_Suppress && set value=1)
if %loopcount%==4 (set path="HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" && set key=NoToastApplicationNotification && set value=1)
if %loopcount%==5 (set path="HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\FileHistory" && set key=Disabled && set value=1)
if %loopcount%==6 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Systray" && set key=HideSystray && set value=1)
if %loopcount%==7 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer" && set key=NoUseStoreOpenWith && set value=1)
if %loopcount%==8 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-time Protection" && set key=DisableRealtimeMonitoring && set value=1)
if %loopcount%==9 (set path="HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Policies" && set key=NtfsEncryptPagingFile && set value=1)
if %loopcount%==10 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive" && set key=DisableFileSyncNGSC && set value=1)
if %loopcount%==11 (set path="HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\GameDVR" && set key=AllowGameDVR && set value=0)
if %loopcount%==12 (set path="HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Messaging" && set key=AllowMessageSync && set value=0)
if %loopcount%==13 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" && set key=PublishUserActivities && set value=0)
if %loopcount%==14 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" && set key=AllowCloudSearch && set value=0)
if %loopcount%==15 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" && set key=ConnectedSearchUseWeb && set value=1)
if %loopcount%==16 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" && set key=DODownloadMode && set value=0)
if %loopcount%==17 (set path="HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\System" && set key=EnableSmartScreen && set value=0)
if %loopcount%==18 (set path="HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer" && set key=DisableNotificationCenter && set value=1)
if %loopcount%==19 (set path="HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" && set key=VerboseStatus && set value=1)
if %loopcount%==20 (set path="HKCU\SOFTWARE\Policies\Microsoft\Windows\CloudContent" && set key=DisableWindowsSpotlightFeatures && set value=1)
if %loopcount%==21 (set path="HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System" && set key=MSAOptional && set value=1) 
if %loopcount%==22 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile" && set key=EnableFirewall && set value=0)
if %loopcount%==23 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" && set key=DisableLogonBackgroundImage && set value=1)
if %loopcount%==24 (set path="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" && set key=EnableFeeds && set value=0)
if %loopcount%==25 (set path="HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" && set key=HideSCAMeetNow && set value=1)

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
:INIT
exit
