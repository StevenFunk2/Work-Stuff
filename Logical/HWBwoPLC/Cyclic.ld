PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="This File Contains The Sequences For The Wrap Brakes And The LBrake With No PLC." row="3" column="0" commented="0">
		<row>
			<contact type="open" name="FBBrakeSetSignal"/>
			<line/>
			<contact type="closed" name="BrakeSequenceReset"/>
			<contact type="open" name="HWBrakeWithNoPLC"/>
			<contact type="open" name="BrakeHydraulics"/>
			<coil type="open" name="WBMachineSetStep"/>
		</row>
		<row>
			<contact type="open" name="WBMachineSetStep"/>
			<contact type="closed" name="FBBrakeSetSignal" or="true"/>
			<empty or="true"/>
			<contact type="open" name="ElectricWrapBrake"/>
			<contact type="open" name="BrakeHydraulics" or="true"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty or="true"/>
			<contact type="open" name="HWBrakeWithPLC"/>
			<contact type="open" name="BrakeActive" or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeAuto"/>
			<contact type="open" name="WBMachineSetStep"/>
			<contact type="open" name="BrakeIsRefed"/>
			<coil type="open" name="WBAutoStep"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeRequired"/>
			<contact type="open" name="WBAutoStep"/>
			<contact type="closed" name="WBSequenceComplete"/>
			<coil type="open" name="WBBrakeRequiredStep"/>
		</row>
	</network>
	<network label="" comment="Debounce Lead Of Part" row="4" column="0" commented="0">
		<row>
			<contact type="open" name="PPDTimerDone"/>
			<contact type="open" name="HWBrakeWithNoPLC"/>
			<contact type="open" name="WBBrakeRequiredStep"/>
			<coil type="open" name="WBPartPresentStep"/>
		</row>
		<row>
			<contact type="open" name="PPDTimerDone"/>
			<contact type="open" name="ElectricWrapBrake" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="BrakePartPresent"/>
			<contact type="open" name="HWBrakeWithPLC" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="WBPartPresentStep"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="The brake PLC handles the function of the next 3 rungs when it is present" row="3" column="0" commented="0">
		<row>
			<contact type="closed" name="BrakePartPresent"/>
			<contact type="open" name="WBPartPresentStep"/>
			<line/>
			<coil type="open" name="WBPartPastStep"/>
		</row>
		<row>
			<contact type="open" name="HWBrakeWithPLC" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="WBPartPastStep" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Raise Carriage Arms After Part Passes Over." row="3" column="0" commented="0">
		<row>
			<contact type="open" name="TrailDelay1Done"/>
			<contact type="open" name="WBPartPastStep"/>
			<line/>
			<coil type="open" name="WBRaiseArmsStep"/>
		</row>
		<row>
			<contact type="open" name="HWBrakeWithPLC" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="WBRaiseArmsStep" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="diWBrakeArmsUp"/>
			<contact type="open" name="WBRaiseArmsStep"/>
			<line/>
			<coil type="open" name="WBArmsUpStep"/>
		</row>
		<row>
			<contact type="open" name="HWBrakeWithPLC" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="WBArmsUpStep" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="MaterialClamped"/>
			<contact type="open" name="WBArmsUpStep"/>
			<line/>
			<coil type="open" name="WBSquareStep"/>
		</row>
		<row>
			<contact type="open" name="EjectComplete" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="WBSquareStep" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="open" name="SquareTimerDone"/>
			<contact type="open" name="WBSquareStep"/>
			<line/>
			<coil type="open" name="WBCloseClampStep"/>
		</row>
		<row>
			<contact type="open" name="HWBrakeWithPLC" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="EjectComplete" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="WBCloseClampStep" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="StartBeltTimerDone"/>
			<contact type="open" name="WBCloseClampStep"/>
			<line/>
			<coil type="open" name="WBReadyToCycleStep"/>
		</row>
		<row>
			<contact type="open" name="HWBrakeWithPLC" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="WBReadyToCycleStep" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="The individual bend seqence begins here" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="MoveCarriage"/>
			<contact type="open" name="WBReadyToCycleStep"/>
			<contact type="closed" name="BendingAgain"/>
			<coil type="open" name="MoveStarted"/>
		</row>
		<row>
			<contact type="open" name="MoveStarted" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="closed" name="ElectricWrapBrake"/>
			<contact type="closed" name="HWBCarriageInPosition"/>
			<contact type="open" name="MoveStarted"/>
			<coil type="open" name="WBNotInPositionStep"/>
		</row>
		<row>
			<contact type="open" name="ElectricWrapBrake"/>
			<contact type="closed" name="InPosition2" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="WBNotInPositionStep"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="6" column="0" commented="0">
		<row>
			<contact type="closed" name="ElectricWrapBrake"/>
			<contact type="open" name="HWBCarriageInPosition"/>
			<contact type="open" name="WBNotInPositionStep"/>
			<coil type="open" name="WBBendSeqStartStep"/>
		</row>
		<row>
			<contact type="open" name="ElectricWrapBrake"/>
			<contact type="open" name="InPosition2" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="HWBrakeWithNoPLC"/>
			<contact type="open" name="EjectComplete" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="HWBrakeWithPLC"/>
			<contact type="closed" name="MaterialClamped" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="ElectricWrapBrake"/>
			<contact type="open" name="WBMissedPart" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="WBBendSeqStartStep"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="5" column="0" commented="0">
		<row>
			<contact type="open" name="BendInProcess"/>
			<line/>
			<contact type="open" name="WBBendSeqStartStep"/>
			<coil type="open" name="WBBendingStep"/>
		</row>
		<row>
			<contact type="open" name="HWBrakeWithNoPLC"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="HWBrakeWithPLC"/>
			<contact type="closed" name="MaterialClamped" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="ElectricWrapBrake"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="WBBendingStep"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="7" column="0" commented="0">
		<row>
			<contact type="open" name="BendSequenceReset"/>
			<contact type="open" name="HWBrakeWithNoPLC"/>
			<contact type="open" name="WBBendingStep"/>
			<coil type="open" name="WB1BendDoneStep"/>
		</row>
		<row>
			<contact type="open" name="BendSequenceReset"/>
			<contact type="open" name="ElectricWrapBrake" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="closed" name="BendInProcess"/>
			<contact type="open" name="HWBrakeWithPLC" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="HWBrakeWithNoPLC"/>
			<contact type="open" name="EjectComplete" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="HWBrakeWithPLC"/>
			<contact type="closed" name="MaterialClamped" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="ElectricWrapBrake"/>
			<contact type="open" name="WBMissedPart" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="WB1BendDoneStep"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="5" column="0" commented="0">
		<row>
			<contact type="open" name="DoneBending"/>
			<line/>
			<contact type="open" name="WB1BendDoneStep"/>
			<coil type="open" name="BeginEjectStep"/>
		</row>
		<row>
			<contact type="open" name="HWBrakeWithNoPLC"/>
			<contact type="open" name="EjectComplete" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="HWBrakeWithPLC"/>
			<contact type="closed" name="MaterialClamped" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="ElectricWrapBrake"/>
			<contact type="open" name="WBMissedPart" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="BeginEjectStep"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="EjectComplete"/>
			<line/>
			<contact type="open" name="BeginEjectStep"/>
			<coil type="open" name="WBOpenClampStep"/>
		</row>
		<row>
			<contact type="open" name="ElectricWrapBrake"/>
			<contact type="open" name="WBMissedPart" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="WBOpenClampStep"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="open" name="HWBrakeWithPLC"/>
			<contact type="closed" name="MaterialClamped"/>
			<contact type="open" name="WBOpenClampStep"/>
			<coil type="open" name="WBNotClampedStep"/>
		</row>
		<row>
			<contact type="open" name="ElectricWrapBrake"/>
			<contact type="closed" name="MaterialClamped" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="HWBrakeWithNoPLC"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="WBNotClampedStep"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="EjectTimerDone"/>
			<contact type="open" name="WBNotClampedStep"/>
			<line/>
			<coil type="open" name="WBCarriageReturnStep"/>
		</row>
		<row>
			<contact type="open" name="WBCarriageReturnStep" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="MoveCarriage"/>
			<contact type="open" name="WBCarriageReturnStep"/>
			<line/>
			<coil type="open" name="ReturnMoveStart"/>
		</row>
		<row>
			<contact type="open" name="ReturnMoveStart" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="closed" name="ElectricWrapBrake"/>
			<contact type="closed" name="HWBCarriageInPosition"/>
			<contact type="open" name="ReturnMoveStart"/>
			<coil type="open" name="WBCarriageReturningStep"/>
		</row>
		<row>
			<contact type="open" name="ElectricWrapBrake"/>
			<contact type="closed" name="InPosition2" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="WBCarriageReturningStep"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="This rung also keeps this sequence from reacting to an incorrect part present signal from passing under the beam." row="4" column="0" commented="0">
		<row>
			<contact type="open" name="HWBrakeWithNoPLC"/>
			<contact type="closed" name="BrakeArmLwrInhibit"/>
			<contact type="open" name="WBCarriageReturningStep"/>
			<coil type="open" name="WBLowerCarriageArmsStep"/>
		</row>
		<row>
			<contact type="open" name="ElectricWrapBrake"/>
			<contact type="closed" name="BrakeArmLwrInhibit" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="HWBrakeWithPLC"/>
			<contact type="open" name="PositionGreaterThan12" or="true"/>
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
	<network label="" comment="Brake Carriage Is Back At Home Position." row="4" column="0" commented="0">
		<row>
			<contact type="closed" name="ElectricWrapBrake"/>
			<contact type="open" name="HWBCarriageInPosition"/>
			<contact type="open" name="WBLowerCarriageArmsStep"/>
			<coil type="open" name="WBSequenceComplete"/>
		</row>
		<row>
			<contact type="open" name="ElectricWrapBrake"/>
			<contact type="open" name="InPosition2" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="BrakePartPresent"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="WBSequenceComplete"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="TON_0" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="BrakePartPresent"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="PPDTimerDone"/>
		</row>
		<row>
			<analog type="input" name="T#250ms"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
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
			<contact type="open" name="WBPartPastStep"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="TrailDelay1Done"/>
		</row>
		<row>
			<analog type="input" name="WBPreset1"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
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
			<contact type="open" name="WBSquareStep"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="SquareTimerDone"/>
		</row>
		<row>
			<analog type="input" name="WBPreset3"/>
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
			<contact type="open" name="WBCloseClampStep"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="StartBeltTimerDone"/>
		</row>
		<row>
			<analog type="input" name="T#500ms"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="TON_7" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="WBNotClampedStep"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="EjectTimerDone"/>
		</row>
		<row>
			<analog type="input" name="T#1s"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
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
			<analog type="output" name="PositionGreaterThan12"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!RealBrakePosition &gt;= 12.0"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="The Inhibit Input Is Retasked When The System Has An L Brake With No PLC." row="1" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeBeamLwrInhibit"/>
			<line/>
			<line/>
			<coil type="open" name="LBrakeEjectorSwitch"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeArmLwrInhibit"/>
			<line/>
			<line/>
			<coil type="open" name="LBrakeEjectorHomeProx"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeBeamUpProx"/>
			<contact type="open" name="BrakeLeafHomeProx"/>
			<contact type="open" name="LBrakeEjectorHomeProx"/>
			<coil type="open" name="LBWNReady"/>
		</row>
		<row>
			<contact type="open" name="LBWN4"/>
			<line/>
			<line or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="L Brake With No PLC Sequence" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="BrakeSetButton"/>
			<contact type="open" name="LBrakeWithNoPLC"/>
			<contact type="open" name="BrakeAutoRequest"/>
			<coil type="open" name="LBWN1"/>
		</row>
		<row>
			<contact type="open" name="LBWN1" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Raise Arms" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="BrakePartPresent"/>
			<contact type="open" name="LBWN1"/>
			<contact type="open" name="BrakeRequired"/>
			<contact type="closed" name="LBWN12"/>
			<coil type="open" name="LBWN2"/>
		</row>
		<row>
			<contact type="open" name="LBWN2" or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Part Has Engaged The Hot Pins" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="MaterialClamped"/>
			<contact type="open" name="LBWN2"/>
			<line/>
			<coil type="open" name="LBWN3"/>
		</row>
		<row>
			<contact type="open" name="LBWN3" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Part Squaring Timer Is Through. Trigger Universal Bending Sequence." row="2" column="0" commented="0">
		<row>
			<contact type="open" name="LBPartSquared"/>
			<contact type="open" name="LBWN3"/>
			<line/>
			<coil type="open" name="LBWN4"/>
		</row>
		<row>
			<contact type="open" name="LBWN4" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Raise Arms When The Beam Contacts The Part. Using The Universal Sequence Step Allows The Settle Timer To Work." row="2" column="0" commented="0">
		<row>
			<contact type="open" name="WBRaiseLeafStep"/>
			<contact type="open" name="LBWN4"/>
			<line/>
			<coil type="open" name="LBWN5"/>
		</row>
		<row>
			<contact type="open" name="LBWN5" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeBeamUpProx"/>
			<contact type="open" name="LBWN5"/>
			<line/>
			<coil type="open" name="LBWN9"/>
		</row>
		<row>
			<contact type="open" name="LBWN9" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="BrakePartPresent"/>
			<contact type="open" name="LBWN9"/>
			<line/>
			<coil type="open" name="LBWN10"/>
		</row>
		<row>
			<contact type="open" name="LBWN10" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="EjectDwellDone"/>
			<contact type="open" name="LBWN10"/>
			<line/>
			<coil type="open" name="LBWN11"/>
		</row>
		<row>
			<contact type="open" name="LBWN11" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Reset Sequence When Ejector Gets Back Home" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="LBrakeEjectorHomeProx"/>
			<contact type="open" name="LBWN11"/>
			<line/>
			<coil type="open" name="LBWN12"/>
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
			<contact type="open" name="LBWN3"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="LBPartSquared"/>
		</row>
		<row>
			<analog type="input" name="WBPreset3"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="TON_5" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="LBWN5"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="LBBeamDownDone"/>
		</row>
		<row>
			<empty/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="TON_6" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="LBWN10"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="EjectDwellDone"/>
		</row>
		<row>
			<analog type="input" name="WBPreset2"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
</networks>
END_PROGRAM



















