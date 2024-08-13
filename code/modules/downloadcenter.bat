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
echo    versions of software. 
echo.
echo    If scoop are [1;32menabled[m it will install the software
echo    using scoop. You can install scoop by typing "[1;35mscoop[m" 
echo    as input. If are [1;31mdisabled[m, it creates an installation 
echo    folder on your desktop with the software files. For more
echo    info type "[1;35mhelp[m" 

call utils\RefreshEnv.cmd > nul 2>&1

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
    set "scoopInstalled=true"
) else (
    echo    Scoop installation           = [[1;31m Disabled [m]
    set "scoopInstalled=false"
)

echo.
cd %~dp0

powershell -Command "scoop which librewolf" >nul 2>&1
if %ERRORLEVEL% == 0 (
    echo    [1]  Librewolf               = [[1;42m Installed [m]
) else (
    if "%scoopInstalled%"=="true" (
        echo    [1]  Librewolf               = [[1;32m Install with scoop [m]
    ) else (
        echo    [1]  Librewolf               = [[1;32m Download in desktop [m]
    )
)

powershell -Command "scoop which vlc" >nul 2>&1
if %ERRORLEVEL% == 0 (
    echo    [2]  VLC Media Player        = [[1;42m Installed [m]
) else (
    if "%scoopInstalled%"=="true" (
        echo    [2]  VLC Media Player        = [[1;32m Install with scoop [m]
    ) else (
        echo    [2]  VLC Media Player        = [[1;32m Download in desktop [m]
    )
)

powershell -Command "scoop which qview" >nul 2>&1
if %ERRORLEVEL% == 0 (
    echo    [3]  qview                   = [[1;42m Installed [m]
) else (
    if "%scoopInstalled%"=="true" (
        echo    [3]  qview                   = [[1;32m Install with scoop [m]
    ) else (
        echo    [3]  qview                   = [[1;32m Download in desktop [m]
    )
)


powershell -Command "scoop which qbittorrent" >nul 2>&1
if %ERRORLEVEL% == 0 (
    echo    [4]  qBittorrent Enhanced    = [[1;42m Installed [m]
) else (
    if "%scoopInstalled%"=="true" (
        echo    [4]  qBittorrent Enhanced    = [[1;32m Install with scoop [m]
    ) else (
        echo    [4]  qBittorrent Enhanced    = [[1;32m Download in desktop [m]
    )
)

powershell -Command "scoop which telegram" >nul 2>&1
if %ERRORLEVEL% == 0 (
    echo    [5]  telegram                = [[1;42m Installed [m]
) else (
    if "%scoopInstalled%"=="true" (
        echo    [5]  telegram                = [[1;32m Install with scoop [m]
    ) else (
        echo    [5]  telegram                = [[1;32m Download in desktop [m]
    )
)

powershell -Command "scoop which subl" >nul 2>&1
if %ERRORLEVEL% == 0 (
    echo    [6]  sublime-text            = [[1;42m Installed [m]
) else (
    if "%scoopInstalled%"=="true" (
        echo    [6]  sublime-text            = [[1;32m Install with scoop [m]
    ) else (
        echo    [6]  sublime-text            = [[1;32m Download in desktop [m]
    )
)


powershell -Command "scoop which simplewall" >nul 2>&1
if %ERRORLEVEL% == 0 (
    echo    [7]  simplewall              = [[1;42m Installed [m]
) else (
    if "%scoopInstalled%"=="true" (
        echo    [7]  simplewall              = [[1;32m Install with scoop [m]
    ) else (
        echo    [7]  simplewall              = [[1;32m Download in desktop [m]
    )
)

powershell -Command "scoop which flameshot" >nul 2>&1
if %ERRORLEVEL% == 0 (
    echo    [8]  flameshot               = [[1;42m Installed [m]
) else (
    if "%scoopInstalled%"=="true" (
        echo    [8]  flameshot               = [[1;32m Install with scoop [m]
    ) else (
        echo    [8]  flameshot               = [[1;32m Download in desktop [m]
    )
)


powershell -Command "scoop which brave" >nul 2>&1
if %ERRORLEVEL% == 0 (
    echo    [9]  Brave                   = [[1;42m Installed [m]
) else (
    if "%scoopInstalled%"=="true" (
        echo    [9]  Brave                   = [[1;32m Install with scoop [m]
    ) else (
        echo    [9]  Brave                   = [[1;32m Download in desktop [m]
    )
)

powershell -Command "scoop which java" >nul 2>&1
if %ERRORLEVEL% == 0 (
    echo    [10] java                    = [[1;42m Installed [m]
) else (
    if "%scoopInstalled%"=="true" (
        echo    [10] java                    = [[1;32m Install with scoop [m]
    ) else (
        echo    [10] java                    = [[1;32m Download in desktop [m]
    )
)

echo    [11] Steam                   = [[1;32m Download in desktop [m]

echo.
echo    [0] Return to menu
echo.

set /P N=Select your task and press Enter ^>

setlocal
cls

if %N%==1 (
    if "%scoopInstalled%"=="true" (
        powershell -Command "scoop install extras/librewolf"
    ) else (
        powershell -File ".\utils\chibiScoop.ps1" -SoftwareName "librewolf"
    )
)

if %N%==2 (
    if "%scoopInstalled%"=="true" (
        powershell -Command "scoop install extras/vlc"
    ) else (
        powershell -File ".\utils\chibiScoop.ps1" -SoftwareName "vlc"
    )
)

if %N%==3 (
    if "%scoopInstalled%"=="true" (
        powershell -Command "scoop install extras/qview"
    ) else (
        powershell -File ".\utils\chibiScoop.ps1" -SoftwareName "qview"
    )
)

if %N%==4 (
    if "%scoopInstalled%"=="true" (
        powershell -Command "scoop install extras/qbittorrent-enhanced"
    ) else (
        powershell -File ".\utils\chibiScoop.ps1" -SoftwareName "qbittorrent-enhanced"
    )
)

if %N%==5 (
    if "%scoopInstalled%"=="true" (
        powershell -Command "scoop install extras/telegram"
    ) else (
        powershell -File ".\utils\chibiScoop.ps1" -SoftwareName "telegram"
    )
)

if %N%==6 (
    if "%scoopInstalled%"=="true" (
        powershell -Command "scoop install extras/sublime-text"
    ) else (
        powershell -File ".\utils\chibiScoop.ps1" -SoftwareName "sublime-text"
    )
)


if %N%==7 (
    if "%scoopInstalled%"=="true" (
        powershell -Command "scoop install extras/simplewall"
    ) else (
        powershell -File ".\utils\chibiScoop.ps1" -SoftwareName "simplewall"
    )
)


if %N%==8 (
    if "%scoopInstalled%"=="true" (
        powershell -Command "scoop install extras/flameshot"
    ) else (
        powershell -File ".\utils\chibiScoop.ps1" -SoftwareName "flameshot"
    )
)

if %N%==9 (
    if "%scoopInstalled%"=="true" (
        powershell -Command "scoop install extras/brave"
    ) else (
        powershell -File ".\utils\chibiScoop.ps1" -SoftwareName "brave"
    )
)

if %N%==10 (
    if "%scoopInstalled%"=="true" (
        powershell -Command "scoop install java/temurin-jdk"
    ) else (
        powershell -File ".\utils\chibiScoop.ps1" -SoftwareName "java"
    )
)

if %N%==11 (
    powershell -File ".\utils\chibiScoop.ps1" -SoftwareName "steam"
)


if /i "%N%"=="scoop" (
    powershell -Command "Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression"  
    call utils\RefreshEnv.cmd
    echo.

    powershell -Command "scoop install main/7zip" 
    call utils\RefreshEnv.cmd
    echo.

    powershell -Command "scoop install main/git" 
    call utils\RefreshEnv.cmd
    echo.

    powershell -Command "scoop install main/innounp" 
    call utils\RefreshEnv.cmd
    echo.

    powershell -Command "scoop install main/wixtoolset" 
    call utils\RefreshEnv.cmd
    echo.

    powershell -Command "scoop bucket add extras" 
    call utils\RefreshEnv.cmd
    echo.

    powershell -Command "scoop bucket add java" 
    call utils\RefreshEnv.cmd
    echo.

    echo Scoop and the software required for its operation installed, check the log before proceeding. 
)

if /i "%N%"=="help" (
    start https://scoop.sh/
)

if %N%==0 (goto EOF)
echo.
pause
endlocal
goto DOWNLOADCENTER
:EOF
exit
