@echo off
pushd ..\..\

title Building pyTivo Desktop - Deleting build directory
echo Deleting build directory

rmdir "build" /s /q
timeout /t 5 /nobreak > NUL
if %errorlevel% NEQ 0 exit /B %errorlevel%

popd