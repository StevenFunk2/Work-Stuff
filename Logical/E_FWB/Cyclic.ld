PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="EQ"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="EngelBrakeModelNumber"/>
			<function position="middle" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="ModelIs1"/>
		</row>
		<row>
			<analog type="input" name="1"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
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
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="TSBrakeDriveResetButton"/>
			<contact type="closed" name="BrakeDriveReady"/>
			<line/>
			<coil type="open" name="BrakeDriveReset"/>
		</row>
		<row>
			<contact type="open" name="FWBResetPB" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="TSBrakeHydraulicsButton"/>
			<contact type="open" name="BrakeHydraulicMS"/>
			<line/>
			<coil type="open" name="BHUnlatch"/>
		</row>
		<row>
			<contact type="negative transition" name="BrakeHydraulics" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="TSBrakeHydraulicsButton"/>
			<contact type="closed" name="BHUnlatch"/>
			<contact type="open" name="EStopClear"/>
			<coil type="open" name="BrakeHydraulicMS"/>
		</row>
		<row>
			<contact type="positive transition" name="BrakeHydraulics" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="BrakeHydraulicMS" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeHydraulicMS"/>
			<line/>
			<line/>
			<coil type="open" name="BrakeInfeedConveyorMotor"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeInfeedConveyorMotor"/>
			<contact type="closed" name="PartPresentPSpotter"/>
			<line/>
			<coil type="open" name="BrakeHiSpeedRelay"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="LOMSpeedSelect1" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeInfeedConveyorMotor"/>
			<contact type="open" name="LOMSpeedSelect2"/>
			<contact type="open" name="PartPresentPSpotter"/>
			<coil type="open" name="BrakeLowSpeedRelay"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeHydraulicMS"/>
			<line/>
			<line/>
			<coil type="open" name="BrakeOutfeedConveyorMotor"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="BrakeAutoButton"/>
			<contact type="open" name="BrakeAutoRequest"/>
			<line/>
			<coil type="open" name="BrakeAutoUnlatch"/>
		</row>
		<row>
			<contact type="closed" name="BrakeDriveReady" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="BrakeAutoButton"/>
			<contact type="closed" name="BrakeAutoUnlatch"/>
			<contact type="open" name="EStopClear"/>
			<contact type="open" name="BrakeHydraulicMS"/>
			<coil type="open" name="BrakeAutoRequest"/>
		</row>
		<row>
			<contact type="open" name="BrakeAutoRequest" or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="BrakeAuto Is Passed In The Server." row="1" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeAutoRequest"/>
			<line/>
			<line/>
			<coil type="open" name="BrakeAuto"/>
		</row>
	</network>
	<network label="" comment="This One goes To The World Outside. Physical Light And PC Button" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeAutoRequest"/>
			<line/>
			<line/>
			<coil type="open" name="BrakeAutoIndicator"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="negative transition" name="BrakeAutoRequest"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="-1"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="MotionStatus2"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="BackGaugeJogInPB"/>
			<contact type="closed" name="BrakeAutoRequest"/>
			<contact type="open" name="BrakeDriveReady"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="5"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="MotionStatus2"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="EQ"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="MotionStatus2"/>
			<function position="middle" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="JoggingIn"/>
		</row>
		<row>
			<analog type="input" name="8"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="negative transition" name="BackGaugeJogInPB"/>
			<contact type="open" name="JoggingIn"/>
			<line/>
			<coil type="set" name="StopFlag2"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="BackGaugeJogOutPB"/>
			<contact type="closed" name="BrakeAutoRequest"/>
			<contact type="open" name="BrakeDriveReady"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="4"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="MotionStatus2"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="EQ"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="MotionStatus2"/>
			<function position="middle" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="JoggingOut"/>
		</row>
		<row>
			<analog type="input" name="7"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="negative transition" name="BackGaugeJogOutPB"/>
			<contact type="open" name="JoggingOut"/>
			<line/>
			<coil type="set" name="StopFlag2"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="FWBHome6"/>
			<contact type="closed" name="BrakeRefSignal"/>
			<line/>
			<coil type="open" name="BrakeIsRefed"/>
		</row>
		<row>
			<contact type="open" name="BrakeIsRefed" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Both E1000 And E2000 Use This." row="1" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeIsRefed"/>
			<line/>
			<line/>
			<coil type="open" name="ButtonStatus[21]"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="BrakeRefSignal"/>
			<contact type="closed" name="FWBResetPB"/>
			<contact type="open" name="BrakeAutoRequest"/>
			<contact type="closed" name="FWBHome6"/>
			<coil type="open" name="FWBHome1"/>
		</row>
		<row>
			<contact type="open" name="FWBHome1" or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="BackGaugeHomeLS"/>
			<contact type="open" name="FWBHome1"/>
			<line/>
			<coil type="open" name="FWBHome2"/>
		</row>
		<row>
			<contact type="open" name="FWBHome2" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Move In To The Limit Switch" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="JoggingOut"/>
			<contact type="open" name="FWBHome2"/>
			<line/>
			<coil type="open" name="FWBHome3"/>
		</row>
		<row>
			<contact type="open" name="FWBHome3" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="The Motion Routine Stops The BackGauge At The Limit Switch" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="BackGaugeHomeLS"/>
			<contact type="open" name="FWBHome3"/>
			<line/>
			<coil type="open" name="FWBHome4"/>
		</row>
		<row>
			<contact type="open" name="FWBHome4" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="JoggingIn"/>
			<contact type="open" name="FWBHome4"/>
			<line/>
			<coil type="open" name="FWBHome5"/>
		</row>
		<row>
			<contact type="open" name="FWBHome5" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="FWBResetTimerDone"/>
			<contact type="open" name="FWBHome5"/>
			<line/>
			<coil type="open" name="FWBHome6"/>
		</row>
		<row>
			<contact type="open" name="FWBHome6" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Set MotionStatus2 to -1 in case of reset or no auto" row="2" column="0" commented="0">
		<row>
			<contact type="negative transition" name="FWBHome1"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="-1"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="MotionStatus2"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeRefSignal"/>
			<line/>
			<line/>
			<coil type="reset" name="BrakeRefSignal"/>
		</row>
	</network>
	<network label="" comment="Move Out Off OfThe Limit Switch If Necessary" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="FWBHome1"/>
			<contact type="closed" name="FWBHome2"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="4"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="MotionStatus2"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="FWBHome2"/>
			<line/>
			<line/>
			<coil type="set" name="StopFlag2"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="FWBHome3"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="5"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="MotionStatus2"/>
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
			<contact type="open" name="FWBHome5"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="FWBResetTimerDone"/>
		</row>
		<row>
			<analog type="input" name="T#2s"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="FWBHome5"/>
			<line/>
			<line/>
			<coil type="open" name="BrakeEncoderReset"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="FWBResetPB"/>
			<line/>
			<line/>
			<coil type="set" name="PCBrakeSetSignal"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="FWBResetPB"/>
			<line/>
			<line/>
			<coil type="set" name="PinspotterSetSignal"/>
		</row>
	</network>
	<network label="" comment="Use Make CustomLTTable channel." row="1" column="0" commented="0">
		<row>
			<contact type="open" name="PinspotterSetSignal"/>
			<line/>
			<line/>
			<coil type="open" name="MakeCustomLTTable"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="FBBrakeSetSignal"/>
			<line/>
			<line/>
			<coil type="reset" name="Bend1Required"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="Bend2Required"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="FBBrakeSetSignal"/>
			<line/>
			<line/>
			<coil type="reset" name="Bend3Required"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="Bend4Required"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="GT"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="BrakeTarget0"/>
			<function position="middle" type="GT"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="BT0GT0"/>
		</row>
		<row>
			<analog type="input" name="0.0"/>
			<function position="bottom" type="GT"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="FBBrakeSetSignal"/>
			<contact type="open" name="BT0GT0"/>
			<line/>
			<coil type="set" name="Bend1Required"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="GT"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="BrakeTarget1"/>
			<function position="middle" type="GT"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="BT1GT0"/>
		</row>
		<row>
			<analog type="input" name="0.0"/>
			<function position="bottom" type="GT"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="FBBrakeSetSignal"/>
			<contact type="open" name="BT1GT0"/>
			<line/>
			<coil type="set" name="Bend2Required"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="GT"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="BrakeTarget2"/>
			<function position="middle" type="GT"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="BT2GT0"/>
		</row>
		<row>
			<analog type="input" name="0.0"/>
			<function position="bottom" type="GT"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="FBBrakeSetSignal"/>
			<contact type="open" name="BT2GT0"/>
			<line/>
			<coil type="set" name="Bend3Required"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="GT"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="BrakeTarget3"/>
			<function position="middle" type="GT"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="BT3GT0"/>
		</row>
		<row>
			<analog type="input" name="0.0"/>
			<function position="bottom" type="GT"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="FBBrakeSetSignal"/>
			<contact type="open" name="BT3GT0"/>
			<line/>
			<coil type="set" name="Bend4Required"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="FBBrakeSetSignal"/>
			<contact type="open" name="Bend1Required"/>
			<contact type="closed" name="Bend2Required"/>
			<contact type="closed" name="Bend3Required"/>
			<contact type="closed" name="Bend4Required"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<contact type="open" name="AutoSequenceDone" or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="BrakeTarget0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="BrakeCarriageTarget"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="1"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="BendsNeeded"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="FBBrakeSetSignal"/>
			<contact type="open" name="Bend2Required"/>
			<contact type="closed" name="Bend3Required"/>
			<contact type="closed" name="Bend4Required"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<contact type="open" name="AutoSequenceDone" or="true"/>
			<empty/>
			<empty/>
			<analog type="input" name="BrakeTarget1"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="BrakeCarriageTarget"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="2"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="BendsNeeded"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="FBBrakeSetSignal"/>
			<contact type="open" name="Bend3Required"/>
			<contact type="closed" name="Bend4Required"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<contact type="open" name="AutoSequenceDone" or="true"/>
			<empty/>
			<analog type="input" name="BrakeTarget2"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="BrakeCarriageTarget"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="3"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="BendsNeeded"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="FBBrakeSetSignal"/>
			<contact type="open" name="Bend4Required"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<contact type="open" name="AutoSequenceDone" or="true"/>
			<analog type="input" name="BrakeTarget3"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="BrakeCarriageTarget"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="4"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="BendsNeeded"/>
		</row>
	</network>
	<network label="" comment="Go To Position For 1st Bend" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="FBBrakeSetSignal"/>
			<contact type="open" name="BrakeAutoRequest"/>
			<contact type="open" name="Bend1Required"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="1"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="MotionStatus2"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="FBBrakeSetSignal"/>
			<contact type="open" name="BrakeAutoRequest"/>
			<line/>
			<coil type="open" name="BendingLatch"/>
		</row>
		<row>
			<contact type="open" name="BendingLatch" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="FBBrakeSetSignal"/>
			<line/>
			<line/>
			<coil type="reset" name="FBBrakeSetSignal"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeIsRefed"/>
			<contact type="open" name="BendingLatch"/>
			<line/>
			<coil type="open" name="ReadyToBend"/>
		</row>
		<row>
			<contact type="open" name="ReadyToBend" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Auto Backgauge Sequence" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="SmallPartsPusherLS"/>
			<contact type="open" name="BrakeRequired"/>
			<contact type="open" name="ReadyToBend"/>
			<contact type="closed" name="AutoSequenceDone"/>
			<coil type="open" name="RaiseSquareArms"/>
		</row>
		<row>
			<contact type="open" name="RaiseSquareArms" or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="SquareArmsNotMoving"/>
			<contact type="open" name="RaiseSquareArms"/>
			<line/>
			<coil type="open" name="Watch4Stops"/>
		</row>
		<row>
			<contact type="open" name="Watch4Stops" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="GuideSideStopLS"/>
			<contact type="open" name="OperatorSideStopLS"/>
			<contact type="open" name="Watch4Stops"/>
			<contact type="closed" name="SingleBendReset"/>
			<coil type="open" name="RunSquareTimer"/>
		</row>
		<row>
			<contact type="open" name="RunSquareTimer"/>
			<line or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="SquareTmrDone"/>
			<contact type="open" name="RunSquareTimer"/>
			<line/>
			<coil type="open" name="LowerBeam"/>
		</row>
		<row>
			<contact type="open" name="LowerBeam" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeClampDownLS"/>
			<contact type="open" name="LowerBeam"/>
			<line/>
			<coil type="open" name="StartClampTimer"/>
		</row>
		<row>
			<contact type="open" name="StartClampTimer" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="ClampSettled"/>
			<contact type="open" name="StartClampTimer"/>
			<line/>
			<coil type="open" name="RaiseLeaf"/>
		</row>
		<row>
			<contact type="open" name="RaiseLeaf" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="FormHeadUpLS"/>
			<contact type="open" name="RaiseLeaf"/>
			<line/>
			<coil type="open" name="StartLeafTimer"/>
		</row>
		<row>
			<contact type="open" name="StartLeafTimer" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="LeafSettled"/>
			<contact type="open" name="StartLeafTimer"/>
			<line/>
			<coil type="open" name="LowerLeaf"/>
		</row>
		<row>
			<contact type="open" name="LowerLeaf" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeDriveReady"/>
			<contact type="open" name="StartLeafTimer"/>
			<line/>
			<coil type="open" name="RepositionBackGauge"/>
		</row>
		<row>
			<contact type="open" name="RepositionBackGauge" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="InPosition2"/>
			<contact type="open" name="RepositionBackGauge"/>
			<line/>
			<coil type="open" name="Wait4Move"/>
		</row>
		<row>
			<contact type="open" name="Wait4Move" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="InPosition2"/>
			<contact type="open" name="Wait4Move"/>
			<line/>
			<coil type="open" name="DisableDrive"/>
		</row>
		<row>
			<contact type="open" name="DisableDrive" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="FormHeadDownLS"/>
			<contact type="open" name="DisableDrive"/>
			<contact type="open" name="LowerLeaf"/>
			<coil type="open" name="OpenLatch1"/>
		</row>
		<row>
			<contact type="open" name="OpenLatch1" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="StopsTimerDone"/>
			<contact type="open" name="OpenLatch1"/>
			<line/>
			<coil type="open" name="StopsDone"/>
		</row>
		<row>
			<contact type="open" name="StopsDone" or="true"/>
			<empty/>
			<empty/>
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
			<analog type="input" name="BendsNeeded"/>
			<function position="middle" type="GT"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="BendsGT0"/>
		</row>
		<row>
			<analog type="input" name="0"/>
			<function position="bottom" type="GT"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="BendsGT0"/>
			<contact type="open" name="StopsDone"/>
			<line/>
			<coil type="open" name="SingleBendReset"/>
		</row>
		<row>
			<contact type="open" name="SingleBendReset" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="BendsGT0"/>
			<contact type="open" name="OpenLatch1"/>
			<line/>
			<coil type="open" name="StartRearEject"/>
		</row>
		<row>
			<contact type="open" name="StartRearEject" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeClampUpLS"/>
			<contact type="open" name="StartRearEject"/>
			<line/>
			<coil type="open" name="Look4Reset"/>
		</row>
		<row>
			<contact type="open" name="Look4Reset" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="negative transition" name="RearEjectResetLimitSwitch"/>
			<contact type="open" name="Look4Reset"/>
			<line/>
			<coil type="open" name="AutoSequenceDone"/>
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
			<contact type="open" name="OpenLatch1"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="StopsTimerDone"/>
		</row>
		<row>
			<analog type="input" name="T#750ms"/>
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
			<contact type="open" name="RaiseSquareArms"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="SquareArmsNotMoving"/>
		</row>
		<row>
			<analog type="input" name="T#4s"/>
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
			<contact type="open" name="RunSquareTimer"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="SquareTmrDone"/>
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
			<contact type="open" name="StartClampTimer"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="ClampSettled"/>
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
			<functionblock position="header" name="TON_4" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="StartLeafTimer"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="LeafSettled"/>
		</row>
		<row>
			<analog type="input" name="WBPreset5"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="RaiseLeaf"/>
			<function position="top" type="SUB"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="BendsNeeded"/>
			<function position="middle" type="SUB"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="BendsNeeded"/>
		</row>
		<row>
			<analog type="input" name="1"/>
			<function position="bottom" type="SUB"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="EQ"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="BendsNeeded"/>
			<function position="middle" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="BNIs0"/>
		</row>
		<row>
			<analog type="input" name="0"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="RaiseLeaf"/>
			<contact type="open" name="BNIs0"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="BrakeTarget0"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="BrakeCarriageTarget"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="GT"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="BrakeTarget1"/>
			<function position="middle" type="GT"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="BT1GT0"/>
		</row>
		<row>
			<analog type="input" name="0.0"/>
			<function position="bottom" type="GT"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="RaiseLeaf"/>
			<contact type="open" name="BNIs0"/>
			<contact type="open" name="BT1GT0"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="BrakeTarget1"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="BrakeCarriageTarget"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="GT"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="BrakeTarget2"/>
			<function position="middle" type="GT"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="BT2GT0"/>
		</row>
		<row>
			<analog type="input" name="0.0"/>
			<function position="bottom" type="GT"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="RaiseLeaf"/>
			<contact type="open" name="BNIs0"/>
			<contact type="open" name="BT2GT0"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="BrakeTarget2"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="BrakeCarriageTarget"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="EQ"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="BendsNeeded"/>
			<function position="middle" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="BNIs1"/>
		</row>
		<row>
			<analog type="input" name="1"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="RaiseLeaf"/>
			<contact type="open" name="BNIs1"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="BrakeTarget0"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="BrakeCarriageTarget"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="EQ"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="BendsNeeded"/>
			<function position="middle" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="BNIs2"/>
		</row>
		<row>
			<analog type="input" name="2"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="RaiseLeaf"/>
			<contact type="open" name="BNIs2"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="BrakeTarget1"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="BrakeCarriageTarget"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="EQ"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="BendsNeeded"/>
			<function position="middle" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="BNIs3"/>
		</row>
		<row>
			<analog type="input" name="3"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="RaiseLeaf"/>
			<contact type="open" name="BNIs3"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="BrakeTarget2"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="BrakeCarriageTarget"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="RepositionBackGauge"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="1"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="MotionStatus2"/>
		</row>
	</network>
	<network label="" comment="Manual Clamp Button Sequence" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="ManualClampPB"/>
			<contact type="closed" name="FWBResetPB"/>
			<contact type="closed" name="MCPB6"/>
			<contact type="open" name="BrakeHydraulicMS"/>
			<coil type="open" name="MCPB0"/>
		</row>
		<row>
			<contact type="open" name="MCPB0" or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="FormHeadDownLS"/>
			<contact type="open" name="MCPB0"/>
			<line/>
			<coil type="open" name="MCPB1"/>
		</row>
		<row>
			<contact type="open" name="MCPB1" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeClampDownLS"/>
			<contact type="open" name="MCPB1"/>
			<line/>
			<coil type="open" name="MCPB2"/>
		</row>
		<row>
			<contact type="open" name="MCPB2" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="FormHeadUpLS"/>
			<contact type="open" name="MCPB2"/>
			<line/>
			<coil type="open" name="MCPB3"/>
		</row>
		<row>
			<contact type="open" name="MCPB3" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="MCPBTimerDone"/>
			<contact type="open" name="MCPB3"/>
			<line/>
			<coil type="open" name="MCPB4"/>
		</row>
		<row>
			<contact type="open" name="MCPB4" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="FormHeadDownLS"/>
			<contact type="open" name="MCPB4"/>
			<line/>
			<coil type="open" name="MCPB5"/>
		</row>
		<row>
			<contact type="open" name="MCPB5" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeClampUpLS"/>
			<contact type="open" name="MCPB5"/>
			<line/>
			<coil type="open" name="MCPB6"/>
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
			<contact type="open" name="MCPB3"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="MCPBTimerDone"/>
		</row>
		<row>
			<analog type="input" name="WBPreset5"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="negative transition" name="RearEjectResetLimitSwitch"/>
			<line/>
			<line/>
			<coil type="open" name="PushPartUnlatch"/>
		</row>
		<row>
			<contact type="negative transition" name="BrakeAutoRequest" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeAutoRequest"/>
			<contact type="closed" name="BrakeRequired"/>
			<contact type="negative transition" name="SmallPartsPusherLS"/>
			<contact type="closed" name="PushPartUnlatch"/>
			<coil type="open" name="PushPart"/>
		</row>
		<row>
			<contact type="open" name="PushPart"/>
			<line/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="RaiseSquareArms"/>
			<contact type="closed" name="RaiseLeaf"/>
			<contact type="closed" name="RotateStopsOut"/>
			<coil type="open" name="BrakeStopsInSolenoid"/>
		</row>
		<row>
			<contact type="open" name="OpenLatch1"/>
			<contact type="closed" name="StartRearEject" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="open" name="BendingLatch"/>
			<contact type="closed" name="RaiseSquareArms"/>
			<line/>
			<coil type="open" name="BrakeStopsOutSolenoid"/>
		</row>
		<row>
			<contact type="open" name="RaiseLeaf"/>
			<contact type="closed" name="OpenLatch1" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="StartRearEject"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="RotateStopsOut"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="RaiseSquareArms"/>
			<contact type="closed" name="RaiseLeaf"/>
			<contact type="closed" name="SmallPartsPusherLS"/>
			<coil type="open" name="SmallPartPusherFwdSolenoid"/>
		</row>
		<row>
			<contact type="open" name="OpenLatch1"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="PushPart"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="BendingLatch"/>
			<contact type="closed" name="RaiseSquareArms"/>
			<contact type="closed" name="PushPart"/>
			<coil type="open" name="SmallPartPusherRevSolenoid"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="SmallPartsPusherLS"/>
			<line or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="TON_8" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="BrakeClampDownLS"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="BCDLSDelay"/>
		</row>
		<row>
			<analog type="input" name="T#250ms"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="open" name="LowerBeam"/>
			<contact type="closed" name="StartRearEject"/>
			<contact type="closed" name="BCDLSDelay"/>
			<coil type="open" name="BrakeBeamLower"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<contact type="open" name="ModelIs1" or="true"/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="MCPB1"/>
			<contact type="closed" name="MCPB5"/>
			<contact type="closed" name="BrakeClampDownLS" or="true"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<contact type="open" name="ModelIs1" or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="TP_0" type="TP"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TP"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="positive transition" name="BrakeStopsInSolenoid"/>
			<functionblock position="middle" type="TP"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="UnclampDelay"/>
		</row>
		<row>
			<analog type="input" name="T#500ms"/>
			<functionblock position="bottom" type="TP"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="BendingLatch"/>
			<contact type="closed" name="LowerBeam"/>
			<contact type="closed" name="UnclampDelay"/>
			<contact type="closed" name="BrakeClampUpLS"/>
			<contact type="closed" name="MCPB1"/>
			<coil type="open" name="BrakeBeamRaise"/>
		</row>
		<row>
			<contact type="open" name="StartRearEject"/>
			<line/>
			<line or="true"/>
			<empty/>
			<empty or="true"/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="MCPB5"/>
			<line/>
			<line/>
			<line/>
			<line or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="RaiseLeaf"/>
			<contact type="closed" name="LowerLeaf"/>
			<line/>
			<coil type="open" name="FormHeadUpSolenoid"/>
		</row>
		<row>
			<contact type="open" name="MCPB2"/>
			<contact type="closed" name="MCPB4" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="6" column="0" commented="0">
		<row>
			<contact type="open" name="BendingLatch"/>
			<contact type="closed" name="RaiseLeaf"/>
			<contact type="closed" name="FormHeadDownLS"/>
			<coil type="open" name="FormHeadDownSolenoid"/>
		</row>
		<row>
			<contact type="open" name="LowerLeaf"/>
			<contact type="closed" name="FormHeadDownLS"/>
			<line or="true"/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="MCPB0"/>
			<contact type="closed" name="MCPB2"/>
			<contact type="closed" name="FormHeadDownLS" or="true"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<contact type="open" name="ModelIs1" or="true"/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="MCPB4"/>
			<contact type="closed" name="FormHeadDownLS"/>
			<line or="true"/>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="ModelIs1"/>
			<line or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="Look4Reset"/>
			<line/>
			<line/>
			<coil type="open" name="BrakePartEjectSolenoid"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="TP_1" type="TP"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TP"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="negative transition" name="FormHeadUpSolenoid"/>
			<functionblock position="middle" type="TP"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="UVDwell"/>
		</row>
		<row>
			<analog type="input" name="T#3s"/>
			<functionblock position="bottom" type="TP"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeBeamLower"/>
			<line/>
			<line/>
			<coil type="open" name="FWBUnloaderValve"/>
		</row>
		<row>
			<contact type="open" name="BrakeBeamRaise" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="FormHeadUpSolenoid" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="UVDwell" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="BendingLatch"/>
			<line/>
			<line/>
			<coil type="open" name="LatchCylinderOutSolenoid"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="BrakeIsRefed"/>
			<function position="top" type="OR"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="BrakeStatus"/>
			<function position="middle" type="OR"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="BrakeStatus"/>
		</row>
		<row>
			<analog type="input" name="1"/>
			<function position="bottom" type="OR"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="BrakeRefSignal"/>
			<contact type="closed" name="BrakeAutoRequest"/>
			<function position="top" type="OR"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="BrakeStatus"/>
			<function position="middle" type="OR"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="BrakeStatus"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="4"/>
			<function position="bottom" type="OR"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="FWBResetPB"/>
			<contact type="closed" name="BrakeIsRefed"/>
			<function position="top" type="OR"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="BrakeStatus"/>
			<function position="middle" type="OR"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="BrakeStatus"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="8"/>
			<function position="bottom" type="OR"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
</networks>
END_PROGRAM


























