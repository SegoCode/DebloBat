@echo off

cd C:\Windows\System32\DriverStore\FileRepository\nv_dispi.inf_amd64*
cd NvCamera
if exist NvCameraEnable.exe (
	GOTO INIT
)

cd C:\Windows\System32\DriverStore\FileRepository\nvmdi.inf_amd64*
cd NvCamera
if exist NvCameraEnable.exe (
	GOTO INIT
)

cd C:\Windows\System32\DriverStore\FileRepository\nvami.inf_amd64*
cd NvCamera
if exist NvCameraEnable.exe (
	GOTO INIT
)

cd "C:\Program Files\NVIDIA Corporation\Ansel\Tools"
if exist NvCameraEnable.exe (
	GOTO INIT
)

cd "C:\Program Files\NVIDIA Corporation\Ansel"
if exist NvCameraEnable.exe (
	GOTO INIT
)

echo    Nvidia Files Status  = [[1;31m Not Found [m]
GOTO EOF

:INIT
title github.com/SegoCode 
cls
echo.
echo    ANSEL SHIT [1;36m v.1.0 [m
echo    Nvidia debloat script by github.com/SegoCode 
echo    -----------------------------------------------
echo.
echo    Nvidia Files Status  = [[1;32m Found [m]


for /f %%i in ('NvCameraEnable') do set ANSEL=%%i
if %ANSEL% EQU 0 (
	echo    Nvidia Ansel Status  = [[1;32m Disabled [m]
	echo.
	GOTO ENABLE
) else (
	echo    Nvidia Ansel Status  = [[1;31m Enabled [m]
	echo.
	GOTO DISABLE
)

:ENABLE
echo    Nvidia Ansel is currently[1;32m disabled[m, press any key to[1;31m enabled [m ^>
pause > nul
NvCameraEnable.exe on

for /f %%i in ('NvCameraEnable') do set ANSEL=%%i
if %ANSEL% NEQ 1 (
	echo    [1;31m Error found[m :(
	GOTO EOF
) else (
	GOTO INIT
)


:DISABLE
echo    Nvidia Ansel is currently[1;31m enabled[m, press any key to[1;32m disabled[m ^>
pause > nul
NvCameraEnable.exe off
for /f %%i in ('NvCameraEnable') do set ANSEL=%%i
if %ANSEL% NEQ 0 (
	echo    [1;31m Error found[m :(
	GOTO EOF
) else (
	GOTO INIT
)

:EOF
pause > nul