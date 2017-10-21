:begin
cls
@echo off
REM =================
set keyname=get_sysinfo
set expath=c:\tools\get_sysinfo.bat
REM =================
echo   Program startup Utility
echo.
echo    1. Add Program to Startup
echo    2. Remove Program From Startup
echo    0. Exit

set /p choice=  Choose A Service:
if not '%choice%'== set %choice%=choice:~0,1%

if '%choice%'=='1' goto :addstartup
if '%choice%'=='2' goto :delstartup
if '%choice%'=='0' goto :exit

:addstartup
cls
copy get_sysinfo.bat c:\tools\.
copy compare_txt.vbs c:\tools\.
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Run\ /v %keyname% /t REG_SZ /d "%expath%"

timeout /t 2 >nul

goto begin

:delstartup
cls
reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Run\ /v "%keyname%" /f

timeout /t 2 >nul

goto begin
