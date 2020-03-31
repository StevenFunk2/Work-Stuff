PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="transition"/>
			<function position="top" type="SUB"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="ActlMetalEncoder"/>
			<function position="middle" type="SUB"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="MetalEncoder"/>
		</row>
		<row>
			<analog type="input" name="CoilAccumulator"/>
			<function position="bottom" type="SUB"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="OneMorePart logic needs To Execute Before The FeedInitiate Signal rung." row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="Compare!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<function position="middle" type="Compare!"><input name=""/><output name="56"/></function>
			<analog type="output" name="JobChanging"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!(RunJob - 1)  &lt;&gt; ShearJob"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="InCycle"/>
			<line/>
			<contact type="open" name="JobChanging"/>
			<contact type="closed" name="RunContinuousSignal"/>
			<coil type="open" name="OneMorePart"/>
		</row>
		<row>
			<contact type="open" name="OneMorePart"/>
			<contact type="closed" name="FeedInitiate" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Feed Initiate Signal" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="FeedInitButton"/>
			<contact type="open" name="EngelCoilDriveReady"/>
			<line/>
			<coil type="open" name="FeedInitiate"/>
		</row>
	</network>
	<network label="" comment="Verify HMI Job change request" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="RunJobClick"/>
			<contact type="closed" name="InCycle"/>
			<function position="top" type="Compare!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<function position="middle" type="Compare!"><input name=""/><output name="56"/></function>
			<analog type="output" name="NewRunJobOk"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!NewRunJob &lt;= MaxRunJob"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="RunJobClick"/>
			<contact type="open" name="NewRunJobOk"/>
			<contact type="closed" name="InCycle"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="NewRunJob"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="RunJob"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="RunJobClick"/>
			<line/>
			<line/>
			<coil type="reset" name="NewRunJobOk"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="RunJobClick"/>
			<line/>
			<line/>
			<coil type="reset" name="RunJobClick"/>
		</row>
	</network>
	<network label="" comment="Update HMI job when the shear finishes one." row="3" column="0" commented="0">
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
			<function position="bottom" type="Compare!"><input name="&lt;!(RunJob - 1) &lt;&gt; ShearJob"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="InCycle"/>
			<contact type="open" name="GStep19"/>
			<contact type="open" name="ShearFires"/>
			<contact type="open" name="JobsDifferent"/>
			<coil type="open" name="ChangeJob1"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="ChangeJob1"/>
			<function position="top" type="ADD"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="ShearJob"/>
			<function position="middle" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="RunJob"/>
		</row>
		<row>
			<analog type="input" name="1"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="FeedInitiate"/>
			<line/>
			<line/>
			<coil type="reset" name="NoShearHits"/>
		</row>
	</network>
	<network label="" comment="Latch BatchActive in whenever the FeedInitiate signal comes on and the Ducto
