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
echo    Based on AtlasOS 0.3.2
echo    -----------------------------------------------
echo.

schtasks /query /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [1]  Consolidator                        = [[1;32m Disabled [m]
) else (
	echo    [1]  Consolidator                        = [[1;31m Enabled [m]
)

schtasks /query /tn "\Microsoft\Windows\PI\Sqm-Tasks" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 ( 
	echo    [2]  Sqm-Tasks                           = [[1;32m Disabled [m]
) else ( 
	echo    [2]  Sqm-Tasks                           = [[1;31m Enabled [m]
)

schtasks /query /tn "\Microsoft\Windows\ApplicationData\appuriverifierdaily" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [3]  AppUriVerifierDaily                 = [[1;32m Disabled [m]
) else (
	echo    [3]  AppUriVerifierDaily                 = [[1;31m Enabled [m]
)

schtasks /query /tn "\Microsoft\Windows\Application Experience\PcaPatchDbTask" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [4]  PcaPatchDbTask                      = [[1;32m Disabled [m]
) else (
	echo    [4]  PcaPatchDbTask                      = [[1;31m Enabled [m]
)

schtasks /query /tn "\Microsoft\Windows\Application Experience\StartupAppTask" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [5]  StartupAppTask                      = [[1;32m Disabled [m]
) else (
	echo    [5]  StartupAppTask                      = [[1;31m Enabled [m]
)

schtasks /query /tn "\Microsoft\Windows\ApplicationData\DsSvcCleanup" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [6]  DsSvcCleanup                        = [[1;32m Disabled [m]
) else (
	echo    [6]  DsSvcCleanup                        = [[1;31m Enabled [m]
)

schtasks /query /tn "\Microsoft\Windows\CloudExperienceHost\CreateObjectTask" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [7]  CreateObjectTask                    = [[1;32m Disabled [m]
) else (
	echo    [7]  CreateObjectTask                    = [[1;31m Enabled [m]
)

schtasks /query /tn "\Microsoft\Windows\Diagnosis\Scheduled" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [8]  Diagnosis Scheduled                 = [[1;32m Disabled [m]
) else (
	echo    [8]  Diagnosis Scheduled                 = [[1;31m Enabled [m]
)

schtasks /query /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [9]  DiskDiagnosticDataCollector         = [[1;32m Disabled [m]
) else (
	echo    [9]  DiskDiagnosticDataCollector         = [[1;31m Enabled [m]
)

schtasks /query /tn "\Microsoft\Windows\DiskFootprint\Diagnostics" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [10] DiskFootprint Diagnostics           = [[1;32m Disabled [m]
) else (
	echo    [10] DiskFootprint Diagnostics           = [[1;31m Enabled [m]
)

schtasks /query /tn "\Microsoft\Windows\InstallService\ScanForUpdates" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [11] ScanForUpdates                      = [[1;32m Disabled [m]
) else (
	echo    [11] ScanForUpdates                      = [[1;31m Enabled [m]
)

schtasks /query /tn "\Microsoft\Windows\InstallService\ScanForUpdatesAsUser" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [12] ScanForUpdatesAsUser                = [[1;32m Disabled [m]
) else (
	echo    [12] ScanForUpdatesAsUser                = [[1;31m Enabled [m]
)

schtasks /query /tn "\Microsoft\Windows\Maintenance\WinSAT" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [13] WinSAT                              = [[1;32m Disabled [m]
) else (
	echo    [13] WinSAT                              = [[1;31m Enabled [m]
)

schtasks /query /tn "\Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [14] RunFullMemoryDiagnostic             = [[1;32m Disabled [m]
) else (
	echo    [14] RunFullMemoryDiagnostic             = [[1;31m Enabled [m]
)

schtasks /query /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [15] AnalyzeSystem                       = [[1;32m Disabled [m]
) else (
	echo    [15] AnalyzeSystem                       = [[1;31m Enabled [m]
)

schtasks /query /tn "\Microsoft\Windows\Registry\RegIdleBackup" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [16] RegIdleBackup                       = [[1;32m Disabled [m]
) else (
	echo    [16] RegIdleBackup                       = [[1;31m Enabled [m]
)

schtasks /query /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [17] FamilySafetyMonitor                 = [[1;32m Disabled [m]
) else (
	echo    [17] FamilySafetyMonitor                 = [[1;31m Enabled [m]
)


schtasks /query /tn "\Microsoft\Windows\Shell\IndexerAutomaticMaintenance" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [18] IndexerAutomaticMaintenance         = [[1;32m Disabled [m]
) else (
	echo    [18] IndexerAutomaticMaintenance         = [[1;31m Enabled [m]
)

schtasks /query /tn "\Microsoft\Windows\StateRepository\MaintenanceTasks" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [19] MaintenanceTasks                    = [[1;32m Disabled [m]
) else (
	echo    [19] MaintenanceTasks                    = [[1;31m Enabled [m]
)

schtasks /query /tn "\Microsoft\Windows\WindowsUpdate\Scheduled Start" | findstr /r "Listo | Ready | Running | Queued" > nul 2>&1
if not %errorlevel% == 0 (
	echo    [20] Scheduled Start                     = [[1;32m Disabled [m]
) else (
	echo    [20] Scheduled Start                     = [[1;31m Enabled [m]
)

echo    [21] Apply all                           = [[1;31m * [m]
echo.
echo    [0]  Return to menu

echo.

set /P N=Select your task and press Enter ^>

if %N%==1 (set task="\Microsoft\Windows\Customer Experience Improvement Program\Consolidator")
if %N%==2 (set task="\Microsoft\Windows\PI\Sqm-Tasks")
if %N%==3 (set task="\Microsoft\Windows\ApplicationData\appuriverifierdaily")
if %N%==4 (set task="\Microsoft\Windows\Application Experience\PcaPatchDbTask")
if %N%==5 (set task="\Microsoft\Windows\Application Experience\StartupAppTask")
if %N%==6 (set task="\Microsoft\Windows\ApplicationData\DsSvcCleanup")
if %N%==7 (set task="\Microsoft\Windows\CloudExperienceHost\CreateObjectTask")
if %N%==8 (set task="\Microsoft\Windows\Diagnosis\Scheduled")
if %N%==9 (set task="\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector")
if %N%==10 (set task="\Microsoft\Windows\DiskFootprint\Diagnostics")
if %N%==11 (set task="\Microsoft\Windows\InstallService\ScanForUpdates")
if %N%==12 (set task="\Microsoft\Windows\InstallService\ScanForUpdatesAsUser")
if %N%==13 (set task="\Microsoft\Windows\Maintenance\WinSAT")
if %N%==14 (set task="\Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic")
if %N%==15 (set task="\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem")
if %N%==16 (set task="\Microsoft\Windows\Registry\RegIdleBackup")
if %N%==17 (set task="\Microsoft\Windows\Shell\FamilySafetyMonitor")
if %N%==18 (set task="\Microsoft\Windows\Shell\IndexerAutomaticMaintenance")
if %N%==19 (set task="\Microsoft\Windows\StateRepository\MaintenanceTasks")
if %N%==20 (set task="\Microsoft\Windows\WindowsUpdate\Scheduled Start")

set tasks="\Microsoft\Windows\ApplicationData\appuriverifierdaily" ^
           "\Microsoft\Windows\Application Experience\PcaPatchDbTask" ^
           "\Microsoft\Windows\Application Experience\StartupAppTask" ^
           "\Microsoft\Windows\ApplicationData\DsSvcCleanup" ^
           "\Microsoft\Windows\CloudExperienceHost\CreateObjectTask" ^
           "\Microsoft\Windows\Diagnosis\Scheduled" ^
           "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" ^
           "\Microsoft\Windows\DiskFootprint\Diagnostics" ^
           "\Microsoft\Windows\InstallService\ScanForUpdates" ^
           "\Microsoft\Windows\InstallService\ScanForUpdatesAsUser" ^
           "\Microsoft\Windows\Maintenance\WinSAT" ^
           "\Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic" ^
           "\Microsoft\Windows\PI\Sqm-Tasks" ^
           "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" ^
           "\Microsoft\Windows\Registry\RegIdleBackup" ^
           "\Microsoft\Windows\Shell\FamilySafetyMonitor" ^
           "\Microsoft\Windows\Shell\IndexerAutomaticMaintenance" ^
           "\Microsoft\Windows\StateRepository\MaintenanceTasks" ^
           "\Microsoft\Windows\WindowsUpdate\Scheduled Start" ^
           "\MicrosoftEdgeUpdateTaskMachineUA" ^
           "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator"

set /A count=1
if %N%==21 (
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
exit