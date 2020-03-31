PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="GStep11"/>
			<line/>
			<line/>
			<coil type="open" name="MoveInitiated"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="MoveInitiated"/>
			<function position="top" type="Compute!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<function position="middle" type="Compute!"><input name=""/><output name="56"/></function>
			<analog type="output" name="IncrementalDINTTarget"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compute!"><input name="&lt;!REAL_TO_DINT(IncrementalRealTarget*UnitsPerInch1*MetalScaler)"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="MoveInitiated"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="MetalTarget"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="CoilAccumulator"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="MoveInitiated"/>
			<function position="top" type="ADD"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="MetalTarget"/>
			<function position="middle" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="MetalTarget"/>
		</row>
		<row>
			<analog type="input" name="IncrementalDINTTarget"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="GStep11"/>
			<contact type="closed" name="GStep12"/>
			<line/>
			<coil type="open" name="GFeedMoveQed"/>
		</row>
	</network>
	<network label="" comment="Routine to control an Engel processor with the original two speed hydraulic solenoids. Coil line drive option #1." row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="SUB"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="MetalTarget"/>
			<function position="middle" type="SUB"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="difference"/>
		</row>
		<row>
			<analog type="input" name="ActlMetalEncoder"/>
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
			<analog type="input" name="difference"/>
			<function position="bottom" type="ABS"><input name="IN"/><output name="42"/></function>
			<analog type="output" name="AbsoluteDifference"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="LE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="AbsoluteDifference"/>
			<function position="middle" type="LE"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="InTargetWindow"/>
		</row>
		<row>
			<analog type="input" name="CoilLineTargetWindow"/>
			<function position="bottom" type="LE"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="Make timer restart when each move starts. No matter how short." row="4" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="TON_0" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="InTargetWindow"/>
			<contact type="closed" name="MoveInitiated"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="SettleTimerDone"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="T#100ms"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="SettleTimerDone"/>
			<contact type="closed" name="MoveInitiated"/>
			<line/>
			<coil type="open" name="InPosition1"/>
		</row>
		<row>
			<contact type="open" name="InPosition1" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Moving Latch" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="MoveInitiated"/>
			<contact type="open" name="InCycle"/>
			<contact type="closed" name="InPosition1"/>
			<coil type="open" name="MovingToPosition"/>
		</row>
		<row>
			<contact type="open" name="MovingToPosition" or="true"/>
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
			<analog type="input" name="difference"/>
			<function position="middle" type="GT"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="PositionLTTarget"/>
		</row>
		<row>
			<analog type="input" name="0"/>
			<function position="bottom" type="GT"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="MovingToPosition"/>
			<contact type="open" name="PositionLTTarget"/>
			<contact type="closed" name="InTargetWindow"/>
			<coil type="open" name="MoveForward"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="MoveForward"/>
			<contact type="open" name="DuctoAuto"/>
			<line/>
			<coil type="open" name="ForwardFeedSolenoid"/>
		</row>
		<row>
			<contact type="open" name="ProcessorJogFwd"/>
			<contact type="closed" name="InCycle" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="LT"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="difference"/>
			<function position="middle" type="LT"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="PositionGTTarget"/>
		</row>
		<row>
			<analog type="input" name="0"/>
			<function position="bottom" type="LT"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="MovingToPosition"/>
			<contact type="open" name="PositionGTTarget"/>
			<contact type="closed" name="InTargetWindow"/>
			<coil type="open" name="MoveReverse"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="MoveReverse"/>
			<line/>
			<line/>
			<coil type="open" name="ReverseFeedSolenoid"/>
		</row>
		<row>
			<contact type="open" name="ProcessorJogRev"/>
			<contact type="closed" name="InCycle" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="GStep21"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="LE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="AbsoluteDifference"/>
			<function position="middle" type="LE"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="InSSWindow"/>
		</row>
		<row>
			<analog type="input" name="CoilLineSlowWindow"/>
			<function position="bottom" type="LE"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="TP_10ms_0" type="TP_10ms"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TP_10ms"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="positive transition" name="MovingToPosition"/>
			<functionblock position="middle" type="TP_10ms"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="MTPPulse"/>
		</row>
		<row>
			<analog type="input" name="100"/>
			<functionblock position="bottom" type="TP_10ms"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="open" name="InCycle"/>
			<contact type="open" name="MovingToPosition"/>
			<contact type="open" name="InSSWindow"/>
			<coil type="open" name="SlowSpeedSolenoid"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="closed" name="MovingToPosition"/>
			<line or="true"/>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="MTPPulse"/>
			<line or="true"/>
			<empty/>
		</row>
		<row>
			<contact type="closed" name="InCycle"/>
			<line/>
			<line or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="CoilLinePower"/>
			<line/>
			<line/>
			<coil type="open" name="EngelCoilDriveReady"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="ForwardFeedSolenoid"/>
			<line/>
			<line/>
			<coil type="open" name="LevelerBrakeSolenoid"/>
		</row>
		<row>
			<contact type="open" name="ReverseFeedSolenoid" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
</networks>
END_PROGRAM

