Sequence isn't started. Step03 latches after PC downloads tables and resets
StartSignal. Unlatch BatchActive at that point if the shear has no hits. Step19
is the last one in the Ducto sequence. If there are no shear hits, the run is
finished. BatchActive unlatches and the entire sequence unlatches." row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="Compare!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<function position="middle" type="Compare!"><input name=""/><output name="56"/></function>
			<analog type="output" name="SHLT0"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!ShearHits &lt; 0"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Step03"/>
			<contact type="open" name="SHLT0"/>
			<line/>
			<coil type="open" name="NoShearHits"/>
		</row>
	</network>
	<network label="" comment="" row="6" column="0" commented="0">
		<row>
			<contact type="open" name="BatchCancelSignal"/>
			<line/>
			<line/>
			<coil type="open" name="BatchCancelUnlatch"/>
		</row>
		<row>
			<contact type="open" name="NoShearHits" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="negative transition" name="MatlAtMeasureRoll" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="negative transition" name="ProcessorDriveEnable" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="negative transition" name="EStopClear" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="Step22" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="FeedInitiate"/>
			<contact type="closed" name="Step01"/>
			<contact type="closed" name="BatchCancelUnlatch"/>
			<coil type="open" name="InCycle"/>
		</row>
		<row>
			<contact type="open" name="InCycle"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="First actions in Ducto sequence, reset indexes and moves, set start signal for PC to generate die tables." row="22" column="0" commented="0">
		<row>
			<contact type="open" name="Step01"/>
			<contact type="closed" name="Step02"/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<analog type="input" name="0.0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="ShearMove"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<analog type="input" name="0.0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="LTNotchMove"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<analog type="input" name="0.0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="VNotchMove"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<analog type="input" name="0.0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="LeftHoleMove"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<analog type="input" name="0.0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="CenterHoleMove"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<analog type="input" name="0.0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="RightHoleMove"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<analog type="input" name="0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="PartsMade"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<analog type="input" name="0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="ShearIndex"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<analog type="input" name="0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="LTNotchIndex"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<analog type="input" name="0"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="VNotchIndex"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="LeftHoleIndex"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="CenterHoleIndex"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="RightHoleIndex"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="0.0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="ButtonMove"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="0.0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="ShearBrakeMove"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="0.0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="CustomLTMove"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="0.0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="CleatMove"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="ButtonIndex"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="ShearBrakeIndex"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="0"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="CustomLTIndex"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="8" column="0" commented="0">
		<row>
			<contact type="open" name="Step01"/>
			<contact type="closed" name="Step02"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="CleatIndex"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="ButtonActual"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="0.0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="CustomVMove"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="CustomVIndex"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="0.0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="BeadRollMove"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="BeadRollIndex"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="TRUE"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="StartSignal"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Step01"/>
			<line/>
			<line/>
			<coil type="open" name="PulseProcessorReset"/>
		</row>
		<row>
			<contact type="open" name="ShearValve"/>
			<contact type="closed" name="InCycle" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Step01"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="CoilAccumulator"/>
		</row>
		<row>
			<analog type="input" name="0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="MetalTarget"/>
		</row>
		<row>
			<analog type="input" name="0.0"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="IncrementalRealTarget"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="TP_9" type="TP"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TP"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="PulseProcessorReset"/>
			<functionblock position="middle" type="TP"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="ProcessorEncoderReset"/>
		</row>
		<row>
			<analog type="input" name="T#100ms"/>
			<functionblock position="bottom" type="TP"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="Reset variable to get ready for a new move" row="5" column="0" commented="0">
		<row>
			<contact type="open" name="Step06"/>
			<contact type="closed" name="Step07"/>
			<line/>
			<line/>
			<line/>
			<coil type="reset" name="PartCutOff"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<line/>
			<line/>
			<line/>
			<coil type="reset" name="ShearFires"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<analog type="input" name="0.0"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="IncrementalRealTarget"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<line/>
			<line/>
			<line/>
			<coil type="open" name="InitMoveSignal"/>
		</row>
	</network>
	<network label="" comment="Make Sure All Data Is Updated By PC" row="1" column="0" commented="0">
		<row>
			<contact type="closed" name="MakeShearTable"/>
			<contact type="closed" name="MakeLTTable"/>
			<contact type="closed" name="MakeVTable"/>
			<contact type="closed" name="MakeLHoleTable"/>
			<contact type="closed" name="MakeCHoleTable"/>
			<contact type="closed" name="MakeBeadRollTable"/>
			<coil type="open" name="HalfUpdated1"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="closed" name="MakeRHoleTable"/>
			<contact type="closed" name="MakeButtonTable"/>
			<contact type="closed" name="MakeShearBrakeTable"/>
			<contact type="closed" name="MakeCustomLTTable"/>
			<contact type="closed" name="MakeCleatTable"/>
			<contact type="closed" name="MakeCustomVTable"/>
			<coil type="open" name="HalfUpdated2"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="HalfUpdated1"/>
			<contact type="open" name="HalfUpdated2"/>
			<line/>
			<coil type="open" name="DataUpdated"/>
		</row>
	</network>
	<network label="MUX1" comment="Net #37-40 from PicPro. " row="24" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Step08"/>
			<contact type="open" name="ShearUsedUp"/>
			<function position="top" type="MUX"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="ShearIndex"/>
			<function position="middle" type="MUX"><input name="K" extensible="true"/><output name="40"/></function>
			<analog type="output" name="ShearMove"/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="ShearTable[0]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="ShearTable[1]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="ShearTable[2]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="ShearTable[3]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="ShearTable[4]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="ShearTable[5]"/>
			<function position="bottom" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="LTUsedUp"/>
			<function position="top" type="MUX"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="LTNotchIndex"/>
			<function position="middle" type="MUX"><input name="K" extensible="true"/><output name="40"/></function>
			<analog type="output" name="LTNotchMove"/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="LTNotchTable[0]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="LTNotchTable[1]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="LTNotchTable[2]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="LTNotchTable[3]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="LTNotchTable[4]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="LTNotchTable[5]"/>
			<function position="bottom" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="VUsedUp"/>
			<function position="top" type="MUX"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="VNotchIndex"/>
			<function position="middle" type="MUX"><input name="K" extensible="true"/><output name="40"/></function>
			<analog type="output" name="VNotchMove"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="VNotchTable[0]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="VNotchTable[1]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="VNotchTable[2]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="VNotchTable[3]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="VNotchTable[4]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="VNotchTable[5]"/>
			<function position="bottom" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="24" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Step08"/>
			<contact type="open" name="ButtonUsedUp"/>
			<function position="top" type="MUX"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="ButtonIndex"/>
			<function position="middle" type="MUX"><input name="K" extensible="true"/><output name="40"/></function>
			<analog type="output" name="ButtonMove"/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="ButtonTable[0]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="ButtonTable[1]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="ButtonTable[2]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="ButtonTable[3]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="ButtonTable[4]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="ButtonTable[5]"/>
			<function position="bottom" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="ShearBrakeUsedUp"/>
			<function position="top" type="MUX"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="ShearBrakeIndex"/>
			<function position="middle" type="MUX"><input name="K" extensible="true"/><output name="40"/></function>
			<analog type="output" name="ShearBrakeMove"/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="ShearBrakeTable[0]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="ShearBrakeTable[1]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="ShearBrakeTable[2]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="ShearBrakeTable[3]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="ShearBrakeTable[4]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="ShearBrakeTable[5]"/>
			<function position="bottom" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="CustomLTUsedUp"/>
			<function position="top" type="MUX"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="CustomLTIndex"/>
			<function position="middle" type="MUX"><input name="K" extensible="true"/><output name="40"/></function>
			<analog type="output" name="CustomLTMove"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="CustomLTTable[0]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="CustomLTTable[1]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="CustomLTTable[2]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="CustomLTTable[3]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="CustomLTTable[4]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="CustomLTTable[5]"/>
			<function position="bottom" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="16" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Step08"/>
			<contact type="open" name="CleatUsedUp"/>
			<function position="top" type="MUX"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="CleatIndex"/>
			<function position="middle" type="MUX"><input name="K" extensible="true"/><output name="40"/></function>
			<analog type="output" name="CleatMove"/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="CleatTable[0]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="CleatTable[1]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="CleatTable[2]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="CleatTable[3]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="CleatTable[4]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="CleatTable[5]"/>
			<function position="bottom" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="CustomVUsedUp"/>
			<function position="top" type="MUX"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="CustomVIndex"/>
			<function position="middle" type="MUX"><input name="K" extensible="true"/><output name="40"/></function>
			<analog type="output" name="CustomVMove"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="CustomVTable[0]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="CustomVTable[1]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="CustomVTable[2]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="CustomVTable[3]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="CustomVTable[4]"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="CustomVTable[5]"/>
			<function position="bottom" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="These 4 tables have too many values for the B&amp;R mux." row="8" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Step08"/>
			<contact type="open" name="LeftHoleUsedUp"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="LeftHoleTable[LeftHoleIndex]"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="LeftHoleMove"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="CenterHoleUsedUp"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="CenterHoleTable[CenterHoleIndex]"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="CenterHoleMove"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="RightHoleUsedUp"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="RightHoleTable[RightHoleIndex]"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="RightHoleMove"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="BeadRollUsedUp"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="BeadRollTable[BeadRollIndex]"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="BeadRollMove"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Step08"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="LeftHoleIndex"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="LeftShuttleIndex"/>
		</row>
		<row>
			<analog type="input" name="CenterHoleIndex"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="CenterShuttleIndex"/>
		</row>
		<row>
			<analog type="input" name="RightHoleIndex"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="RightShuttleIndex"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Step08"/>
			<actionblock position="topbottom"><input qualifier="N"/><output name="getNextMove"/></actionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Step08A"/>
			<line/>
			<line/>
			<coil type="reset" name="NextMoveDone"/>
		</row>
		<row>
			<contact type="negative transition" name="InCycle" or="true"/>
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
			<analog type="output" name="ShearUsedUp"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!ABS(ShearMove) &lt;= InPositionBand"/></function>
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
			<analog type="output" name="LTUsedUp"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!ABS(LTNotchMove) &lt;= InPositionBand"/></function>
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
			<analog type="output" name="VUsedUp"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!ABS(VNotchMove) &lt;= InPositionBand"/></function>
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
			<analog type="output" name="LeftHoleUsedUp"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!ABS(LeftHoleMove) &lt;= InPositionBand"/></function>
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
			<analog type="output" name="CenterHoleUsedUp"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!ABS(CenterHoleMove) &lt;= InPositionBand"/></function>
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
			<analog type="output" name="RightHoleUsedUp"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!ABS(RightHoleMove) &lt;= InPositionBand"/></function>
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
			<analog type="output" name="ButtonUsedUp"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!ABS(ButtonMove) &lt;= InPositionBand"/></function>
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
			<analog type="output" name="ShearBrakeUsedUp"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!ABS(ShearBrakeMove) &lt;= InPositionBand"/></function>
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
			<analog type="output" name="CustomLTUsedUp"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!ABS(CustomLTMove) &lt;= InPositionBand"/></function>
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
			<analog type="output" name="CleatUsedUp"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!ABS(CleatMove) &lt;= InPositionBand"/></function>
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
			<analog type="output" name="CustomVUsedUp"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!ABS(CustomVMove) &lt;= InPositionBand"/></function>
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
			<analog type="output" name="BeadRollUsedUp"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!ABS(BeadRollMove) &lt;= InPositionBand"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Step08A"/>
			<actionblock position="topbottom"><input qualifier="N"/><output name="UpdateTables"/></actionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Step08B"/>
			<line/>
			<line/>
			<coil type="reset" name="UpdateTablesDone"/>
		</row>
		<row>
			<contact type="negative transition" name="InCycle" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Step08B"/>
			<function position="top" type="ADD"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="IncrementalRealTarget"/>
			<function position="middle" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="IncrementalRealTarget"/>
		</row>
		<row>
			<analog type="input" name="SmallResult"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="12" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Step08B"/>
			<contact type="open" name="ShearFires"/>
			<line/>
			<coil type="open" name="NextMoveComplete"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="LTFires" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="VFires" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="LeftHoleFires" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="CenterHoleFires" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="RightHoleFires" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="ButtonFires" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="ShearBrakeFires" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="CustomLTFires" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="CleatFires" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="CustomVFires" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="BeadRollFires" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Step08B"/>
			<contact type="closed" name="NextMoveComplete"/>
			<line/>
			<coil type="open" name="NextMoveLookAgain"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="LTValve"/>
			<line/>
			<line/>
			<coil type="reset" name="LTFires"/>
		</row>
		<row>
			<contact type="negative transition" name="InCycle" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="VValve"/>
			<line/>
			<line/>
			<coil type="reset" name="VFires"/>
		</row>
		<row>
			<contact type="negative transition" name="InCycle" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="LHoleValve"/>
			<line/>
			<line/>
			<coil type="reset" name="LeftHoleFires"/>
		</row>
		<row>
			<contact type="negative transition" name="InCycle" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="CHoleValve"/>
			<line/>
			<line/>
			<coil type="reset" name="CenterHoleFires"/>
		</row>
		<row>
			<contact type="negative transition" name="InCycle" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="RHoleValve"/>
			<line/>
			<line/>
			<coil type="reset" name="RightHoleFires"/>
		</row>
		<row>
			<contact type="negative transition" name="InCycle" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="CycleButtons"/>
			<line/>
			<line/>
			<coil type="reset" name="ButtonFires"/>
		</row>
		<row>
			<contact type="negative transition" name="InCycle" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="CycleMaleBender"/>
			<line/>
			<line/>
			<coil type="reset" name="ShearBrakeFires"/>
		</row>
		<row>
			<contact type="negative transition" name="InCycle" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="CustomLTValve"/>
			<line/>
			<line/>
			<coil type="reset" name="CustomLTFires"/>
		</row>
		<row>
			<contact type="negative transition" name="InCycle" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="ChangeKDRolls"/>
			<line/>
			<line/>
			<coil type="reset" name="CleatFires"/>
		</row>
		<row>
			<contact type="negative transition" name="InCycle" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="CustomVValve"/>
			<line/>
			<line/>
			<coil type="reset" name="CustomVFires"/>
		</row>
		<row>
			<contact type="negative transition" name="InCycle" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="WaitCon3"/>
			<line/>
			<line/>
			<coil type="reset" name="BeadRollFires"/>
		</row>
		<row>
			<contact type="negative transition" name="InCycle" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Step09"/>
			<line/>
			<function position="top" type="DIV"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="MetalDesired"/>
			<function position="middle" type="DIV"><input name="" extensible="true"/><output name="42"/></function>
			<analog type="output" name="MetalScaler"/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="MetalActual"/>
			<function position="bottom" type="DIV"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<line/>
			<coil type="open" name="ClearEncoderSignal"/>
		</row>
	</network>
	<network label="" comment="" row="5" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Step10"/>
			<contact type="open" name="CropCut"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="CropPercent1"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="RunSpeed1"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="closed" name="CropCut"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="PercentSpeed1"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="RunSpeed1"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<line/>
			<coil type="open" name="RunSpeedCalculated"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="Step11"/>
			<contact type="closed" name="GStep12"/>
			<line/>
			<coil type="open" name="FeedMoveQed"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="Step14"/>
			<contact type="open" name="LTFires"/>
			<contact type="open" name="ChangeConnector"/>
			<coil type="open" name="WaitToFire1"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="FeedInitiate"/>
			<line/>
			<coil type="open" name="WaitCon1"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="TON_10" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="WaitToFire2"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="WaitCon2"/>
		</row>
		<row>
			<analog type="input" name="T#50ms"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="InPosition1"/>
			<contact type="closed" name="WaitCon2"/>
			<line/>
			<coil type="open" name="WaitToFire2"/>
		</row>
		<row>
			<contact type="open" name="WaitToFire2" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="Step14"/>
			<contact type="open" name="BeadRollFires"/>
			<contact type="open" name="FeedInitiate"/>
			<coil type="open" name="WaitCon3"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<line/>
			<coil type="open" name="WaitToFire3"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="WaitToFire3"/>
			<line/>
			<line/>
			<coil type="set" name="ChangeBeadRoll"/>
		</row>
	</network>
	<network label="" comment="" row="6" column="0" commented="0">
		<row>
			<contact type="open" name="Step14"/>
			<contact type="open" name="WaitToFire1"/>
			<contact type="open" name="WaitCon1"/>
			<coil type="open" name="Wait1Ready"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="closed" name="WaitToFire1"/>
			<line or="true"/>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="WaitToFire2"/>
			<contact type="open" name="WaitCon2"/>
			<coil type="open" name="Wait2Ready"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="closed" name="WaitToFire2"/>
			<line or="true"/>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="WaitToFire3"/>
			<contact type="open" name="WaitCon3"/>
			<coil type="open" name="Wait3Ready"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="closed" name="WaitToFire3"/>
			<line or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="Step15"/>
			<contact type="open" name="ShearFires"/>
			<line/>
			<coil type="open" name="ShearTemp"/>
		</row>
		<row>
			<contact type="closed" name="InCycle"/>
			<contact type="open" name="CycleShear" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="CycleShear"/>
			<line/>
			<line/>
			<coil type="reset" name="CycleShear"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="ShearTemp"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="ShearDwell"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="shearTime"/>
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
			<contact type="open" name="ShearTemp"/>
			<functionblock position="middle" type="TP"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="ShearValve"/>
		</row>
		<row>
			<analog type="input" name="shearTime"/>
			<functionblock position="bottom" type="TP"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="Step15"/>
			<contact type="open" name="LTFires"/>
			<line/>
			<coil type="open" name="LTTemp"/>
		</row>
		<row>
			<contact type="closed" name="InCycle"/>
			<contact type="open" name="CycleLTDie" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="CycleLTDie"/>
			<line/>
			<line/>
			<coil type="reset" name="CycleLTDie"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="LTTemp"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="LTDwell"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="LTTime"/>
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
			<contact type="open" name="LTTemp"/>
			<functionblock position="middle" type="TP"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="LTValve"/>
		</row>
		<row>
			<analog type="input" name="LTTime"/>
			<functionblock position="bottom" type="TP"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="Step15"/>
			<contact type="open" name="VFires"/>
			<line/>
			<coil type="open" name="VTemp"/>
		</row>
		<row>
			<contact type="closed" name="InCycle"/>
			<contact type="open" name="CycleVDie" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="CycleVDie"/>
			<line/>
			<line/>
			<coil type="reset" name="CycleVDie"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="VTemp"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="VDwell"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="VTime"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="TP_2" type="TP"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TP"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="VTemp"/>
			<functionblock position="middle" type="TP"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="VValve"/>
		</row>
		<row>
			<analog type="input" name="VTime"/>
			<functionblock position="bottom" type="TP"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="Step15"/>
			<contact type="open" name="LeftHoleFires"/>
			<line/>
			<coil type="open" name="LHTemp"/>
		</row>
		<row>
			<contact type="closed" name="InCycle"/>
			<contact type="open" name="CycleLDie" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="CycleLDie"/>
			<line/>
			<line/>
			<coil type="reset" name="CycleLDie"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="LHTemp"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="LHoleDwell"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="LeftHoleTime"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="TP_3" type="TP"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TP"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="LHTemp"/>
			<functionblock position="middle" type="TP"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="LHoleValve"/>
		</row>
		<row>
			<analog type="input" name="LeftHoleTime"/>
			<functionblock position="bottom" type="TP"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="Step15"/>
			<contact type="open" name="CenterHoleFires"/>
			<line/>
			<coil type="open" name="CHTemp"/>
		</row>
		<row>
			<contact type="closed" name="InCycle"/>
			<contact type="open" name="CycleCDie" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="CycleCDie"/>
			<line/>
			<line/>
			<coil type="reset" name="CycleCDie"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="CHTemp"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="CHoleDwell"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="CenterHoleTime"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="TP_4" type="TP"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TP"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="CHTemp"/>
			<functionblock position="middle" type="TP"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="CHoleValve"/>
		</row>
		<row>
			<analog type="input" name="CenterHoleTime"/>
			<functionblock position="bottom" type="TP"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="Step15"/>
			<contact type="open" name="RightHoleFires"/>
			<line/>
			<coil type="open" name="RHTemp"/>
		</row>
		<row>
			<contact type="closed" name="InCycle"/>
			<contact type="open" name="CycleRDie" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="CycleRDie"/>
			<line/>
			<line/>
			<coil type="reset" name="CycleRDie"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="RHTemp"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="RHoleDwell"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="RightHoleTime"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="TP_5" type="TP"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TP"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="RHTemp"/>
			<functionblock position="middle" type="TP"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="RHoleValve"/>
		</row>
		<row>
			<analog type="input" name="RightHoleTime"/>
			<functionblock position="bottom" type="TP"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="Step15"/>
			<contact type="open" name="CustomLTFires"/>
			<line/>
			<coil type="open" name="CLTTemp"/>
		</row>
		<row>
			<contact type="closed" name="InCycle"/>
			<contact type="open" name="CycleCustomLTDie" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="CycleCustomLTDie"/>
			<line/>
			<line/>
			<coil type="reset" name="CycleCustomLTDie"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="CLTTemp"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="CustomLTDwell"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="CustomLTTime"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="TP_6" type="TP"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TP"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="CLTTemp"/>
			<functionblock position="middle" type="TP"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="CustomLTValve"/>
		</row>
		<row>
			<analog type="input" name="CustomLTTime"/>
			<functionblock position="bottom" type="TP"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="Step15"/>
			<contact type="open" name="CustomVFires"/>
			<line/>
			<coil type="open" name="CustomVTemp"/>
		</row>
		<row>
			<contact type="closed" name="InCycle"/>
			<contact type="open" name="CycleCustomVDie" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="CycleCustomVDie"/>
			<line/>
			<line/>
			<coil type="reset" name="CycleCustomVDie"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="CustomVTemp"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="CustomVDwell"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="CustomVTime"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="TP_7" type="TP"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TP"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="CustomVTemp"/>
			<functionblock position="middle" type="TP"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="CustomVValve"/>
		</row>
		<row>
			<analog type="input" name="CustomVTime"/>
			<functionblock position="bottom" type="TP"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="Removed most of the button cycle" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="Step15"/>
			<contact type="positive transition" name="ButtonBack7"/>
			<line/>
			<coil type="open" name="UnlatchButtons"/>
		</row>
		<row>
			<contact type="negative transition" name="InCycle"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Step15"/>
			<contact type="open" name="ButtonFires"/>
			<contact type="closed" name="UnlatchButtons"/>
			<coil type="open" name="CycleButtons"/>
		</row>
		<row>
			<contact type="open" name="CycleButtons"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="Step15"/>
			<contact type="positive transition" name="ShearClampUpProx"/>
			<line/>
			<coil type="reset" name="ShearBrakeLatch"/>
		</row>
		<row>
			<contact type="open" name="ShearBrakeLatch" or="true"/>
			<empty or="true"/>
			<line/>
			<coil type="open" name="UnlatchBender"/>
		</row>
		<row>
			<contact type="negative transition" name="ProcessorDriveEnable"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Step15"/>
			<contact type="open" name="ShearBrakeFires"/>
			<contact type="closed" name="UnlatchBender"/>
			<coil type="open" name="CycleMaleBender"/>
		</row>
		<row>
			<contact type="open" name="ShearBrakeLatch"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="CycleMaleBender"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="ShearValve"/>
			<contact type="closed" name="LTValve"/>
			<contact type="closed" name="VValve"/>
			<contact type="closed" name="LHoleValve"/>
			<contact type="open" name="HolePunchUp"/>
			<coil type="open" name="ThirdOff1"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty or="true"/>
			<contact type="closed" name="PunchMaster" or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="closed" name="CHoleValve"/>
			<contact type="closed" name="RHoleValve"/>
			<contact type="closed" name="ChangeKDRolls"/>
			<contact type="closed" name="CycleMaleBender"/>
			<coil type="open" name="ThirdOff2"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="closed" name="CycleButtons"/>
			<contact type="closed" name="CustomLTValve"/>
			<contact type="closed" name="CustomVValve"/>
			<contact type="closed" name="WaitCon3"/>
			<coil type="open" name="ThirdOff3"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Step17"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="DieUpDelay"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="DieUpTime"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
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
			<contact type="open" name="Step17"/>
			<contact type="closed" name="GStep18"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="DieDelayDone"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="DieUpTime"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="PartCutOff"/>
			<line/>
			<line/>
			<coil type="open" name="IncPartsMade"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="GStep18"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="GapTime"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="GTime"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<empty/>
			<functionblock position="header" name="TP_8" type="TP"/>
			<empty/>
		</row>
		<row>
			<line/>
			<line/>
			<line/>
			<functionblock position="top" type="TP"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="GStep18"/>
			<contact type="open" name="PartCutOff"/>
			<contact type="open" name="DuctoAuto"/>
			<functionblock position="middle" type="TP"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="GapTP"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="GTime"/>
			<functionblock position="bottom" type="TP"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="GapTP"/>
			<line/>
			<line/>
			<coil type="open" name="GapPulse"/>
		</row>
		<row>
			<contact type="positive transition" name="GStep18" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="6" column="0" commented="0">
		<row>
			<contact type="positive transition" name="GStep18"/>
			<contact type="open" name="IncPartsMade"/>
			<function position="top" type="ADD"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="PartsMade"/>
			<function position="middle" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="PartsMade"/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="1"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<function position="top" type="ADD"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PartLength"/>
			<function position="middle" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="RTotalInches"/>
			<empty/>
		</row>
		<row>
			<analog type="input" name="RTotalInches"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="ChangeJob1"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="0"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="PartsMade"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="RTotalInches"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="TotalInches"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="ClearLengthCountSignal"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="RTotalInches"/>
		</row>
		<row>
			<analog type="input" name="FALSE"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="ClearLengthCountSignal"/>
		</row>
	</network>
	<network label="" comment="Set StartSignal for touchscreen. Touchscreen resets StartSignal at the tail end of the data transfer." row="2" column="0" commented="0">
		<row>
			<contact type="open" name="FeedInitiate"/>
			<contact type="open" name="InCycle"/>
			<line/>
			<coil type="open" name="Step01"/>
		</row>
		<row>
			<contact type="open" name="Step01" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="StartSignal"/>
			<contact type="open" name="Step01"/>
			<line/>
			<coil type="open" name="Step02"/>
		</row>
		<row>
			<contact type="open" name="Step02" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="StartSignal"/>
			<contact type="open" name="Step02"/>
			<line/>
			<coil type="open" name="Step03"/>
		</row>
		<row>
			<contact type="open" name="Step03" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="The last step in the sequence determines if the processor should stop to wait for the FeedInitiate signal. The manual signal is set if the processor needs to stop. The manual signal ujnlatches all steps past Step05B and the waits at Step05B for for FeedInitiate. The auto signal is set if the processor can continue without a FeedInitiate signal. The auto signal unlatches all steps past Step06." row="3" column="0" commented="0">
		<row>
			<contact type="open" name="FeedInitiate"/>
			<contact type="open" name="Step03"/>
			<contact type="closed" name="GManualSignal"/>
			<coil type="open" name="Step06"/>
		</row>
		<row>
			<contact type="positive transition" name="Step03" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="Step06" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="InitMoveSignal"/>
			<contact type="open" name="Step06"/>
			<contact type="closed" name="AutoSignal"/>
			<coil type="open" name="Step07"/>
		</row>
		<row>
			<contact type="open" name="Step07" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Step08 enables the the rungs that determine the length of the next move and what to do when it completes. This will execute multiple times in some cases before it is finished." row="2" column="0" commented="0">
		<row>
			<contact type="open" name="DataUpdated"/>
			<contact type="open" name="Step07"/>
			<contact type="closed" name="NextMoveLookAgain"/>
			<coil type="open" name="Step08"/>
		</row>
		<row>
			<contact type="open" name="Step08" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="NextMoveDone"/>
			<contact type="open" name="Step08"/>
			<line/>
			<coil type="open" name="Step08A"/>
		</row>
		<row>
			<contact type="open" name="Step08A" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="UpdateTablesDone"/>
			<contact type="open" name="Step08A"/>
			<line/>
			<coil type="open" name="Step08B"/>
		</row>
		<row>
			<contact type="open" name="Step08B" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="NextMoveComplete"/>
			<contact type="open" name="Step08B"/>
			<line/>
			<coil type="open" name="Step09"/>
		</row>
		<row>
			<contact type="open" name="Step09" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="ClearEncoderSignal"/>
			<contact type="open" name="Step09"/>
			<line/>
			<coil type="open" name="Step10"/>
		</row>
		<row>
			<contact type="open" name="Step10" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="RunSpeedCalculated"/>
			<contact type="open" name="Step10"/>
			<line/>
			<coil type="open" name="Step11"/>
		</row>
		<row>
			<contact type="open" name="Step11" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="FeedMoveQed"/>
			<contact type="open" name="Step11"/>
			<line/>
			<coil type="open" name="GStep12"/>
		</row>
		<row>
			<contact type="open" name="GStep12" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="InPosition1"/>
			<contact type="open" name="GStep12"/>
			<line/>
			<coil type="open" name="Step13"/>
		</row>
		<row>
			<contact type="open" name="Step13" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="InPosition1"/>
			<contact type="open" name="Step13"/>
			<line/>
			<coil type="open" name="Step14"/>
		</row>
		<row>
			<contact type="open" name="Step14" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Dies fire when Step15 latches. Step16 latches when when a die fires or another operation begins. Step17 latches when all operations are finished." row="2" column="0" commented="0">
		<row>
			<contact type="open" name="Wait1Ready"/>
			<contact type="open" name="Wait2Ready"/>
			<contact type="open" name="Wait3Ready"/>
			<contact type="open" name="Step14"/>
			<coil type="open" name="Step15"/>
		</row>
		<row>
			<contact type="open" name="Step15"/>
			<line/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="closed" name="ThirdOff1"/>
			<contact type="open" name="Step15"/>
			<line/>
			<coil type="open" name="Step16"/>
		</row>
		<row>
			<contact type="closed" name="ThirdOff2" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="closed" name="ThirdOff3" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="Step16" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="ThirdOff1"/>
			<contact type="open" name="ThirdOff2"/>
			<contact type="open" name="ThirdOff3"/>
			<contact type="open" name="Step16"/>
			<coil type="open" name="Step17"/>
		</row>
		<row>
			<contact type="open" name="Step17"/>
			<line/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="DieDelayDone"/>
			<contact type="open" name="Step17"/>
			<line/>
			<coil type="open" name="GStep18"/>
		</row>
		<row>
			<contact type="open" name="GStep18" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="open" name="GapPulse"/>
			<contact type="open" name="PartCutOff"/>
			<contact type="open" name="DuctoAuto"/>
			<contact type="open" name="GStep18"/>
			<coil type="open" name="Step18A"/>
		</row>
		<row>
			<contact type="closed" name="PartCutOff"/>
			<line/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="closed" name="DuctoAuto"/>
			<line/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="Step18A"/>
			<line/>
			<line or="true"/>
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
			<analog type="output" name="ShearHitsLTZero"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!ShearHits &lt; 0"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="closed" name="GapPulse"/>
			<contact type="open" name="Step18A"/>
			<line/>
			<coil type="open" name="GStep18B"/>
		</row>
		<row>
			<contact type="open" name="ShearHitsLTZero" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="closed" name="DuctoAuto" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="GStep18B" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="closed" name="ShearFires"/>
			<line/>
			<line/>
			<contact type="open" name="GStep18B"/>
			<coil type="open" name="GStep19"/>
		</row>
		<row>
			<contact type="open" name="ShearFires"/>
			<contact type="closed" name="MakeShearTable"/>
			<contact type="closed" name="OneMorePart" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="ShearFires"/>
			<contact type="closed" name="DuctoAuto"/>
			<contact type="open" name="OneMorePart" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="GStep19"/>
			<line/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="5" column="0" commented="0">
		<row>
			<contact type="open" name="GStep19"/>
			<contact type="closed" name="ShearHitsLTZero"/>
			<contact type="open" name="ShearFires"/>
			<contact type="open" name="CropCut"/>
			<line/>
			<coil type="open" name="GManualSignal"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<contact type="open" name="ShearFires"/>
			<contact type="open" name="PartCutOff"/>
			<contact type="closed" name="DuctoAuto" or="true"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<contact type="closed" name="ShearFires"/>
			<line/>
			<line/>
			<coil type="open" name="AutoSignal"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<contact type="open" name="ShearFires"/>
			<contact type="closed" name="PartCutOff"/>
			<contact type="closed" name="CropCut" or="true"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<contact type="open" name="ShearFires"/>
			<contact type="open" name="PartCutOff"/>
			<contact type="open" name="DuctoAuto" or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="ShearHitsLTZero"/>
			<contact type="open" name="GStep19"/>
			<line/>
			<coil type="open" name="Step20"/>
		</row>
		<row>
			<contact type="open" name="Step20" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="ReturnCalculated"/>
			<contact type="open" name="Step20"/>
			<line/>
			<coil type="open" name="GStep21"/>
		</row>
		<row>
			<contact type="open" name="GStep21" or="true"/>
			<empty/>
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
			<analog type="input" name="ActlMetalEncoder"/>
			<function position="middle" type="LE"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="ReturnComplete"/>
		</row>
		<row>
			<analog type="input" name="ReturnTarget"/>
			<function position="bottom" type="LE"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="ReturnComplete"/>
			<contact type="open" name="GStep21"/>
			<line/>
			<coil type="open" name="Step22"/>
		</row>
		<row>
			<contact type="closed" name="MatlAtMeasureRoll" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="Step22" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="GManualSignal"/>
			<contact type="open" name="ShearFires"/>
			<contact type="open" name="CropCut"/>
			<coil type="reset" name="CropCut"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="closed" name="InCycle"/>
			<contact type="closed" name="CropCut"/>
			<line/>
			<coil type="set" name="CropCut"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="AutoSignal"/>
			<contact type="open" name="ZeroCropCut"/>
			<function position="top" type="Compare!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<function position="middle" type="Compare!"><input name=""/><output name="56"/></function>
			<analog type="output" name="ZCOLT0"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!ZeroCropOffset &lt;= 0"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="ZCOLT0"/>
			<line/>
			<line/>
			<coil type="reset" name="CropCut"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="ZeroCropCut"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Step20"/>
			<function position="top" type="Compute!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<function position="middle" type="Compute!"><input name=""/><output name="56"/></function>
			<analog type="output" name="ReturnTarget"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compute!"><input name="&lt;!ActlMetalEncoder - REAL_TO_DINT(ZeroCropOffset*UnitsPerInch1*MetalScaler)"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Step20"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="ReturnTarget"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="MetalTarget"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="LeftDiePosition[LeftShuttleIndex]"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="LeftPosA"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="LHoleValve"/>
			<line/>
			<line/>
			<coil type="set" name="GChangeLShuttle"/>
		</row>
		<row>
			<contact type="positive transition" name="InCycle" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="GChangeLShuttle"/>
			<contact type="positive transition" name="Step09"/>
			<line/>
			<coil type="open" name="GLShuttleUnlatch"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<line/>
			<coil type="reset" name="GChangeLShuttle"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="LeftPosA"/>
			<contact type="open" name="GLShuttleUnlatch"/>
			<contact type="open" name="InCycle"/>
			<coil type="open" name="LeftShuttleOutput"/>
		</row>
		<row>
			<contact type="open" name="LeftShuttleOutput"/>
			<contact type="closed" name="GLShuttleUnlatch" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="LeftShuttleOutput"/>
			<line/>
			<line/>
			<coil type="open" name="PunchMasterShiftSolenoid"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="CenterDiePosition[CenterShuttleIndex]"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="CenterPosA"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="CHoleValve"/>
			<line/>
			<line/>
			<coil type="set" name="ChangeCShuttle"/>
		</row>
		<row>
			<contact type="positive transition" name="InCycle" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="ChangeCShuttle"/>
			<contact type="positive transition" name="Step09"/>
			<line/>
			<coil type="open" name="CShuttleUnlatch"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<line/>
			<coil type="reset" name="ChangeCShuttle"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="CenterPosA"/>
			<contact type="open" name="CShuttleUnlatch"/>
			<contact type="open" name="InCycle"/>
			<coil type="open" name="CenterShuttleOutput"/>
		</row>
		<row>
			<contact type="open" name="CenterShuttleOutput"/>
			<contact type="closed" name="CShuttleUnlatch" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="RightDiePosition[RightShuttleIndex]"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="RightPosA"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="RHoleValve"/>
			<line/>
			<line/>
			<coil type="set" name="ChangeRShuttle"/>
		</row>
		<row>
			<contact type="positive transition" name="InCycle" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="ChangeRShuttle"/>
			<contact type="positive transition" name="Step09"/>
			<line/>
			<coil type="open" name="RShuttleUnlatch"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<line/>
			<coil type="reset" name="ChangeRShuttle"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="RightPosA"/>
			<contact type="open" name="RShuttleUnlatch"/>
			<contact type="open" name="InCycle"/>
			<coil type="open" name="RightShuttleOutput"/>
		</row>
		<row>
			<contact type="open" name="RightShuttleOutput"/>
			<contact type="closed" name="RShuttleUnlatch" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="InCycle"/>
			<contact type="closed" name="InPosition1"/>
			<line/>
			<coil type="open" name="UncoilerRun"/>
		</row>
	</network>
</networks>
END_PROGRAM















































