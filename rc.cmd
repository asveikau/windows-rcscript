
setlocal EnableDelayedExpansion

set TOOLS_PATH=!TOOLS_PATH! PortableGit\cmd
set TOOLS_PATH=!TOOLS_PATH! PortableGit\usr\bin PortableGit\mingw64\bin
set TOOLS_PATH=!TOOLS_PATH! ilspy
set TOOLS_PATH=!TOOLS_PATH! gnumake\bin
set TOOLS_PATH=!TOOLS_PATH! nasm
set TOOLS_PATH=!TOOLS_PATH! nasm\rdoff
set TOOLS_PATH=!TOOLS_PATH! bin
set TOOLS_PATH=!TOOLS_PATH! sublime

for %%i in (!TOOLS_PATH!) do (set TOOLS_PATH_EX=!TOOLS_PATH_EX! %~dp0%%i)
(set TOOLS_PATH=!TOOLS_PATH_EX!)

REM Merge TOOLS_PATH with PATH only if they're not present.

for %%i in (!TOOLS_PATH!) do for /f "delims=" %%j in ('echo ^;!PATH!^; ^| findstr /l ^;%%i^; ^| find /c ":"') do if "%%j" == "0" set PATH=!PATH!;%%i

REM Persist the above to the registry.  (That is why we checked
REM PATH to see that we don't double-insert

reg add HKCU\Environment /f /v PATH /t REG_SZ /d "!PATH!" > NUL

REM endlocal, but persisting PATH.
for /f "delims=" %%a in (""!PATH!"") do endlocal && set PATH=%%~a

