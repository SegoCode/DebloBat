@echo off
:: Ensure admin privileges
fltmc >nul 2>&1 || (
    echo Administrator privileges are required.
    PowerShell Start -Verb RunAs '%0' 2> nul || (
        echo Right-click on the script and select "Run as administrator".
        pause & exit 1
    )
    exit 0
)

:INIT
MODE 100,35
title github.com/SegoCode 
cls
echo.
echo    Windows Tool Box for[1;36m Windows 10 [m
echo    Yet another (and ugly) debloat suite. 
echo    -----------------------------------------------
echo.  
echo    [1]  Privacy Local Group Policy            
echo    [2]  Tweak Windows Tasks 
echo    [3]  Tweak Windows Services          
echo    [4]  Miscellaneous tweaks            
echo    [5]  Windows online activator    
echo    [6]  System information                 
echo.

set /P N=Select your option and press Enter ^> 
if %N%==1 (goto LOCALGROUP)

goto INIT