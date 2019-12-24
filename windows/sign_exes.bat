@echo off

title Building pyTivo Desktop - Signing executables
echo Signing executables

pushd "..\..\build"

setlocal

set SIGNTOOL_PATH="C:\Program Files (x86)\Windows Kits\10\bin\10.0.17763.0\x86\signtool.exe"
set CERT_PATH="C:\Users\Dan\Documents\pyTivoDesktop\pyTivoCert.pfx"
set TIMESTAMP_SERVER=http://timestamp.comodoca.com/authenticode


call "..\sign_password.bat"


%SIGNTOOL_PATH% sign /f %CERT_PATH% /t %TIMESTAMP_SERVER% /p "%SIGNPASS%" "pyTivo.exe"
if %errorlevel% NEQ 0 exit /B %errorlevel%


%SIGNTOOL_PATH% sign /f %CERT_PATH% /t %TIMESTAMP_SERVER% /p "%SIGNPASS%" "pyTivoTray.exe"
if %errorlevel% NEQ 0 exit /B %errorlevel%


%SIGNTOOL_PATH% sign /f %CERT_PATH% /t %TIMESTAMP_SERVER% /p "%SIGNPASS%" "pyTivoService.exe"
if %errorlevel% NEQ 0 exit /B %errorlevel%


%SIGNTOOL_PATH% sign /f %CERT_PATH% /t %TIMESTAMP_SERVER% /p "%SIGNPASS%" "desktop/pyTivoDesktop.exe"
if %errorlevel% NEQ 0 exit /B %errorlevel%


%SIGNTOOL_PATH% sign /f %CERT_PATH% /t %TIMESTAMP_SERVER% /p "%SIGNPASS%" "bin/ffmpeg.exe"
if %errorlevel% NEQ 0 exit /B %errorlevel%


%SIGNTOOL_PATH% sign /f %CERT_PATH% /t %TIMESTAMP_SERVER% /p "%SIGNPASS%" "bin/tdcat.exe"
if %errorlevel% NEQ 0 exit /B %errorlevel%


%SIGNTOOL_PATH% sign /f %CERT_PATH% /t %TIMESTAMP_SERVER% /p "%SIGNPASS%" "bin/tivolibre.exe"
if %errorlevel% NEQ 0 exit /B %errorlevel%

endlocal

popd