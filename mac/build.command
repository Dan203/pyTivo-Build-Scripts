cd "`dirname $0`"

echo "Creating build directory"
rm -R build
mkdir build
echo "Copying bin files"
cp -R ./pyTivo/bin ./build/bin
echo "Copying seticon files"
cp -R ./seticon ./build/seticon

pushd pytivo/pyinstaller
echo "Building pyTivoTray"
pyinstaller pytivotray.spec --distpath=../../build
echo "Building pyTivo"
pyinstaller pytivo.spec --distpath=../../build/pyTivoTray.app/Contents/MacOS
popd
pushd build
echo "Deleting pyTivoTray executable since we have bundle"
rm pyTivoTray
echo "Renaming pyTivoTray bundle"
mv pyTivoTray.app pyTivo.app
echo "Signing pyTivo"
codesign -s "Robert Haddix" pyTivoTray.app/Contents/MacOS/pyTivo
echo "Signing pyTivoTray"
codesign -s "Robert Haddix" pyTivoTray.app
popd
pushd desktop
echo "Building pyTivoDesktop"
ng build -prod -aot -bh ./
cp ./electron/*.* ./dist
electron-packager ./dist --icon=icon.icns --out=../build --platform=darwin --osxSign=true --asar --overwrite
popd
pushd build
mv ./pyTivoDesktop-darwin-x64/*.* ./
rm -R pyTivoDesktop-darwin-x64
popd
pushd installer
"/Applications/BitRock InstallBuilder Enterprise 19.11.0/bin/builder" build pyTivo.xml
rm *.app
popd
exit 1