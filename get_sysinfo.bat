@echo off

REM ===========================
REM ftp setting
set useFtpFG=0
set USERNAME=myname
set PASSWORD=mypassword
set ftpserver=nas.syps.tn.edu.tw

REM ===========================


cd %0\..\
set now_path=%cd%
set mydate=%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,5%
REM  echo %mydate%

set file=%mydate%.txt

REM wmic os get localdatetime > %file%

REM echo bios >> %file%

wmic csproduct get UUID >> %file%

wmic bios get name >> %file%


wmic cpu get name >> %file%

wmic MEMPHYSICAL get maxcapacity >> %file%

wmic NICCONFIG   get dhcpserver   >> %file%
wmic NICCONFIG   get IPAddress  >> %file%

REM wmic product get name >> %file%




REM copy the first info
IF  EXIST FIRST_SYSTEM_INFO GOTO step2
copy %file% FIRST_SYSTEM_INFO



:step2

if %useFtpFG% EQU 1 (
(
   echo %USERNAME%
   echo %PASSWORD%
   echo asc
   echo put %now_path%\%file%
   echo quit
  )>upload.txt

  ftp  -s:upload.txt %ftpsever%

  del upload.txt
)

cscript %now_path%\compare_txt.vbs %file%  FIRST_SYSTEM_INFO

del %file%
