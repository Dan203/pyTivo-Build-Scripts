@echo off
pushd "..\..\pytivo\pyinstaller"

title Building pyTivo Desktop - Building pyTivoService
echo Building pyTivoService

pyinstaller pytivoservice.spec --distpath="..\..\build"
if %errorlevel% NEQ 0 exit /B %errorlevel%

popd