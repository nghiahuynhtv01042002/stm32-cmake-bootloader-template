@echo off
echo --------start--------
rmdir /s /q BUILD
cmake -S . -B BUILD -G "MinGW Makefiles" -DCMAKE_TOOLCHAIN_FILE=./arm-toolchain.cmake
cmake --build BUILD

@REM cmake --build BUILD --target flash_all  

echo --------DONE--------


