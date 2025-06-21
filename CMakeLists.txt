cmake_minimum_required(VERSION 3.13)
project(OTA)

add_subdirectory(BOOTLOADER)
add_subdirectory(APPLICATION)

set(FLASH_TOOL ${CMAKE_SOURCE_DIR}/tools/stm32-programmer/bin/STM32_Programmer_CLI.exe)

# Output binary paths after build
set(BOOT_BIN ${CMAKE_BINARY_DIR}/BOOTLOADER/bootloader.bin)
set(APP_BIN  ${CMAKE_BINARY_DIR}/APPLICATION/application.bin)

# Flash addresses
set(BOOT_ADDRESS 0x08000000)
set(APP_ADDRESS  0x08010000)

# Create flash_all custom target
add_custom_target(flash_all
    COMMAND ${FLASH_TOOL} -c port=SWD -d ${BOOT_BIN} ${BOOT_ADDRESS} -d ${APP_BIN} ${APP_ADDRESS} -rst
    COMMENT Flashing Bootloader and Application to STM32...
    VERBATIM
)