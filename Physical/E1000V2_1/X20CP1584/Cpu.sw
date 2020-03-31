<?xml version="1.0" encoding="utf-8"?>
<?AutomationStudio Version=4.2.5.388?>
<SwConfiguration CpuAddress="SL1" xmlns="http://br-automation.co.at/AS/SwConfiguration">
  <TaskClass Name="Cyclic#1">
    <Task Name="EFdrHydDrv" Source="EFdrHydDrv.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="CEF" Source="CEF.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="IMotion2" Source="IMotion2.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#2">
    <Task Name="SysCheck" Source="SysCheck.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="E2Feeder" Source="E2Feeder.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="PMaster" Source="PMaster.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Pinspotter" Source="Pinspotter.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="E_FWB" Source="E_FWB.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="DH800" Source="DH800.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#3" />
  <TaskClass Name="Cyclic#4">
    <Task Name="Server" Source="LibAsTCP1_ST.Server.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#5" />
  <TaskClass Name="Cyclic#6" />
  <TaskClass Name="Cyclic#7" />
  <TaskClass Name="Cyclic#8" />
  <Binaries>
    <BinaryObject Name="TCData" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="arconfig" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="asfw" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="ashwd" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="iomap" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="User" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="Role" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="sysconf" Source="" Memory="SystemROM" Language="Binary" />
  </Binaries>
  <Libraries>
    <LibraryObject Name="asstring" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="runtime" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="asieccon" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="standard" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="astime" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="astcp" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
  </Libraries>
</SwConfiguration>