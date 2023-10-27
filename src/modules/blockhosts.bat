@echo off
title github.com/SegoCode
MODE 88,35
:: ----------------------------------------------------------
:: ---------------------HOSTS BLOCK END----------------------
:: ----------------------------------------------------------
:BLOCKHOSTS
cls
echo.
echo    Deblo.bat -[1;36m Domain Blocker [m
echo    Powered by oisd.nl, WindowsSpyBlocker and StevenBlack/hosts
echo    -----------------------------------------------
echo.

echo    Using windows hosts file create a list of domains that serve ads,
echo    tracking scripts and malware from multiple reputable sources and
echo    creates protection packs that prevents your system from connecting
echo    to them. Only one can be activated simultaneously.
echo.
:: Check internet connection
ping -n 2 8.8.8.8 > nul
if not %errorlevel% == 1 (
	echo    Internet Status                                   = [[1;32m Online [m]
) else (
	echo    Internet Status                                   = [[1;31m Offline [m]
)
echo.
findstr /r "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts" %SystemRoot%\System32\Drivers\etc\hosts > nul 2>&1
if not %errorlevel% == 1 (
	echo    [1]  StevenBlack/hosts, adware, malware           = [[1;32m Enabled [m]
) else (
	echo    [1]  StevenBlack/hosts, adware, malware           = [[1;30m Disabled [m]
)

findstr /r "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts" %SystemRoot%\System32\Drivers\etc\hosts > nul 2>&1
if not %errorlevel% == 1 (
	echo    [2]  StevenBlack/hosts, fakenews, gambling, porn  = [[1;32m Enabled [m]
) else (
	echo    [2]  StevenBlack/hosts, fakenews, gambling, porn  = [[1;30m Disabled [m]
)

findstr /r "bad-hosts" %SystemRoot%\System32\Drivers\etc\hosts > nul 2>&1
if not %errorlevel% == 1 (
	echo    [3]  bad-hosts, blocking ads, malware             = [[1;32m Enabled [m]
) else (
	echo    [3]  bad-hosts, blocking ads, malware             = [[1;30m Disabled [m]
)

findstr /r "30B31BDA" %SystemRoot%\System32\Drivers\etc\hosts > nul 2>&1
if not %errorlevel% == 1 (
	echo    [4]  Threat-Intel malware domains list            = [[1;32m Enabled [m]
) else (
	echo    [4]  Threat-Intel malware domains list            = [[1;30m Disabled [m]
)

findstr /r "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/porn/hosts" %SystemRoot%\System32\Drivers\etc\hosts > nul 2>&1
if not %errorlevel% == 1 (
	echo    [5]  StevenBlack/hosts porn domains list          = [[1;32m Enabled [m]
) else (
	echo    [5]  StevenBlack/hosts porn domains list          = [[1;30m Disabled [m]
)

findstr /r "WindowsSpyBlocker" %SystemRoot%\System32\Drivers\etc\hosts > nul 2>&1
if not %errorlevel% == 1 (
	echo    [6]  WindowsSpyBlocker, Just block spy            = [[1;32m Enabled [m]
) else (
	echo    [6]  WindowsSpyBlocker, Just block spy            = [[1;30m Disabled [m]
)

findstr /r "https://oisd.nl" %SystemRoot%\System32\Drivers\etc\hosts > nul 2>&1
if not %errorlevel% == 1 (
	echo    [7]  oisd.nl, basic list to work for everyone     = [[1;32m Enabled [m]
) else (
	echo    [7]  oisd.nl, basic list to work for everyone     = [[1;30m Disabled [m]
)


echo    [8]  Disable all                                  = [[1;31m * [m]
echo.
echo    [0]  Return to menu

echo.

set /P N=Select your task and press Enter ^>

if %N%==1 (set url="https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts")
if %N%==2 (set url="https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts")
if %N%==3 (set url="https://raw.githubusercontent.com/cenk/bad-hosts/main/hosts")
if %N%==4 (set url="https://raw.githubusercontent.com/davidonzo/Threat-Intel/master/lists/latestdomains.piHole.txt")
if %N%==5 (set url="https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/porn/hosts")
if %N%==6 (set url="https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt")
if %N%==7 (set url="https://hosts.oisd.nl/basic/")
if %N%==8 (set url="")
if %N%==0 (goto INIT)


cd %~dp0
PowerShell -Command "Invoke-WebRequest -Uri %url% -OutFile hosts" > nul 2>&1
del %SystemRoot%\System32\Drivers\etc\hosts /f > nul 2>&1
move hosts %SystemRoot%\System32\Drivers\etc\ > nul 2>&1

goto BLOCKHOSTS

:: ----------------------------------------------------------
:: ---------------------HOSTS BLOCK END----------------------
:: ----------------------------------------------------------
:INIT