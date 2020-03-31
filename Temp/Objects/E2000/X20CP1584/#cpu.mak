SHELL = cmd.exe
export AS_PLC := X20CP1584
export AS_TEMP_PLC := X20CP1584
export AS_CPU_PATH := $(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_PLC)
export AS_CPU_PATH_2 := C:/Code/BandR Duct Line Project/Temp//Objects/$(AS_CONFIGURATION)/$(AS_PLC)
export AS_PROJECT_CONFIG_PATH := $(AS_PROJECT_PATH)/Physical/$(AS_CONFIGURATION)
export AS_PROJECT_CPU_PATH := $(AS_PROJECT_CONFIG_PATH)/$(AS_PLC)
export AS_STATIC_ARCHIVES_PATH := $(AS_TEMP_PATH)/Archives/$(AS_CONFIGURATION)/$(AS_PLC)
export WIN32_AS_CPU_PATH := $(WIN32_AS_TEMP_PATH)\Objects\$(AS_CONFIGURATION)\$(AS_PLC)
export WIN32_AS_ACTIVE_CONFIG_PATH := $(WIN32_AS_PROJECT_PATH)\Physical\$(AS_CONFIGURATION)\$(AS_PLC)


CpuMakeFile: \
$(AS_CPU_PATH)/ashwd.br \
$(AS_CPU_PATH)/asfw.br \
$(AS_CPU_PATH)/sysconf.br \
$(AS_CPU_PATH)/arconfig.br \
$(AS_CPU_PATH)/EFdrHydDr1.br \
$(AS_CPU_PATH)/IMotion2.br \
$(AS_CPU_PATH)/CEF.br \
$(AS_CPU_PATH)/SysCheck.br \
$(AS_CPU_PATH)/E2Buttons.br \
$(AS_CPU_PATH)/E2Feeder.br \
$(AS_CPU_PATH)/EngelStuff.br \
$(AS_CPU_PATH)/PMaster.br \
$(AS_CPU_PATH)/E2Transfer.br \
$(AS_CPU_PATH)/E2_LOM.br \
$(AS_CPU_PATH)/Pinspotter.br \
$(AS_CPU_PATH)/E_FWB.br \
$(AS_CPU_PATH)/Server.br \
$(AS_CPU_PATH)/iomap.br \
$(AS_CPU_PATH)/AsOPCS.opcs \
$(AS_CPU_PATH)/Role.br \
$(AS_CPU_PATH)/User.br \
$(AS_CPU_PATH)/TCData.br \
$(AS_BINARIES_PATH)/$(AS_CONFIGURATION)/$(AS_PLC)/Transfer.lst


$(AS_BINARIES_PATH)/$(AS_CONFIGURATION)/$(AS_PLC)/Transfer.lst: \
	FORCE
	@"$(AS_BIN_PATH)/BR.AS.FinalizeBuild.exe" "$(AS_PROJECT_PATH)/DuctLines.apj" -t "$(AS_TEMP_PATH)" -o "$(AS_BINARIES_PATH)" -c "$(AS_CONFIGURATION)" -i "C:/BrAutomation/AS42" -S "X20CP1584"  -all -A "X20CP1584" -pil   -swFiles "$(AS_PROJECT_PATH)/Physical/E2000/X20CP1584/Cpu.sw" -Z "mapp: 1.30.0, GMC: 0.67.0, TextSystem: n.d, Connectivity: n.d, AAS: n.d" -C "/RT=1000 /AM=* /SDT=5 /DAIP=10.1.254.101 /REPO=11159 /ANSL=1 /PT=11169" -D "/IF=tcpip /LOPO=11159 /SA=1" -M IA32 -T SG4

#nothing to do (just call module make files)

include $(AS_CPU_PATH)/TCData/TCData.mak
include $(AS_CPU_PATH)/User/User.mak
include $(AS_CPU_PATH)/Role/Role.mak
include $(AS_CPU_PATH)/AsOPCS/AsOPCS.mak
include $(AS_CPU_PATH)/iomap/iomap.mak
include $(AS_CPU_PATH)/Server/Server.mak
include $(AS_CPU_PATH)/E_FWB/E_FWB.mak
include $(AS_CPU_PATH)/Pinspotter/Pinspotter.mak
include $(AS_CPU_PATH)/E2_LOM/E2_LOM.mak
include $(AS_CPU_PATH)/E2Transfer/E2Transfer.mak
include $(AS_CPU_PATH)/PMaster/PMaster.mak
include $(AS_CPU_PATH)/EngelStuff/EngelStuff.mak
include $(AS_CPU_PATH)/E2Feeder/E2Feeder.mak
include $(AS_CPU_PATH)/E2Buttons/E2Buttons.mak
include $(AS_CPU_PATH)/SysCheck/SysCheck.mak
include $(AS_CPU_PATH)/CEF/CEF.mak
include $(AS_CPU_PATH)/IMotion2/IMotion2.mak
include $(AS_CPU_PATH)/EFdrHydDr1/EFdrHydDr1.mak
include $(AS_CPU_PATH)/arconfig/arconfig.mak
include $(AS_CPU_PATH)/sysconf/sysconf.mak
include $(AS_CPU_PATH)/asfw/asfw.mak
include $(AS_CPU_PATH)/ashwd/ashwd.mak

.DEFAULT:
#nothing to do (need this target for prerequisite files that don't exit)

FORCE:
