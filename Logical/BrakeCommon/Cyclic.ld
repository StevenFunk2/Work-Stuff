PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="Convert raw feedback to an actual scaled position." row="2" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="DINT_TO_REAL"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="BrakeEncoder"/>
			<function position="bottom" type="DINT_TO_REAL"><input name="IN"/><output name="8"/></function>
			<analog type="output" name="RawBrakeEncoder"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="NE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="BrakeResolution"/>
			<function position="middle" type="NE"><input name="IN1"/><output name="1"/></function>
			<analog type="output" name="ResOK"/>
		</row>
		<row>
			<analog type="input" name="0"/>
			<function position="bottom" type="NE"><input name="IN2"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="NE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="BrakeDesired"/>
			<function position="middle" type="NE"><input name="IN1"/><output name="1"/></function>
			<analog type="output" name="BDOK"/>
		</row>
		<row>
			<analog type="input" name="0"/>
			<function position="bottom" type="NE"><input name="IN2"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="NE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="BrakeActual"/>
			<function position="middle" type="NE"><input name="IN1"/><output name="1"/></function>
			<analog type="output" name="BAOK"/>
		</row>
		<row>
			<analog type="input" name="0"/>
			<function position="bottom" type="NE"><input name="IN2"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="ResOK"/>
			<contact type="open" name="BDOK"/>
			<contact type="open" name="BAOK"/>
			<function position="top" type="Compute!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<function position="middle" type="Compute!"><input name=""/><output name="56"/></function>
			<analog type="output" name="RealBrakePosition"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<function position="bottom" type="Compute!"><input name="&lt;!RawBrakeEncoder / BrakeResolution / (BrakeDesired / BrakeActual) + BrakeReference"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="ElectricWrapBrake"/>
			<contact type="positive transition" name="BrakeAutoRequest"/>
			<contact type="open" name="BrakeHydraulics"/>
			<contact type="closed" name="BrakeManualButton"/>
			<contact type="open" name="BrakeDriveReady"/>
			<coil type="open" name="EWBAutoLatch"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="EWBAutoLatch" or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="5" column="0" commented="0">
		<row>
			<contact type="open" name="LBrakeWithNoPLC"/>
			<contact type="open" name="BrakeAutoRequest"/>
			<contact type="open" name="BrakeHydraulics"/>
			<contact type="open" name="LBWNReady"/>
			<coil type="open" name="BrakeAuto"/>
		</row>
		<row>
			<contact type="open" name="LBrakeWithPLC"/>
			<contact type="open" name="BrakeAutoRequest"/>
			<contact type="open" name="EStopClear"/>
			<line or="true"/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="HWBrakeWithNoPLC"/>
			<contact type="open" name="BrakeAutoRequest"/>
			<contact type="open" name="BrakeHydraulics"/>
			<line or="true"/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="HWBrakeWithPLC"/>
			<contact type="open" name="BrakeAutoRequest"/>
			<contact type="open" name="BrakeActive"/>
			<line or="true"/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="EWBAutoLatch"/>
			<line/>
			<line/>
			<line or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Relay physical button press to PC, The PC Will Reset This Signal." row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="BrakeSetButton"/>
			<line/>
			<line/>
			<coil type="set" name="PCBrakeSetSignal"/>
		</row>
	</network>
	<network label="" comment="PC has received set signal, updated data and replied with this signal." row="4" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="TON_1" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="FBBrakeSetSignal"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="SetSignalReset"/>
		</row>
		<row>
			<analog type="input" name="T#1s"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="SetSignalReset"/>
			<line/>
			<line/>
			<coil type="reset" name="FBBrakeSetSignal"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="BrakeSetButton"/>
			<contact type="open" name="BrakeAuto"/>
			<line/>
			<coil type="open" name="BrakeSetOK"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeSetOK"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="RunJob"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="BrakeJob"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="Compare!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<function position="middle" type="Compare!"><input name=""/><output name="56"/></function>
			<analog type="output" name="JobsDifferent"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!RunJob &lt;&gt; BrakeJob"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeSetOK"/>
			<contact type="closed" name="JobsDifferent"/>
			<contact type="open" name="BrakeHydraulics"/>
			<coil type="open" name="BrakeIsSetUp"/>
		</row>
		<row>
			<contact type="open" name="BrakeIsSetUp" or="true"/>
			<empty or="true"/>
			<contact type="open" name="BrakeActive" or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="BrakeIsRefed"/>
			<function position="top" type="ADD"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="BrakeStatus"/>
			<function position="middle" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="BrakeStatus"/>
		</row>
		<row>
			<analog type="input" name="1"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="negative transition" name="BrakeIsRefed"/>
			<function position="top" type="SUB"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="BrakeStatus"/>
			<function position="middle" type="SUB"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="BrakeStatus"/>
		</row>
		<row>
			<analog type="input" name="1"/>
			<function position="bottom" type="SUB"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="The next 4 rungs select the target for all brakes." row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="WBArmsUpStep"/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<contact type="positive transition" name="RaiseSquareArms" or="true"/>
			<analog type="input" name="0"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="WBIndex"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="WBBendSeqStartStep"/>
			<function position="top" type="ADD"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="WBIndex"/>
			<function position="middle" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="WBIndex"/>
		</row>
		<row>
			<analog type="input" name="1"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="positive transition" name="WBBendSeqStartStep"/>
			<line/>
			<line/>
			<coil type="open" name="MakeTargets"/>
		</row>
		<row>
			<contact type="positive transition" name="WBArmsUpStep"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="positive transition" name="FBBrakeSetSignal"/>
			<contact type="open" name="LBrakeWithPLC" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="LBrakeWithNoPLC" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="7" column="0" commented="0">
		<row>
			<contact type="open" name="MakeTargets"/>
			<function position="top" type="MUX"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="WBIndex"/>
			<function position="middle" type="MUX"><input name="K" extensible="true"/><output name="40"/></function>
			<analog type="output" name="BrakeCarriageTarget"/>
		</row>
		<row>
			<analog type="input" name="BrakeTarget0"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="BrakeTarget1"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="BrakeTarget2"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="BrakeTarget3"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="-1.0"/>
			<function position="bottom" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="GT"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="BrakeCarriageTarget"/>
			<function position="middle" type="GT"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="BCTGreatThan0"/>
		</row>
		<row>
			<analog type="input" name="0.0"/>
			<function position="bottom" type="GT"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="WB1BendDoneStep"/>
			<contact type="open" name="BCTGreatThan0"/>
			<contact type="closed" name="BeginEjectStep"/>
			<coil type="open" name="BendingAgain"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="WB1BendDoneStep"/>
			<contact type="closed" name="BCTGreatThan0"/>
			<line/>
			<coil type="open" name="DoneBending"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="WBCarriageReturnStep"/>
			<function position="top" type="SUB"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="BrakeReference"/>
			<function position="middle" type="SUB"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="BrakeCarriageTarget"/>
		</row>
		<row>
			<analog type="input" name="1.0"/>
			<function position="bottom" type="SUB"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="BrakeSingleCycle"/>
			<contact type="open" name="BrakeHydraulics"/>
			<contact type="closed" name="BrakeAutoRequest"/>
			<coil type="set" name="SingleCyclingBrake"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="BrakeActive" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="negative transition" name="WBCheckLeafStep"/>
			<line/>
			<line/>
			<coil type="reset" name="SingleCyclingBrake"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="positive transition" name="BrakeSetButton"/>
			<line/>
			<contact type="open" name="BrakeAuto"/>
			<contact type="open" name="HWBrakeWithNoPLC"/>
			<coil type="open" name="SetBendingSolenoids"/>
		</row>
		<row>
			<contact type="positive transition" name="BrakeAutoRequest"/>
			<contact type="open" name="LBrakeWithNoPLC" or="true"/>
			<empty or="true"/>
			<contact type="open" name="ElectricWrapBrake" or="true"/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="SetBendingSolenoids"/>
			<line or="true"/>
			<empty or="true"/>
			<contact type="open" name="LBrakeWithNoPLC" or="true"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty or="true"/>
			<contact type="open" name="ElectricWrapBrake" or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="SetBendingSolenoids"/>
			<line/>
			<line/>
			<coil type="open" name="BendingLatch"/>
		</row>
		<row>
			<contact type="open" name="SingleCyclingBrake" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Universal Bending Sequence For Iowa Brakes With No PLC Including Electric Servo Wrap Brake" row="4" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeSingleCycle"/>
			<line/>
			<contact type="open" name="BendingLatch"/>
			<contact type="closed" name="BendSequenceReset"/>
			<contact type="open" name="BrakeHydraulics"/>
			<coil type="open" name="WBCheckLeafStep"/>
		</row>
		<row>
			<contact type="positive transition" name="WBBendSeqStartStep"/>
			<contact type="closed" name="EjectComplete" or="true"/>
			<empty/>
			<empty or="true"/>
			<contact type="open" name="BrakeActive" or="true"/>
			<empty/>
		</row>
		<row>
			<contact type="positive transition" name="LBWN4"/>
			<line or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="WBCheckLeafStep"/>
			<line or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeLeafHomeProx"/>
			<contact type="open" name="WBCheckLeafStep"/>
			<line/>
			<coil type="open" name="WBCheckBeamStep"/>
		</row>
		<row>
			<contact type="open" name="WBCheckBeamStep" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeBeamUpProx"/>
			<contact type="open" name="WBCheckBeamStep"/>
			<line/>
			<coil type="open" name="WBLowerBeamStep"/>
		</row>
		<row>
			<contact type="open" name="WBLowerBeamStep" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeBeamDownProx"/>
			<contact type="open" name="WBLowerBeamStep"/>
			<line/>
			<coil type="open" name="WBBeamSettleStep"/>
		</row>
		<row>
			<contact type="open" name="WBBeamSettleStep" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="BeamSettleTimerDone"/>
			<contact type="open" name="WBBeamSettleStep"/>
			<line/>
			<coil type="open" name="WBRaiseLeafStep"/>
		</row>
		<row>
			<contact type="open" name="WBRaiseLeafStep" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="BrakeLeafHomeProx"/>
			<contact type="open" name="WBRaiseLeafStep"/>
			<line/>
			<coil type="open" name="WBLeafNotHomeStep"/>
		</row>
		<row>
			<contact type="open" name="WBLeafNotHomeStep" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="RaiseLeafTimerDone"/>
			<contact type="open" name="WBLeafNotHomeStep"/>
			<line/>
			<coil type="open" name="WBStopLeafStep"/>
		</row>
		<row>
			<contact type="open" name="WBStopLeafStep" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="StopLeafTimerDone"/>
			<contact type="open" name="WBStopLeafStep"/>
			<line/>
			<coil type="open" name="WBLowerLeafStep"/>
		</row>
		<row>
			<contact type="open" name="WBLowerLeafStep" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeLeafHomeProx"/>
			<contact type="open" name="WBLowerLeafStep"/>
			<line/>
			<coil type="open" name="WBRaiseBeamStep"/>
		</row>
		<row>
			<contact type="open" name="WBRaiseBeamStep" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeBeamUpProx"/>
			<contact type="open" name="WBRaiseBeamStep"/>
			<line/>
			<coil type="open" name="BendSequenceReset"/>
		</row>
		<row>
			<contact type="open" name="BendSequenceReset" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="TON_2" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="WBBeamSettleStep"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="BeamSettleTimerDone"/>
		</row>
		<row>
			<analog type="input" name="WBPreset4"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="TON_3" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="WBRaiseLeafStep"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="RaiseLeafTimerDone"/>
		</row>
		<row>
			<analog type="input" name="WBPreset5"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="TON_4" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="WBStopLeafStep"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="StopLeafTimerDone"/>
		</row>
		<row>
			<analog type="input" name="T#200ms"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="Outputs For Hydraulic Wrap Brake With No PLC And Electric Servo Wrap Brake" row="4" column="0" commented="0">
		<row>
			<contact type="open" name="HWBrakeWithNoPLC"/>
			<contact type="open" name="BrakeArmLwrInhibit"/>
			<line/>
			<coil type="open" name="CarriageArmRaise"/>
		</row>
		<row>
			<contact type="open" name="ElectricWrapBrake" or="true"/>
			<empty or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="WBRaiseArmsStep"/>
			<contact type="closed" name="WBLowerCarriageArmsStep" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="LBWN2"/>
			<contact type="closed" name="LBWN5" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="WBMachineSetStep"/>
			<contact type="closed" name="WBRaiseArmsStep"/>
			<contact type="closed" name="BrakeArmLwrInhibit"/>
			<coil type="open" name="CarriageArmLower"/>
		</row>
		<row>
			<contact type="open" name="WBLowerCarriageArmsStep"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="WBMachineSetStep"/>
			<contact type="closed" name="WBRaiseArmsStep"/>
			<line/>
			<coil type="open" name="CarriageClampClose"/>
		</row>
		<row>
			<contact type="open" name="WBCloseClampStep"/>
			<contact type="closed" name="WBOpenClampStep" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="WBLowerCarriageArmsStep"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="SetBendingSolenoids"/>
			<contact type="closed" name="WBLowerBeamStep"/>
			<line/>
			<coil type="open" name="BrakeBeamRaise"/>
		</row>
		<row>
			<contact type="open" name="WBCheckBeamStep" or="true"/>
			<empty or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="WBRaiseBeamStep"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="WBLowerBeamStep"/>
			<contact type="closed" name="WBRaiseBeamStep"/>
			<contact type="closed" name="BrakeBeamLwrInhibit"/>
			<coil type="open" name="BrakeBeamLower"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<contact type="open" name="LBrakeWithNoPLC" or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="WBRaiseLeafStep"/>
			<contact type="closed" name="WBStopLeafStep"/>
			<line/>
			<coil type="open" name="BrakeLeafRaise"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="SetBendingSolenoids"/>
			<contact type="closed" name="WBRaiseLeafStep"/>
			<line/>
			<coil type="open" name="BrakeLeafLower"/>
		</row>
		<row>
			<contact type="open" name="WBCheckLeafStep" or="true"/>
			<empty or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="WBLowerLeafStep"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="closed" name="BrakeAuto"/>
			<contact type="open" name="BrakeHydraulics"/>
			<line/>
			<coil type="open" name="BrakeManualIndicator"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="ExitBeltsOn"/>
			<contact type="open" name="InsulationRequired"/>
			<contact type="open" name="PartPresentPSpotter"/>
			<contact type="closed" name="WBRaiseArmsStep"/>
			<coil type="open" name="BrakeConveyorLow"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty or="true"/>
			<contact type="open" name="WBReadyToCycleStep" or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="WBRaiseArmsStep"/>
			<contact type="open" name="ExitBeltsOn"/>
			<contact type="closed" name="PartPresentPSpotter"/>
			<coil type="open" name="BrakeConveyorHigh"/>
		</row>
		<row>
			<contact type="open" name="WBReadyToCycleStep" or="true"/>
			<empty or="true"/>
			<contact type="closed" name="InsulationRequired" or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="LBWN10"/>
			<contact type="closed" name="LBWN11"/>
			<contact type="open" name="LBrakeEjectorSwitch"/>
			<coil type="open" name="LBrakePartEjectSolenoid"/>
		</row>
		<row>
			<contact type="open" name="ElectricWrapBrake"/>
			<contact type="open" name="BrakeManualIndicator"/>
			<line or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeAuto"/>
			<line/>
			<line/>
			<coil type="open" name="BrakeAutoIndicator"/>
		</row>
	</network>
</networks>
END_PROGRAM







































