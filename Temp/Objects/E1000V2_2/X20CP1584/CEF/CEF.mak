UnmarkedObjectFolder := C:/Code/BandR Duct Line Project/Logical/CEF
MarkedObjectFolder := C:/Code/BandR\ Duct\ Line\ Project/Logical/CEF

$(AS_CPU_PATH)/CEF.br: \
	$(AS_PROJECT_CPU_PATH)/Cpu.per \
	FORCE \
	$(AS_CPU_PATH)/CEF/CEF.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/CEF/CEF.ox" -o "$(AS_CPU_PATH)/CEF.br" -v V1.00.0 -f "$(AS_CPU_PATH)/NT.ofs" -offsetLT "$(AS_BINARIES_PATH)/$(AS_CONFIGURATION)/$(AS_PLC)/LT.ofs" -T SG4  -M IA32  -B J4.25 -extConstants -d "runtime: V* - V*,asieccon: V* - V*" -r Cyclic1 -p 2 -s "CEF" -L "AsIecCon: V*, asstring: V*, AsTCP: V*, astime: V*, Library: V*, MestekLib: V*, operator: V*, runtime: V*, standard: V*" -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/CEF/CEF.ox: \
	$(AS_CPU_PATH)/CEF/a.out \
	FORCE 
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/CEF/a.out" -o "$(AS_CPU_PATH)/CEF/CEF.ox" -T SG4 -r Cyclic1   -G V4.1.2  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/CEF/a.out: \
	$(AS_CPU_PATH)/CEF/Cyclic.ld.o \
	$(AS_CPU_PATH)/CEF/Init.ld.o \
	$(AS_CPU_PATH)/CEF/Exit.ld.o \
	FORCE
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link "$(AS_CPU_PATH)/CEF/Cyclic.ld.o" "$(AS_CPU_PATH)/CEF/Init.ld.o" "$(AS_CPU_PATH)/CEF/Exit.ld.o"  -o "$(AS_CPU_PATH)/CEF/a.out"  -G V4.1.2  -T SG4  -M IA32  "-Wl,$(AS_TEMP_PATH)/Archives/$(AS_CONFIGURATION)/$(AS_PLC)/libLibrary.a" "-Wl,$(AS_SYSTEM_PATH)/J0425/SG4/IA32/libasstring.a" "-Wl,$(AS_SYSTEM_PATH)/J0425/SG4/IA32/libAsTCP.a" "-Wl,$(AS_TEMP_PATH)/Archives/$(AS_CONFIGURATION)/$(AS_PLC)/libMestekLib.a" "-Wl,$(AS_SYSTEM_PATH)/J0425/SG4/IA32/libstandard.a" "-Wl,$(AS_SYSTEM_PATH)/J0425/SG4/IA32/libAsIecCon.a" "-Wl,$(AS_SYSTEM_PATH)/J0425/SG4/IA32/libastime.a" "-Wl,$(AS_SYSTEM_PATH)/J0425/SG4/IA32/libruntime.a" "-Wl,$(AS_SYSTEM_PATH)/J0425/SG4/IA32/liboperator.a" -specs=I386specs -Wl,-q,-T,bur_elf_i386.x -nostdlib -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/CEF/Cyclic.ld.o: \
	$(AS_PROJECT_PATH)/Logical/CEF/Cyclic.ld \
	FORCE 
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/CEF/Cyclic.ld" -o "$(AS_CPU_PATH)/CEF/Cyclic.ld.o"  -O "$(AS_CPU_PATH)//CEF/Cyclic.ld.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/CEF/Init.ld.o: \
	$(AS_PROJECT_PATH)/Logical/CEF/Init.ld \
	FORCE 
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/CEF/Init.ld" -o "$(AS_CPU_PATH)/CEF/Init.ld.o"  -O "$(AS_CPU_PATH)//CEF/Init.ld.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/CEF/Exit.ld.o: \
	$(AS_PROJECT_PATH)/Logical/CEF/Exit.ld \
	FORCE 
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/CEF/Exit.ld" -o "$(AS_CPU_PATH)/CEF/Exit.ld.o"  -O "$(AS_CPU_PATH)//CEF/Exit.ld.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 



FORCE: