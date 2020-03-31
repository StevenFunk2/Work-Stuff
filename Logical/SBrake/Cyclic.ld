PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="This file is the Iowa Shear Brake Cycle sequence." row="1" column="0" commented="0">
		<row>
			<contact type="open" name="ButtonSignal[18]"/>
			<line/>
			<line/>
			<coil type="open" name="ShearBrakeSetButton"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="ShearBrakeReady"/>
			<line/>
			<line/>
			<coil type="open" name="ButtonStatus[18]"/>
		</row>
	</network>
	<network label="" comment="This file is the Iowa Shear Brake Cycle sequence." row="4" column="0" commented="0">
		<row>
			<contact type="positive transition" name="UClampTest"/>
			<line/>
			<line/>
			<coil type="open" name="ManualFunction"/>
		</row>
		<row>
			<contact type="positive transition" name="DClampTest" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="positive transition" name="ULeafTest" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="positive transition" name="DLeafTest" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="ShearBrakeSetButton"/>
			<contact type="open" name="ProcessorDriveEnable"/>
			<contact type="closed" name="ManualFunction"/>
			<coil type="open" name="State01"/>
		</row>
		<row>
			<contact type="open" name="State01" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="ShearBrakeReady"/>
			<contact type="open" name="State01"/>
			<contact type="closed" name="CycleComplete"/>
			<coil type="open" name="State02"/>
		</row>
		<row>
			<contact type="open" name="State02" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="CycleMaleBender"/>
			<contact type="open" name="State02"/>
			<line/>
			<coil type="open" name="State05"/>
		</row>
		<row>
			<contact type="open" name="State05" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="ShearClampDownProx"/>
			<contact type="open" name="State05"/>
			<line/>
			<coil type="open" name="State07"/>
		</row>
		<row>
			<contact type="open" name="State07" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="ClampTimerDone"/>
			<contact type="open" name="State07"/>
			<line/>
			<coil type="open" name="State10"/>
		</row>
		<row>
			<contact type="open" name="State10" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="ShearLeafUpProx"/>
			<contact type="open" name="State10"/>
			<line/>
			<coil type="open" name="State12"/>
		</row>
		<row>
			<contact type="open" name="State12" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="LDDoneA"/>
			<contact type="open" name="State12"/>
			<line/>
			<coil type="open" name="State15"/>
		</row>
		<row>
			<contact type="open" name="State15" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="ShearLeafDownProx"/>
			<contact type="open" name="State15"/>
			<line/>
			<coil type="open" name="State17"/>
		</row>
		<row>
			<contact type="open" name="State17" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="LDDoneB"/>
			<contact type="open" name="State17"/>
			<line/>
			<coil type="open" name="State20"/>
		</row>
		<row>
			<contact type="open" name="State20" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="closed" name="CycleMaleBender"/>
			<contact type="open" name="State20"/>
			<line/>
			<coil type="open" name="CycleComplete"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="State01"/>
			<contact type="closed" name="State05"/>
			<contact type="open" name="ShearClampRaiseSolenoid"/>
			<contact type="open" name="ShearClampUpProx"/>
			<contact type="open" name="ShearLeafLowerSolenoid"/>
			<contact type="open" name="ShearLeafDownProx"/>
			<contact type="closed" name="ShearClamp4Buttons"/>
			<coil type="open" name="ShearBrakeReady"/>
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
			<contact type="open" name="State07"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="ClampTimerDone"/>
		</row>
		<row>
			<analog type="input" name="T#150ms"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="State10"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="MaleLeafDwell"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="LeafDwell"/>
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
			<contact type="open" name="State12"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="LDDoneA"/>
		</row>
		<row>
			<analog type="input" name="LeafDwell"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
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
			<contact type="open" name="State17"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="LDDoneB"/>
		</row>
		<row>
			<analog type="input" name="T#150ms"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="ShearBrakeSetButton"/>
			<line/>
			<line/>
			<coil type="reset" name="DClampTest"/>
		</row>
		<row>
			<contact type="negative transition" name="ProcessorDriveEnable" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="positive transition" name="UClampTest" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="ShearBrakeSetButton"/>
			<line/>
			<line/>
			<coil type="reset" name="UClampTest"/>
		</row>
		<row>
			<contact type="negative transition" name="ProcessorDriveEnable" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="positive transition" name="DClampTest" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="ShearBrakeSetButton"/>
			<line/>
			<line/>
			<coil type="reset" name="ULeafTest"/>
		</row>
		<row>
			<contact type="negative transition" name="ProcessorDriveEnable" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="positive transition" name="DLeafTest" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="ShearBrakeSetButton"/>
			<line/>
			<line/>
			<coil type="reset" name="DLeafTest"/>
		</row>
		<row>
			<contact type="negative transition" name="ProcessorDriveEnable" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="positive transition" name="ULeafTest" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="ShearClamp4Buttons"/>
			<line/>
			<line/>
			<coil type="open" name="CLMP"/>
		</row>
		<row>
			<contact type="open" name="DClampTest"/>
			<contact type="open" name="ShearLeafDownProx" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="open" name="State01"/>
			<contact type="closed" name="State05"/>
			<line/>
			<contact type="closed" name="CLMP"/>
			<coil type="open" name="ShearClampRaiseSolenoid"/>
		</row>
		<row>
			<contact type="open" name="State20"/>
			<line/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="UClampTest"/>
			<line/>
			<contact type="open" name="ShearLeafDownProx" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="ShearBeamUpSS"/>
			<contact type="closed" name="InCycle" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="State05"/>
			<contact type="closed" name="State20"/>
			<line/>
			<coil type="open" name="ShearClampLowerSolenoid"/>
		</row>
		<row>
			<contact type="open" name="CLMP"/>
			<line/>
			<line or="true"/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="ShearBeamDownSS"/>
			<contact type="closed" name="InCycle"/>
			<contact type="open" name="ShearLeafDownProx" or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="open" name="State01"/>
			<contact type="closed" name="State10"/>
			<line/>
			<coil type="open" name="ShearLeafLowerSolenoid"/>
		</row>
		<row>
			<contact type="open" name="State15"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="DLeafTest"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="ShearLeafDownSS"/>
			<contact type="closed" name="InCycle" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="State10"/>
			<contact type="closed" name="State15"/>
			<line/>
			<coil type="open" name="ShearLeafRaiseSolenoid"/>
		</row>
		<row>
			<contact type="open" name="ULeafTest"/>
			<line/>
			<contact type="open" name="ShearClampDownProx" or="true"/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="ShearLeafUpSS"/>
			<contact type="closed" name="InCycle" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
</networks>
END_PROGRAM




