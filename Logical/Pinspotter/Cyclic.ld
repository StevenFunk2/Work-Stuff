PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="PS0"/>
			<function position="top" type="Compare!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<function position="middle" type="Compare!"><input name=""/><output name="56"/></function>
			<analog type="output" name="Drive"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!PinspotEncoder &gt;= Target"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="Clear Encoder, setup for 1st row of pins." row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="PartPresentPSpotter"/>
			<contact type="open" name="PartPresentPSpotter"/>
			<contact type="open" name="PinsRequired"/>
			<contact type="closed" name="PS4"/>
			<coil type="open" name="PS0"/>
		</row>
		<row>
			<contact type="open" name="PS0" or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="EncoderReset"/>
			<contact type="open" name="PS0"/>
			<line/>
			<coil type="open" name="PS1"/>
		</row>
		<row>
			<contact type="open" name="PS1" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="Drive"/>
			<contact type="open" name="PS1"/>
			<contact type="closed" name="PinAgain"/>
			<coil type="open" name="PS2"/>
		</row>
		<row>
			<contact type="open" name="PS2" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="DriveComplete"/>
			<contact type="open" name="PS2"/>
			<line/>
			<coil type="open" name="PS3"/>
		</row>
		<row>
			<contact type="open" name="PS3" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="PinningDone"/>
			<contact type="open" name="PS3"/>
			<line/>
			<coil type="open" name="PS4"/>
		</row>
		<row>
			<contact type="open" name="PS4" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="PS0"/>
			<contact type="closed" name="PS1"/>
			<line/>
			<coil type="open" name="PinspotEncoderResetSignal"/>
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
			<contact type="open" name="PS0"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="EncoderReset"/>
		</row>
		<row>
			<analog type="input" name="T#50ms"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="Initialize for new part" row="5" column="0" commented="0">
		<row>
			<contact type="positive transition" name="PS0"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PinRepeat0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="RepeatCounter"/>
		</row>
		<row>
			<analog type="input" name="0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="PinSpaceSelector"/>
		</row>
		<row>
			<analog type="input" name="PinTarget0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="PinSpacing"/>
		</row>
		<row>
			<analog type="input" name="PinTarget0"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="RealTarget"/>
		</row>
	</network>
	<network label="" comment="Initialize for new part" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="PS0"/>
			<function position="top" type="Compute!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<function position="middle" type="Compute!"><input name=""/><output name="56"/></function>
			<analog type="output" name="RealCounts"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compute!"><input name="&lt;!(RealTarget * PinspotResolution * PSpotDesired) / PSpotActual"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="Initialize for new part" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="PS0"/>
			<function position="top" type="REAL_TO_DINT"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="RealCounts"/>
			<function position="bottom" type="REAL_TO_DINT"><input name="IN"/><output name="4"/></function>
			<analog type="output" name="Target"/>
		</row>
	</network>
	<network label="" comment="The following rungs are for each row of pins" row="1" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Drive"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PinDriveDwell"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="DriveDwell"/>
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
			<contact type="open" name="Drive"/>
			<contact type="open" name="PS1"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="DriveComplete"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="DriveDwell"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="PS3"/>
			<line/>
			<line/>
			<coil type="open" name="UpDateSignal"/>
		</row>
	</network>
	<network label="" comment="Decrement Repeat Counter" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="UpDateSignal"/>
			<function position="top" type="SUB"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="RepeatCounter"/>
			<function position="middle" type="SUB"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="RepeatCounter"/>
		</row>
		<row>
			<analog type="input" name="1"/>
			<function position="bottom" type="SUB"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="See if repeats in this index are finished" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="Compare!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<function position="middle" type="Compare!"><input name=""/><output name="56"/></function>
			<analog type="output" name="RCounterIs0"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!RepeatCounter = 0"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="UpDateSignal"/>
			<contact type="open" name="RCounterIs0"/>
			<line/>
			<coil type="open" name="IndexFinished"/>
		</row>
	</network>
	<network label="" comment="Increment the PinSpaceSelector if the repeats are finished." row="3" column="0" commented="0">
		<row>
			<contact type="open" name="IndexFinished"/>
			<function position="top" type="ADD"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PinSpaceSelector"/>
			<function position="middle" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="PinSpaceSelector"/>
		</row>
		<row>
			<analog type="input" name="1"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="Get the next pin spacing after the PinSpaceSelector is incremented." row="11" column="0" commented="0">
		<row>
			<contact type="open" name="IndexFinished"/>
			<function position="top" type="MUX"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PinSpaceSelector"/>
			<function position="middle" type="MUX"><input name="K" extensible="true"/><output name="40"/></function>
			<analog type="output" name="PinSpacing"/>
		</row>
		<row>
			<analog type="input" name="PinTarget0"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PinTarget1"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PinTarget2"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PinTarget3"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PinTarget4"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PinTarget5"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PinTarget6"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PinTarget7"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PinTarget8"/>
			<function position="bottom" type="MUX"><input name="" extensible="true"/></function>
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
			<analog type="output" name="PinSpaceSelectorIs9"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!PinSpaceSelector = 9"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="IndexFinished"/>
			<contact type="open" name="PinSpaceSelectorIs9"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="PinTarget9"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="PinSpacing"/>
		</row>
	</network>
	<network label="" comment="Load the repeat counter after the PinSpaceSelector is incremented." row="11" column="0" commented="0">
		<row>
			<contact type="open" name="IndexFinished"/>
			<function position="top" type="MUX"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PinSpaceSelector"/>
			<function position="middle" type="MUX"><input name="K" extensible="true"/><output name="40"/></function>
			<analog type="output" name="RepeatCounter"/>
		</row>
		<row>
			<analog type="input" name="PinRepeat0"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PinRepeat1"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PinRepeat2"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PinRepeat3"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PinRepeat4"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PinRepeat5"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PinRepeat6"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PinRepeat7"/>
			<function position="middle" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PinRepeat8"/>
			<function position="bottom" type="MUX"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="IndexFinished"/>
			<contact type="open" name="PinSpaceSelectorIs9"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="PinRepeat9"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="RepeatCounter"/>
		</row>
	</network>
	<network label="" comment="Pinning is done when a -1.0 is encountered in the targets." row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="Compare!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<function position="middle" type="Compare!"><input name=""/><output name="56"/></function>
			<analog type="output" name="PinningDone"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!PinSpacing &lt;= 0.0"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="UpDateSignal"/>
			<contact type="closed" name="PinningDone"/>
			<line/>
			<coil type="open" name="PinAgain"/>
		</row>
	</network>
	<network label="" comment="Add the next spacing to the previous target in floating point inches." row="3" column="0" commented="0">
		<row>
			<contact type="open" name="UpDateSignal"/>
			<contact type="closed" name="PinningDone"/>
			<function position="top" type="ADD"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="RealTarget"/>
			<function position="middle" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="RealTarget"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="PinSpacing"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="Calculate the encoder count target in a floating value. " row="3" column="0" commented="0">
		<row>
			<contact type="open" name="UpDateSignal"/>
			<contact type="closed" name="PinningDone"/>
			<function position="top" type="Compute!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<function position="middle" type="Compute!"><input name=""/><output name="56"/></function>
			<analog type="output" name="RealCounts"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<function position="bottom" type="Compute!"><input name="&lt;!(RealTarget * PinspotResolution * PSpotDesired) / PSpotActual"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="Convert the floating point target to a double integer." row="2" column="0" commented="0">
		<row>
			<contact type="open" name="UpDateSignal"/>
			<contact type="closed" name="PinningDone"/>
			<function position="top" type="REAL_TO_DINT"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="RealCounts"/>
			<function position="bottom" type="REAL_TO_DINT"><input name="IN"/><output name="4"/></function>
			<analog type="output" name="Target"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="PS2"/>
			<contact type="closed" name="PS3"/>
			<line/>
			<coil type="open" name="PinspotterDrive"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="negative transition" name="PinspotterDrive"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PinLoadDelay"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="DelayTime"/>
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
			<contact type="negative transition" name="PinspotterDrive"/>
			<functionblock position="middle" type="TP"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="LoadDelayPulse"/>
		</row>
		<row>
			<analog type="input" name="DelayTime"/>
			<functionblock position="bottom" type="TP"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="negative transition" name="LoadDelayPulse"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PinLoadDwell"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="PinLoadTime"/>
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
			<contact type="negative transition" name="LoadDelayPulse"/>
			<functionblock position="middle" type="TP"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="PinspotterLoad"/>
		</row>
		<row>
			<analog type="input" name="PinLoadTime"/>
			<functionblock position="bottom" type="TP"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
</networks>
END_PROGRAM












