@echo off
pushd ..\..\

title Building pyTivo Desktop - Copying binary files
echo Copying binary files

xcopy /Y "pytivo\bin\*.exe" "build\bin\"
if %errorlevel% NEQ 0 exit /B %errorlevel%

xcopy /Y /S "pytivo\bin\jre\*.*" "build\bin\jre\"
if %errorlevel% NEQ 0 exit /B %errorlevel%

xcopy /Y /S "dshow\*.*" "build\dshow\"
if %errorlevel% NEQ 0 exit /B %errorlevel%

xcopy /Y /S "tivomak\Release\tivomak.exe" "build\dshow\"
if %errorlevel% NEQ 0 exit /B %errorlevel%

xcopy /Y /S "service\*.bat" "build\"
if %errorlevel% NEQ 0 exit /B %errorlevel%

popd