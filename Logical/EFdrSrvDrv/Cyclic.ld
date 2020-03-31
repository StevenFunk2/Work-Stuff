PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="RollDriveEnableButton"/>
			<contact type="open" name="ProcessorDriveEnable"/>
			<line/>
			<coil type="open" name="RollEnableUnlatch"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="RollDriveEnableButton"/>
			<contact type="closed" name="RollEnableUnlatch"/>
			<contact type="open" name="ProcessorDriveReady"/>
			<contact type="open" name="EStopClear"/>
			<coil type="open" name="ProcessorDriveEnable"/>
		</row>
		<row>
			<contact type="open" name="ProcessorDriveEnable" or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="ProcessorJogFwd"/>
			<contact type="open" name="ProcessorDriveEnable"/>
			<contact type="closed" name="InCycle"/>
			<coil type="open" name="Analog1Forward"/>
		</row>
		<row>
			<contact type="open" name="Step04C"/>
			<contact type="closed" name="Step04D"/>
			<line or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="ProcessorJogRev"/>
			<contact type="open" name="ProcessorDriveEnable"/>
			<contact type="closed" name="InCycle"/>
			<coil type="open" name="Analog1Reverse"/>
		</row>
		<row>
			<contact type="open" name="Step04"/>
			<contact type="closed" name="Step04B"/>
			<line or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Analog1Forward"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="4"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="MotionStatus1"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Analog1Reverse"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="5"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="MotionStatus1"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="negative transition" name="Analog1Forward"/>
			<contact type="closed" name="StopFlag1"/>
			<line/>
			<coil type="set" name="StopFlag1"/>
		</row>
		<row>
			<contact type="negative transition" name="Analog1Reverse" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="negative transition" name="DuctoAuto"/>
			<contact type="open" name="Step13"/>
			<contact type="closed" name="Step14"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="9"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="MotionStatus1"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="DuctoAuto"/>
			<contact type="open" name="Step13"/>
			<contact type="closed" name="Step14"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty/>
			<analog type="input" name="1"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="MotionStatus1"/>
		</row>
	</network>
	<network label="" comment="ElectricDriveEnable Output" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="Compare!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<function position="middle" type="Compare!"><input name=""/><output name="56"/></function>
			<analog type="output" name="ElectricDriveEnable"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!MotionStatus1 &gt;= 0"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Step04E"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="0"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="MotionStatus1"/>
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
			<analog type="output" name="ServoLoop1Closed"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!(MotionStatus1 &gt;= 0) AND (MotionStatus1 &lt;= 3)"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="negative transition" name="InCycle"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="-1"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="MotionStatus1"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="GStep11"/>
			<contact type="closed" name="GStep12"/>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<analog type="input" name="1"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="MotionStatus1"/>
		</row>
		<row>
			<empty/>
			<empty or="true"/>
			<line/>
			<line/>
			<line/>
			<coil type="open" name="GFeedMoveQed"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="ProcessorDriveReady"/>
			<contact type="open" name="MatlAtMeasureRoll"/>
			<line/>
			<coil type="open" name="ElectricServoStuffOK"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="Analog1Forward"/>
			<line/>
			<line/>
			<coil type="open" name="LevelerBrakeSolenoid"/>
		</row>
		<row>
			<contact type="open" name="Analog1Reverse" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="ServoLoop1Closed" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="MatlAtMeasureRoll"/>
			<contact type="open" name="ProcessorDriveEnable"/>
			<line/>
			<coil type="open" name="EngelCoilDriveReady"/>
		</row>
	</network>
</networks>
END_PROGRAM





