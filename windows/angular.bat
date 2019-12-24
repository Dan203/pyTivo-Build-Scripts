@echo off
pushd "..\..\desktop"

title Building pyTivo Desktop - Building angular code
echo Building angular code

call ng build -prod -aot -bh ./
if %errorlevel% NEQ 0 pause 
::exit /B %errorlevel%

popd