$(AS_CPU_PATH)/AsOPCS.opcs: \
	FORCE
	@"$(AS_BIN_PATH)/BR.OPC.Builder.exe"  "$(AS_PROJECT_PATH)/Logical/OpcTag.opct" -o "$(AS_CPU_PATH)/AsOPCS.opcs" -c Southwark_CD2505_00 -T Win -g "$(AS_TEMP_PATH)/Objects/Declarations.lst" -m "$(AS_CPU_PATH)/ConfigInfo.cfi" -P "$(AS_PROJECT_PATH)" -C "/RT=1000 /AM=* /SDT=5 /DAIP=10.1.254.101 /REPO=11159 /ANSL=1 /PT=11169" -D "/IF=tcpip /LOPO=11159 /SA=1" -p "@/Pvi/LNINA2/$(AS_CONFIGURATION)/$(AS_PLC)/CPU"

FORCE: