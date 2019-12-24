@echo off
pushd "..\..\pytivo\pyinstaller"

title Building pyTivo Desktop - Building pyTivoTray
echo Building pyTivoTray

pyinstaller pytivotray.spec --distpath="..\..\build"
if %errorlevel% NEQ 0 exit /B %errorlevel%

popd