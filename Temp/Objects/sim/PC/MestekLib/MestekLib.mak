UnmarkedObjectFolder := C:/code/BandR Projects/X20_CPU/X20_CPU/Logical/Libraries/MestekLib
MarkedObjectFolder := C:/code/BandR\ Projects/X20_CPU/X20_CPU/Logical/Libraries/MestekLib

$(AS_CPU_PATH)/MestekLib.br: \
	$(AS_PROJECT_PATH)/Logical/Libraries/MestekLib/IEC.lby \
	$(AS_CPU_PATH)/MestekLib/MestekLib.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/MestekLib/MestekLib.ox" -o "$(AS_CPU_PATH)/MestekLib.br" -v V1.00.0 -f "$(AS_CPU_PATH)/NT.ofs" -offsetLT "$(AS_BINARIES_PATH)/$(AS_CONFIGURATION)/$(AS_PLC)/LT.ofs" -T SG4  -M IA32  -B J4.25 -extConstants -d "runtime: V* - V*,asieccon: V* - V*" -r Library -s "Libraries.MestekLib" -L "AsIecCon: V*, asstring: V*, AsTCP: V*, astime: V*, Library: V*, MestekLib: V*, operator: V*, runtime: V*, standard: V*" -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/MestekLib/MestekLib.ox: \
	$(AS_CPU_PATH)/MestekLib/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/MestekLib/a.out" -o "$(AS_CPU_PATH)/MestekLib/MestekLib.ox" -T SG4 -r Library   -G V4.1.2  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/MestekLib/a.out: \
	$(AS_CPU_PATH)/MestekLib/myAdd.st.o
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link "$(AS_CPU_PATH)/MestekLib/myAdd.st.o"  -o "$(AS_CPU_PATH)/MestekLib/a.out"  -G V4.1.2  -T SG4  -M IA32  "-Wl,$(AS_TEMP_PATH)/Archives/$(AS_CONFIGURATION)/$(AS_PLC)/libLibrary.a" "-Wl,$(AS_SYSTEM_PATH)/J0425/SG4/IA32/libasstring.a" "-Wl,$(AS_SYSTEM_PATH)/J0425/SG4/IA32/libAsTCP.a" "-Wl,$(AS_SYSTEM_PATH)/J0425/SG4/IA32/libstandard.a" "-Wl,$(AS_SYSTEM_PATH)/J0425/SG4/IA32/libAsIecCon.a" "-Wl,$(AS_SYSTEM_PATH)/J0425/SG4/IA32/libastime.a" "-Wl,$(AS_SYSTEM_PATH)/J0425/SG4/IA32/libruntime.a" "-Wl,$(AS_SYSTEM_PATH)/J0425/SG4/IA32/liboperator.a" -specs=I386specs -Wl,-q,-T,bur_elf_i386.x -nostdlib -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/MestekLib/myAdd.st.o: \
	$(AS_PROJECT_PATH)/Logical/Libraries/MestekLib/myAdd.st \
	$(AS_PROJECT_PATH)/Logical/Libraries/MestekLib/MestekLib.fun
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Libraries/MestekLib/myAdd.st" -o "$(AS_CPU_PATH)/MestekLib/myAdd.st.o"  -O "$(AS_CPU_PATH)//MestekLib/myAdd.st.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 

