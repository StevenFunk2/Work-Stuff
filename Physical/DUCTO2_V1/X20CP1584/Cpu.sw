﻿<?xml version="1.0" encoding="utf-8"?>
<?AutomationStudio Version=4.2.14.119 SP?>
<SwConfiguration CpuAddress="SL1" xmlns="http://br-automation.co.at/AS/SwConfiguration">
  <TaskClass Name="Cyclic#1">
    <Task Name="IMotionCon" Source="IMotionControl.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="IMotion1" Source="IMotion1.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="CleatRoll" Source="CleatRoll.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#2">
    <Task Name="Uncoiler_1" Source="Uncoiler_1.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="MarkTable" Source="MarkTable.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="MarkRF" Source="MarkRF.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Feeder" Source="Feeder.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="SBrake" Source="SBrake.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="TDCTable" Source="TDCTable.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="TDCRFPshrs" Source="TDCRFPshrs.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="GlueApp" Source="GlueApp.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Insulmatic" Source="Insulmatic.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Pinspotter" Source="Pinspotter.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="BrakeCommo" Source="BrakeCommon.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="HydraulicB" Source="HydraulicBrakeCarriage.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="HWBwoPLC" Source="HWBwoPLC.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#3" />
  <TaskClass Name="Cyclic#4">
    <Task Name="HMIButtons" Source="HMIButtons.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Server" Source="LibAsTCP1_ST.Server.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#5" />
  <TaskClass Name="Cyclic#6" />
  <TaskClass Name="Cyclic#7" />
  <TaskClass Name="Cyclic#8" />
  <Binaries>
    <BinaryObject Name="TCData" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="sysconf" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="Role" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="User" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="iomap" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="ashwd" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="asfw" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="arconfig" Source="" Memory="SystemROM" Language="Binary" />
  </Binaries>
  <Libraries>
    <LibraryObject Name="standard" Source="Libraries.standard.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="MestekLib" Source="Libraries.MestekLib.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="AsTCP" Source="Libraries.AsTCP.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="runtime" Source="Libraries.runtime.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="asstring" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="asieccon" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="astime" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
  </Libraries>
</SwConfiguration>