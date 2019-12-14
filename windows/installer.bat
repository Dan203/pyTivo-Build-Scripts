@echo off
pushd "../installer"

title Building pyTivo Desktop - Bulding installer
echo Building installer

"C:\Program Files (x86)\Inno Setup 5\ISCC.exe" pyTivo.iss
if %errorlevel% NEQ 0 exit /B %errorlevel%

popd