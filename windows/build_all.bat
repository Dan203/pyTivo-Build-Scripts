@echo off
TITLE Building pyTivo Desktop

pushd ..
set /p oldversion=< version.info
popd

echo Current version: %oldversion%

set /p newversion=Enter new version number?
if /i "%newversion%" EQU "" (
    set newversion=%oldversion%
    goto :justbuild
)
if /i "%newversion%" EQU "EXIT" goto :exit

:choice
set /p c=Change version from %oldversion% to %newversion%[Y/N]?
if /i "%c%" EQU "Y" goto :continue
if /i "%c%" EQU "N" goto :exit
goto :choice

:continue
echo.
call change_version %oldversion% %newversion%
call :check_for_error

:justbuild
echo.
call delete_build
call :check_for_error

echo.
call copy_bin
call :check_for_error

echo.
call pytivo
call :check_for_error

echo.
call pytivotray
call :check_for_error

echo.
call pytivoservice
call :check_for_error

echo.
call angular
call :check_for_error

echo.
call electron
call :check_for_error

echo.
call installer
call :check_for_error

:exit
exit /B %errorlevel%

:check_for_error
    if %errorlevel% NEQ 0 (
        echo Error:%errorlevel%
        pause      
    )
    exit /B 0
