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
echo    Using KMS38 signed XML
echo    -----------------------------------------------
echo.

echo    This offline activation method uses a signed XML compatible
echo    with the selected key, this method is known as KMS38 Activation,
echo    check the code to understand how it works. Be aware that although
echo    this method seems secure, the community does not know if it can 
echo    leave any vulnerability in the system.
echo.

::Get OS info
set powershell=%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe
for /f "usebackq delims=" %%a in (`%powershell% -Command "(Get-CimInstance Win32_OperatingSystem).Caption;"`) do Set version=%%a

:: Check licese status
for /f %%i in ('cscript //nologo "%systemroot%\system32\slmgr.vbs" /dli') do set licenseStatus=%%i

if not "%licenseStatus%"=="Error:" (
	echo    Windows Key Status  = [[1;32m Registered [m]
	echo    Windows Edition     = [ %version% ]
	goto LICENSED

) else (
	echo    Windows Key Status  = [[1;31m Unregistered [m]
	echo    Windows Edition     = [ %version% ]
	goto UNLICENSED
)

:: Start license status section
:LICENSED
echo.
set /P N=Select (Y)es and press enter to[1;31m remove [mthe actual key (Y/N) ^>
if %N%==N (goto INIT)
if %N%==n (goto INIT)
::Revert gpo
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform" /v NoGenTicket /t REG_DWORD /d 0 /f > nul 2>&1
cscript //nologo "%systemroot%\system32\slmgr.vbs" /upk > nul
goto WINDOWSACTIVATOR
:: End license status section

:: Start unlicense status section
:UNLICENSED
echo.
set /P N=Select (Y)es and press enter to [1;32mactivate[m Windows (Y/N) ^>
if %N%==N (goto INIT)
if %N%==n (goto INIT)

::🔑 Windows Home: TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
::🔑 Windows Home N: 3KHY7-WNT83-DGQKR-F7HPR-844BM
::🔑 Windows Home Single Language: 7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH
::🔑 Windows Home Country Specific: PVMJN-6DFY6-9CCP6-7BKTT-D3WVR

::🔑 Windows Professional: W269N-WFGWX-YVC9B-4J6C9-T83GX
::🔑 Windows Professional N: MH37W-N47XK-V7XM9-C7227-GCQG9
::🔑 Windows Professional Workstation: NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J

::🔑 Windows Enterprise: NPPR9-FWDCX-D2C8J-H872K-2YT43
::🔑 Windows Enterprise N: DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4
::🔑 Windows Enterprise 2015 LTSB: WNMTR-4C88C-JK8YV-HQ7T2-76DF9
::🔑 Windows Enterprise 2015 LTSB N: 2F77B-TNFGY-69QQF-B8YKP-D69TJ
::🔑 Windows Enterprise 2016 LTSB:  DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ
::🔑 Windows Enterprise 2016 LTSB N: QFFDN-GRT3P-VKWWX-X7T3R-8B639
::🔑 Windows Enterprise LTSC 2019: M7XTQ-FN8P6-TTKYV-9D4CC-J462D
::🔑 Windows Enterprise N LTSC 2019: 92NFX-8DJQP-P6BBQ-THF9C-7CG2H

::🔑 Windows Education: NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
::🔑 Windows Education N: 2WH4N-8QGBV-H22JP-CT43Q-MDWWJ

cls
echo.
echo    Deblo.bat -[1;36m Windows online activator [m
echo    Using KMS38 signed XML
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

cls
echo.
echo    Deblo.bat -[1;36m Windows online activator [m
echo    Using KMS38 signed XML
echo    -----------------------------------------------
echo.
echo    Working please wait...

::Ensure the GenuineTicket directory exists
if not exist "C:\ProgramData\Microsoft\Windows\ClipSVC\GenuineTicket\" (
    mkdir "C:\ProgramData\Microsoft\Windows\ClipSVC\GenuineTicket\"
)

::Copy the KMS activation XML file to the GenuineTicket directory
copy "%~dp0sources\kms.xml" "C:\ProgramData\Microsoft\Windows\ClipSVC\GenuineTicket\" > nul 2>&1

::Disable send data to microsoft
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform" /v NoGenTicket /t REG_DWORD /d 1 /f > nul 2>&1

cscript //nologo "%systemroot%\system32\slmgr.vbs" /ipk %key% > nul

::Update the licensing status
clipup -v -o > nul 2>&1

cls
echo.
echo    Deblo.bat -[1;36m Windows online activator [m
echo    Using KMS38 signed XML
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