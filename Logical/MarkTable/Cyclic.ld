PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="MarkTableStop"/>
			<line/>
			<line/>
			<coil type="open" name="MarkTableLatch"/>
		</row>
		<row>
			<contact type="open" name="MarkTableStart" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Sometimes Mark Table Start latches itself and there is no stop. Sometimes Start is momentary and stop is NC. This will work either way." row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="MarkTableStart"/>
			<contact type="open" name="MarkTableLatch"/>
			<line/>
			<coil type="open" name="MarkTableOn"/>
		</row>
		<row>
			<contact type="open" name="MarkTableOn" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="open" name="DuctSelected"/>
			<line/>
			<line/>
			<coil type="open" name="BackUpParts"/>
		</row>
		<row>
			<contact type="open" name="DischargeMarkSide" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="DischargeTDCSide" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="DischargeTDCEnd" or="true"/>
			<empty/>
			<empty/>
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
			<analog type="input" name="MarkTransferModel"/>
			<function position="middle" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="TableStyle2"/>
		</row>
		<row>
			<analog type="input" name="2"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="MatlAtMarkTable"/>
			<contact type="open" name="TableStyle2"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="MarkTableDecelDelay"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="tmDirectionDelay"/>
		</row>
	</network>
	<network label="" comment="U Line Transfer Table #2, Gate Raises And Chain Pushers." row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="MatlAtMarkTable"/>
			<contact type="open" name="MarkTableOn"/>
			<contact type="open" name="BackUpParts"/>
			<contact type="closed" name="Step9"/>
			<coil type="open" name="Step1"/>
		</row>
		<row>
			<contact type="open" name="Step1" or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="truepart"/>
			<contact type="open" name="Step1"/>
			<line/>
			<coil type="open" name="Step2"/>
		</row>
		<row>
			<contact type="open" name="Step2" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="truepartoff"/>
			<contact type="open" name="Step2"/>
			<line/>
			<coil type="open" name="Step3"/>
		</row>
		<row>
			<contact type="open" name="Step3" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="DirectionDelay"/>
			<contact type="open" name="Step3"/>
			<line/>
			<coil type="open" name="Step4"/>
		</row>
		<row>
			<contact type="open" name="Step4" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="MatlAtMarkTable"/>
			<contact type="open" name="Step4"/>
			<line/>
			<coil type="open" name="Step5"/>
		</row>
		<row>
			<contact type="open" name="Step5" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="WaitDone"/>
			<contact type="open" name="Step5"/>
			<line/>
			<coil type="open" name="Step6"/>
		</row>
		<row>
			<contact type="open" name="Step6" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="MarkPshrHome"/>
			<contact type="open" name="Step6"/>
			<line/>
			<coil type="open" name="Step6A"/>
		</row>
		<row>
			<contact type="open" name="Step6A" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="MarkPshrHome"/>
			<contact type="open" name="Step6A"/>
			<line/>
			<coil type="open" name="Step7"/>
		</row>
		<row>
			<contact type="open" name="Step7" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="GateReset"/>
			<contact type="open" name="Step7"/>
			<line/>
			<coil type="open" name="Step8"/>
		</row>
		<row>
			<contact type="open" name="Step8" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="DirectionDelay"/>
			<contact type="open" name="Step8"/>
			<line/>
			<coil type="open" name="Step9"/>
		</row>
		<row>
			<contact type="closed" name="ULineSelected"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="closed" name="TableStyle2"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Z Line, Transfer Table #2" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="MatlAtMarkTable"/>
			<contact type="open" name="MarkTableOn"/>
			<contact type="open" name="BackUpParts"/>
			<contact type="closed" name="Step15"/>
			<coil type="open" name="Step11"/>
		</row>
		<row>
			<contact type="open" name="Step11" or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="truepart"/>
			<contact type="open" name="Step11"/>
			<line/>
			<coil type="open" name="Step12"/>
		</row>
		<row>
			<contact type="open" name="Step12" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="WaitDone"/>
			<contact type="open" name="Step12"/>
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
			<contact type="closed" name="MarkPshrHome"/>
			<contact type="open" name="Step13"/>
			<line/>
			<coil type="open" name="Step13A"/>
		</row>
		<row>
			<contact type="open" name="Step13A" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="MarkPshrHome"/>
			<contact type="open" name="Step13A"/>
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
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="closed" name="MatlAtMarkTable"/>
			<contact type="open" name="Step14"/>
			<line/>
			<coil type="open" name="Step15"/>
		</row>
		<row>
			<contact type="open" name="ULineSelected"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="closed" name="TableStyle2"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<empty/>
			<functionblock position="header" name="TON_2" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<line/>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="Step3"/>
			<contact type="closed" name="Step4"/>
			<line/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="DirectionDelay"/>
		</row>
		<row>
			<contact type="open" name="Step8"/>
			<contact type="closed" name="Step9" or="true"/>
			<analog type="input" name="tmDirectionDelay"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="MatlAtMarkTable"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="MarkGateUpDwell"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="GateUpTime"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="MatlAtMarkTable"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="MarkPStartDelay"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="SettleTime"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<functionblock position="header" name="TON_3" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<line/>
			<line/>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="MatlAtMarkTable"/>
			<contact type="open" name="Step1"/>
			<contact type="closed" name="Step2"/>
			<line/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="truepart"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="Step11"/>
			<contact type="closed" name="Step12" or="true"/>
			<analog type="input" name="T#500ms"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<empty/>
			<functionblock position="header" name="TON_4" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<line/>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="closed" name="MatlAtMarkTable"/>
			<contact type="open" name="Step2"/>
			<contact type="closed" name="Step3"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="truepartoff"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="T#500ms"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<empty/>
			<functionblock position="header" name="TON_5" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<line/>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="Step5"/>
			<contact type="closed" name="Step6"/>
			<line/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="WaitDone"/>
		</row>
		<row>
			<contact type="open" name="Step12"/>
			<contact type="closed" name="Step13" or="true"/>
			<analog type="input" name="SettleTime"/>
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
			<contact type="open" name="Step7"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="GateReset"/>
		</row>
		<row>
			<analog type="input" name="GateUpTime"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="Step4"/>
			<line/>
			<line/>
			<coil type="open" name="TableFwd2"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="MarkTableOn"/>
			<contact type="open" name="ULineSelected"/>
			<contact type="closed" name="Step3"/>
			<coil type="open" name="TableRev2"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="closed" name="ULineSelected"/>
			<line or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="Step3"/>
			<contact type="closed" name="Step8"/>
			<line/>
			<coil type="open" name="Gate2"/>
		</row>
		<row>
			<contact type="closed" name="ULineSelected"/>
			<contact type="open" name="MarkTableOn"/>
			<contact type="open" name="BackUpParts" or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="Step6"/>
			<line/>
			<line/>
			<coil type="open" name="PSettled"/>
		</row>
		<row>
			<contact type="open" name="Step13" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Mark TT Pusher Sequence" row="1" column="0" commented="0">
		<row>
			<contact type="closed" name="DuctSelected"/>
			<contact type="open" name="DischargeMarkSide"/>
			<line/>
			<coil type="open" name="PushReverse"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="MarkTableOn"/>
			<line/>
			<line/>
			<coil type="open" name="SetupPushers"/>
		</row>
		<row>
			<contact type="positive transition" name="PushReverse" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="negative transition" name="PushReverse" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="PSettled"/>
			<contact type="open" name="PSettled"/>
			<contact type="open" name="MarkTableOn"/>
			<contact type="closed" name="PushReverse"/>
			<contact type="closed" name="Psh6"/>
			<coil type="open" name="Psh1"/>
		</row>
		<row>
			<contact type="open" name="SetupPushers"/>
			<line or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="Psh1"/>
			<line or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="PshStartTmrDone"/>
			<contact type="open" name="Psh1"/>
			<line/>
			<coil type="open" name="Psh2"/>
		</row>
		<row>
			<contact type="open" name="SetupPushers" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="Psh2" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="negative transition" name="MarkPushComplete"/>
			<contact type="open" name="Psh2"/>
			<line/>
			<coil type="open" name="Psh3"/>
		</row>
		<row>
			<contact type="positive transition" name="MarkPusherStop" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="SetupPushers" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="Psh3" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="open" name="PshPauseTmrDone"/>
			<contact type="open" name="Psh3"/>
			<line/>
			<coil type="open" name="Psh4"/>
		</row>
		<row>
			<contact type="positive transition" name="MarkPusherStop" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="SetupPushers" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="Psh4" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="MarkPusherStop"/>
			<contact type="open" name="Psh4"/>
			<line/>
			<coil type="open" name="Psh5"/>
		</row>
		<row>
			<contact type="open" name="Psh5" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="PshStopDelayTmrDone"/>
			<contact type="open" name="Psh5"/>
			<line/>
			<coil type="open" name="Psh6"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Psh1"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="MarkPStartDelay"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="tmMPSD"/>
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
			<contact type="open" name="Psh1"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="PshStartTmrDone"/>
		</row>
		<row>
			<analog type="input" name="tmMPSD"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Psh3"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="MarkPPauseDwell"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="tmPPDwell"/>
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
			<contact type="open" name="Psh3"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="PshPauseTmrDone"/>
		</row>
		<row>
			<analog type="input" name="tmPPDwell"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Psh5"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="MarkPStopDelay"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="tmMPSDelay"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="TON_9" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="Psh5"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="PshStopDelayTmrDone"/>
		</row>
		<row>
			<analog type="input" name="tmMPSDelay"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="PSettled"/>
			<contact type="open" name="MarkTableOn"/>
			<contact type="open" name="PushReverse"/>
			<contact type="closed" name="Psh11"/>
			<coil type="open" name="Psh8"/>
		</row>
		<row>
			<contact type="open" name="SetupPushers" or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="Psh8" or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="MarkPusherStop"/>
			<contact type="open" name="Psh8"/>
			<line/>
			<coil type="open" name="Psh9"/>
		</row>
		<row>
			<contact type="open" name="Psh9" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="MarkPusherStop"/>
			<contact type="open" name="Psh9"/>
			<line/>
			<coil type="open" name="Psh10"/>
		</row>
		<row>
			<contact type="open" name="Psh10" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="PshStageTmrDone"/>
			<contact type="open" name="Psh10"/>
			<line/>
			<coil type="open" name="Psh11"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Psh10"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="MarkPStageTime"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="tmMPS"/>
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
			<contact type="open" name="Psh10"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="PshStageTmrDone"/>
		</row>
		<row>
			<analog type="input" name="tmMPS"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="Psh2"/>
			<contact type="closed" name="Psh3"/>
			<line/>
			<coil type="open" name="PushValve2"/>
		</row>
		<row>
			<contact type="open" name="Psh4"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="closed" name="Psh1"/>
			<contact type="closed" name="Psh8"/>
			<contact type="open" name="MarkTableOn"/>
			<coil type="open" name="MarkPshrHome"/>
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
			<analog type="output" name="TableStyle3"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!MarkTransferModel = 3"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="Transfer Table Forward, Table Style #3 - Gate Raises" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="MarkConveyorDelayFwd"/>
			<contact type="open" name="TableStyle3"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="MarkTableDecelDelay"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="ForwardDelay"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<empty/>
			<functionblock position="header" name="TON_0" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<line/>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="MarkTableOn"/>
			<contact type="open" name="DuctSelected"/>
			<contact type="open" name="MarkConveyorDelayFwd"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="TableFwd3"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="ForwardDelay"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="Transfer Table Reverse" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="MatlAtMarkTable"/>
			<contact type="open" name="TableStyle3"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="MarkGateUpDwell"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="ReverseDelay"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<functionblock position="header" name="TON_1" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<line/>
			<line/>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="MarkTableOn"/>
			<contact type="open" name="DuctSelected"/>
			<contact type="open" name="MatlAtMarkTable"/>
			<line/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="TableRev3"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="closed" name="DuctSelected"/>
			<line or="true"/>
			<analog type="input" name="ReverseDelay"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="Pusher Output" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="TableStyle3"/>
			<contact type="positive transition" name="MarkPushComplete"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="MarkPStartDelay"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="PusherOffDelay"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="TableStyle3"/>
			<contact type="positive transition" name="MarkPushComplete"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="MarkPStopDelay"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="MPRTime"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="TON_13" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="MarkPushComplete"/>
			<contact type="open" name="MarkConveyorDelayFwd"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="MarkPushReady"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="MPRTime"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="TOF_0" type="TOF"/>
			<empty/>
		</row>
		<row>
			<line/>
			<line/>
			<functionblock position="top" type="TOF"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="TableFwd3"/>
			<contact type="open" name="MarkPushReady"/>
			<functionblock position="middle" type="TOF"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="PushValve3"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="PusherOffDelay"/>
			<functionblock position="bottom" type="TOF"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="Gate Raise Output" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="MarkPusherStop"/>
			<contact type="open" name="TableStyle3"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="MarkPPauseDwell"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="GateLowerDelay"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="TOF_1" type="TOF"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TOF"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="MarkPusherStop"/>
			<functionblock position="middle" type="TOF"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="MarkPusherStopDOB"/>
		</row>
		<row>
			<analog type="input" name="GateLowerDelay"/>
			<functionblock position="bottom" type="TOF"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="MarkPusherStopDOB"/>
			<line/>
			<line/>
			<coil type="open" name="Gate3"/>
		</row>
		<row>
			<contact type="open" name="MarkTableOn"/>
			<contact type="closed" name="DuctSelected" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Switch local variables to physical outputs based on table type." row="2" column="0" commented="0">
		<row>
			<contact type="open" name="TableFwd3"/>
			<contact type="open" name="TableStyle3"/>
			<line/>
			<coil type="open" name="MarkTableFwd"/>
		</row>
		<row>
			<contact type="open" name="TableFwd2"/>
			<contact type="open" name="TableStyle2" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="TableRev3"/>
			<contact type="open" name="TableStyle3"/>
			<line/>
			<coil type="open" name="MarkTableRev"/>
		</row>
		<row>
			<contact type="open" name="TableRev2"/>
			<contact type="open" name="TableStyle2" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="PushValve3"/>
			<contact type="open" name="TableStyle3"/>
			<line/>
			<coil type="open" name="MarkPshrFwd"/>
		</row>
		<row>
			<contact type="open" name="PushValve2"/>
			<contact type="open" name="TableStyle2" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="TableStyle3"/>
			<contact type="open" name="MarkTableOn"/>
			<contact type="closed" name="MarkPshrFwd"/>
			<contact type="open" name="Mark3PusherHome"/>
			<coil type="open" name="MarkPusherReverse"/>
		</row>
		<row>
			<contact type="open" name="Psh8"/>
			<line/>
			<line/>
			<line or="true"/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="MarkTTPusherJogRevPB"/>
			<line/>
			<line/>
			<line or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="Gate3"/>
			<contact type="open" name="TableStyle3"/>
			<line/>
			<coil type="open" name="MarkGateRaise"/>
		</row>
		<row>
			<contact type="open" name="Gate2"/>
			<contact type="open" name="TableStyle2" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
</networks>
END_PROGRAM



















