$(AS_CPU_PATH)/sysconf.br: \
	$(AS_PROJECT_CONFIG_PATH)/Hardware.hw 
	@"$(AS_BIN_PATH)/BR.AS.ConfigurationBuilder.exe" "$(AS_PROJECT_CONFIG_PATH)/Hardware.hw"  -c sim -sysconf -S "PC" -o "$(AS_CPU_PATH)/sysconf.br" -T SG4  -B J4.25 -P "$(AS_PROJECT_PATH)" -s "sim" -secret "$(AS_PROJECT_PATH)_br.as.configurationbuilder.exe"

-include $(AS_CPU_PATH)/Force.mak 
