@echo off
title github.com/SegoCode
MODE 88,35
setlocal enabledelayedexpansion
:: ----------------------------------------------------------
:: ----------------------SERVICES START----------------------
:: ----------------------------------------------------------

:SERVICES
cls
echo.
echo    Deblo.bat -[1;36m Windows Services [m
echo    Yet another (and ugly) debloat suite.
echo    -----------------------------------------------
echo.

sc qc "lfsvc" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [1]  Location Foundation Service                 = [[1;32m Disabled [m]
) else (
	echo    [1]  Location Foundation Service                 = [[1;31m Enabled [m]
)

sc qc "MapsBroker" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [2]  Maps Broker Service                         = [[1;32m Disabled [m]
) else (
	echo    [2]  Maps Broker Service                         = [[1;31m Enabled [m]
)

sc qc "DiagTrack" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [3]  Diagnostics Tracking Service                = [[1;32m Disabled [m]
) else (
	echo    [3]  Diagnostics Tracking Service                = [[1;31m Enabled [m]
)

sc qc "OneSyncSvc" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [4]  OneSync Service                             = [[1;32m Disabled [m]
) else (
	echo    [4]  OneSync Service                             = [[1;31m Enabled [m]
)

sc qc "TrkWks" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [5]  Distributed Link Tracking Client            = [[1;32m Disabled [m]
) else (
	echo    [5]  Distributed Link Tracking Client            = [[1;31m Enabled [m]
)

sc qc "PcaSvc" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [6]  Program Compatibility Assistant Service     = [[1;32m Disabled [m]
) else (
	echo    [6]  Program Compatibility Assistant Service     = [[1;31m Enabled [m]
)

sc qc "WSearch" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [7]  Windows Search                              = [[1;32m Disabled [m]
) else (
	echo    [7]  Windows Search                              = [[1;31m Enabled [m]
)

sc qc "WerSvc" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [8]  Windows Error Reporting Service             = [[1;32m Disabled [m]
) else (
	echo    [8]  Windows Error Reporting Service             = [[1;31m Enabled [m]
)

sc qc "WpnService" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [9]  Windows Push Notification Service           = [[1;32m Disabled [m]
) else (
	echo    [9]  Windows Push Notification Service           = [[1;31m Enabled [m]
)

sc qc "ndu" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [10] Windows Network Data Usage Monitor          = [[1;32m Disabled [m]
) else (
	echo    [10] Windows Network Data Usage Monitor          = [[1;31m Enabled [m]
)

sc qc "diagsvc" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [11] Diagnostic Service                          = [[1;32m Disabled [m]
) else (
	echo    [11] Diagnostic Service                          = [[1;31m Enabled [m]
)

sc qc "diagnosticshub.standardcollector.service" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [12] Diagnostics Hub Standard Collector Service  = [[1;32m Disabled [m]
) else (
	echo    [12] Diagnostics Hub Standard Collector Service  = [[1;31m Enabled [m]
)

sc qc "wercplsupport" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [13] Problem Reports Panel Support               = [[1;32m Disabled [m]
) else (
	echo    [13] Problem Reports Panel Support               = [[1;31m Enabled [m]
)

sc qc "WdiServiceHost" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [14] Diagnostic Service Host                     = [[1;32m Disabled [m]
) else (
	echo    [14] Diagnostic Service Host                     = [[1;31m Enabled [m]
)

sc qc "RasMan" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [15] Remote Access Connection Manager Service    = [[1;32m Disabled [m]
) else (
	echo    [15] Remote Access Connection Manager Service    = [[1;31m Enabled [m]
)


echo    [16] Apply all                                   = [[1;31m * [m]
echo.
echo    [0]  Return to menu
echo.
set /P N=Select your service and press Enter ^>


if %N%==1 (set serviceName="lfsvc")
if %N%==2 (set serviceName="MapsBroker")
if %N%==3 (set serviceName="DiagTrack")
if %N%==4 (set serviceName="OneSyncSvc")
if %N%==5 (set serviceName="TrkWks")
if %N%==6 (set serviceName="PcaSvc")
if %N%==7 (set serviceName="WSearch")
if %N%==8 (set serviceName="WerSvc")
if %N%==9 (set serviceName="WpnService")
if %N%==10 (set serviceName="ndu")
if %N%==11 (set serviceName="diagsvc")
if %N%==12 (set serviceName="diagnosticshub.standardcollector.service")
if %N%==13 (set serviceName="wercplsupport")
if %N%==14 (set serviceName="WdiServiceHost")
if %N%==15 (set serviceName="RasMan")

set services=lfsvc MapsBroker DiagTrack OneSyncSvc TrkWks PcaSvc WSearch WerSvc WpnService ndu diagsvc diagnosticshub.standardcollector.service wercplsupport WdiServiceHost RasMan
set /A count=1

if %N%==16 (
	for %%s in (%services%) do (
		sc qc %%s | findstr /r "DISABLED" > nul 2>&1
		if !errorlevel! equ 0 (
			sc config %%s start= auto > nul 2>&1
		) else (
		    sc config %%s start= disabled > nul 2>&1
		)
		set /A count+=1
	)
	goto SERVICES
)

if %N%==0 (goto INIT)

PowerShell -Command "If ((Get-Service -Name %serviceName%).StartType -eq 'Disabled') {exit 0} Else {exit 1}" > nul 2>&1
if not %errorlevel% == 1 (
	sc config %serviceName% start= AUTO
) else (
    sc stop %serviceName%
	sc config %serviceName% start= DISABLED
)

goto SERVICES
:: ----------------------------------------------------------
:: -----------------------SERVICES END-----------------------
:: ----------------------------------------------------------
:INIT
exit