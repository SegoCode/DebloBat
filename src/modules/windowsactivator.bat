@echo off
title github.com/SegoCode
MODE 88,35
:: ----------------------------------------------------------
:: ----------------WINDOWS ONLINE ACTIVATOR------------------
:: ----------------------------------------------------------
:WINDOWSACTIVATOR
cls
echo.
echo    Deblo.bat -[1;36m Windows online activator [m
echo    Using KMS public servers
echo    -----------------------------------------------
echo.

echo    Using a KMS server to validate a fake Windows key constitutes piracy,
echo    which could compromise your system. Your computer will connect to a 
echo    potentially malicious server, sending telemetry about you. This action
echo    may also exploit vulnerabilities in your system if it is not properly 
echo    updated. Please consider these risks before proceeding.
echo.





:: Check internet connection
ping -n 2 8.8.8.8 > nul
if not %errorlevel% == 1 (
	echo    Internet Status  = [[1;32m Online [m]
) else (
	echo    Internet Status  = [[1;31m Offline [m]
)

::Get OS info
set powershell=%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe
for /f "usebackq delims=" %%a in (`%powershell% -Command "(Get-CimInstance Win32_OperatingSystem).Caption;"`) do Set version=%%a

:: Check licese status
for /f %%i in ('cscript //nologo "%systemroot%\system32\slmgr.vbs" /dli') do set licenseStatus=%%i

if not "%licenseStatus%"=="Error:" (
	echo    Windows  Status  = [[1;32m Licensed [m]
	echo    Windows  Edition = [ %version% ]
	goto LICENSED

) else (
	echo    Windows  Status  = [[1;31m Unlicensed [m]
	echo    Windows  Edition = [ %version% ]
	goto UNLICENSED
)

:: Start license status section
:LICENSED
echo.
set /P N=Select (Y)es and press enter to[1;31m remove [mthe actual license (Y/N) ^>
if %N%==N (goto INIT)
if %N%==n (goto INIT)
cscript //nologo "%systemroot%\system32\slmgr.vbs" /upk > nul
goto WINDOWSACTIVATOR
:: End license status section

:: Start unlicense status section
:UNLICENSED
echo.
set /P N=Select (Y)es and press enter to [1;32mactivate[m Windows (Y/N) ^>
if %N%==N (goto INIT)
if %N%==n (goto INIT)

::🔑 Windows 10 Home: TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
::🔑 Windows 10 Home N: 3KHY7-WNT83-DGQKR-F7HPR-844BM
::🔑 Windows 10 Home Single Language: 7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH
::🔑 Windows 10 Home Country Specific: PVMJN-6DFY6-9CCP6-7BKTT-D3WVR

::🔑 Windows 10 Professional: W269N-WFGWX-YVC9B-4J6C9-T83GX
::🔑 Windows 10 Professional N: MH37W-N47XK-V7XM9-C7227-GCQG9
::🔑 Windows 10 Professional Workstation: NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J

::🔑 Windows 10 Enterprise: NPPR9-FWDCX-D2C8J-H872K-2YT43
::🔑 Windows 10 Enterprise N: DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4
::🔑 Windows 10 Enterprise 2015 LTSB: WNMTR-4C88C-JK8YV-HQ7T2-76DF9
::🔑 Windows 10 Enterprise 2015 LTSB N: 2F77B-TNFGY-69QQF-B8YKP-D69TJ
::🔑 Windows 10 Enterprise 2016 LTSB:  DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ
::🔑 Windows 10 Enterprise 2016 LTSB N: QFFDN-GRT3P-VKWWX-X7T3R-8B639
::🔑 Windows 10 Enterprise LTSC 2019: M7XTQ-FN8P6-TTKYV-9D4CC-J462D
::🔑 Windows 10 Enterprise N LTSC 2019: 92NFX-8DJQP-P6BBQ-THF9C-7CG2H

::🔑 Windows 10 Education: NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
::🔑 Windows 10 Education N: 2WH4N-8QGBV-H22JP-CT43Q-MDWWJ

cls
echo.
echo    Deblo.bat -[1;36m Windows online activator [m
echo    Using KMS public servers
echo    -----------------------------------------------
echo.
echo    [1] [1;30m Windows Home[m
echo    [2] [1;30m Windows Home N[m
echo    [3] [1;30m Windows Home Single Language[m
echo    [4] [1;30m Windows Home Country Specific[m
echo    [5] [1;34m Windows Professional[m
echo    [6] [1;34m Windows Professional N[m
echo    [7] [1;34m Windows Professional Workstation[m
echo    [8] [1;35m Windows Enterprise[m
echo    [9] [1;35m Windows Enterprise N[m
echo    [10] [1;35mWindows Enterprise 2015 LTSB[m
echo    [11] [1;35mWindows Enterprise 2015 LTSB N[m
echo    [12] [1;35mWindows Enterprise 2016 LTSB[m
echo    [13] [1;35mWindows Enterprise 2016 LTSB N[m
echo    [14] [1;35mWindows Enterprise LTSC 2019[m
echo    [15] [1;35mWindows Enterprise N LTSC 2019[m
echo    [16] [1;33mWindows Education[m
echo    [17] [1;33mWindows Education N[m
echo.
set /P N=Select your windows and press Enter ^>
:: Generic Windows keys
if %N%==1 (set key=TX9XD-98N7V-6WMQ6-BX7FG-H8Q99)
if %N%==2 (set key=3KHY7-WNT83-DGQKR-F7HPR-844BM)
if %N%==3 (set key=7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH)
if %N%==4 (set key=PVMJN-6DFY6-9CCP6-7BKTT-D3WVR)
if %N%==5 (set key=W269N-WFGWX-YVC9B-4J6C9-T83GX)
if %N%==6 (set key=MH37W-N47XK-V7XM9-C7227-GCQG9)
if %N%==7 (set key=NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J)
if %N%==8 (set key=NPPR9-FWDCX-D2C8J-H872K-2YT43)
if %N%==9 (set key=DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4)
if %N%==10 (set key=WNMTR-4C88C-JK8YV-HQ7T2-76DF9)
if %N%==11 (set key=2F77B-TNFGY-69QQF-B8YKP-D69TJ)
if %N%==12 (set key=DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ)
if %N%==13 (set key=QFFDN-GRT3P-VKWWX-X7T3R-8B639)
if %N%==14 (set key=M7XTQ-FN8P6-TTKYV-9D4CC-J462D)
if %N%==15 (set key=92NFX-8DJQP-P6BBQ-THF9C-7CG2H)
if %N%==16 (set key=NW6C2-QMPVW-D7KKK-3GKT6-VCFB2)
if %N%==17 (set key=2WH4N-8QGBV-H22JP-CT43Q-MDWWJ)

::🔗 kms.loli.beer
::🔗 kms.digiboy.ir
::🔗 kms.library.hk
::🔗 kms.jm33.me
::🔗 kms.cangshui.net
::🔗 kms7.msguides.com
::🔗 kms8.msguides.com
::🔗 kms9.msguides.com
:MENUKMS
cls
echo.
echo    Deblo.bat -[1;36m Windows online activator [m
echo    Using KMS public servers
echo    -----------------------------------------------
echo.
echo    [1]  kms.loli.beer
echo    [2]  kms.digiboy.ir
echo    [3]  kms.library.hk
echo    [4]  kms.jm33.me
echo    [5]  kms.cangshui.net
echo    [6]  kms7.msguides.com
echo    [7]  kms8.msguides.com
echo    [8]  kms9.msguides.com
echo.
set /P N=Select your KMS server and press Enter ^>

if %N%==1 (set serverKms=kms.loli.beer)
if %N%==2 (set serverKms=kms.digiboy.ir)
if %N%==3 (set serverKms=kms.library.hk)
if %N%==4 (set serverKms=kms.jm33.me)
if %N%==5 (set serverKms=kms.cangshui.net)
if %N%==6 (set serverKms=kms7.msguides.com)
if %N%==7 (set serverKms=kms8.msguides.com)
if %N%==8 (set serverKms=kms9.msguides.com)

cls
echo.
echo    Deblo.bat -[1;36m Windows online activator [m
echo    Using KMS public servers
echo    -----------------------------------------------
echo.
echo    Working please wait...
 
cscript //nologo "%systemroot%\system32\slmgr.vbs" /ipk %key% > nul
cscript //nologo "%systemroot%\system32\slmgr.vbs" /skms %serverKms% > nul
cscript //nologo "%systemroot%\system32\slmgr.vbs" /ato > nul
move /Y "C:\Windows\System32\LicensingUI.exe" "C:\Windows\System32\LicensingUI.exe_backup" > nul 2>&1
cls
echo.
echo    Deblo.bat -[1;36m Windows online activator [m
echo    Using KMS public servers
echo    -----------------------------------------------
echo.

:: Check licese status
for /f %%i in ('cscript //nologo "%systemroot%\system32\slmgr.vbs" /dli') do set licenseStatus=%%i
if not "%licenseStatus%"=="Error:" (
	echo    Your Windows status changed to[1;32m licensed [msuccessfully, press any key to continue
) else (
	echo    [1;31m Error found[m, did you select the correct Windows edition?
)
pause > nul
goto WINDOWSACTIVATOR
:: ----------------------------------------------------------
:: --------------END WINDOWS ONLINE ACTIVATOR----------------
:: ----------------------------------------------------------
:INIT
exit