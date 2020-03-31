PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
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
			<analog type="input" name="PunchSelect[LeftShuttleIndex]"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="PunchCurrentSelect"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="AND"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PunchCurrentSelect"/>
			<function position="middle" type="AND"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="OGResult"/>
		</row>
		<row>
			<analog type="input" name="4"/>
			<function position="bottom" type="AND"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="NE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="OGResult"/>
			<function position="middle" type="NE"><input name="IN1"/><output name="1"/></function>
			<analog type="output" name="OGLatch"/>
		</row>
		<row>
			<analog type="input" name="0"/>
			<function position="bottom" type="NE"><input name="IN2"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="GLShuttleUnlatch"/>
			<contact type="open" name="OGLatch"/>
			<contact type="open" name="InCycle"/>
			<coil type="open" name="OutSideGuideSolenoid"/>
		</row>
		<row>
			<contact type="open" name="OutSideGuideSolenoid"/>
			<contact type="closed" name="GLShuttleUnlatch" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="HoleSize"/>
			<contact type="open" name="GLShuttleUnlatch"/>
			<contact type="open" name="InCycle"/>
			<coil type="open" name="HolePunchSelectedSolenoid"/>
		</row>
		<row>
			<contact type="open" name="HolePunchSelectedSolenoid"/>
			<contact type="closed" name="GLShuttleUnlatch" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="LT"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PunchMasterCoilWidth"/>
			<function position="middle" type="LT"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="FourFootCoil"/>
		</row>
		<row>
			<analog type="input" name="60.0"/>
			<function position="bottom" type="LT"><input name="" extensible="true"/></function>
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
			<analog type="input" name="PunchMasterCoilWidth"/>
			<function position="middle" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="FiveFootCoil"/>
		</row>
		<row>
			<analog type="input" name="60.0"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
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
			<analog type="input" name="PunchMasterCoilWidth"/>
			<function position="middle" type="GT"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="SixFootCoil"/>
		</row>
		<row>
			<analog type="input" name="60.0"/>
			<function position="bottom" type="GT"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="AND"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PunchCurrentSelect"/>
			<function position="middle" type="AND"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="FourResult"/>
		</row>
		<row>
			<analog type="input" name="2"/>
			<function position="bottom" type="AND"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="NE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="FourResult"/>
			<function position="middle" type="NE"><input name="IN1"/><output name="1"/></function>
			<analog type="output" name="FFCLatch"/>
		</row>
		<row>
			<analog type="input" name="0"/>
			<function position="bottom" type="NE"><input name="IN2"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="GLShuttleUnlatch"/>
			<contact type="open" name="FourFootCoil"/>
			<contact type="open" name="FFCLatch"/>
			<contact type="open" name="InCycle"/>
			<coil type="open" name="FourFootCenterSolenoid"/>
		</row>
		<row>
			<contact type="open" name="FourFootCenterSolenoid"/>
			<contact type="closed" name="GLShuttleUnlatch"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="GLShuttleUnlatch"/>
			<contact type="open" name="FiveFootCoil"/>
			<contact type="open" name="FFCLatch"/>
			<contact type="open" name="InCycle"/>
			<coil type="open" name="FiveFootCenterSolenoid"/>
		</row>
		<row>
			<contact type="open" name="FiveFootCenterSolenoid"/>
			<contact type="closed" name="GLShuttleUnlatch"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="GLShuttleUnlatch"/>
			<contact type="open" name="SixFootCoil"/>
			<contact type="open" name="FFCLatch"/>
			<contact type="open" name="InCycle"/>
			<coil type="open" name="SixFootCenterSolenoid"/>
		</row>
		<row>
			<contact type="open" name="SixFootCenterSolenoid"/>
			<contact type="closed" name="GLShuttleUnlatch"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="AND"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PunchCurrentSelect"/>
			<function position="middle" type="AND"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="OneResult"/>
		</row>
		<row>
			<analog type="input" name="1"/>
			<function position="bottom" type="AND"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="NE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="OneResult"/>
			<function position="middle" type="NE"><input name="IN1"/><output name="1"/></function>
			<analog type="output" name="OutsideLatch"/>
		</row>
		<row>
			<analog type="input" name="0"/>
			<function position="bottom" type="NE"><input name="IN2"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="GLShuttleUnlatch"/>
			<contact type="open" name="OutsideLatch"/>
			<contact type="open" name="FourFootCoil"/>
			<contact type="open" name="InCycle"/>
			<coil type="open" name="FourFootOutsideSolenoid"/>
		</row>
		<row>
			<contact type="open" name="FourFootOutsideSolenoid"/>
			<contact type="closed" name="GLShuttleUnlatch"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="GLShuttleUnlatch"/>
			<contact type="open" name="OutsideLatch"/>
			<contact type="open" name="FiveFootCoil"/>
			<contact type="open" name="InCycle"/>
			<coil type="open" name="FiveFootOutsideSolenoid"/>
		</row>
		<row>
			<contact type="open" name="FiveFootOutsideSolenoid"/>
			<contact type="closed" name="GLShuttleUnlatch"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="GLShuttleUnlatch"/>
			<contact type="open" name="OutsideLatch"/>
			<contact type="open" name="SixFootCoil"/>
			<contact type="open" name="InCycle"/>
			<coil type="open" name="SixFootOutsideSolenoid"/>
		</row>
		<row>
			<contact type="open" name="SixFootOutsideSolenoid"/>
			<contact type="closed" name="GLShuttleUnlatch"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="AND"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PunchCurrentSelect"/>
			<function position="middle" type="AND"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="DamperResult"/>
		</row>
		<row>
			<analog type="input" name="8"/>
			<function position="bottom" type="AND"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="NE"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="DamperResult"/>
			<function position="middle" type="NE"><input name="IN1"/><output name="1"/></function>
			<analog type="output" name="DamperLatch"/>
		</row>
		<row>
			<analog type="input" name="0"/>
			<function position="bottom" type="NE"><input name="IN2"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="GLShuttleUnlatch"/>
			<contact type="open" name="DamperLatch"/>
			<contact type="open" name="InCycle"/>
			<coil type="open" name="DamperHoleSolenoid"/>
		</row>
		<row>
			<contact type="open" name="DamperHoleSolenoid"/>
			<contact type="closed" name="GLShuttleUnlatch" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
</networks>
END_PROGRAM




