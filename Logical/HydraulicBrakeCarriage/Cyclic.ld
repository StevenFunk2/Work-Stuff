PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="This File Has The Logic To Position The Iowa Brake Carriages For All Except The Electric Servo. Homing Routine For All Iowa Brake Carriages." row="2" column="0" commented="0">
		<row>
			<contact type="open" name="BC_Home5"/>
			<contact type="closed" name="BrakeRefSignal"/>
			<line/>
			<coil type="open" name="HWBrakeHomed"/>
		</row>
		<row>
			<contact type="open" name="HWBrakeHomed" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="HWBrakeHomed"/>
			<line/>
			<line/>
			<coil type="open" name="BrakeIsRefed"/>
		</row>
	</network>
	<network label="" comment="Sort Out The Travel Limits." row="5" column="0" commented="0">
		<row>
			<contact type="open" name="LBrakeWithPLC"/>
			<contact type="open" name="CarriageReference"/>
			<line/>
			<coil type="open" name="BCReverseTravelLimit"/>
		</row>
		<row>
			<contact type="open" name="LBrakeWithNoPLC" or="true"/>
			<empty or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="HWBrakeWithPLC"/>
			<contact type="open" name="EjectComplete" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="HWBrakeWithNoPLC" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="ElectricWrapBrake" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="5" column="0" commented="0">
		<row>
			<contact type="open" name="LBrakeWithPLC"/>
			<contact type="open" name="EjectComplete"/>
			<line/>
			<coil type="open" name="BCForwardTravelLimit"/>
		</row>
		<row>
			<contact type="open" name="LBrakeWithNoPLC" or="true"/>
			<empty or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="HWBrakeWithPLC"/>
			<contact type="open" name="CarriageReference" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="HWBrakeWithNoPLC" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="ElectricWrapBrake" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Begin Reference Sequence. Move Away Until The Reference Has Been Off For 2 Seconds. Note: Reference Is The Reverse(Negative, In, Minus) Travel Limit For The L Brakes And The Forward(Positive, Out, Plus) For The Wrap Brakes. " row="5" column="0" commented="0">
		<row>
			<contact type="positive transition" name="BrakeRefSignal"/>
			<contact type="open" name="BrakeAuto"/>
			<contact type="open" name="HWBrakeWithPLC"/>
			<contact type="closed" name="HWBrakeHomed"/>
			<coil type="open" name="BC_Home1"/>
		</row>
		<row>
			<contact type="open" name="BC_Home1" or="true"/>
			<empty or="true"/>
			<contact type="open" name="HWBrakeWithNoPLC" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<contact type="open" name="LBrakeWithPLC" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<contact type="open" name="LBrakeWithNoPLC" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<contact type="open" name="ElectricWrapBrake" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Move Brake Carriage Toward The Reference Sensor." row="2" column="0" commented="0">
		<row>
			<contact type="open" name="ROffSignal"/>
			<contact type="open" name="BC_Home1"/>
			<line/>
			<coil type="open" name="BC_Home2"/>
		</row>
		<row>
			<contact type="open" name="BC_Home2" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="HoldingPosition"/>
			<contact type="open" name="BC_Home2"/>
			<line/>
			<coil type="open" name="BC_Home2B"/>
		</row>
		<row>
			<contact type="closed" name="ElectricWrapBrake" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="BC_Home2B" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Stop Brake Carriage When The Reference Sensor Comes On." row="2" column="0" commented="0">
		<row>
			<contact type="open" name="CarriageReference"/>
			<contact type="open" name="BC_Home2B"/>
			<line/>
			<coil type="open" name="BC_Home3"/>
		</row>
		<row>
			<contact type="open" name="BC_Home3" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Update Brake Carriage Position After A Pause To Allow The Carriage To Stop." row="2" column="0" commented="0">
		<row>
			<contact type="open" name="BPositionUpdateDelayDone"/>
			<contact type="open" name="BC_Home3"/>
			<line/>
			<coil type="open" name="BC_Home4"/>
		</row>
		<row>
			<contact type="open" name="BC_Home4" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="CarriagePositionUpdateDwell"/>
			<contact type="open" name="BC_Home4"/>
			<line/>
			<coil type="open" name="BC_Home5"/>
		</row>
		<row>
			<contact type="open" name="BC_Home5" or="true"/>
			<empty/>
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
			<contact type="closed" name="CarriageReference"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="ROffSignal"/>
		</row>
		<row>
			<analog type="input" name="T#2s"/>
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
			<contact type="open" name="BC_Home3"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="BPositionUpdateDelayDone"/>
		</row>
		<row>
			<analog type="input" name="T#1500ms"/>
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
			<contact type="open" name="BC_Home4"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="CarriagePositionUpdateDwell"/>
		</row>
		<row>
			<analog type="input" name="T#2s"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="BC_Home4"/>
			<line/>
			<line/>
			<coil type="open" name="BrakeEncoderReset"/>
		</row>
	</network>
	<network label="" comment="Move To Target Logic For Digital I/O Controlled Brake Carriages. MoveToBeam, MoveAwayBeam and BrakeHiSpeedRelay." row="1" column="0" commented="0">
		<row>
			<contact type="open" name="WBReadyToCycleStep"/>
			<contact type="closed" name="WBNotInPositionStep"/>
			<line/>
			<coil type="open" name="Move4HWBwoPLC"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="FBBrakeSetSignal"/>
			<contact type="open" name="LBrakeWithPLC"/>
			<line/>
			<coil type="open" name="SetLBrakeCarriage"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="LBrakeWithNoPLC" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="5" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Move4HWBwoPLC"/>
			<line/>
			<line/>
			<coil type="open" name="MoveCarriage"/>
		</row>
		<row>
			<contact type="positive transition" name="SetLBrakeCarriage" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="positive transition" name="WBCarriageReturnStep" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="positive transition" name="MoveMinus4" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="positive transition" name="MovePlus4" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="MoveCarriage"/>
			<function position="top" type="Compute!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<function position="middle" type="Compute!"><input name=""/><output name="56"/></function>
			<analog type="output" name="realBTW"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compute!"><input name="&lt;!DINT_TO_REAL(BrakeTargetWindow) / BrakeResolution"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="6" column="0" commented="0">
		<row>
			<contact type="positive transition" name="MoveCarriage"/>
			<line/>
			<function position="top" type="ADD"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="BrakeCarriageTarget"/>
			<function position="middle" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="ULimit"/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="realBTW"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<function position="top" type="SUB"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
			<empty/>
		</row>
		<row>
			<analog type="input" name="BrakeCarriageTarget"/>
			<function position="middle" type="SUB"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="LLimit"/>
			<empty/>
		</row>
		<row>
			<analog type="input" name="realBTW"/>
			<function position="bottom" type="SUB"><input name="" extensible="true"/></function>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="SUB"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="BrakeCarriageTarget"/>
			<function position="middle" type="SUB"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="Difference"/>
		</row>
		<row>
			<analog type="input" name="RealBrakePosition"/>
			<function position="bottom" type="SUB"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="ABS"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="Difference"/>
			<function position="bottom" type="ABS"><input name="IN"/><output name="42"/></function>
			<analog type="output" name="AbsDifference"/>
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
			<analog type="output" name="InPosWindow"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!AbsDifference &lt;= realBTW"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="TON_2" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="InPosWindow"/>
			<contact type="closed" name="MoveCarriage"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="HWBCarriageInPosition"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="T#100ms"/>
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
			<analog type="output" name="InSSWindow"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!AbsDifference &lt;= SSWin"/></function>
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
			<analog type="output" name="MinusStop"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!RealBrakePosition &lt;= ULimit"/></function>
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
			<analog type="output" name="PlusStop"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!RealBrakePosition &gt;= LLimit"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="WBPartPastStep was an open contact." row="3" column="0" commented="0">
		<row>
			<contact type="open" name="HWBCarriageInPosition"/>
			<line/>
			<line/>
			<coil type="open" name="MVMinusUnlatch"/>
		</row>
		<row>
			<contact type="open" name="MoveMinus4" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="positive transition" name="WBPartPastStep" or="true"/>
			<empty/>
			<empty/>
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
			<analog type="output" name="MCLessThan0"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!Difference &lt; 0.0"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="MCLessThan0"/>
			<contact type="open" name="MoveCarriage"/>
			<contact type="open" name="BrakeAuto"/>
			<contact type="closed" name="MVMinusUnlatch"/>
			<coil type="open" name="MoveMinus1"/>
		</row>
		<row>
			<contact type="open" name="MoveMinus1"/>
			<line or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="InSSWindow"/>
			<contact type="open" name="MoveMinus1"/>
			<line/>
			<coil type="open" name="MoveMinus2"/>
		</row>
		<row>
			<contact type="open" name="MoveMinus2" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="MinusStop"/>
			<contact type="open" name="MoveMinus2"/>
			<line/>
			<coil type="open" name="MoveMinus3"/>
		</row>
		<row>
			<contact type="open" name="MoveMinus3" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="PositioningError1"/>
			<contact type="open" name="MoveMinus3"/>
			<line/>
			<coil type="open" name="MoveMinus4"/>
		</row>
		<row>
			<contact type="open" name="MoveMinus4" or="true"/>
			<empty/>
			<empty/>
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
			<contact type="open" name="MoveMinus3"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="PositioningError1"/>
		</row>
		<row>
			<analog type="input" name="SettleTime"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="WBPartPastStep was an open contact." row="3" column="0" commented="0">
		<row>
			<contact type="open" name="HWBCarriageInPosition"/>
			<line/>
			<line/>
			<coil type="open" name="MVPlusUnlatch"/>
		</row>
		<row>
			<contact type="open" name="MovePlus4" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="positive transition" name="WBPartPastStep" or="true"/>
			<empty/>
			<empty/>
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
			<analog type="output" name="DifferenceGreaterThan0"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!Difference &gt;= 0.0"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="MoveCarriage"/>
			<contact type="open" name="DifferenceGreaterThan0"/>
			<contact type="open" name="BrakeAuto"/>
			<contact type="closed" name="MVPlusUnlatch"/>
			<coil type="open" name="MovePlus1"/>
		</row>
		<row>
			<contact type="open" name="MovePlus1"/>
			<line or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="InSSWindow"/>
			<contact type="open" name="MovePlus1"/>
			<line/>
			<coil type="open" name="MovePlus2"/>
		</row>
		<row>
			<contact type="open" name="MovePlus2" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="PlusStop"/>
			<contact type="open" name="MovePlus2"/>
			<line/>
			<coil type="open" name="MovePlus3"/>
		</row>
		<row>
			<contact type="open" name="MovePlus3" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="PositioningError2"/>
			<contact type="open" name="MovePlus3"/>
			<line/>
			<coil type="open" name="MovePlus4"/>
		</row>
		<row>
			<contact type="open" name="MovePlus4" or="true"/>
			<empty/>
			<empty/>
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
			<contact type="open" name="MovePlus3"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="PositioningError2"/>
		</row>
		<row>
			<analog type="input" name="SettleTime"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="MoveCarriage"/>
			<function position="top" type="DINT_TO_REAL"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="BrakeSlowWindow"/>
			<function position="bottom" type="DINT_TO_REAL"><input name="IN"/><output name="8"/></function>
			<analog type="output" name="BSWReal"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="MoveCarriage"/>
			<function position="top" type="Compute!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<function position="middle" type="Compute!"><input name=""/><output name="56"/></function>
			<analog type="output" name="SSWin"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compute!"><input name="&lt;!BSWReal / BrakeResolution"/></function>
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
			<contact type="closed" name="MoveAwayBeam"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="DecelDone1"/>
		</row>
		<row>
			<analog type="input" name="T#500ms"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="9" column="0" commented="0">
		<row>
			<contact type="open" name="HWBrakeWithPLC"/>
			<contact type="open" name="BC_Home1"/>
			<contact type="closed" name="BC_Home2"/>
			<line/>
			<contact type="open" name="DecelDone1"/>
			<contact type="closed" name="BCReverseTravelLimit"/>
			<coil type="open" name="MoveToBeam"/>
		</row>
		<row>
			<contact type="open" name="HWBrakeWithNoPLC" or="true"/>
			<empty/>
			<empty/>
			<empty or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="closed" name="ElectricWrapBrake"/>
			<contact type="open" name="BeginEjectStep"/>
			<contact type="closed" name="WBOpenClampStep"/>
			<line or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="LBrakeWithPLC"/>
			<contact type="open" name="BC_Home2"/>
			<contact type="closed" name="BC_Home3"/>
			<line or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="LBrakeWithNoPLC" or="true"/>
			<empty/>
			<empty/>
			<empty or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="MoveMinus1"/>
			<contact type="closed" name="MoveMinus3"/>
			<line/>
			<line or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="closed" name="ElectricWrapBrake"/>
			<contact type="open" name="WBArmsUpStep"/>
			<contact type="closed" name="WBReadyToCycleStep"/>
			<line or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="diBrakeCarriageJogIn"/>
			<contact type="open" name="HWBrakeWithNoPLC"/>
			<contact type="open" name="BrakeBeamUpProx"/>
			<contact type="closed" name="BrakeAuto" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="LBrakeWithNoPLC"/>
			<line or="true"/>
			<empty/>
			<empty/>
			<empty/>
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
			<contact type="closed" name="MoveToBeam"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="DecelDone2"/>
		</row>
		<row>
			<analog type="input" name="T#500ms"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="Brake" comment="" row="7" column="0" commented="0">
		<row>
			<contact type="open" name="LBrakeWithPLC"/>
			<contact type="open" name="BC_Home1"/>
			<contact type="closed" name="BC_Home2"/>
			<contact type="open" name="DecelDone2"/>
			<contact type="closed" name="BCForwardTravelLimit"/>
			<coil type="open" name="MoveAwayBeam"/>
		</row>
		<row>
			<contact type="open" name="LBrakeWithNoPLC" or="true"/>
			<empty/>
			<empty or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="HWBrakeWithPLC"/>
			<contact type="open" name="BC_Home2"/>
			<contact type="closed" name="BC_Home3" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="HWBrakeWithNoPLC" or="true"/>
			<empty/>
			<empty or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="MovePlus1"/>
			<contact type="closed" name="MovePlus3"/>
			<line or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="diBrakeCarriageJogOut"/>
			<contact type="open" name="HWBrakeWithNoPLC"/>
			<contact type="closed" name="BrakeAuto" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="LBrakeWithNoPLC" or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="6" column="0" commented="0">
		<row>
			<contact type="open" name="MoveMinus1"/>
			<contact type="closed" name="MoveMinus2"/>
			<line/>
			<line/>
			<coil type="open" name="BrakeHighSpeedRelay"/>
		</row>
		<row>
			<contact type="open" name="MovePlus1"/>
			<contact type="closed" name="MovePlus2"/>
			<line/>
			<line or="true"/>
			<empty/>
		</row>
		<row>
			<contact type="closed" name="ElectricWrapBrake"/>
			<contact type="open" name="WBArmsUpStep"/>
			<contact type="closed" name="WBReadyToCycleStep"/>
			<line or="true"/>
			<empty/>
		</row>
		<row>
			<contact type="closed" name="ElectricWrapBrake"/>
			<contact type="open" name="BeginEjectStep"/>
			<contact type="closed" name="WBOpenClampStep"/>
			<line or="true"/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="diBrakeCarriageJogIn"/>
			<contact type="closed" name="BrakeAuto"/>
			<contact type="open" name="HWBrakeWithNoPLC"/>
			<contact type="open" name="BrakeBeamUpProx" or="true"/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="diBrakeCarriageJogOut" or="true"/>
			<empty or="true"/>
			<contact type="open" name="LBrakeWithNoPLC"/>
			<contact type="open" name="BrakeSpeedSwitch" or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Brake With PLC Outputs" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="WBBrakeRequiredStep"/>
			<line/>
			<line/>
			<coil type="open" name="BrakeOn"/>
		</row>
		<row>
			<contact type="open" name="LBrakeWithPLC"/>
			<contact type="open" name="BrakeRequired" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="WBBendSeqStartStep"/>
			<contact type="closed" name="WBBendingStep"/>
			<contact type="open" name="MaterialClamped"/>
			<coil type="open" name="BendStart"/>
		</row>
	</network>
	<network label="" comment="Electric Servo Wrap Brake Motion - Move Off Home Switch If Necessary" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="ElectricWrapBrake"/>
			<contact type="positive transition" name="BC_Home1"/>
			<contact type="closed" name="BC_Home2"/>
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
			<analog type="output" name="HoldingPosition"/>
		</row>
		<row>
			<analog type="input" name="0"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="BC_Home2"/>
			<contact type="closed" name="HoldingPosition"/>
			<line/>
			<coil type="set" name="StopFlag2"/>
		</row>
	</network>
	<network label="" comment="Move Away From Beam To Reference Switch" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="ElectricWrapBrake"/>
			<contact type="positive transition" name="BC_Home2B"/>
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
	<network label="" comment="Save the 1st Bend Target And Setup A Move To -6 To Run The Part Down." row="4" column="0" commented="0">
		<row>
			<contact type="open" name="ElectricWrapBrake"/>
			<contact type="positive transition" name="WBArmsUpStep"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="BrakeCarriageTarget"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="TempBrakeCarriageTarget"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="-6.0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="BrakeCarriageTarget"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="1"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="MotionStatus2"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="LE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="BrakeCarriageTarget"/>
			<function position="middle" type="LE"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="BCTLessThan0"/>
		</row>
		<row>
			<analog type="input" name="0.0"/>
			<function position="bottom" type="LE"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="BCTLessThan0"/>
			<contact type="closed" name="BeginEjectStep"/>
			<line/>
			<coil type="open" name="FirstCycle"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="ElectricWrapBrake"/>
			<contact type="open" name="MoveCarriage"/>
			<contact type="open" name="FirstCycle"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="TempBrakeCarriageTarget"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="BrakeCarriageTarget"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="WBNotInPositionStep"/>
			<contact type="open" name="FirstCycle"/>
			<contact type="open" name="InPosition2"/>
			<coil type="open" name="WBMissedPart"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="ElectricWrapBrake"/>
			<contact type="open" name="MoveCarriage"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="1"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="MotionStatus2"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="ElectricWrapBrake"/>
			<contact type="positive transition" name="BeginEjectStep"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="BrakeEjectTarget"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="BrakeCarriageTarget"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="1"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="MotionStatus2"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="TP_0" type="TP"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<functionblock position="top" type="TP"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="positive transition" name="BrakeHydraulics"/>
			<contact type="closed" name="BrakeDriveReady"/>
			<functionblock position="middle" type="TP"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="BrakeDriveFaultReset"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="T#250ms"/>
			<functionblock position="bottom" type="TP"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
</networks>
END_PROGRAM





























