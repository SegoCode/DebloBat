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

if exist firefox-latest.exe (
	echo    [1]  Mozilla Firefox       = [[1;32m Ready to install [m]
) else (
	echo    [1]  Mozilla Firefox       = [[1;32m Ready to download [m]
)

if exist vlc.exe (
	echo    [2]  VLC                   = [[1;32m Ready to install [m]
) else (
	echo    [2]  VLC                   = [[1;32m Ready to download [m]
)


if exist SteamSetup.exe (
	echo    [3]  Steam client          = [[1;32m Ready to install [m]
) else (
	echo    [3]  Steam client          = [[1;32m Ready to download [m]
)

if exist 7z-x64.exe (
	echo    [4]  7Zip                  = [[1;32m Ready to install [m]
) else (
	echo    [4]  7Zip                  = [[1;32m Ready to download [m]
)

if exist deluge-win64-setup.exe (
	echo    [5]  Deluge                = [[1;32m Ready to install [m]
) else (
	echo    [5]  Deluge                = [[1;32m Ready to download [m]
)



echo.
echo    The downloads provided below do not come with an automatic installation process. 
echo    They are instead placed in the execution path, requiring the user to manually 
echo    execute them should they choose to continue with the installation. 
echo.


if exist simplewallSetup.exe (
	echo    [6] Simplewall            = [[1;32m %~dp0simplewallSetup.exe [m]
) else (
	echo    [6]  Simplewall            = [[1;32m Ready [m]
)

if exist qViewSetup.exe (
	echo    [7]  qView                 = [[1;32m %~dp0qViewSetup.exe [m]
) else (
	echo    [7]  qView                 = [[1;32m Ready [m]
)

if exist Battle.net-Setup.exe (
	echo    [8]  Battle.net            = [[1;32m %~dp0Battle.net-Setup.exe [m]
) else (
	echo    [8]  Battle.net            = [[1;32m Ready [m]
)

if exist VSCodeUserSetup-x64.exe (
	echo    [9]  VSCode                = [[1;32m %~dp0VSCodeUserSetup-x64.exe [m]
) else (
	echo    [9]  VSCode                = [[1;32m Ready [m]
)

if exist FileConverter-setup.msi (
	echo    [10] FileConverter         = [[1;32m %~dp0FileConverter-setup.msi [m]
) else (
	echo    [10] FileConverter         = [[1;32m Ready [m]
)


echo.
echo    [0]  Return to menu

echo.

set /P N=Select your task and press Enter ^>

cls
echo.
echo    Deblo.bat -[1;36m Download center [m
echo    Always latest version and oficial links
echo    -----------------------------------------------
echo.
echo    Loading, Please wait...   

setlocal
if %N%==1 (
	if exist firefox-latest.exe (
        firefox-latest.exe /S > nul 2>&1
        goto DOWNLOADCENTER
    )

    where curl > nul 2>&1
    if %ERRORLEVEL% == 0 (
        curl -L "https://download.mozilla.org/?product=firefox-latest-ssl&os=win64" -o firefox-latest.exe > nul 2>&1
    ) else (
        PowerShell -Command "Invoke-WebRequest -Uri 'https://download.mozilla.org/?product=firefox-latest-ssl&os=win64' -OutFile firefox-latest.exe" > nul 2>&1
    )
)

if %N%==2 (
    if exist vlc.exe (
        vlc.exe /S > nul 2>&1
        goto DOWNLOADCENTER
    )

    where curl > nul 2>&1
    if %ERRORLEVEL% == 0 (
        curl -L "https://mirrors.up.pt/pub/videolan/vlc/3.0.20/win64/vlc-3.0.20-win64.exe" -o vlc.exe > nul 2>&1
    ) else (
        PowerShell -Command "Invoke-WebRequest -Uri 'https://mirrors.up.pt/pub/videolan/vlc/3.0.20/win64/vlc-3.0.20-win64.exe' -OutFile vlc.exe" > nul 2>&1
    )
)

if %N%==3 (
    if exist SteamSetup.exe (
        SteamSetup.exe /S > nul 2>&1
        goto DOWNLOADCENTER
    )

    where curl > nul 2>&1
    if %ERRORLEVEL% == 0 (
        curl -L "https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe" -o SteamSetup.exe > nul 2>&1
    ) else (
        PowerShell -Command "Invoke-WebRequest -Uri 'https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe' -OutFile SteamSetup.exe" > nul 2>&1
    )
)

if %N%==4 (
    if exist 7z-x64.exe (
        7z-x64.exe /S > nul 2>&1
        goto DOWNLOADCENTER
    )

    where curl > nul 2>&1
    if %ERRORLEVEL% == 0 (
        curl -L "https://www.7-zip.org/a/7z2401-x64.exe" -o 7z-x64.exe > nul 2>&1
    ) else (
        PowerShell -Command "Invoke-WebRequest -Uri 'https://www.7-zip.org/a/7z2301-x64.exe' -OutFile 7z-x64.exe" > nul 2>&1
    )
)


if %N%==5 (
    if exist deluge-win64-setup.exe (
        deluge-win64-setup.exe /s > nul 2>&1
        goto DOWNLOADCENTER
    )

    where curl > nul 2>&1
    if %ERRORLEVEL% == 0 (
        curl -L "https://ftp.osuosl.org/pub/deluge/windows/deluge-2.1.1-win64-setup.exe" -o deluge-win64-setup.exe > nul 2>&1
    ) else (
        PowerShell -Command "Invoke-WebRequest -Uri 'https://ftp.osuosl.org/pub/deluge/windows/deluge-2.1.1-win64-setup.exe' -OutFile deluge-win64-setup.exe" > nul 2>&1
    )
)



if %N%==6 (
	PowerShell -Command "Invoke-WebRequest -Uri ((((Invoke-WebRequest -UseBasicParsing -Uri 'https://api.github.com/repos/henrypp/simplewall/releases/latest' | Select-Object).Content) | ConvertFrom-Json).assets[2].browser_download_url) -OutFile simplewallSetup.exe"
)

if %N%==7 (
	PowerShell -Command "Invoke-WebRequest -Uri ((((Invoke-WebRequest -UseBasicParsing -Uri 'https://api.github.com/repos/jurplel/qView/releases/latest' | Select-Object).Content) | ConvertFrom-Json).assets[5].browser_download_url) -OutFile qViewSetup.exe"
)

if %N%==8 (
	PowerShell -Command "Invoke-WebRequest -Uri 'https://eu.battle.net/download/getInstaller?os=win&installer=Battle.net-Setup.exe' -OutFile Battle.net-Setup.exe" > nul 2>&1
)

if %N%==9 (
	PowerShell -Command "Invoke-WebRequest -Uri 'https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user' -OutFile VSCodeUserSetup-x64.exe" > nul 2>&1
)

if %N%==10 (
	PowerShell -Command "Invoke-WebRequest -Uri ((((Invoke-WebRequest -UseBasicParsing -Uri 'https://api.github.com/repos/Tichau/FileConverter/releases/latest' | Select-Object).Content) | ConvertFrom-Json).assets[5].browser_download_url) -OutFile  FileConverter-setup.msi"
)

endlocal
if %N%==0 (goto INIT)
goto DOWNLOADCENTER

:: ----------------------------------------------------------
:: -------------------DOWNLOAD CENTER END--------------------
:: ----------------------------------------------------------
:INIT
exit