@echo off
:: --------------------------------------------------------------------------------
::
:: Windows compatible version: 10, 8, 7
:: Author: https://github.com/SegoCode
:: Script function:
::	Creates a honeypot VM files in windows directory 
::
:: --------------------------------------------------------------------------------

:: Ensure admin privileges
fltmc >nul 2>&1 || (
    echo Administrator privileges are required.
    PowerShell Start -Verb RunAs '%0' 2> nul || (
        echo Right-click on the script and select "Run as administrator".
        pause & exit 1
    )
    exit 0
)

:: ----------------------------------------------------------
:: ---------------------Create a fake VM---------------------
:: ----------------------------------------------------------
echo Creating files . . .
SET sys32=%systemroot%\system32
SET drivers=%systemroot%\system32\drivers

:: C:\Windows\System32\
cd %sys32%
set listDll=VBoxDisp VBoxHook VBoxMRXNP VBoxOGL VBoxOGLarrayspu VBoxOGLcrutil VBoxOGLerrorspu VBoxOGLfeedbackspu VBoxOGLpackspu VBoxOGLpassthroughspu
for %%a in (%listDll%) do ( 
   echo Honeypot> %%a.dll
   echo Writting %%a.dll
)

set listEXE=VBoxControl VBoxService VBoxTray VBoxDrvInst VBoxWHQLFake
for %%b in (%listEXE%) do ( 
   echo Honeypot> %%b.exe
   echo Writting %%b.dll
)

:: C:\Windows\System32\Drivers\
cd %drivers%
set listSYS=VBoxSF vboxmouse vboxguest vboxvideo Vmmouse
for %%c in (%listSYS%) do ( 
   echo Honeypot> %%c.sys
    echo Writting %%c.dll
)
echo Files created!
:: ----------------------------------------------------------
pause
exit /b 0