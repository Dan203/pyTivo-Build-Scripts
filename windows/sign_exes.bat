@echo off

title Building pyTivo Desktop - Signing executables
echo Signing executables

pushd "..\..\build"

setlocal

set SIGNTOOL_PATH="C:\Program Files (x86)\Windows Kits\10\bin\10.0.17763.0\x86\signtool.exe"
set CERT_PATH="C:\Users\Dan\Documents\pyTivoDesktop\pyTivoCert.pfx"
rem set TIMESTAMP_SERVER=http://timestamp.comodoca.com/authenticode
set TIMESTAMP_SERVER=http://timestamp.verisign.com/scripts/timstamp.dll


call "..\sign_password.bat"


%SIGNTOOL_PATH% sign /f %CERT_PATH% /t %TIMESTAMP_SERVER% /p "%SIGNPASS%" /d "pyTivo" "pyTivo.exe"
if %errorlevel% NEQ 0 exit /B %errorlevel%


%SIGNTOOL_PATH% sign /f %CERT_PATH% /t %TIMESTAMP_SERVER% /p "%SIGNPASS%" /d "pyTivo Desktop Tray" "pyTivoTray.exe"
if %errorlevel% NEQ 0 exit /B %errorlevel%


%SIGNTOOL_PATH% sign /f %CERT_PATH% /t %TIMESTAMP_SERVER% /p "%SIGNPASS%" /d "pyTivo Service" "pyTivoService.exe"
if %errorlevel% NEQ 0 exit /B %errorlevel%


%SIGNTOOL_PATH% sign /f %CERT_PATH% /t %TIMESTAMP_SERVER% /p "%SIGNPASS%" /d "pyTivo Desktop" "desktop/pyTivoDesktop.exe"
if %errorlevel% NEQ 0 exit /B %errorlevel%


%SIGNTOOL_PATH% sign /f %CERT_PATH% /t %TIMESTAMP_SERVER% /p "%SIGNPASS%" /d "ffmpeg" "bin/ffmpeg.exe"
if %errorlevel% NEQ 0 exit /B %errorlevel%


%SIGNTOOL_PATH% sign /f %CERT_PATH% /t %TIMESTAMP_SERVER% /p "%SIGNPASS%" /d "TiVo metadata extractor" "bin/tdcat.exe"
if %errorlevel% NEQ 0 exit /B %errorlevel%

endlocal

popd