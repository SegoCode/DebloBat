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
set powershell=%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe
:TASKSCHEDULER
cls
echo.
echo    Windows Tool Box -[1;36m Task Scheduler [m
echo    Reverse engineer WPD app based on 1.5.2042 RC 1 
echo    -----------------------------------------------
echo.  

%powershell% -Command "If ((Get-ScheduledTask "Consolidator").state -eq 'Disabled') {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [1]  Consolidator                 = [[1;32m Disabled [m]
) else (
	echo    [1]  Consolidator                 = [[1;31m Enabled [m]
)

%powershell% -Command "If ((Get-ScheduledTask "Sqm-Tasks").state -eq 'Disabled') {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [2]  Sqm-Tasks                    = [[1;32m Disabled [m]
) else (
	echo    [2]  Sqm-Tasks                    = [[1;31m Enabled [m]
)

%powershell% -Command "If ((Get-ScheduledTask "Proxy").state -eq 'Disabled') {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [3]  Proxy                        = [[1;32m Disabled [m]
) else (
	echo    [3]  Proxy                        = [[1;31m Enabled [m]
)

%powershell% -Command "If ((Get-ScheduledTask "Microsoft-Windows-DiskDiagnosticDataCollector").state -eq 'Disabled') {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [4]  DiskDiagnosticDataCollector  = [[1;32m Disabled [m]
) else (
	echo    [4]  DiskDiagnosticDataCollector  = [[1;31m Enabled [m]
)


%powershell% -Command "If ((Get-ScheduledTask "GatherNetworkInfo").state -eq 'Disabled') {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [5]  GatherNetworkInfo            = [[1;32m Disabled [m]
) else (
	echo    [5]  GatherNetworkInfo            = [[1;31m Enabled [m]
)


%powershell% -Command "If ((Get-ScheduledTask "device").state -eq 'Disabled') {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [6]  Device Census                = [[1;32m Disabled [m]
) else (
	echo    [6]  Device Census                = [[1;31m Enabled [m]
)

%powershell% -Command "If ((Get-ScheduledTask "QueueReporting").state -eq 'Disabled') {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [7]  Windows Error Reporting      = [[1;32m Disabled [m]
) else (
	echo    [7]  Windows Error Reporting      = [[1;31m Enabled [m]
)

echo    [8]  Apply all                    = [[1;31m * [m]
echo    [0]  Return to menu                                                       

echo.

set /P N=Select your service and press Enter ^> 

if %N%==1 (set service="Consolidator")
if %N%==2 (set service="Sqm-Tasks")
if %N%==3 (set service="Proxy")
if %N%==4 (set service="Microsoft-Windows-DiskDiagnosticDataCollector")
if %N%==5 (set service="GatherNetworkInfo")
if %N%==6 (set service="device")
if %N%==7 (set service="QueueReporting")

if %N%==8 (set loopcount=7 && goto APPLYALLTASKSCHEDULERMIDDLE)
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

set /a numcount= 7 - %loopcount% + 1
echo    Working...  = [[1;31m %numcount%/7 [m]
%powershell% -Command "If ((Get-ScheduledTask %service%).state -eq 'Disabled') {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	%powershell% -Command "Enable-ScheduledTask (Get-ScheduledTask %service%)" > nul 2>&1
) else (
	%powershell% -Command "Disable-ScheduledTask (Get-ScheduledTask %service%)" > nul 2>&1
)

set /a loopcount=loopcount-1
if %loopcount%==0 goto TASKSCHEDULER
goto APPLYALLTASKSCHEDULER