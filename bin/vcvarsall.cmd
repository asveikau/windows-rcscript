@echo off

rem Back up working directory, then enter Program Files (x86) to look for vcvarsall.bat
rem
pushd .
cd /d "%ProgramFiles(x86)%"
for /f "tokens=*" %%x in ('dir /s vcvarsall.bat /b') do set VCVARSALL=%%x
popd

if "%VCVARSALL%"=="" goto :fail

"%VCVARSALL%" %*

set VCVARSALL=
goto :ok
:fail
echo Could not find vcvarsall.bat. 1>&2
exit /b 1
:ok
