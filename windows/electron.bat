@echo off

title Building pyTivo Desktop - Building electron exe
echo Building electron exe

pushd "../build"

rmdir "desktop" /s /q

popd
pushd "../desktop"

xcopy /Y "electron\*.*" "dist"
if %errorlevel% NEQ 0 exit /B %errorlevel%

call electron-packager ./dist --icon=icon.ico --out="..\build" --platform=win32 --arch=ia32 --asar --overwrite
if %errorlevel% NEQ 0 exit /B %errorlevel%

popd
pushd "../build"

move "pyTivoDesktop-win32-ia32" "desktop"
if %errorlevel% NEQ 0 exit /B %errorlevel%

popd