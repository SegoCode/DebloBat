<# : batch portion
@echo off
setlocal EnableDelayedExpansion
:: Here we check if the script was run with TrustedInstaller privileges already
whoami | findstr /i "nt authority\system" >nul
if errorlevel 1 (
	cls
	echo Deblo.bat -[1;36m Windows UAC [m
	echo Deblobat will run in a new window with elevated privileges.
	echo -----------------------------------------------
	echo.
	echo This script requires TrustedInstaller privileges!
    echo Elevating to TrustedInstaller...
    goto RunAsTI-Elevate
    :: goto INIT
    exit /b
)
:: ----------------------------------------------------------
:: ----------------------DEBLOBAT SCRIPT---------------------
:: ----------------------------------------------------------

title github.com/SegoCode
PowerShell -Command "& {Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force}"
MODE 88,35
set logo1=  [48;5;202m  [48;5;202m  [48;5;202m  [48;5;202m  [48;5;202m  [48;5;202m  [m  [48;5;41m  [48;5;41m  [48;5;41m  [48;5;41m  [48;5;41m  [48;5;41m  [m
set logo2=  [48;5;32m  [48;5;32m  [48;5;32m  [48;5;32m  [48;5;32m  [48;5;32m  [m  [48;5;220m  [48;5;220m  [48;5;220m  [48;5;220m  [48;5;220m  [48;5;220m  [m

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

set powershell=%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe
set "output="
for /F "delims=" %%A in ('whoami') do set "output=!output!%%A\n"

echo    Working as: %blue%%output%[m
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
echo    [1]  Privacy Local Group Policy
echo    [2]  Other Local Group Policy
echo    [3]  Windows Tasks
echo    [4]  Windows Services
echo    [5]  QoL Customizations
echo    [6]  Non-Restorable Scripts
echo    [7]  Windows online activator
echo    [8]  Domain Blocker
echo    [9]  Download center
echo    [10] System information
echo.
echo    [11] System reboot
echo    [12] Report an error or suggestion
echo    [13] Github
echo    [14] Exit
echo.

set /P N=Select your option and press Enter ^>
if %N%==1 (CALL .\modules\localgroup.bat)
if %N%==2 (CALL .\modules\otherlocalgroup.bat)
if %N%==3 (CALL .\modules\taskscheduler.bat)
if %N%==4 (CALL .\modules\services.bat)
if %N%==5 (CALL .\modules\qolconfig.bat)
if %N%==6 (CALL .\modules\permanentconfig.bat)
if %N%==7 (CALL .\modules\windowsactivator.bat)
if %N%==8 (CALL .\modules\blockhosts.bat)
if %N%==9 (CALL .\modules\downloadcenter.bat)
if %N%==10 (goto SYSINFO)
if %N%==11 (shutdown /r /t 0)
if %N%==12 (start https://github.com/SegoCode/DebloBat/issues)
if %N%==13 (start https://github.com/SegoCode/DebloBat)
if %N%==14 (exit)
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

:RunAsTI-Elevate
if "%~1" == "" (
	set program_path=%~dp0%~nx0
	if "!program_path!" == "" echo error: failed && timeout /t 3 > nul & if "!run_by!" == "cmd" (pause & exit) else (exit /b 1)
	if exist "!program_path!\*" echo error: !program_path! is a folder & if "!run_by!" == "cmd" (pause & exit) else (exit /b 1)

	if exist !program_path! (
		call :RunAsTI !program_path!
		if "!run_by!" == "cmd" (exit) else (exit /b)
	) else (
		where !program_path! > nul 2>&1
		if !errorlevel! == 0 (
			call :RunAsTI !program_path!
			if "!run_by!" == "cmd" (exit) else (exit /b)
		)
	)
	echo error: failed
	if "!run_by!" == "cmd" (pause & exit) else (exit /b 1)
)

call :RunAsTI %*
exit /b

:RunAsTI-Declined
echo]
echo Self-elevation to TrustedInstaller failed, because the UAC prompt was declined.
echo Selecting 'Yes' to the UAC prompt is required for this script.
echo]
echo Press any key to attempt to elevate again...
pause > nul
goto RunAsTI-Elevate


:RunAsTI
set ^ #=& set "0=%~f0"& set 1=%*
(for %%I in ("%~f0";%*) do @echo(%%~I) | PowerShell -NoProfile -Command "$argv = $input | ?{$_}; iex (${%~f0} | out-string)"
set RunAsTI_Errorlevel=%errorlevel%
if %RunAsTI_Errorlevel% == 1 (
	goto RunAsTI-Declined
) else (
	if %RunAsTI_Errorlevel%==2 (
		goto RunAsTI-Declined
	) else (
		exit /b
	)
)
: end batch / begin powershell #>

Try {
function RunAsTI ($cmd,$arg) { $id='RunAsTI'; $key="Registry::HKU\$(((whoami /user)-split' ')[-1])\Volatile Environment"; $code=@'
 $I=[int32]; $M=$I.module.gettype("System.Runtime.Interop`Services.Mar`shal"); $P=$I.module.gettype("System.Int`Ptr"); $S=[string]
 $D=@(); $T=@(); $DM=[AppDomain]::CurrentDomain."DefineDynami`cAssembly"(1,1)."DefineDynami`cModule"(1); $Z=[uintptr]::size
 0..5|% {$D += $DM."Defin`eType"("AveYo_$_",1179913,[ValueType])}; $D += [uintptr]; 4..6|% {$D += $D[$_]."MakeByR`efType"()}
 $F='kernel','advapi','advapi', ($S,$S,$I,$I,$I,$I,$I,$S,$D[7],$D[8]), ([uintptr],$S,$I,$I,$D[9]),([uintptr],$S,$I,$I,[byte[]],$I)
 0..2|% {$9=$D[0]."DefinePInvok`eMethod"(('CreateProcess','RegOpenKeyEx','RegSetValueEx')[$_],$F[$_]+'32',8214,1,$S,$F[$_+3],1,4)}
 $DF=($P,$I,$P),($I,$I,$I,$I,$P,$D[1]),($I,$S,$S,$S,$I,$I,$I,$I,$I,$I,$I,$I,[int16],[int16],$P,$P,$P,$P),($D[3],$P),($P,$P,$I,$I)
 1..5|% {$k=$_; $n=1; $DF[$_-1]|% {$9=$D[$k]."Defin`eField"('f' + $n++, $_, 6)}}; 0..5|% {$T += $D[$_]."Creat`eType"()}
 0..5|% {nv "A$_" ([Activator]::CreateInstance($T[$_])) -fo}; function F ($1,$2) {$T[0]."G`etMethod"($1).invoke(0,$2)}
 $TI=(whoami /groups)-like'*1-16-16384*'; $As=0; if(!$cmd) {$cmd='control';$arg='admintools'}; if ($cmd-eq'This PC'){$cmd='file:'}
 if (!$TI) {'TrustedInstaller','lsass','winlogon'|% {if (!$As) {$9=sc.exe start $_; $As=@(get-process -name $_ -ea 0|% {$_})[0]}}
 function M ($1,$2,$3) {$M."G`etMethod"($1,[type[]]$2).invoke(0,$3)}; $H=@(); $Z,(4*$Z+16)|% {$H += M "AllocHG`lobal" $I $_}
 M "WriteInt`Ptr" ($P,$P) ($H[0],$As.Handle); $A1.f1=131072; $A1.f2=$Z; $A1.f3=$H[0]; $A2.f1=1; $A2.f2=1; $A2.f3=1; $A2.f4=1
 $A2.f6=$A1; $A3.f1=10*$Z+32; $A4.f1=$A3; $A4.f2=$H[1]; M "StructureTo`Ptr" ($D[2],$P,[boolean]) (($A2 -as $D[2]),$A4.f2,$false)
 $Run=@($null, "powershell -win 1 -nop -c iex `$env:R; # $id", 0, 0, 0, 0x0E080600, 0, $null, ($A4 -as $T[4]), ($A5 -as $T[5]))
 F 'CreateProcess' $Run; return}; $env:R=''; rp $key $id -force; $priv=[diagnostics.process]."GetM`ember"('SetPrivilege',42)[0]
 'SeSecurityPrivilege','SeTakeOwnershipPrivilege','SeBackupPrivilege','SeRestorePrivilege' |% {$priv.Invoke($null, @("$_",2))}
 $HKU=[uintptr][uint32]2147483651; $NT='S-1-5-18'; $reg=($HKU,$NT,8,2,($HKU -as $D[9])); F 'RegOpenKeyEx' $reg; $LNK=$reg[4]
 function L ($1,$2,$3) {sp 'HKLM:\Software\Classes\AppID\{CDCBCFCA-3CDC-436f-A4E2-0E02075250C2}' 'RunAs' $3 -force -ea 0
  $b=[Text.Encoding]::Unicode.GetBytes("\Registry\User\$1"); F 'RegSetValueEx' @($2,'SymbolicLinkValue',0,6,[byte[]]$b,$b.Length)}
 function Q {[int](gwmi win32_process -filter 'name="explorer.exe"'|?{$_.getownersid().sid-eq$NT}|select -last 1).ProcessId}
 $11bug=($((gwmi Win32_OperatingSystem).BuildNumber)-eq'22000')-AND(($cmd-eq'file:')-OR(test-path -lit $cmd -PathType Container))
 if ($11bug) {'System.Windows.Forms','Microsoft.VisualBasic' |% {[Reflection.Assembly]::LoadWithPartialName("'$_")}}
 if ($11bug) {$path='^(l)'+$($cmd -replace '([\+\^\%\~\(\)\[\]])','{$1}')+'{ENTER}'; $cmd='control.exe'; $arg='admintools'}
 L ($key-split'\\')[1] $LNK ''; $R=[diagnostics.process]::start($cmd,$arg); if ($R) {$R.PriorityClass='High'; $R.WaitForExit()}
 if ($11bug) {$w=0; do {if($w-gt40){break}; sleep -mi 250;$w++} until (Q); [Microsoft.VisualBasic.Interaction]::AppActivate($(Q))}
 if ($11bug) {[Windows.Forms.SendKeys]::SendWait($path)}; do {sleep 7} while(Q); L '.Default' $LNK 'Interactive User'
'@; $V='';'cmd','arg','id','key'|%{$V+="`n`$$_='$($(gv $_ -val)-replace"'","''")';"}; sp $key $id $($V,$code) -type 7 -force -ea 0
 start powershell -args "-win 1 -nop -c `n$V `$env:R=(gi `$key -ea 0).getvalue(`$id)-join''; iex `$env:R" -verb runas
}; $A=$env:1-split'"([^"]+)"|([^ ]+)',2|%{$_.Trim(' "')}; RunAsTI $A[1] $A[2]; #:RunAsTI lean & mean snippet by AveYo, 2022.01.28
}
Catch {
	Write-Host ""
	$UACDeclined = $PSItem | Select-String -pattern "The operation was canceled by the user" -quiet
	if ( $UACDeclined )
	{
		$exitcode = 2
		Write-Host "PowerShell: UAC prompt was declined!" -ForegroundColor Red
	}
	else {
		$exitcode = 1
		Write-Host "PowerShell: Failed to self-elevate (unknown error)!" -ForegroundColor Red
		Write-Host ""
		Write-Host Error: $PSItem -ForegroundColor Red
		Write-Host Where: $PSItem.ScriptStackTrace -ForegroundColor Red
	}
	exit $exitcode
}