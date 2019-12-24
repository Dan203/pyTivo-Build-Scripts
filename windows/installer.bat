@echo off
pushd "..\..\installer"

title Building pyTivo Desktop - Bulding installer
echo Building installer

setlocal

set /p VERSION=< version.info
set SIGNTOOL_PATH=C:\Program Files (x86)\Windows Kits\10\bin\10.0.17763.0\x86\signtool.exe
set CERT_PATH=C:\Users\Dan\Documents\pyTivoDesktop\pyTivoCert.pfx
set TIMESTAMP_SERVER=http://timestamp.comodoca.com/authenticode

call "..\sign_password.bat"

"C:\Program Files (x86)\Inno Setup 5\ISCC.exe" pyTivo.iss "/Ssigntool=$q%SIGNTOOL_PATH%$q sign /f $q%CERT_PATH%$q /t http://timestamp.comodoca.com/authenticode /d $qpyTivo Desktop Installer$q /p %SIGNPASS% $f"
if %errorlevel% NEQ 0 exit /B %errorlevel%

endlocal

popd