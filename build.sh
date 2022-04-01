rm -rf build/CMakeFiles/ahh.dir
rm build/cmake_install.cmake
rm build/Makefile
#rm -rf outputs

mkdir build
cd build

cmake ../
make

echo "build finish\n"

rm CMakeCache.txt

cd ../outputs
if [ -f "jinLibs/armeabi-v7a/libahh.so" ]; then
  file jinLibs/armeabi-v7a/libahh.so
fi

if [ -f "jinLibs/arm64-v8a/libahh.so" ]; then
  file jinLibs/arm64-v8a/libahh.so
fi

if [ -f "jinLibs/x86/libahh.so" ]; then
  file jinLibs/x86/libahh.so
fi
if [ -f "jinLibs/x86_64/libahh.so" ]; then
  file jinLibs/x86_64/libahh.so
fi