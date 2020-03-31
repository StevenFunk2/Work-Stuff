PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="ADD"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="RawMarkEncoder"/>
			<function position="middle" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="MarkEncoder"/>
		</row>
		<row>
			<analog type="input" name="MarkRFBase"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="Signal from physical button to PC." row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="MarkSetButton"/>
			<line/>
			<line/>
			<coil type="set" name="MarkButtonSignal"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="Compute!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<function position="middle" type="Compute!"><input name=""/><output name="56"/></function>
			<analog type="output" name="AbsDiff"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compute!"><input name="&lt;!ABS(ScaledTarget - MarkEncoder)"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="Homed"/>
			<function position="top" type="Compare!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<function position="middle" type="Compare!"><input name=""/><output name="56"/></function>
			<analog type="output" name="InPosition"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!AbsDiff &lt;= MarkInPosBand"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="BeginMarkHoming"/>
			<line/>
			<contact type="open" name="MarkAuto"/>
			<coil type="open" name="RefInProcess"/>
		</row>
		<row>
			<contact type="open" name="RefInProcess"/>
			<contact type="closed" name="Homed" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="RefInProcess"/>
			<line/>
			<function position="top" type="Compute!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<contact type="positive transition" name="MarkSetSignal" or="true"/>
			<empty/>
			<function position="middle" type="Compute!"><input name=""/><output name="56"/></function>
			<analog type="output" name="Scaler"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<function position="bottom" type="Compute!"><input name="&lt;!(MarkDesired / MarkActual) * MarkResolution"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="RefInProcess"/>
			<function position="top" type="Compute!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<function position="middle" type="Compute!"><input name=""/><output name="56"/></function>
			<analog type="output" name="ScalerRef"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compute!"><input name="&lt;!REAL_TO_DINT(MarkReference * Scaler)"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="RefInProcess"/>
			<contact type="positive transition" name="MarkRefSwitch"/>
			<line/>
			<coil type="open" name="Homed"/>
		</row>
		<row>
			<contact type="open" name="Homed"/>
			<contact type="closed" name="BeginMarkHoming" or="true"/>
			<empty/>
			<empty/>
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
			<contact type="positive transition" name="Homed"/>
			<functionblock position="middle" type="TP"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="MarkEncoderResetSignal"/>
		</row>
		<row>
			<analog type="input" name="T#500ms"/>
			<functionblock position="bottom" type="TP"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="negative transition" name="MarkEncoderResetSignal"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="ScalerRef"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="MarkRFBase"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="MarkSetSignal"/>
			<function position="top" type="Compare!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<function position="middle" type="Compare!"><input name=""/><output name="56"/></function>
			<analog type="output" name="TargetOk"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!MarkTarget &gt; MarkMinLength"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="MarkSetSignal"/>
			<contact type="open" name="TargetOk"/>
			<contact type="open" name="MarkAuto"/>
			<contact type="open" name="Homed"/>
			<coil type="open" name="MarkSettingUp"/>
		</row>
		<row>
			<contact type="open" name="MarkSettingUp"/>
			<contact type="closed" name="InPosition" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="MarkSettingUp"/>
			<line/>
			<line/>
			<coil type="open" name="GoodToGo"/>
		</row>
		<row>
			<contact type="positive transition" name="CheckPosition"/>
			<contact type="closed" name="InPosition"/>
			<contact type="open" name="MarkSettingUp" or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="GoodToGo"/>
			<function position="top" type="Compute!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<function position="middle" type="Compute!"><input name=""/><output name="56"/></function>
			<analog type="output" name="ScaledTarget"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compute!"><input name="&lt;!REAL_TO_DINT(MarkTarget * Scaler)"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="GoodToGo"/>
			<line/>
			<contact type="open" name="MarkAuto"/>
			<coil type="open" name="SetStepA"/>
		</row>
		<row>
			<contact type="open" name="SetStepA"/>
			<contact type="closed" name="SetStepB" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="SetStepA"/>
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
			<function position="bottom" type="Compute!"><input name="&lt;!REAL_TO_DINT(MarkResolution / 2.0) + ScaledTarget"/></function>
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
			<analog type="output" name="RTGTME"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!ReturnTarget &lt; MarkEncoder"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="SetStepA"/>
			<contact type="open" name="RTGTME"/>
			<line/>
			<coil type="open" name="StepAComplete"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="SetStepB"/>
			<function position="top" type="Compare!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<function position="middle" type="Compare!"><input name=""/><output name="56"/></function>
			<analog type="output" name="StepBWorking"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!MarkEncoder &gt;= ScaledTarget"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="StepAComplete"/>
			<line/>
			<line/>
			<line/>
			<coil type="open" name="SetStepB"/>
		</row>
		<row>
			<contact type="open" name="MarkAuto"/>
			<contact type="open" name="SetStepB"/>
			<contact type="closed" name="InPosition"/>
			<contact type="open" name="StepBWorking" or="true"/>
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
			<contact type="closed" name="SetStepB"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="CheckPosition"/>
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
			<empty/>
			<functionblock position="header" name="TP_0" type="TP"/>
			<empty/>
		</row>
		<row>
			<line/>
			<line/>
			<functionblock position="top" type="TP"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="negative transition" name="MarkRFMoveOut"/>
			<line/>
			<functionblock position="middle" type="TP"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="WaitToChange"/>
		</row>
		<row>
			<contact type="negative transition" name="MarkRFMoveIn" or="true"/>
			<analog type="input" name="T#1250ms"/>
			<functionblock position="bottom" type="TP"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="RefInProcess"/>
			<contact type="open" name="MarkRefSwitch"/>
			<contact type="closed" name="WaitToChange"/>
			<coil type="open" name="MarkRFMoveOut"/>
		</row>
		<row>
			<contact type="open" name="SetStepA"/>
			<line or="true"/>
			<empty or="true"/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="MarkHeadJogOutSwitch"/>
			<contact type="closed" name="MarkAuto"/>
			<line or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="RefInProcess"/>
			<contact type="closed" name="MarkRefSwitch"/>
			<contact type="closed" name="WaitToChange"/>
			<contact type="closed" name="MarkRFMoveOut"/>
			<coil type="open" name="MarkRFMoveIn"/>
		</row>
		<row>
			<contact type="open" name="SetStepB"/>
			<line or="true"/>
			<empty or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="MarkHeadJogInSwitch"/>
			<contact type="closed" name="MarkAuto"/>
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
			<analog type="output" name="NotInSlowBand"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!AbsDiff &gt; MarkSlowBand"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="open" name="SetStepA"/>
			<line/>
			<line/>
			<coil type="open" name="MarkRFHighSpeed"/>
		</row>
		<row>
			<contact type="open" name="SetStepB"/>
			<contact type="open" name="NotInSlowBand"/>
			<line or="true"/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="MarkHiSpeedSignal"/>
			<contact type="open" name="MarkHeadJogInSwitch"/>
			<contact type="closed" name="MarkAuto" or="true"/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="MarkHiSpeedSignal"/>
			<contact type="open" name="MarkHeadJogOutSwitch"/>
			<contact type="closed" name="MarkAuto" or="true"/>
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
			<analog type="input" name="TempStat"/>
			<function position="middle" type="GT"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="MarkSignaling"/>
		</row>
		<row>
			<analog type="input" name="1"/>
			<function position="bottom" type="GT"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="zzTON00000000" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="MarkSignaling"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="SignalTimeUp"/>
		</row>
		<row>
			<analog type="input" name="T#1500ms"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="SignalTimeUp"/>
			<contact type="closed" name="Homed"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="0"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="TempStat"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="SignalTimeUp"/>
			<contact type="open" name="Homed"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="1"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="TempStat"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Homed"/>
			<function position="top" type="Compute!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<function position="middle" type="Compute!"><input name=""/><output name="56"/></function>
			<analog type="output" name="TempStat"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compute!"><input name="&lt;!TempStat + 1"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="negative transition" name="Homed"/>
			<function position="top" type="SUB"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="TempStat"/>
			<function position="middle" type="SUB"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="TempStat"/>
		</row>
		<row>
			<analog type="input" name="1"/>
			<function position="bottom" type="SUB"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="negative transition" name="SetStepB"/>
			<function position="top" type="Compute!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<function position="middle" type="Compute!"><input name=""/><output name="56"/></function>
			<analog type="output" name="TempStat"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compute!"><input name="&lt;!TempStat + 2"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="MarkSetSignal"/>
			<contact type="closed" name="Homed"/>
			<function position="top" type="Compute!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<function position="middle" type="Compute!"><input name=""/><output name="56"/></function>
			<analog type="output" name="TempStat"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<function position="bottom" type="Compute!"><input name="&lt;!TempStat + 4"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="BeginMarkHoming"/>
			<contact type="closed" name="MarkAuto"/>
			<function position="top" type="Compute!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<function position="middle" type="Compute!"><input name=""/><output name="56"/></function>
			<analog type="output" name="TempStat"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<function position="bottom" type="Compute!"><input name="&lt;!TempStat + 8"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="MarkSetSignal"/>
			<contact type="closed" name="MarkAuto"/>
			<function position="top" type="Compute!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<function position="middle" type="Compute!"><input name=""/><output name="56"/></function>
			<analog type="output" name="TempStat"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<function position="bottom" type="Compute!"><input name="&lt;!TempStat + 8"/></function>
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
			<analog type="output" name="TargetTooSmall"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!MarkTarget &lt; MarkMinLength"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="MarkSetSignal"/>
			<contact type="open" name="TargetTooSmall"/>
			<function position="top" type="ADD"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="TempStat"/>
			<function position="middle" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="TempStat"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="16"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
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
			<analog type="input" name="TempStat"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="MarkStatus"/>
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
			<contact type="open" name="BeginMarkHoming"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="ResetMarkHoming"/>
		</row>
		<row>
			<analog type="input" name="T#1s"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="ResetMarkHoming"/>
			<line/>
			<line/>
			<coil type="reset" name="BeginMarkHoming"/>
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
			<contact type="open" name="MarkSetSignal"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="ResetMarkSet"/>
		</row>
		<row>
			<analog type="input" name="T#1s"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="ResetMarkSet"/>
			<line/>
			<line/>
			<coil type="reset" name="MarkSetSignal"/>
		</row>
	</network>
</networks>
END_PROGRAM














