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
echo    Always latest version and official links
echo    -----------------------------------------------
echo.
echo    This tool utilizes Scoop repositories to fetch the latest 
echo    versions of software. It won't install the software, 
echo    instead, it creates an installation folder on your 
echo    desktop where the downloads are saved. You can then 
echo    decide how to proceed with the installers. If you want 
echo    you can install scoop by typing "scoop" as input.
echo.
ping -n 2 8.8.8.8 > nul
if not %errorlevel% == 1 (
    echo    Internet Status              = [[1;32m Online [m]
) else (
    echo    Internet Status              = [[1;31m Offline [m]
)

where scoop >nul 2>nul
if %errorlevel% == 0 (
    echo    Scoop installation           = [[1;32m Enabled [m]
) else (
    echo    Scoop installation           = [[1;31m Disabled [m]
)

echo.
cd %~dp0
echo    [1]  Mozilla Firefox         = [[1;32m Download [m]
echo    [2]  VLC Media Player        = [[1;32m Download [m]
echo    [3]  7-Zip                   = [[1;32m Download [m]
echo    [4]  qBittorrent Enhanced    = [[1;32m Download [m]
echo    [5]  Steam                   = [[1;32m Download [m]
echo    [6]  Discord                 = [[1;32m Download [m]
echo    [7]  File Converter          = [[1;32m Download [m]
echo    [8]  Telegram                = [[1;32m Download [m]
echo    [9]  Spotify                 = [[1;32m Download [m]
echo    [10] SimpleWall              = [[1;32m Download [m]
echo    [11] Ungoogled Chromium      = [[1;32m Download [m]
echo    [12] Brave Browser           = [[1;32m Download [m]
echo    [13] qView                   = [[1;32m Download [m]
echo    [14] Sublime Text            = [[1;32m Download [m]
echo    [15] Flameshot               = [[1;32m Download [m]

echo.
echo    [0] Return to menu
echo.

set /P N=Select your task and press Enter ^>

setlocal
cls

powershell "Set-ExecutionPolicy Unrestricted -force 2>&1 | Out-Null" > nul 2>&1

if %N%==1 (
     powershell -File ".\utils\chibiScoop.ps1" -SoftwareName "firefox"
)
if %N%==2 (
     powershell -File ".\utils\chibiScoop.ps1" -SoftwareName "vlc"
)
if %N%==3 (
     powershell -File ".\utils\chibiScoop.ps1" -SoftwareName "7zip"
)
if %N%==4 (
    powershell -File ".\utils\chibiScoop.ps1" -SoftwareName "qbittorrent-enhanced"
)
if %N%==5 (
    powershell -File ".\utils\chibiScoop.ps1" -SoftwareName "steam"
)
if %N%==6 (
    powershell -File ".\utils\chibiScoop.ps1" -SoftwareName "discord"
)
if %N%==7 (
    powershell -File ".\utils\chibiScoop.ps1" -SoftwareName "file-converter"
)
if %N%==8 (
    powershell -File ".\utils\chibiScoop.ps1" -SoftwareName "telegram"
)
if %N%==9 (
    powershell -File ".\utils\chibiScoop.ps1" -SoftwareName "spotify"
)
if %N%==10 (
    powershell -File ".\utils\chibiScoop.ps1" -SoftwareName "simplewall"
)
if %N%==11 (
    powershell -File ".\utils\chibiScoop.ps1" -SoftwareName "ungoogled-chromium"
)
if %N%==12 (
    powershell -File ".\utils\chibiScoop.ps1" -SoftwareName "brave"
)
if %N%==13 (
    powershell -File ".\utils\chibiScoop.ps1" -SoftwareName "qview"
)
if %N%==14 (
    powershell -File ".\utils\chibiScoop.ps1" -SoftwareName "sublime-text"
)
if %N%==15 (
    powershell -File ".\utils\chibiScoop.ps1" -SoftwareName "flameshot"
)

if /i "%N%"=="scoop" (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "LongPathsEnabled" /t REG_DWORD /d 1 /f > nul 2>&1
    powershell -Command "Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression"
    pause  
)

if %N%==0 (goto EOF)
endlocal
goto DOWNLOADCENTER
:EOF
exit
