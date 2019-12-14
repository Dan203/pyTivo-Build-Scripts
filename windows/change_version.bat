@echo off
pushd ..

set oldversion=%1
set newversion=%2

title Building pyTivo Desktop - Updating version number
echo Updating version number

fart version.info %oldversion% %newversion%
if %errorlevel% EQU 0 exit /B 1

fart beta.info %oldversion% %newversion%
if %errorlevel% EQU 0 exit /B 1

fart "pyTivo\httpserver.py" "<Version>%oldversion%</Version>"  "<Version>%newversion%</Version>"
if %errorlevel% EQU 0 exit /B 1

fart "pyTivo\UserInterface\pyTivoTray.py" %oldversion% %newversion%
if %errorlevel% EQU 0 exit /B 1

fart "desktop\package.json" "\"version\": \"%oldversion%\"" "\"version\": \"%newversion%\""
if %errorlevel% EQU 0 exit /B 1

fart "desktop\electron\package.json" "\"version\": \"%oldversion%\"" "\"version\": \"%newversion%\""
if %errorlevel% EQU 0 exit /B 1

fart "desktop\src\app\common\about-dialog\about-dialog.component.html" %oldversion% %newversion%
if %errorlevel% EQU 0 exit /B 1

fart "desktop\src\app\common\pytivo.service.ts" %oldversion% %newversion%
if %errorlevel% EQU 0 exit /B 1

fart "installer\pyTivo.iss" %oldversion% %newversion%
if %errorlevel% EQU 0 exit /B 1

fart "installer\pyTivo.xml" %oldversion% %newversion%
if %errorlevel% EQU 0 exit /B 1

popd

exit /B 0