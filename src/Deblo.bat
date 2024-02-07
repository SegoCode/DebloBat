@echo off
title github.com/SegoCode
MODE 88,35
set logo1=  [48;5;202m  [48;5;202m  [48;5;202m  [48;5;202m  [48;5;202m  [48;5;202m  [m  [48;5;41m  [48;5;41m  [48;5;41m  [48;5;41m  [48;5;41m  [48;5;41m  [m
set logo2=  [48;5;32m  [48;5;32m  [48;5;32m  [48;5;32m  [48;5;32m  [48;5;32m  [m  [48;5;220m  [48;5;220m  [48;5;220m  [48;5;220m  [48;5;220m  [48;5;220m  [m
set powershell=%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe
set "POWERSHELL_CMD=powershell.exe -ExecutionPolicy Bypass -File .\launcher.ps1 -batchFilePath"

:: ----------------------------------------------------------
:: ---------------GET SYSTEM INFORMATION START---------------
:: ----------------------------------------------------------
cls
echo.
set white=[0m
set blue=[96m
set -=%blue%-%white%
echo %blue%      ,-----.     ____       _     _       _           _
echo %blue%     / ,---. \   ^|  _ \  ___^| ^|__ ^| ^| ___ ^| ^|__   __ _^| ^|_
echo %blue%    / /     \ \  ^| ^| ^| ^|/ _ ^| '_ \^| ^|/ _ \^| '_ \ / _` ^| __^|
echo %blue%    \ \     / /  ^| ^|_^| ^|  __^| ^|_) ^| ^| (_) ^| ^|_) ^| (_^| ^| ^|_
echo %blue%     \ `---' /   ^|____/ \___^|_.__/^|_^|\___/^|_.__/ \__,_^|\__^|
echo %blue%      `-----'
echo %white%   --------------------------------------------------------
echo.

echo    Loading, Please wait...  = [[1;31m 1/7 [m]

:: Windows version
for /f "usebackq delims=" %%a in (`%powershell% -Command "(Get-CimInstance Win32_OperatingSystem).Caption;"`) do Set version=%%a
for /f "usebackq delims=" %%a in (`%powershell% -Command "(Get-CimInstance Win32_OperatingSystem).OSArchitecture;"`) do Set bits=%%a
for /f "usebackq delims=" %%a in (`%powershell% -Command "(Get-CimInstance  Win32_OperatingSystem).Version;"`) do Set kernel=%%a

echo    Loading, Please wait...  = [[1;31m 2/7 [m]

::CPU
for /f "usebackq delims=" %%a in (`%powershell% -Command "(((Get-CimInstance Win32_Processor).Name) -replace '\s+', ' ');"`) do Set cpu=%%a

echo    Loading, Please wait...  = [[1;31m 3/7 [m]

::GPU
for /f "usebackq delims=" %%a in (`%powershell% -Command "(Get-CimInstance Win32_DisplayConfiguration).DeviceName;"`) do Set gpu=%%a

echo    Loading, Please wait...  = [[1;31m 4/7 [m]

::Board
for /f "usebackq delims=" %%a in (`%powershell% -Command "(Get-CimInstance Win32_BaseBoard | Select-Object Manufacturer, Product).Product;"`) do Set moboP=%%a
for /f "usebackq delims=" %%a in (`%powershell% -Command "(Get-CimInstance Win32_BaseBoard | Select-Object Manufacturer, Product).Manufacturer;"`) do Set moboM=%%a

echo    Loading, Please wait...  = [[1;31m 5/7 [m]

::Names
for /f "usebackq delims=" %%a in (`%powershell% -Command "[System.Net.Dns]::GetHostName();"`) do Set userinfo=%%a
for /f "usebackq delims=" %%a in (`%powershell% -Command "$env:USERNAME"`) do Set username=%%a

echo    Loading, Please wait...  = [[1;31m 6/7 [m]

::Screen
for /f "usebackq delims=" %%a in (`%powershell% -Command "(Get-WmiObject -Class Win32_VideoController).CurrentRefreshRate"`) do Set hz=%%a
for /f "usebackq delims=" %%a in (`%powershell% -Command "(Get-WmiObject -Class Win32_VideoController).CurrentHorizontalResolution"`) do Set hozrs=%%a
for /f "usebackq delims=" %%a in (`%powershell% -Command "(Get-WmiObject -Class Win32_VideoController).CurrentVerticalResolution"`) do Set verrs=%%a

echo    Loading, Please wait...  = [[1;31m 7/7 [m]

:: UpTime
for /f %%a in ('WMIC OS GET lastbootuptime ^| find "."') DO set DTS=%%a
set boot=%DTS:~0,4%-%DTS:~4,2%-%DTS:~6,2%  %DTS:~8,2%:%DTS:~10,2%
:: ----------------------------------------------------------
:: ----------------GET SYSTEM INFORMATION END----------------
:: ----------------------------------------------------------

:: ----------------------------------------------------------
:: ----------------------MAIN MENU START---------------------
:: ----------------------------------------------------------
:INIT
cd %~dp0
cls
echo.
set white=[0m
set blue=[96m
set -=%blue%-%white%
echo %blue%      ,-----.     ____       _     _       _           _
echo %blue%     / ,---. \   ^|  _ \  ___^| ^|__ ^| ^| ___ ^| ^|__   __ _^| ^|_
echo %blue%    / /     \ \  ^| ^| ^| ^|/ _ ^| '_ \^| ^|/ _ \^| '_ \ / _` ^| __^|
echo %blue%    \ \     / /  ^| ^|_^| ^|  __^| ^|_) ^| ^| (_) ^| ^|_) ^| (_^| ^| ^|_
echo %blue%     \ `---' /   ^|____/ \___^|_.__/^|_^|\___/^|_.__/ \__,_^|\__^|
echo %blue%      `-----'
echo %white%   --------------------------------------------------------
echo.
echo.
echo    [1]  Essential Privacy Local Group Policy
echo    [2]  Optional Local Group Policy
echo    [3]  Windows Tasks
echo    [4]  Windows Services
echo    [5]  QoL Customizations
echo    [6]  Windows online activator
echo    [7]  Domain Blocker
echo    [8]  Download center
echo    [9]  System information
echo.
echo    [10] System reboot
echo    [11] Report an error or suggestion
echo    [12] Github
echo    [13] Exit
echo.

set /P N=Select your option and press Enter ^>
if %N%==1 (%POWERSHELL_CMD% ".\modules\localgroup.bat")
if %N%==2 (%POWERSHELL_CMD% ".\modules\otherlocalgroup.bat")
if %N%==3 (%POWERSHELL_CMD% ".\modules\taskscheduler.bat")
if %N%==4 (%POWERSHELL_CMD% ".\modules\services.bat")
if %N%==5 (%POWERSHELL_CMD% ".\modules\qolconfig.bat")
if %N%==6 (%POWERSHELL_CMD% ".\modules\windowsactivator.bat")
if %N%==7 (%POWERSHELL_CMD% ".\modules\blockhosts.bat")
if %N%==8 (%POWERSHELL_CMD% ".\modules\downloadcenter.bat")
if %N%==9 (goto SYSINFO)
if %N%==10 (shutdown /r /t 0)
if %N%==11 (start https://github.com/SegoCode/DebloBat/issues)
if %N%==12 (start https://github.com/SegoCode/DebloBat)
if %N%==13 (exit)
else (
	goto INIT
)

:: ----------------------------------------------------------
:: -----------------------MAIN MENU END----------------------
:: ----------------------------------------------------------

:: ----------------------------------------------------------
:: -------------SYSTEM SHOW INFORMATION START----------------
:: ----------------------------------------------------------
:SYSINFO
cls
echo.
echo    Deblo.bat -[1;36m System information [m
echo    Yet another (and not than ugly) Screenfetch. 
echo    -----------------------------------------------
echo  [m 
echo  %logo1%      [1;34m%username%[m@[1;34m%userinfo%[m        
echo  %logo1%      ---------------------
echo  %logo1%      [1;34mOS[m: %version% %bits%
echo  %logo1%      [1;34mKernel[m: %kernel%
echo  %logo1%      [1;34mCPU[m: %cpu% 
echo [m                                   [1;34mMotherboard[m: %moboM% %moboP% 
echo  %logo2%	   [1;34mGPU[m: %gpu%
echo  %logo2%      [1;34mResolution[m: %hozrs% x %verrs% (%hz% Hz)
echo  %logo2%      [1;34mBoot[m: %boot%
echo  %logo2%      
echo  %logo2%      Press any key for return to menu . . . 
pause > nul
goto INIT
:: ----------------------------------------------------------
:: --------------SYSTEM SHOW INFORMATION END-----------------
:: ----------------------------------------------------------

:: ----------------------------------------------------------
:: --------------------DEBLOBAT SCRIPT END-------------------
:: ----------------------------------------------------------
