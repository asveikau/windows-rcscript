@echo off

REM Don't let this run recursively, as happens with for /f ('command')
REM
if x%NO_RECURSE% == x1 goto :eof
set NO_RECURSE=1

REM
REM Set ourselves up to run at cmd.exe startup
REM

setlocal ENABLEDELAYEDEXPANSION
SET EXISTING_VALUE=
SET THIS_SCRIPT=%~dpnx0
SET REGKEY="HKCU\Software\Microsoft\Command Processor"
SET REGVALUE=AutoRun

REM If the reg key doesn't exist, don't try to parse it.
REM
reg query %REGKEY% /v %REGVALUE% /t REG_SZ > NUL 2>&1 || goto :noExisting

REM Read existing value
REM
for /f "tokens=3" %%i in ('reg query %REGKEY% /v %REGVALUE% /t REG_SZ') do if x!EXISTING_VALUE! == x set EXISTING_VALUE=%%i

:noExisting
if x%EXISTING_VALUE% == x%THIS_SCRIPT% goto :skipSetup 

echo Setting this script (%THIS_SCRIPT%) as cmd.exe autorun.
reg add %REGKEY% /v %REGVALUE% /t REG_SZ /d %THIS_SCRIPT% /f

:skipSetup
endlocal

call %~dp0\rc.cmd

set NO_RECURSE=
