PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="The CEF Buttons May Be Either Physical Inputs Or Turned On By The PC, Depending On The Application." row="3" column="0" commented="0">
		<row>
			<contact type="open" name="TSCEF1Button"/>
			<contact type="closed" name="TSCEF2Button"/>
			<line/>
			<coil type="open" name="CEF1"/>
		</row>
		<row>
			<contact type="positive transition" name="FirstScan" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="CEF1" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="TSCEF2Button"/>
			<contact type="closed" name="TSCEF1Button"/>
			<line/>
			<coil type="open" name="CEF2"/>
		</row>
		<row>
			<contact type="open" name="CEF2" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="TON_10ms_0" type="TON_10ms"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TON_10ms"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="CEFNotchDetect"/>
			<functionblock position="middle" type="TON_10ms"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="OnTimerDone"/>
		</row>
		<row>
			<analog type="input" name="CleatOnDelay"/>
			<functionblock position="bottom" type="TON_10ms"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="TOF_10ms_0" type="TOF_10ms"/>
			<empty/>
		</row>
		<row>
			<line/>
			<line/>
			<functionblock position="top" type="TOF_10ms"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="CEFNotchDetect"/>
			<contact type="open" name="OnTimerDone"/>
			<functionblock position="middle" type="TOF_10ms"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="DetectSignal"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="CleatOffDelay"/>
			<functionblock position="bottom" type="TOF_10ms"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="CEF1"/>
			<contact type="open" name="DetectSignal"/>
			<contact type="closed" name="CEFReset"/>
			<contact type="closed" name="cleat4"/>
			<coil type="open" name="cleat1"/>
		</row>
		<row>
			<contact type="open" name="cleat1"/>
			<line or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="DetectSignal"/>
			<contact type="open" name="cleat1"/>
			<line/>
			<coil type="open" name="cleat2"/>
		</row>
		<row>
			<contact type="open" name="cleat2" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="DetectSignal"/>
			<contact type="open" name="cleat2"/>
			<line/>
			<coil type="open" name="cleat3"/>
		</row>
		<row>
			<contact type="open" name="cleat3" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="closed" name="DetectSignal"/>
			<contact type="open" name="cleat3"/>
			<line/>
			<coil type="open" name="cleat4"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="CEF2"/>
			<contact type="open" name="DetectSignal"/>
			<contact type="closed" name="CEFReset"/>
			<contact type="closed" name="cleat8"/>
			<coil type="open" name="cleat5"/>
		</row>
		<row>
			<contact type="open" name="cleat5"/>
			<line or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="DetectSignal"/>
			<contact type="open" name="cleat5"/>
			<line/>
			<coil type="open" name="cleat6"/>
		</row>
		<row>
			<contact type="open" name="cleat6" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="DetectSignal"/>
			<contact type="open" name="cleat6"/>
			<line/>
			<coil type="open" name="cleat7"/>
		</row>
		<row>
			<contact type="open" name="cleat7" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="closed" name="DetectSignal"/>
			<contact type="open" name="cleat7"/>
			<line/>
			<coil type="open" name="cleat8"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="CEF1"/>
			<contact type="closed" name="cleat1"/>
			<line/>
			<contact type="closed" name="FullCleatSelect"/>
			<coil type="open" name="CEF1Indicator"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="cleat2"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="CEF2"/>
			<contact type="open" name="cleat5"/>
			<contact type="closed" name="cleat6" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="CEF2"/>
			<contact type="closed" name="CEF1"/>
			<line/>
			<coil type="open" name="CEF2Indicator"/>
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
			<contact type="open" name="cleat2"/>
			<contact type="closed" name="cleat3"/>
			<line/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="CEFReset"/>
		</row>
		<row>
			<contact type="open" name="cleat6"/>
			<contact type="closed" name="cleat7" or="true"/>
			<analog type="input" name="T#4s"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="CEF1Indicator"/>
			<line/>
			<line/>
			<coil type="open" name="StatHeadRollSolenoid"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="CEF1Indicator"/>
			<line/>
			<line/>
			<coil type="open" name="MoveHeadRollSolenoid"/>
		</row>
	</network>
</networks>
END_PROGRAM




