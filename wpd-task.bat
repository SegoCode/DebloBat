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

:TASKSCHEDULER
MODE 100,35
title github.com/SegoCode 
cls
echo.
echo    Task Scheduler  [1;36m Based on 1.5.2042 RC 1 [m
echo    Reverse engineer WPD app by github.com/SegoCode 
echo    -----------------------------------------------
echo.

powershell -Command "If ((Get-ScheduledTask "Consolidator").state -eq 'Disabled') {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [1]  Consolidator          = [[1;32m Disabled [m]
) else (
	echo    [1]  Consolidator          = [[1;31m Enabled [m]
)

powershell -Command "If ((Get-ScheduledTask "Sqm-Tasks").state -eq 'Disabled') {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [2]  Sqm-Tasks             = [[1;32m Disabled [m]
) else (
	echo    [2]  Sqm-Tasks             = [[1;31m Enabled [m]
)

powershell -Command "If ((Get-ScheduledTask "BackgroundUploadTask").state -eq 'Disabled') {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [3]  BackgroundUploadTask  = [[1;32m Disabled [m]
) else (
	echo    [3]  BackgroundUploadTask  = [[1;31m Enabled [m]
)

powershell -Command "If ((Get-ScheduledTask "Proxy").state -eq 'Disabled') {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [4]  Proxy                 = [[1;32m Disabled [m]
) else (
	echo    [4]  Proxy                 = [[1;31m Enabled [m]
)

powershell -Command "If ((Get-ScheduledTask "Proxy").state -eq 'Disabled') {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [?]  Device Census         = [[1;32m Disabled [m]
) else (
	echo    [?]  Device Census         = [[1;31m Enabled [m]
)

echo.

set /P N=Select your service and press Enter ^> 
if %N%==1 (set service="Consolidator")
if %N%==2 (set service="Sqm-Tasks")
if %N%==3 (set service="BackgroundUploadTask")
if %N%==4 (set service="Proxy")


powershell -Command "If ((Get-ScheduledTask %service%).state -eq 'Disabled') {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	powershell -Command "Enable-ScheduledTask (Get-ScheduledTask %service%)" > nul 2>&1
) else (
	powershell -Command "Disable-ScheduledTask (Get-ScheduledTask %service%)" > nul 2>&1
)

goto TASKSCHEDULER