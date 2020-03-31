PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="TDCRFPusherStart"/>
			<contact type="closed" name="TDCPusherEnable"/>
			<line/>
			<coil type="set" name="TDCPushSignal"/>
		</row>
		<row>
			<contact type="negative transition" name="TDCRFPusherStart"/>
			<contact type="open" name="TDCPusherEnable" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="negative transition" name="TDCRFPusherStop"/>
			<contact type="open" name="TDCPusherEnable" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="TDCPushSignal"/>
			<contact type="open" name="TDCPusherEnable"/>
			<line/>
			<coil type="open" name="TDCPusherUnlatch"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="TDCPushSignal"/>
			<contact type="closed" name="TDCPusherUnlatch"/>
			<line/>
			<coil type="open" name="TDCPusherEnable"/>
		</row>
		<row>
			<contact type="open" name="TDCPusherEnable" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="TDCPusherEnable"/>
			<line/>
			<line/>
			<coil type="open" name="TDCRFPusherIndicator"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="TDCPushSignal"/>
			<line/>
			<line/>
			<coil type="reset" name="TDCPushSignal"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="negative transition" name="TDCPushPartPresent"/>
			<line/>
			<line/>
			<coil type="open" name="TDCRFStartPush"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="TDCRFStartPush"/>
			<contact type="open" name="TDCPusherEnable"/>
			<contact type="closed" name="TDCRFP3"/>
			<coil type="open" name="TDCRFP1"/>
		</row>
		<row>
			<contact type="open" name="TDCRFP1" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="TDCPushDelayDone"/>
			<contact type="open" name="TDCRFP1"/>
			<line/>
			<coil type="open" name="TDCRFP2"/>
		</row>
		<row>
			<contact type="open" name="TDCRFP2" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="closed" name="TDCPushStrokeComplete"/>
			<contact type="open" name="TDCRFP2"/>
			<line/>
			<coil type="open" name="TDCRFP3"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="TDCPushStrokeComplete"/>
			<contact type="open" name="TDCRFP4"/>
			<line/>
			<coil type="open" name="TDCRFP5"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="TDCPusherEnable"/>
			<contact type="open" name="TDCPusherEnable"/>
			<contact type="closed" name="TDCRFP5"/>
			<coil type="open" name="TDCRFP4"/>
		</row>
		<row>
			<contact type="open" name="TDCRFP3" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="TDCRFP4" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="TDCRFP1"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="TDCRFPushDelay"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="TDCRFPTime"/>
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
			<contact type="open" name="TDCRFP1"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="TDCPushDelayDone"/>
		</row>
		<row>
			<analog type="input" name="TDCRFPTime"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="TDCRFP2"/>
			<line/>
			<line/>
			<coil type="open" name="TDCRFPusherFwd"/>
		</row>
		<row>
			<contact type="open" name="TDCRFP4" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="TDCPusherRevPB"/>
			<contact type="closed" name="TDCRFPusherFwd"/>
			<line/>
			<coil type="open" name="TDCRFPusherRev"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="diTDCAdjustableHeadJogIn"/>
			<line/>
			<line/>
			<coil type="open" name="doTDCAdjustableHeadIn"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="diTDCAdjustableHeadJogOut"/>
			<line/>
			<line/>
			<coil type="open" name="doTDCAdjustableHeadOut"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="diTDCFixedHeadJogIn"/>
			<line/>
			<line/>
			<coil type="open" name="doTDCFixedHeadIn"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="diTDCFixedHeadJogOut"/>
			<line/>
			<line/>
			<coil type="open" name="doTDCFixedHeadOut"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="TDCMotorLatch"/>
			<line/>
			<line/>
			<coil type="open" name="TDCRFMotor"/>
		</row>
		<row>
			<contact type="open" name="diTDCRollformerJog" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
</networks>
END_PROGRAM



