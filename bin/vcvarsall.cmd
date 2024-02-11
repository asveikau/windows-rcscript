@echo off

rem Back up working directory, then enter Program Files (x86) to look for vcvarsall.bat
rem
pushd .
cd /d "%ProgramFiles(x86)%"
for /f "tokens=*" %%x in ('dir /s vcvarsall.bat /b') do set VCVARSALL=%%x
popd

"%VCVARSALL%" %*
