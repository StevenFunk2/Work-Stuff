SHELL = cmd.exe
CYGWIN=nontsec
export PATH := C:\Program Files (x86)\Rockwell Software\RSCommon\;C:\Program Files (x86)\Common Files\Rockwell;C:\Program Files (x86)\Rockwell Software\RSCommon;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\Program Files (x86)\Windows Kits\8.1\Windows Performance Toolkit\;C:\Program Files\Microsoft SQL Server\110\Tools\Binn\;C:\Program Files (x86)\Common Files\Rockwell\;c:\Program Files (x86)\Microsoft SQL Server\100\Tools\Binn\;c:\Program Files (x86)\Microsoft SQL Server\100\DTS\Binn\;C:\Program Files (x86)\Rockwell Software\RSView Enterprise\;C:\Program Files (x86)\Rockwell Automation\Common\Components;c:\Program Files (x86)\Microsoft SQL Server\90\Tools\binn\;C:\Users\io_sfunk\AppData\Local\Microsoft\WindowsApps;C:\Program Files (x86)\Common Files\Hilscher GmbH\TLRDecode;C:\Users\io_sfunk\AppData\Local\Microsoft\WindowsApps;C:\Program Files (x86)\Common Files\Hilscher GmbH\TLRDecode
export AS_BUILD_MODE := Rebuild
export AS_VERSION := 4.2.5.388
export AS_COMPANY_NAME :=  
export AS_USER_NAME := io_sfunk
export AS_PATH := C:/BrAutomation/AS42
export AS_BIN_PATH := C:/BrAutomation/AS42/Bin-en
export AS_PROJECT_PATH := C:/Code/BandR\ Duct\ Line\ Project
export AS_PROJECT_NAME := DuctLines
export AS_SYSTEM_PATH := C:/BrAutomation/AS/System
export AS_VC_PATH := C:/BrAutomation/AS42/AS/VC
export AS_TEMP_PATH := C:/Code/BandR\ Duct\ Line\ Project/Temp
export AS_CONFIGURATION := DUCTO2_V02
export AS_BINARIES_PATH := C:/Code/BandR\ Duct\ Line\ Project/Binaries
export AS_GNU_INST_PATH := C:/BrAutomation/AS42/AS/GnuInst/V4.1.2
export AS_GNU_BIN_PATH := $(AS_GNU_INST_PATH)/bin
export AS_GNU_INST_PATH_SUB_MAKE := C:/BrAutomation/AS42/AS/GnuInst/V4.1.2
export AS_GNU_BIN_PATH_SUB_MAKE := $(AS_GNU_INST_PATH_SUB_MAKE)/bin
export AS_INSTALL_PATH := C:/BrAutomation/AS42
export WIN32_AS_PATH := "C:\BrAutomation\AS42"
export WIN32_AS_BIN_PATH := "C:\BrAutomation\AS42\Bin-en"
export WIN32_AS_PROJECT_PATH := "C:\Code\BandR Duct Line Project"
export WIN32_AS_SYSTEM_PATH := "C:\BrAutomation\AS\System"
export WIN32_AS_VC_PATH := "C:\BrAutomation\AS42\AS\VC"
export WIN32_AS_TEMP_PATH := "C:\Code\BandR Duct Line Project\Temp"
export WIN32_AS_BINARIES_PATH := "C:\Code\BandR Duct Line Project\Binaries"
export WIN32_AS_GNU_INST_PATH := "C:\BrAutomation\AS42\AS\GnuInst\V4.1.2"
export WIN32_AS_GNU_BIN_PATH := "$(WIN32_AS_GNU_INST_PATH)\\bin" 
export WIN32_AS_INSTALL_PATH := "C:\BrAutomation\AS42"

.suffixes:

ProjectMakeFile:

	@"$(AS_BIN_PATH)/BR.AS.AnalyseProject.exe" "$(AS_PROJECT_PATH)/DuctLines.apj" -t "$(AS_TEMP_PATH)" -c "$(AS_CONFIGURATION)" -o "$(AS_BINARIES_PATH)"   -sfas -buildMode "Rebuild"  

	@$(AS_GNU_BIN_PATH)/mingw32-make.exe -r -f 'C:/Code/BandR Duct Line Project/Temp/Objects/$(AS_CONFIGURATION)/X20CP1584/#cpu.mak' -k 

