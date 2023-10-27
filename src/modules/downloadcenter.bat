@echo off
title github.com/SegoCode
MODE 88,35
:: ----------------------------------------------------------
:: -----------------DOWNLOAD CENTER START--------------------
:: ----------------------------------------------------------
:DOWNLOADCENTER
cls
echo.
echo    Deblo.bat -[1;36m Download center [m
echo    Always latest version and oficial links
echo    -----------------------------------------------
echo.

ping -n 2 8.8.8.8 > nul
if not %errorlevel% == 1 (
	echo    Internet Status           = [[1;32m Online [m]
) else (
	echo    Internet Status           = [[1;31m Offline [m]
)
echo.

cd %~dp0

::TODO: Auto install and config firefox
if exist firefox-latest.exe (
	echo    [1] Mozilla Firefox       = [[1;32m %~dp0firefox-latest.exe [m]
) else (
	echo    [1] Mozilla Firefox       = [[1;32m Ready [m]
)

if exist brave-latest.exe (
	echo    [2] Chromium Brave        = [[1;32m %~dp0brave-latest.exe [m]
) else (
	echo    [2] Chromium Brave        = [[1;32m Ready [m]
)

if exist iridiumbrowser-latest.msi (
	echo    [3] Chromium iridium      = [[1;32m %~dp0iridiumbrowser-latest.msi [m]
) else (
	echo    [3] Chromium iridium      = [[1;32m Ready [m]
)

if exist SteamSetup.exe (
	echo    [4] Steam client          = [[1;32m %~dp0SteamSetup.exe [m]
) else (
	echo    [4] Steam client          = [[1;32m Ready [m]
)

if exist simplewallSetup.exe (
	echo    [5] Simplewall            = [[1;32m %~dp0simplewallSetup.exe [m]
) else (
	echo    [5] Simplewall            = [[1;32m Ready [m]
)

if exist qViewSetup.exe (
	echo    [6] qView                 = [[1;32m %~dp0qViewSetup.exe [m]
) else (
	echo    [6] qView                 = [[1;32m Ready [m]
)


if exist Battle.net-Setup.exe (
	echo    [7] Battle.net            = [[1;32m %~dp0Battle.net-Setup.exe [m]
) else (
	echo    [7] Battle.net            = [[1;32m Ready [m]
)

if exist VSCodeUserSetup-x64.exe (
	echo    [8] VSCode                = [[1;32m %~dp0VSCodeUserSetup-x64.exe [m]
) else (
	echo    [8] VSCode                = [[1;32m Ready [m]
)

if exist deluge-2.1.1-win64-setup.exe (
	echo    [9] Deluge                = [[1;32m %~dp0deluge-2.1.1-win64-setup.exe [m]
) else (
	echo    [9] Deluge                = [[1;32m Ready [m]
)

if exist FileConverter-setup.msi (
	echo    [10] FileConverter        = [[1;32m %~dp0FileConverter-setup.msi [m]
) else (
	echo    [10] FileConverter        = [[1;32m Ready [m]
)





echo.
echo    [0]  Return to menu

echo.

set /P N=Select your task and press Enter ^>

if %N%==1 (
	PowerShell -Command "Invoke-WebRequest -Uri 'https://download.mozilla.org/?product=firefox-latest-ssl&os=win64' -OutFile firefox-latest.exe" > nul 2>&1
)

if %N%==2 (
	PowerShell -Command "Invoke-WebRequest -Uri 'https://laptop-updates.brave.com/latest/winx64' -OutFile brave-latest.exe" > nul 2>&1
)

if %N%==3 (
	PowerShell -Command "Invoke-WebRequest -Uri 'https://downloads.iridiumbrowser.de/windows/iridiumbrowser-latest-x64.msi' -OutFile iridiumbrowser-latest.msi" > nul 2>&1
)

if %N%==4 (
	PowerShell -Command "Invoke-WebRequest -Uri 'https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe' -OutFile SteamSetup.exe" > nul 2>&1
)

if %N%==5 (
	PowerShell -Command "Invoke-WebRequest -Uri ((((Invoke-WebRequest -UseBasicParsing -Uri 'https://api.github.com/repos/henrypp/simplewall/releases/latest' | Select-Object).Content) | ConvertFrom-Json).assets[2].browser_download_url) -OutFile simplewallSetup.exe"
)

if %N%==6 (
	PowerShell -Command "Invoke-WebRequest -Uri ((((Invoke-WebRequest -UseBasicParsing -Uri 'https://api.github.com/repos/jurplel/qView/releases/latest' | Select-Object).Content) | ConvertFrom-Json).assets[5].browser_download_url) -OutFile qViewSetup.exe"
)

if %N%==7 (
	PowerShell -Command "Invoke-WebRequest -Uri 'https://eu.battle.net/download/getInstaller?os=win&installer=Battle.net-Setup.exe' -OutFile Battle.net-Setup.exe" > nul 2>&1
)

if %N%==8 (
	PowerShell -Command "Invoke-WebRequest -Uri 'https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user' -OutFile VSCodeUserSetup-x64.exe" > nul 2>&1
)

if %N%==9 (
    PowerShell -Command "Invoke-WebRequest -Uri 'https://www.fosshub.com/Deluge.html?dwl=deluge-2.1.1-win64-setup.exe' -OutFile deluge-2.1.1-win64-setup.exe"
)

if %N%==10 (
	PowerShell -Command "Invoke-WebRequest -Uri ((((Invoke-WebRequest -UseBasicParsing -Uri 'https://api.github.com/repos/Tichau/FileConverter/releases/latest' | Select-Object).Content) | ConvertFrom-Json).assets[5].browser_download_url) -OutFile  FileConverter-setup.msi"
)




if %N%==0 (goto INIT)
goto DOWNLOADCENTER

:: ----------------------------------------------------------
:: -------------------DOWNLOAD CENTER END--------------------
:: ----------------------------------------------------------

:INIT