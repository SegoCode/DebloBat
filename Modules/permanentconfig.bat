
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

PowerShell -Command "If ((Get-ComputerRestorePoint).Description -Contains 'DebloBatRestorePoint') {exit 0} Else {exit 1}"
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

if %N%==1 (
	PowerShell -Command "Checkpoint-Computer -Description 'DebloBatRestorePoint' -RestorePointType 'MODIFY_SETTINGS'"
)

if %N%==2 (
	cls
	echo.
	echo    Deblo.bat -[1;36m Non-Restorable Settings [m
	echo    OneDrive removal script from AtlasOS
	echo    -----------------------------------------------
	echo.
	echo    Kill OneDrive process, Please wait...               = [[1;31m 1/8 [m]
	
	taskkill /f /im OneDrive.exe > nul 2>&1
	taskkill /IM OneDriveStandaloneUpdater.exe /F > nul 2>&1
    taskkill /IM OneDriveSetup.exe /F > nul 2>&1
    taskkill /IM OneDrive* /F > nul 2>&1
    sc delete OneSyncSvc* > nul 2>&1

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
    reg delete "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f > nul 2>&1
    reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v OneDrive /f > nul 2>&1
    reg delete "HKCU\SOFTWARE\Microsoft\OneDrive" /f > nul 2>&1
	reg delete "HKU\%~1\Environment" /v "OneDrive" /f > nul 2>&1

	echo    Delete OneDrive task, Please wait...                = [[1;31m 7/8 [m]
	for /f "tokens=1 delims=," %%x in ('schtasks /query /fo csv ^| find "OneDrive"') do schtasks /Delete /TN %%x /F > nul 2>&1

	echo    Remove residual files, Please wait...               = [[1;31m 8/8 [m]
    del /F /Q "C:\Windows\System32\OneDriveSetup.exe" > nul 2>&1
    del /F /Q "C:\Windows\SysWOW64\OneDriveSetup.exe" > nul 2>&1
    del /F /Q "C:\Windows\SysWOW64\OneDriveSettingSyncProvider.dll" > nul 2>&1
    del /F /Q "C:\OneDriveTemp" > nul 2>&1
    del /F /Q "C:\ProgramData\Microsoft OneDrive" > nul 2>&1

    for /f "usebackq tokens=2 delims=\" %%a in (`reg query "HKEY_USERS" ^| findstr /r /x /c:"HKEY_USERS\\S-.*" /c:"HKEY_USERS\\AME_UserHive_[^_]*"`) do (
        reg query "HKU\%%a" | findstr /c:"Volatile Environment" /c:"AME_UserHive_" > nul 2>&1
        if not !errorlevel! == 1 (
            for /f "usebackq delims=" %%b in (`reg query "HKU\%%a\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\BannerStore" ^| findstr /i /c:"OneDrive"`) do (
                reg delete "%%b" /f > nul 2>&1
            )
            for /f "usebackq delims=" %%b in (`reg query "HKU\%%a\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\Handlers" ^| findstr /i /c:"OneDrive"`) do (
                reg delete "%%b" /f > nul 2>&1
            )
            for /f "usebackq delims=" %%b in (`reg query "HKU\%%a\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths" ^| findstr /i /c:"OneDrive"`) do (
                reg delete "%%b" /f > nul 2>&1
            )
            for /f "usebackq delims=" %%b in (`reg query "HKU\%%a\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" ^| findstr /i /c:"OneDrive"`) do (
                reg delete "%%b" /f > nul 2>&1
            )
        )
    )
    

	echo.
	echo    One drive killer Script                             = [[1;32m DONE [m]
	echo    Press any key for return to menu . . .
	pause > nul
)



if %N%==3 (
	cls
	echo.
	echo    Deblo.bat -[1;36m Non-Restorable Settings [m
	echo    Edge removal script from AtlasOS
	echo    -----------------------------------------------
	echo.
	

	echo    Killing task, Please wait...           = [[1;31m 2/2 [m]
    taskkill /IM MicrosoftEdgeUpdate.exe /F > nul 2>&1
    taskkill /IM msedge.exe /F > nul 2>&1
    taskkill /IM MicrosoftEdge* /F > nul 2>&1
    taskkill /IM setup.exe /F > nul 2>&1
    taskkill /IM msedgewebview2.exe /F > nul 2>&1

	echo    Delete services, Please wait...        = [[1;31m 2/2 [m]
    sc delete edgeupdate > nul 2>&1
    sc delete edgeupdatem > nul 2>&1
    sc delete MicrosoftEdgeElevationService > nul 2>&1


	echo    Remove registry entries, Please wait...= [[1;31m 2/2 [m]
    reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarMigratedBrowserPin /f > nul 2>&1
    reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdate" /f > nul 2>&1
    reg delete "HKCR\CLSID\{1FCBE96C-1697-43AF-9140-2897C7C69767}" /f > nul 2>&1
    reg delete "HKCR\AppID\{1FCBE96C-1697-43AF-9140-2897C7C69767}" /f > nul 2>&1
    reg delete "HKCR\Interface\{C9C2B807-7731-4F34-81B7-44FF7779522B}" /f > nul 2>&1
    reg delete "HKCR\TypeLib\{C9C2B807-7731-4F34-81B7-44FF7779522B}" /f > nul 2>&1
    reg delete "HKCR\MSEdgeHTM" /f > nul 2>&1
    reg delete "HKCR\MSEdgePDF" /f > nul 2>&1
    reg delete "HKCR\MSEdgeMHT" /f > nul 2>&1
    reg delete "HKCR\AppID\{628ACE20-B77A-456F-A88D-547DB6CEEDD5}" /f > nul 2>&1
    reg delete "HKLM\SOFTWARE\Clients\StartMenuInternet\Microsoft Edge" /f > nul 2>&1
    reg delete "HKLM\SOFTWARE\RegisteredApplications" /v "Microsoft Edge" /f > nul 2>&1
    reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\msedge.exe" /f > nul 2>&1
    reg delete "HKCR\.htm\OpenWithProgIds" /v MSEdgeHTM /f > nul 2>&1
    reg delete "HKCR\.html\OpenWithProgIds" /v MSEdgeHTM /f > nul 2>&1
    reg delete "HKCR\.shtml\OpenWithProgids" /v MSEdgeHTM /f > nul 2>&1
    reg delete "HKCR\.svg\OpenWithProgIds" /v MSEdgeHTM /f > nul 2>&1
    reg delete "HKCR\.xht\OpenWithProgIds" /v MSEdgeHTM /f > nul 2>&1
    reg delete "HKCR\.xhtml\OpenWithProgIds" /v MSEdgeHTM /f > nul 2>&1
    reg delete "HKCR\.webp\OpenWithProgids" /v MSEdgeHTM /f > nul 2>&1
    reg delete "HKCR\.xml\OpenWithProgIds" /v MSEdgeHTM /f > nul 2>&1
    reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" /v MSEdgeHTM_microsoft-edge /f > nul 2>&1
    reg delete "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\EnterpriseMode" /v MSEdgePath /f > nul 2>&1
    reg delete "HKCR\AppID\ie_to_edge_bho.dll" /f > nul 2>&1



	echo    Cleaning files, Please wait...         = [[1;31m 2/2 [m]
    del /F /Q "C:\Users\Public\Desktop\Microsoft Edge.lnk" > nul 2>&1
    del /F /Q "C:\ProgramData\Microsoft\EdgeUpdate" > nul 2>&1
    del /F /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk" > nul 2>&1
    del /F /Q "%ProgramFiles(x86)%\Microsoft" > nul 2>&1
    

    echo    Cleaning the registry, Please wait...  = [[1;31m 3/4 [m]
    
    for /f "usebackq tokens=2 delims=\" %%a in (`reg query "HKEY_USERS" ^| findstr /c:"S-"`) do (
        reg query "HKU\%%a" | findstr /c:"Volatile Environment" /c:"AME_UserHive_" > nul 2>&1
        if not !errorlevel! == 1 (
            for /f "usebackq tokens=1 delims= " %%b in (`reg query "HKU\%%a\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" ^| findstr /i /c:"MicrosoftEdge" /c:"msedge"`) do (
                reg delete "HKU\%%a\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "%%b" /f > nul 2>&1
            )
        )
    )
    
    for /f "usebackq delims=" %%a in (`reg query "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall" ^| findstr /i /r /c:"Microsoft[ ]*Edge" /c:"msedge"`) do (
        reg delete "%%a" /f > nul 2>&1
    )

    echo    Remove residual files, Please wait...  = [[1;31m 4/4 [m]
    for /f "usebackq delims=" %%a in (`dir /b /a:d "!SystemDrive!\Users" ^| findstr /v /i /x /c:"Public" /c:"Default User" /c:"All Users"`) do (
        del /q /f "!SystemDrive!\Users\%%a\Desktop\Microsoft Edge.lnk" > nul 2>&1
        del /q /f "!SystemDrive!\Users\%%a\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Microsoft Edge.lnk" > nul 2>&1
        rmdir /q /s "!SystemDrive!\Users\%%a\AppData\Local\Microsoft\EdgeWebView" > nul 2>&1
        rmdir /q /s "!SystemDrive!\Users\%%a\AppData\Local\Microsoft\Edge" > nul 2>&1
        rmdir /q /s "!SystemDrive!\Users\%%a\AppData\Local\Microsoft\EdgeUpdate" > nul 2>&1
        rmdir /q /s "!SystemDrive!\Users\%%a\AppData\Local\Microsoft\EdgeCore" > nul 2>&1
    )
    for %%a in (
        "MicrosoftEdgeUpdateTaskMachineCore"
        "MicrosoftEdgeUpdateTaskMachineUA"
    ) do (
        schtasks /delete /tn "%%~a" /f > nul 2>&1
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

	echo    Clear DNS cache                                 = [[1;31m 20/31 [m]
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
	cls
	echo.
	echo    Deblo.bat -[1;36m Non-Restorable Settings [m
	echo    Uninstall default apps script
	echo    -----------------------------------------------
	echo.

	echo    Uninstalling apps, Please wait...          = [[1;31m 1/1 [m]
	
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
	) do (
    	echo    [[1;31m!count!/124[m] Uninstalling %%p, Please wait...
    	PowerShell -Command "Get-AppxPackage -AllUsers %%p | Remove-AppxPackage" > nul 2>&1
    	set /a count+=1
    )
    
	echo.
    echo    Uninstall default apps script              = [[1;32m DONE [m]
	echo    Press any key for return to menu . . .
	pause > nul
)
if %N%==0 (goto INIT)
goto PERMANENTCONFIG

:INIT