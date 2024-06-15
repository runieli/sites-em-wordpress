@echo off
rem START or STOP Services
rem ----------------------------------
rem Check if argument is STOP or START

if not ""%1"" == ""START"" goto stop


"G:\xampp\mysql\bin\mysqld" --defaults-file="G:\xampp\mysql\bin\my.ini" --standalone
if errorlevel 1 goto error
goto finish

:stop
cmd.exe /C start "" /MIN call "G:\xampp\killprocess.bat" "mysqld.exe"

if not exist "G:\xampp\mysql\data\%computername%.pid" goto finish
echo Delete %computername%.pid ...
del "G:\xampp\mysql\data\%computername%.pid"
goto finish


:error
echo MySQL could not be started

:finish
exit
