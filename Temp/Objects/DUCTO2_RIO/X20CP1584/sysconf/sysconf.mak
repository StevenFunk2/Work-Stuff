$(AS_CPU_PATH)/sysconf.br: \
	FORCE \
	$(AS_PROJECT_CONFIG_PATH)/Hardware.hw 
	@"$(AS_BIN_PATH)/BR.AS.ConfigurationBuilder.exe" "$(AS_PROJECT_CONFIG_PATH)/Hardware.hw"  -c DUCTO2_RIO -sysconf -S "X20CP1584" -o "$(AS_CPU_PATH)/sysconf.br" -T SG4  -B J4.25 -P "$(AS_PROJECT_PATH)" -s "DUCTO2_RIO" -secret "$(AS_PROJECT_PATH)_br.as.configurationbuilder.exe"

FORCE:

-include $(AS_CPU_PATH)/Force.mak 
