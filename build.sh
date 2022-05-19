
function build_so
{
  # 移除缓存CMakeCache,让cmake配置生效
  rm CMakeCache.txt

  cmake -DCMAKE_ANDROID_ARCH_ABI=$AHH_ABI ../
  make
  echo "build $AHH_ABI so finish\n"
}

rm -rf outputs
mkdir build
cd build

# armeabi-v7a
AHH_ABI=armeabi-v7a
build_so

# arm64-v8a
AHH_ABI=arm64-v8a
build_so

# x86
AHH_ABI=x86
build_so

# x86_64
AHH_ABI=x86_64
build_so


echo "build finish\n"

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