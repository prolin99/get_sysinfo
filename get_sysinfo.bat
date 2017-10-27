@echo off
REM utf8


REM ===========================
REM ftp setting
set useFtpFG=1
set USERNAME=ftpuser
set PASSWORD=ftppassword
set ftpserver=ftp://120.116.24.2/home/
set newftp=ftp://120.116.24.2/home/new/

REM ===========================



SET now_path=%~dp0
REM echo %now_path%
cd %now_path%

set hour=%time:~0,2%
if "%hour:~0,1%" == " " set hour=0%hour:~1,1%
REM echo hour=%hour%
set min=%time:~3,2%
if "%min:~0,1%" == " " set min=0%min:~1,1%
REM echo min=%min%
set secs=%time:~6,2%
if "%secs:~0,1%" == " " set secs=0%secs:~1,1%
REM echo secs=%secs%

set mydate=%date:~0,4%%date:~5,2%%date:~8,2%_%hour%%min%%secs%

REM  echo %mydate%

set file=%mydate%.txt

REM chcp 65001
REM wmic os get localdatetime > %file%

REM wmic csproduct get UUID
wmic csproduct get UUID >> %file%

REM wmic bios get name
wmic bios get name >> %file%

REM wmic cpu get name
wmic cpu get name >> %file%

REM  wmic MEMPHYSICAL get maxcapacity
wmic MEMPHYSICAL get maxcapacity >> %file%

REM wmic NICCONFIG   get dhcpserver
wmic NICCONFIG   get dhcpserver   >> %file%
REM wmic NICCONFIG   get IPAddress
wmic NICCONFIG   get IPAddress  >> %file%

REM wmic product get name >> %file%




REM copy the first info
IF  EXIST FIRST_SYSTEM_INFO GOTO step2
copy %file% FIRST_SYSTEM_INFO



:step2

if %useFtpFG% EQU 1 (
   %now_path%curl.exe -T  %file%   %ftpserver%%file% --user   %USERNAME%:%PASSWORD%  --silent
)

cscript %now_path%compare_txt.vbs %file%  FIRST_SYSTEM_INFO

del %file%

REM  auto DownLoad new version get_sysinfo.bat
%now_path%curl.exe   -O  %newftp%get_sysinfo.bat --user   %USERNAME%:%PASSWORD% --silent


%now_path%curl.exe   -O  %newftp%compare_txt.vbs --user   %USERNAME%:%PASSWORD% --silent

REM 20171027_0904
