UnmarkedObjectFolder := C:/code/BandR Projects/X20_CPU/X20_CPU/Logical/GlueApp
MarkedObjectFolder := C:/code/BandR\ Projects/X20_CPU/X20_CPU/Logical/GlueApp

$(AS_CPU_PATH)/GlueApp.br: \
	$(AS_PROJECT_CPU_PATH)/Cpu.per \
	$(AS_CPU_PATH)/GlueApp/GlueApp.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/GlueApp/GlueApp.ox" -o "$(AS_CPU_PATH)/GlueApp.br" -v V1.00.0 -f "$(AS_CPU_PATH)/NT.ofs" -offsetLT "$(AS_BINARIES_PATH)/$(AS_CONFIGURATION)/$(AS_PLC)/LT.ofs" -T SG4  -M IA32  -B J4.25 -extConstants -d "runtime: V* - V*,asieccon: V* - V*" -r Cyclic2 -p 8 -s "GlueApp" -L "AsIecCon: V*, asstring: V*, AsTCP: V*, astime: V*, Library: V*, MestekLib: V*, operator: V*, runtime: V*, standard: V*" -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/GlueApp/GlueApp.ox: \
	$(AS_CPU_PATH)/GlueApp/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/GlueApp/a.out" -o "$(AS_CPU_PATH)/GlueApp/GlueApp.ox" -T SG4 -r Cyclic2   -G V4.1.2  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/GlueApp/a.out: \
	$(AS_CPU_PATH)/GlueApp/Cyclic.ld.o \
	$(AS_CPU_PATH)/GlueApp/Init.ld.o \
	$(AS_CPU_PATH)/GlueApp/Exit.ld.o
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link "$(AS_CPU_PATH)/GlueApp/Cyclic.ld.o" "$(AS_CPU_PATH)/GlueApp/Init.ld.o" "$(AS_CPU_PATH)/GlueApp/Exit.ld.o"  -o "$(AS_CPU_PATH)/GlueApp/a.out"  -G V4.1.2  -T SG4  -M IA32  "-Wl,$(AS_TEMP_PATH)/Archives/$(AS_CONFIGURATION)/$(AS_PLC)/libLibrary.a" "-Wl,$(AS_SYSTEM_PATH)/J0425/SG4/IA32/libasstring.a" "-Wl,$(AS_SYSTEM_PATH)/J0425/SG4/IA32/libAsTCP.a" "-Wl,$(AS_TEMP_PATH)/Archives/$(AS_CONFIGURATION)/$(AS_PLC)/libMestekLib.a" "-Wl,$(AS_SYSTEM_PATH)/J0425/SG4/IA32/libstandard.a" "-Wl,$(AS_SYSTEM_PATH)/J0425/SG4/IA32/libAsIecCon.a" "-Wl,$(AS_SYSTEM_PATH)/J0425/SG4/IA32/libastime.a" "-Wl,$(AS_SYSTEM_PATH)/J0425/SG4/IA32/libruntime.a" "-Wl,$(AS_SYSTEM_PATH)/J0425/SG4/IA32/liboperator.a" -specs=I386specs -Wl,-q,-T,bur_elf_i386.x -nostdlib -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/GlueApp/Cyclic.ld.o: \
	$(AS_PROJECT_PATH)/Logical/GlueApp/Cyclic.ld \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/runtime/runtime.fun \
	$(AS_PROJECT_PATH)/Logical/GlueApp/Variables.var \
	$(AS_PROJECT_PATH)/Logical/Global.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/GlueApp/Cyclic.ld" -o "$(AS_CPU_PATH)/GlueApp/Cyclic.ld.o"  -O "$(AS_CPU_PATH)//GlueApp/Cyclic.ld.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/GlueApp/Init.ld.o: \
	$(AS_PROJECT_PATH)/Logical/GlueApp/Init.ld \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/runtime/runtime.fun \
	$(AS_PROJECT_PATH)/Logical/GlueApp/Variables.var \
	$(AS_PROJECT_PATH)/Logical/Global.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/GlueApp/Init.ld" -o "$(AS_CPU_PATH)/GlueApp/Init.ld.o"  -O "$(AS_CPU_PATH)//GlueApp/Init.ld.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

$(AS_CPU_PATH)/GlueApp/Exit.ld.o: \
	$(AS_PROJECT_PATH)/Logical/GlueApp/Exit.ld \
	$(AS_PROJECT_PATH)/Logical/Libraries/standard/standard.fun \
	$(AS_PROJECT_PATH)/Logical/Libraries/runtime/runtime.fun \
	$(AS_PROJECT_PATH)/Logical/GlueApp/Variables.var \
	$(AS_PROJECT_PATH)/Logical/Global.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/GlueApp/Exit.ld" -o "$(AS_CPU_PATH)/GlueApp/Exit.ld.o"  -O "$(AS_CPU_PATH)//GlueApp/Exit.ld.o.opt" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 

