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

sc qc "DiagTrack" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [1]   Diagnostics Tracking Service                = [[1;32m Disabled [m]
) else (
	echo    [1]   Diagnostics Tracking Service                = [[1;31m Enabled [m]
)

sc qc "lfsvc" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [2]   Geolocation Service                         = [[1;32m Disabled [m]
) else (
	echo    [2]   Geolocation Service                         = [[1;31m Enabled [m]
)

sc qc "MapsBroker" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [3]   Downloaded Maps Manager                     = [[1;32m Disabled [m]
) else (
	echo    [3]   Downloaded Maps Manager                     = [[1;31m Enabled [m]
)

sc qc "wuauserv" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [4]   Windows Update wuauserv                     = [[1;32m Disabled [m]
) else (
	echo    [4]   Windows Update wuauserv                     = [[1;31m Enabled [m]
)

sc qc "SharedAccess" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [5]   Internet Connection Sharing                 = [[1;32m Disabled [m]
) else (
	echo    [5]   Internet Connection Sharing                 = [[1;31m Enabled [m]
)

sc qc "TrkWks" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [6]   Distributed Link Tracking Client            = [[1;32m Disabled [m]
) else (
	echo    [6]   Distributed Link Tracking Client            = [[1;31m Enabled [m]
)

sc qc "WSearch" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [7]   Windows Search                              = [[1;32m Disabled [m]
) else (
	echo    [7]   Windows Search                              = [[1;31m Enabled [m]
)

sc qc "WerSvc" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [8]   Disables windows error reporting            = [[1;32m Disabled [m]
) else (
	echo    [8]   Disables windows error reporting            = [[1;31m Enabled [m]
)

sc qc "LicenseManager" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [9]   LicenseManager                              = [[1;32m Disabled [m]
) else (
	echo    [9]   LicenseManager                              = [[1;31m Enabled [m]
)

sc qc "ndu" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [10]  Windows Network Data Usage Monitor          = [[1;32m Disabled [m]
) else (
	echo    [10]  Windows Network Data Usage Monitor          = [[1;31m Enabled [m]
)

sc qc "WPDBusEnum" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [11]  WPDBusEnum                                  = [[1;32m Disabled [m]
) else (
	echo    [11]  WPDBusEnum                                  = [[1;31m Enabled [m]
)

sc qc "diagnosticshub.standardcollector.service" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [12]  Diagnostics Hub Standard Collector Service  = [[1;32m Disabled [m]
) else (
	echo    [12]  Diagnostics Hub Standard Collector Service  = [[1;31m Enabled [m]
)

sc qc "wlpasvc" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [13]  Windows License Manager Service             = [[1;32m Disabled [m]
) else (
	echo    [13]  Windows License Manager Service             = [[1;31m Enabled [m]
)

sc qc "CryptSvc" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [14]  Cryptographic Services                      = [[1;32m Disabled [m]
) else (
	echo    [14]  Cryptographic Services                      = [[1;31m Enabled [m]
)

sc qc "gcs" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [15]  Google Update Service                       = [[1;32m Disabled [m]
) else (
	echo    [15]  Google Update Service                       = [[1;31m Enabled [m]
)

sc qc "LanmanServer" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [16]  Server servic, LanmanServer                 = [[1;32m Disabled [m]
) else (
	echo    [16]  Server service, LanmanServer                = [[1;31m Enabled [m]
)

sc qc "LanmanWorkstation" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [17]  Workstation service, LanmanWorkstation      = [[1;32m Disabled [m]
) else (
	echo    [17]  Workstation service, LanmanWorkstation      = [[1;31m Enabled [m]
)

sc qc "PhoneSvc" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [18]  Phone Service, PhoneSvc                     = [[1;32m Disabled [m]
) else (
	echo    [18]  Phone Service, PhoneSvc                     = [[1;31m Enabled [m]
)

sc qc "RasMan" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [19]  Remote Access Connection Manager, RasMan    = [[1;32m Disabled [m]
) else (
	echo    [19]  Remote Access Connection Manager, RasMan    = [[1;31m Enabled [m]
)

sc qc "Spooler" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [20]  Print Spooler, Spooler                      = [[1;32m Disabled [m]
) else (
	echo    [20]  Print Spooler, Spooler                      = [[1;31m Enabled [m]
)

:: Smartcard Service
sc qc "SCardSvr" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [21]  Smart Card, SCardSvr                        = [[1;32m Disabled [m]
) else (
	echo    [21]  Smart Card, SCardSvr                        = [[1;31m Enabled [m]
)


sc qc "GraphicsPerfSvc" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [22]  Graphics Performance Service                = [[1;32m Disabled [m]
) else (
	echo    [22]  Graphics Performance Service                = [[1;31m Enabled [m]
)


sc qc "embeddedmode" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [23]  Embedded Mode, embeddedmode                 = [[1;32m Disabled [m]
) else (
	echo    [23]  Embedded Mode, embeddedmode                 = [[1;31m Enabled [m]
)


sc qc "PeerDistSvc" | findstr /r "DISABLED" > nul 2>&1
if not %errorlevel% == 1 (
	echo    [24]  Peer Distribution Service PeerDistSvc       = [[1;32m Disabled [m]
) else (
	echo    [24]  Peer Distribution Service, PeerDistSvc      = [[1;31m Enabled [m]
)




echo    [25]  Apply all                                   = [[1;31m * [m]
echo.
echo    [0]   Return to menu
echo.
set /P N=Select your service and press Enter ^>


if %N%==1 (set serviceName="DiagTrack")
if %N%==2 (set serviceName="lfsvc")
if %N%==3 (set serviceName="MapsBroker")
if %N%==4 (set serviceName="wuauserv")
if %N%==5 (set serviceName="SharedAccess")
if %N%==6 (set serviceName="TrkWks")
if %N%==7 (set serviceName="WSearch")
if %N%==8 (set serviceName="WerSvc")
if %N%==9 (set serviceName="RemoteAccess")
if %N%==10 (set serviceName="ndu")
if %N%==11 (set serviceName="NetTcpPortSharing")
if %N%==12 (set serviceName="diagnosticshub.standardcollector.service")
if %N%==13 (set serviceName="wlpasvc")
if %N%==14 (set serviceName="CryptSvc")
if %N%==15 (set serviceName="gcs")
if %N%==16 (set serviceName="LanmanServer")
if %N%==17 (set serviceName="LanmanWorkstation")
if %N%==18 (set serviceName="PhoneSvc")
if %N%==19 (set serviceName="RasMan")
if %N%==20 (set serviceName="Spooler")
if %N%==21 (set serviceName="Smartcard")
if %N%==22 (set serviceName="GraphicsPerfSvc")
if %N%==23 (set serviceName="embeddedmode")
if %N%==24 (set serviceName="PeerDistSvc")


set services= PeerDistSvc embeddedmode GraphicsPerfSvc fhsvc Smartcard Spooler RasMan PhoneSvc LanmanWorkstation LanmanServer gcs CryptSvc wlpasvc DiagTrack lfsvc MapsBroker wuauserv SharedAccess TrkWks WSearch WerSvc RemoteAccess ndu NetTcpPortSharing diagnosticshub.standardcollector.service
set /A count=1

if %N%==25 (
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