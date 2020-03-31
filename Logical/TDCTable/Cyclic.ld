PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="MarkAuto"/>
			<contact type="negative transition" name="MarkRFHighSpeed"/>
			<line/>
			<coil type="open" name="MarkSetComplete"/>
		</row>
	</network>
	<network label="" comment="" row="6" column="0" commented="0">
		<row>
			<contact type="positive transition" name="TDCConveyorRun"/>
			<line/>
			<contact type="open" name="TDCConveyorRun"/>
			<contact type="closed" name="Cycle6"/>
			<contact type="open" name="TDCPusherStyle"/>
			<coil type="open" name="Cycle1"/>
		</row>
		<row>
			<contact type="positive transition" name="TDCTablePartProx"/>
			<contact type="closed" name="DischargeTDCSide" or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="MarkSetComplete"/>
			<line or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="positive transition" name="DuctSelected"/>
			<line or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="negative transition" name="DuctSelected"/>
			<line or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="Cycle1"/>
			<line or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="PartSquared"/>
			<contact type="open" name="Cycle1"/>
			<line/>
			<coil type="open" name="Cycle2"/>
		</row>
		<row>
			<contact type="open" name="Cycle2" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="TDCTablePause"/>
			<contact type="open" name="Cycle2"/>
			<line/>
			<coil type="open" name="Cycle3"/>
		</row>
		<row>
			<contact type="negative transition" name="TDCTablePushStop" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="Cycle3" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="PusherPaused"/>
			<contact type="open" name="Cycle3"/>
			<line/>
			<coil type="open" name="Cycle4"/>
		</row>
		<row>
			<contact type="negative transition" name="TDCTablePushStop" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="Cycle4" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="negative transition" name="TDCTablePushStop"/>
			<contact type="open" name="Cycle4"/>
			<line/>
			<coil type="open" name="Cycle5"/>
		</row>
		<row>
			<contact type="open" name="Cycle5" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="DwellDone"/>
			<contact type="open" name="Cycle5"/>
			<line/>
			<coil type="open" name="Cycle6"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="TDCTablePartProx"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="TDCSquareDelay"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="PartSettleDelay"/>
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
			<contact type="open" name="Cycle1"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="PartSquared"/>
		</row>
		<row>
			<analog type="input" name="PartSettleDelay"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Cycle3"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="TDCTablePauseDwell"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="PauseDwell"/>
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
			<contact type="open" name="Cycle3"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="PusherPaused"/>
		</row>
		<row>
			<analog type="input" name="PauseDwell"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Cycle5"/>
			<function position="top" type="Compute!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<function position="middle" type="Compute!"><input name=""/><output name="56"/></function>
			<analog type="output" name="PusherDwellReal"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compute!"><input name="&lt;!((TDCTableLength - TDCPartLength - 2.0) / TableSpeed) * 1000.0"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Cycle5"/>
			<function position="top" type="REAL_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PusherDwellReal"/>
			<function position="bottom" type="REAL_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="PusherDwellTime"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Cycle5"/>
			<function position="top" type="Compare!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<function position="middle" type="Compare!"><input name=""/><output name="56"/></function>
			<analog type="output" name="UseMinDwell"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!(PusherDwellTime &lt;  T#10ms) OR (TDCPartLength &lt;= 0.0)"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Cycle5"/>
			<contact type="open" name="UseMinDwell"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="T#20ms"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="PusherDwellTime"/>
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
			<contact type="open" name="Cycle5"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="DwellDone"/>
		</row>
		<row>
			<analog type="input" name="PusherDwellTime"/>
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
			<contact type="positive transition" name="TDCConveyorRun"/>
			<contact type="open" name="TDCSetupOutputStyle"/>
			<functionblock position="middle" type="TP"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="SetupPulse"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="T#1s"/>
			<functionblock position="bottom" type="TP"><input name="PT"/><output name="ET"/></functionblock>
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
			<contact type="open" name="TDCTablePartProx"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="KnurledRoll"/>
		</row>
		<row>
			<analog type="input" name="PartSettleDelay"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="closed" name="DuctSelected"/>
			<contact type="open" name="DischargeTDCEnd"/>
			<line/>
			<coil type="open" name="PushReverse"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="open" name="Cycle2"/>
			<contact type="closed" name="Cycle3"/>
			<contact type="closed" name="PushReverse"/>
			<coil type="open" name="TDCTablePusherFwd"/>
		</row>
		<row>
			<contact type="open" name="Cycle4"/>
			<contact type="closed" name="PushReverse"/>
			<line or="true"/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="TDCKnurlRollStyle"/>
			<contact type="open" name="KnurledRoll"/>
			<line or="true"/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="TDCSetupOutputStyle"/>
			<contact type="open" name="SetupPulse"/>
			<line or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="Cycle2"/>
			<contact type="closed" name="Cycle3"/>
			<contact type="open" name="PushReverse"/>
			<coil type="open" name="TDCTablePusherReverse"/>
		</row>
		<row>
			<contact type="open" name="Cycle4"/>
			<contact type="open" name="PushReverse"/>
			<line or="true"/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="TDCTablePusherRevPB"/>
			<contact type="closed" name="TDCTablePusherFwd"/>
			<line or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="TDCTableOn"/>
			<contact type="open" name="TDCTableStop"/>
			<line/>
			<coil type="open" name="TDCConveyorRun"/>
		</row>
		<row>
			<contact type="open" name="TDCConveyorRun" or="true"/>
			<contact type="open" name="TDCTableOn" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="TDCConveyorRun"/>
			<line/>
			<line/>
			<coil type="open" name="TDCTransferOnIndicator"/>
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
			<contact type="open" name="MarkSetComplete"/>
			<functionblock position="middle" type="TP"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="TDCPusherCycle"/>
		</row>
		<row>
			<analog type="input" name="T#500ms"/>
			<functionblock position="bottom" type="TP"><input name="PT"/><output name="ET"/></functionblock>
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
			<analog type="output" name="DuctTypeEquals0"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!DuctType = 0"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="DuctTypeEquals0"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="TDCTableLength"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="TDCPartLength"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="DuctTypeEquals0"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PartLength"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="TDCPartLength"/>
		</row>
	</network>
</networks>
END_PROGRAM




