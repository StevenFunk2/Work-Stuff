UnmarkedObjectFolder := C:/Code/BandR Duct Line Project/Physical/DUCTO2_V1/X20CP1584/AccessAndSecurity/UserRoleSystem
MarkedObjectFolder := C:/Code/BandR\ Duct\ Line\ Project/Physical/DUCTO2_V1/X20CP1584/AccessAndSecurity/UserRoleSystem

$(AS_CPU_PATH)/Role.br: \
	$(AS_PROJECT_CONFIG_PATH)/$(AS_PLC)/AccessAndSecurity/UserRoleSystem/Role.role \
 	FORCE 
	@"$(AS_BIN_PATH)/BR.AS.SystemConfiguration.Builder.exe"   "$(AS_PROJECT_CPU_PATH)/AccessAndSecurity/UserRoleSystem/Role.role" -o "$(AS_CPU_PATH)/Role.br" -zip -B J4.25 -z n.d -P "$(AS_PROJECT_PATH)" -c "$(AS_CONFIGURATION)" -secret "$(AS_PROJECT_PATH)_br.as.systemconfiguration.builder.exe"

FORCE: