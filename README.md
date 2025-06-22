# STM32 CMake Bootloader Template

[![Build Status](https://img.shields.io/badge/build-passing-brightgreen.svg)](https://github.com)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![STM32](https://img.shields.io/badge/STM32-F411-orange.svg)](https://www.st.com/en/microcontrollers-microprocessors/stm32f411.html)
[![CMake](https://img.shields.io/badge/CMake-3.20+-blue.svg)](https://cmake.org/)

A professional-grade, modular STM32 firmware template featuring dual-stage bootloader architecture with modern CMake build system. Designed for embedded systems requiring reliable firmware updates and secure boot capabilities.

> 🚀 **Why This Template?** Demonstrates advanced embedded systems architecture with separation of concerns between bootloader and application layers, essential for production-ready IoT and industrial applications.

## 🎯 Key Features

### 🏗️ **Architecture**
- **Dual-stage bootloader** with configurable memory mapping
- **Modular design** following embedded software best practices
- **Cross-platform CMake** build system with Windows optimization
- **Automated toolchain** management and dependency resolution

### 🔧 **Technical Highlights**
- **Memory Layout Management**: Custom linker scripts for bootloader (0x08000000) and application (0x08010000)
- **Hardware Abstraction**: Clean separation between bootloader and application firmware
- **Build Automation**: One-click build and flash scripts for streamlined development
- **Professional Tooling**: Integration with STM32CubeProgrammer CLI for production workflows

### 🎨 **Visual Indicators**
- 🟠 **Bootloader Mode**: Orange LED (PD13) - System initialization and boot sequence
- 🟢 **Application Mode**: Green LED (PD15) - Normal operation mode
- 🔄 **Seamless Transition**: Automatic handoff between bootloader and application

## 📋 Technical Specifications

| Component | Specification |
|-----------|---------------|
| **Target MCU** | STM32F411 (ARM Cortex-M4) |
| **Build System** | CMake 3.20+ |
| **Toolchain** | ARM GCC (arm-none-eabi) |
| **Flash Tool** | STM32CubeProgrammer CLI |
| **Memory Layout** | Bootloader: 64KB, Application: 448KB |
| **Development OS** | Windows (with cross-platform support) |

## 🏗️ Project Architecture

```
stm32-cmake-bootloader-template/
├── 📁 BOOTLOADER/                  # Bootloader firmware source
│   ├── 📄 linker_script.ld         # Memory layout (0x08000000)
│   └── 📄 CMakeLists.txt           # Bootloader build config
├── 📁 APPLICATION/                 # Main application firmware
│   ├── 📄 linker_script.ld         # Memory layout (0x08010000)
│   └── 📄 CMakeLists.txt           # Application build config
├── 📁 BUILD/                       # Build artifacts (auto-generated)
├── 📁 stm32-programmer/            # STM32CubeProgrammer CLI
├── 📁 tools-arm-noneabi/           # ARM GCC toolchain
├── 📄 arm-toolchain.cmake          # Cross-compilation configuration
├── 📄 CMakeLists.txt               # Root build configuration
├── 📄 autobuild-script.bat         # Automated build script
└── 📄 flash_all.bat                # Automated flash script
```

## 🚀 Quick Start Guide

### Prerequisites

Ensure you have the following tools installed:

- **CMake 3.20+** - [Download here](https://cmake.org/download/)
- **ARM GCC Toolchain** - Included in `tools-arm-noneabi/`
- **STM32CubeProgrammer** - Included in `stm32-programmer/`
- **ST-LINK USB Driver** - [Download from ST](https://www.st.com/en/development-tools/stsw-link009.html)

### Build Process

#### Option 1: Automated Build (Recommended)
```cmd
# One-click build - builds both bootloader and application
autobuild-script.bat
```

#### Option 2: Manual Build
```cmd
# Configure build system
cmake -S . -B BUILD -G "MinGW Makefiles" -DCMAKE_TOOLCHAIN_FILE=./arm-toolchain.cmake

# Compile firmware
cmake --build BUILD --config Release

# Build artifacts will be in BUILD/BOOTLOADER/ and BUILD/APPLICATION/
```

### Flash to Hardware

#### Prerequisites
1. Connect ST-LINK programmer to your STM32F411 board
2. Ensure ST-LINK drivers are installed
3. Power on the target board

#### Flash Command
```cmd
# Flash both bootloader and application with memory verification
flash_all.bat
```
or 
```cmd
cmake --build BUILD --target flash_all  
```
**Flash Process Details:**
- ✅ Erases target flash memory
- ✅ Programs bootloader.bin → 0x08000000 
- ✅ Programs application.bin → 0x08010000
- ✅ Verifies programming integrity
- ✅ Performs system reset

## 🔧 Development Workflow

### Memory Layout Strategy
```
STM32F411 Flash Memory (512KB)
┌─────────────────────────────────┐
│ Bootloader (64KB)               │ 0x08000000 - 0x0800FFFF
├─────────────────────────────────┤
│ Application (448KB)             │ 0x08010000 - 0x0807FFFF
└─────────────────────────────────┘
```

### Boot Sequence
1. **Power-On**: System starts in bootloader at 0x08000000
2. **Initialization**: Bootloader performs system checks and ORANGE LED indication
3. **Handoff**: Bootloader jumps to application at 0x08010000
4. **Runtime**: Application executes with green LED indication

### Planned Features
- 🔐 **Secure Boot**: Cryptographic signature verification
- 📡 **OTA Updates**: Over-the-air firmware update capability
- 🛡️ **Fail-Safe Recovery**: Backup firmware and rollback mechanisms
- 🔍 **Diagnostics**: Comprehensive logging and error reporting

### Related Projects
- [STM32CubeIDE Bootloader](https://github.com/nghiahuynhtv01042002/BootloaderStm32f411.git) - Alternative IDE-based implementation
- 🚧 **OTA Update System** - Coming soon
- 🚧 **Secure Boot Implementation** - Coming soon

## 👨‍💻 Author

**Nghia Huynh**
- 🌐 GitHub: [@nghiahuynhtv01042002](https://github.com/nghiahuynhtv01042002)
- 📧 Email: 
    nghiahuynhtv01042002@gmail.com
    nghiatv01zz@gmail.com
---

