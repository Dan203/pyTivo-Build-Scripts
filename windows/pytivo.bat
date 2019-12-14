@echo off
pushd "../pytivo/pyinstaller"

title Building pyTivo Desktop - Building pyTivo
echo Building pyTivo

pyinstaller pytivo.spec --distpath="..\..\build"
if %errorlevel% NEQ 0 exit /B %errorlevel%

popd