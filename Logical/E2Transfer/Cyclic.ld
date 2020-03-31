PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="TSTransferButton"/>
			<contact type="open" name="TransferSystemPower"/>
			<line/>
			<coil type="open" name="TSPUnlatch"/>
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
			<contact type="positive transition" name="TSTransferButton"/>
			<functionblock position="middle" type="TP"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="TSSystemTripPulse"/>
		</row>
		<row>
			<analog type="input" name="T#2s"/>
			<functionblock position="bottom" type="TP"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="TSTransferButton"/>
			<contact type="open" name="AllSystemsOK"/>
			<contact type="closed" name="TSPUnlatch"/>
			<contact type="open" name="TripIndicatorTransfer1"/>
			<contact type="open" name="TripIndicatorTransfer2"/>
			<coil type="open" name="TransferSystemPower"/>
		</row>
		<row>
			<contact type="open" name="TransferSystemPower" or="true"/>
			<empty/>
			<empty or="true"/>
			<empty or="true"/>
			<contact type="open" name="BypassSwitch" or="true"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty or="true"/>
			<contact type="open" name="TSSystemTripPulse"/>
			<line or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="TransferSystemPower"/>
			<line/>
			<line/>
			<coil type="open" name="Transfer1Power"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="TransferSystemPower"/>
			<contact type="closed" name="BypassSwitch"/>
			<line/>
			<coil type="open" name="Transfer2Power"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="Table1SheetStopProxA"/>
			<contact type="open" name="Table1SheetStopProxB"/>
			<contact type="closed" name="BypassSwitch"/>
			<contact type="open" name="TransferSystemPower"/>
			<contact type="closed" name="Pusher1OffProx"/>
			<coil type="open" name="Pusher1Solenoid"/>
		</row>
		<row>
			<contact type="open" name="Pusher1Solenoid"/>
			<line or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="Pusher1Solenoid"/>
			<line/>
			<line/>
			<coil type="open" name="Lift1Solenoid"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="Pusher1OffProx"/>
			<contact type="open" name="TransferSystemPower"/>
			<line/>
			<coil type="open" name="Lift2Solenoid"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="Table2SheetStopProxA"/>
			<contact type="open" name="Table2SheetStopProxB"/>
			<contact type="open" name="TransferSystemPower"/>
			<contact type="closed" name="Pusher2OffProx"/>
			<coil type="open" name="Pusher2Solenoid"/>
		</row>
		<row>
			<contact type="open" name="Pusher2Solenoid"/>
			<line or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Pusher2OffProx"/>
			<contact type="open" name="TransferSystemPower"/>
			<contact type="closed" name="Lift3DownPulse"/>
			<coil type="open" name="Lift3UpSolenoid"/>
		</row>
		<row>
			<contact type="open" name="Lift3UpSolenoid" or="true"/>
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
			<contact type="open" name="Lift3DownProx"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="Lift3DownPulse"/>
		</row>
		<row>
			<analog type="input" name="Lift3UpDwell"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="TP_2" type="TP"/>
			<empty/>
		</row>
		<row>
			<line/>
			<line/>
			<functionblock position="top" type="TP"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="positive transition" name="TransferSystemPower"/>
			<line/>
			<functionblock position="middle" type="TP"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="Lift3DownSolenoid"/>
		</row>
		<row>
			<contact type="negative transition" name="Lift3UpSolenoid" or="true"/>
			<analog type="input" name="Lift3DownDwell"/>
			<functionblock position="bottom" type="TP"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
</networks>
END_PROGRAM






