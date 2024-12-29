@echo off
color 0a
cd ..
@echo on

:: Check if Visual Studio is installed by checking registry
echo Checking for Visual Studio installation...
reg query "HKLM\SOFTWARE\Microsoft\VisualStudio\*" >nul 2>&1
if %errorlevel% == 0 (
    echo Microsoft Visual Studio is already installed.
) else (
    echo Microsoft Visual Studio is NOT installed.
)

pause
