PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="PittsButton"/>
			<contact type="open" name="doProDuctHydraulics"/>
			<line/>
			<coil type="set" name="Dn1Latch"/>
		</row>
		<row>
			<contact type="positive transition" name="Dn1Delay" or="true"/>
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
			<contact type="open" name="Dn1Latch"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="Dn1Done"/>
		</row>
		<row>
			<analog type="input" name="TPulseLength"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="positive transition" name="PassThruButton"/>
			<line/>
			<line/>
			<coil type="reset" name="Dn1Latch"/>
		</row>
		<row>
			<contact type="positive transition" name="SnapButton" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="negative transition" name="doProDuctHydraulics" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="Dn1Done" or="true"/>
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
			<contact type="open" name="doMarkRFPassUp"/>
			<functionblock position="middle" type="TON_10ms"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="Dn1Delay"/>
		</row>
		<row>
			<analog type="input" name="800"/>
			<functionblock position="bottom" type="TON_10ms"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="Dn1Latch"/>
			<contact type="closed" name="doMarkRollformerHeadRaise"/>
			<line/>
			<coil type="open" name="doMarkRollformerHeadLower"/>
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
			<contact type="positive transition" name="SnapButton"/>
			<contact type="open" name="doProDuctHydraulics"/>
			<functionblock position="middle" type="TP"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="Up1Latch"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="TPulseLength"/>
			<functionblock position="bottom" type="TP"><input name="PT"/><output name="ET"/></functionblock>
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
			<empty/>
			<functionblock position="top" type="TP_10ms"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="PassThruButton"/>
			<functionblock position="middle" type="TP_10ms"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="PassUpPulse"/>
		</row>
		<row>
			<analog type="input" name="1800"/>
			<functionblock position="bottom" type="TP_10ms"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="Up1Latch"/>
			<contact type="closed" name="doMarkRollformerHeadLower"/>
			<line/>
			<coil type="open" name="doMarkRollformerHeadRaise"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="TP_1" type="TP"/>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<functionblock position="top" type="TP"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="positive transition" name="PittsButton"/>
			<contact type="open" name="doProDuctHydraulics"/>
			<functionblock position="middle" type="TP"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="Dn2Latch"/>
		</row>
		<row>
			<contact type="positive transition" name="SnapButton" or="true"/>
			<analog type="input" name="TPulseLength"/>
			<functionblock position="bottom" type="TP"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="Dn2Latch"/>
			<contact type="closed" name="doMarkRFPassUp"/>
			<line/>
			<coil type="open" name="doMarkRFPassDown"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="TON_10ms_1" type="TON_10ms"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TON_10ms"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="Up2PassLatch1"/>
			<functionblock position="middle" type="TON_10ms"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="Up2Done"/>
		</row>
		<row>
			<analog type="input" name="1000"/>
			<functionblock position="bottom" type="TON_10ms"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
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
			<contact type="open" name="Up2Done"/>
			<functionblock position="middle" type="TP"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="Up2Latch"/>
		</row>
		<row>
			<analog type="input" name="TPulseLength"/>
			<functionblock position="bottom" type="TP"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Up2Latch"/>
			<line/>
			<line/>
			<coil type="reset" name="Up2PassLatch1"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="PassThruButton"/>
			<line/>
			<line/>
			<coil type="set" name="Up2PassLatch1"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="Up2Latch"/>
			<contact type="closed" name="doMarkRFPassDown"/>
			<line/>
			<coil type="open" name="doMarkRFPassUp"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="diMarkHeadDownProx"/>
			<line/>
			<line/>
			<coil type="open" name="PittsPosition"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="closed" name="diMarkHeadDownProx"/>
			<contact type="closed" name="diMarkHeadUpProx"/>
			<line/>
			<coil type="open" name="PassThruPosition"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="diMarkHeadUpProx"/>
			<line/>
			<line/>
			<coil type="open" name="SnapPosition"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="PittsButton"/>
			<line/>
			<line/>
			<coil type="reset" name="PittsButton"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="PassThruButton"/>
			<line/>
			<line/>
			<coil type="reset" name="PassThruButton"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="SnapButton"/>
			<line/>
			<line/>
			<coil type="reset" name="SnapButton"/>
		</row>
	</network>
</networks>
END_PROGRAM



