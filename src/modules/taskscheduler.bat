@echo off
title github.com/SegoCode
MODE 88,35
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
	echo    [1]  Consolidator                       = [[1;32m Disabled [m]
) else (
	echo    [1]  Consolidator                       = [[1;31m Enabled [m]
)

schtasks /query /tn "\Microsoft\Windows\PI\Sqm-Tasks" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 ( 
	echo    [2]  Sqm-Tasks                           = [[1;32m Disabled [m]
) else ( 
	echo    [2]  Sqm-Tasks                           = [[1;31m Enabled [m]
)


schtasks /query /tn "\Microsoft\Windows\Autochk\Proxy" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [3]  Proxy                               = [[1;32m Disabled [m]
) else (
	echo    [3]  Proxy                               = [[1;31m Enabled [m]
)

schtasks /query /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [4]  DiskDiagnosticDataCollector         = [[1;32m Disabled [m]
) else (
	echo    [4]  DiskDiagnosticDataCollector         = [[1;31m Enabled [m]
)

schtasks /query /tn "\Microsoft\Windows\NetTrace\GatherNetworkInfo" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [5]  GatherNetworkInfo                   = [[1;32m Disabled [m]
) else (
	echo    [5]  GatherNetworkInfo                   = [[1;31m Enabled [m]
)

schtasks /query /tn "\Microsoft\Windows\Device Information\Device" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [6]  Device Census                       = [[1;32m Disabled [m]
) else (
	echo    [6]  Device Census                       = [[1;31m Enabled [m]
)


schtasks /query /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [7]  Windows Error Reporting              = [[1;32m Disabled [m]
) else (
	echo    [7]  Windows Error Reporting              = [[1;31m Enabled [m]
)

schtasks /query /tn "\Microsoft\Windows\Feedback\Siuf\DmClient" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [8]  DmClient                           = [[1;32m Disabled [m]
) else (
	echo    [8]  DmClient                           = [[1;31m Enabled [m]
)

schtasks /query /tn "\MicrosoftEdgeUpdateTaskMachineUA" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [9]  MicrosoftEdgeUpdateTaskMachineUA   = [[1;32m Disabled [m]
) else (
	echo    [9]  MicrosoftEdgeUpdateTaskMachineUA   = [[1;31m Enabled [m]
)

echo    [10]  Apply all                    = [[1;31m * [m]
echo.
echo    [0]  Return to menu

echo.

set /P N=Select your task and press Enter ^>

if %N%==1 (set task="\Microsoft\Windows\Customer Experience Improvement Program\Consolidator")
if %N%==2 (set task="\Microsoft\Windows\PI\Sqm-Tasks")
if %N%==3 (set task="\Microsoft\Windows\Autochk\Proxy")
if %N%==4 (set task="\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector")
if %N%==5 (set task="\Microsoft\Windows\NetTrace\GatherNetworkInfo")
if %N%==6 (set task="\Microsoft\Windows\Device Information\Device")
if %N%==7 (set task="\Microsoft\Windows\Windows Error Reporting\QueueReporting")
if %N%==8 (set task="\Microsoft\Windows\Feedback\Siuf\DmClient")
if %N%==9 (set task="\MicrosoftEdgeUpdateTaskMachineUA")

set tasks="\Microsoft\Windows\Feedback\Siuf\DmClient" ^
           "\Microsoft\Windows\Windows Error Reporting\QueueReporting" ^
		   "\Microsoft\Windows\Device Information\Device" ^
           "\Microsoft\Windows\NetTrace\GatherNetworkInfo" ^
		   "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" ^
           "\Microsoft\Windows\Autochk\Proxy" ^
		   "\Microsoft\Windows\PI\Sqm-Tasks" ^
		   "\MicrosoftEdgeUpdateTaskMachineUA" ^
           "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator"

set /A count=1
if %N%==10 (
    for %%t in (%tasks%) do (
        schtasks /query /tn %%t | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
        if %errorlevel% equ 0 (
            schtasks /change /tn %%t /disable > nul 2>&1
        ) else (
            schtasks /change /tn %%t /enable > nul 2>&1
        )
        set /A count+=1
    )
    goto TASKSCHEDULER
)

if %N%==0 (goto INIT)

schtasks /query /tn %task% | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	schtasks /change /tn %task% /enable > nul 2>&1
) else (
	schtasks /change /tn %task% /disable > nul 2>&1
)

goto TASKSCHEDULER
:: ----------------------------------------------------------
:: ------------------TASK SCHEDULER END--------------------
:: ----------------------------------------------------------
:INIT