@echo off

:loop
del /f /s /q build\*.*

mkdir build
cd build

cmake -G "MinGW Makefiles" ../
cmake --build . --target ahh -- -j 6

echo "build finish"
cd ../

pause