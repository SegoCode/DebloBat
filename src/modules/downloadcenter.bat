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
	echo    Internet Status            = [[1;32m Online [m]
) else (
	echo    Internet Status            = [[1;31m Offline [m]
)
echo.

cd %~dp0

if exist firefox-latest.exe (
	echo    [1]  Mozilla Firefox       = [[1;32m 0e1621 [m]
) else (
	echo    [1]  Mozilla Firefox       = [[1;32m Download [m]
)

if exist vlc.exe (
	echo    [2]  VLC                   = [[1;32m Install [m]
) else (
	echo    [2]  VLC                   = [[1;32m Download [m]
)


if exist SteamSetup.exe (
	echo    [3]  Steam client          = [[1;32m Install [m]
) else (
	echo    [3]  Steam client          = [[1;32m Download [m]
)

if exist 7z-x64.exe (
	echo    [4]  7Zip                  = [[1;32m Install [m]
) else (
	echo    [4]  7Zip                  = [[1;32m Download [m]
)

if exist deluge-win64-setup.exe (
	echo    [5]  Deluge                = [[1;32m Install [m]
) else (
	echo    [5]  Deluge                = [[1;32m Download [m]
)

if exist DiscordSetup.exe (
    echo    [6]  Discord               = [[1;32m Install [m]
) else (
    echo    [6]  Discord               = [[1;32m Download [m]
)

if exist FileConverter-setup.msi (
    echo    [7]  FileConverter         = [[1;32m Install [m]
) else (
    echo    [7]  FileConverter         = [[1;32m Download [m]
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
        del firefox-latest.exe > nul 2>&1
        goto INSTALLCOMPLETED
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
        del vlc.exe > nul 2>&1
        goto INSTALLCOMPLETED
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
        del SteamSetup.exe > nul 2>&1
        goto INSTALLCOMPLETED
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
        del 7z-x64.exe > nul 2>&1
        goto INSTALLCOMPLETED
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
        del deluge-win64-setup.exe > nul 2>&1
        goto INSTALLCOMPLETED
    )

    where curl > nul 2>&1
    if %ERRORLEVEL% == 0 (
        curl -L "https://ftp.osuosl.org/pub/deluge/windows/deluge-2.1.1-win64-setup.exe" -o deluge-win64-setup.exe > nul 2>&1
    ) else (
        PowerShell -Command "Invoke-WebRequest -Uri 'https://ftp.osuosl.org/pub/deluge/windows/deluge-2.1.1-win64-setup.exe' -OutFile deluge-win64-setup.exe" > nul 2>&1
    )
)

if %N%==6 (
    if exist DiscordSetup.exe (
        DiscordSetup.exe -s > nul 2>&1
        del DiscordSetup.exe > nul 2>&1
        goto INSTALLCOMPLETED
    )

    where curl > nul 2>&1
    if %ERRORLEVEL% == 0 (
        curl -L "https://dl.discordapp.net/distro/app/stable/win/x86/1.0.9011/DiscordSetup.exe" -o DiscordSetup.exe > nul 2>&1
    ) else (
        PowerShell -Command "Invoke-WebRequest -Uri 'https://dl.discordapp.net/distro/app/stable/win/x86/1.0.9011/DiscordSetup.exe' -OutFile DiscordSetup.exe" > nul 2>&1
    )
)


if %N%==7 (
    if exist FileConverter-setup.msi (
        msiexec /i FileConverter-setup.msi /quiet /norestart
        del FileConverter-setup.msi > nul 2>&1
        goto INSTALLCOMPLETED
    )
    PowerShell -Command "Invoke-WebRequest -Uri ((((Invoke-WebRequest -UseBasicParsing -Uri 'https://api.github.com/repos/Tichau/FileConverter/releases/latest' | Select-Object).Content) | ConvertFrom-Json).assets[0].browser_download_url) -OutFile FileConverter-setup.msi" > nul 2>&1
)

endlocal
if %N%==0 (goto INIT)
goto DOWNLOADCENTER
:INSTALLCOMPLETED
cls
echo.
echo    Deblo.bat -[1;36m Download center [m
echo    Always latest version and oficial links
echo    -----------------------------------------------
echo.
echo    The software has been successfully installed
echo    Press enter to return to the menu
pause > nul 2>&1
goto DOWNLOADCENTER
:: ----------------------------------------------------------
:: -------------------DOWNLOAD CENTER END--------------------
:: ----------------------------------------------------------
:INIT
exit