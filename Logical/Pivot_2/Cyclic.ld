PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="positive transition" name="FeedInitiate"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="DuctType"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="PDuctType"/>
		</row>
		<row>
			<analog type="input" name="PartLength"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="PivotPLength"/>
		</row>
		<row>
			<analog type="input" name="CoilWidth"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="56"/></function>
			<analog type="output" name="PivotWidth"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="EQ"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PDuctType"/>
			<function position="middle" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="Residential"/>
		</row>
		<row>
			<analog type="input" name="6"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="RotatingTableOn"/>
			<line/>
			<line/>
			<coil type="open" name="S1"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="S1"/>
			<line/>
			<line/>
			<coil type="set" name="RTBeltConveyorRaiseSolenoid"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="set" name="CushionRollRaiseSolenoid"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="set" name="RTBeltConveyorMotor"/>
		</row>
	</network>
	<network label="" comment="" row="9" column="0" commented="0">
		<row>
			<contact type="negative transition" name="S1"/>
			<line/>
			<line/>
			<coil type="reset" name="RTSkewTableRelay"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="RTBeltConveyorMotor"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="RTKnurledRollsMotor"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="RTBeltConveyorRaiseSolenoid"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="PivotClampCloseSolenoid"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="CushionRollRaiseSolenoid"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="RTKnurledRollLowerSolenoid"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="RTKnurledRollGateSolenoid"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="RTPivotArmRotate"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="PartPresentRTClamp"/>
			<contact type="closed" name="RTCycleComplete"/>
			<contact type="open" name="S1"/>
			<coil type="open" name="S2"/>
		</row>
		<row>
			<contact type="open" name="S2" or="true"/>
			<empty/>
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
			<analog type="input" name="PivotPLength"/>
			<function position="middle" type="LT"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="LenLTWidth"/>
		</row>
		<row>
			<analog type="input" name="PivotWidth"/>
			<function position="bottom" type="LT"><input name="" extensible="true"/></function>
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
			<analog type="input" name="PivotPLength"/>
			<function position="middle" type="GT"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="LenGTWidth"/>
		</row>
		<row>
			<analog type="input" name="PivotWidth"/>
			<function position="bottom" type="GT"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="5" column="0" commented="0">
		<row>
			<contact type="positive transition" name="S2"/>
			<line/>
			<line/>
			<coil type="reset" name="RTBeltConveyorRaiseSolenoid"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="RTBeltConveyorMotor"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="Residential"/>
			<contact type="open" name="LenLTWidth"/>
			<coil type="set" name="RTKnurledRollGateSolenoid"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="closed" name="Residential"/>
			<contact type="open" name="LenGTWidth"/>
			<coil type="set" name="RTKnurledRollGateSolenoid"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="closed" name="Residential"/>
			<line/>
			<coil type="set" name="RTSkewTableRelay"/>
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
			<contact type="open" name="S2"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="Ton8Done"/>
		</row>
		<row>
			<analog type="input" name="PivotTablePreset[8]"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="Ton8Done"/>
			<contact type="open" name="S2"/>
			<line/>
			<coil type="open" name="S3"/>
		</row>
		<row>
			<contact type="closed" name="Residential" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="S3" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="S3"/>
			<contact type="open" name="Residential"/>
			<line/>
			<coil type="set" name="PivotClampCloseSolenoid"/>
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
			<contact type="open" name="S3"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="Ton2Done"/>
		</row>
		<row>
			<analog type="input" name="PivotTablePreset[1]"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="Ton2Done"/>
			<contact type="open" name="S3"/>
			<line/>
			<coil type="open" name="S4"/>
		</row>
		<row>
			<contact type="closed" name="Residential" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="S4" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="S4"/>
			<contact type="open" name="Residential"/>
			<line/>
			<coil type="set" name="RTSkewTableRelay"/>
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
			<contact type="open" name="S4"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="Ton1Done"/>
		</row>
		<row>
			<analog type="input" name="PivotTablePreset[0]"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="Ton1Done"/>
			<contact type="open" name="S4"/>
			<line/>
			<coil type="open" name="S5"/>
		</row>
		<row>
			<contact type="closed" name="Residential" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="S5" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="S5"/>
			<contact type="open" name="Residential"/>
			<line/>
			<coil type="set" name="RTPivotArmRotate"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="PartRotateComplete"/>
			<contact type="open" name="S5"/>
			<line/>
			<coil type="open" name="S6"/>
		</row>
		<row>
			<contact type="open" name="S6" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="GE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="PivotPLength"/>
			<function position="middle" type="GE"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="LenGERCL"/>
		</row>
		<row>
			<analog type="input" name="RotateCompleteLength"/>
			<function position="bottom" type="GE"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="positive transition" name="S6"/>
			<contact type="open" name="LenGERCL"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="PivotTablePreset[2]"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="PT_3"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="closed" name="LenGERCL"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="PivotTablePreset[12]"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="PT_3"/>
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
			<contact type="open" name="S6"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="Ton3Done"/>
		</row>
		<row>
			<analog type="input" name="PT_3"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="Ton3Done"/>
			<contact type="open" name="S6"/>
			<line/>
			<coil type="open" name="S7"/>
		</row>
		<row>
			<contact type="open" name="S7" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="S7"/>
			<line/>
			<line/>
			<coil type="reset" name="PivotClampCloseSolenoid"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="CushionRollRaiseSolenoid"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="RTPivotArmRotate"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="PartRotateComplete"/>
			<contact type="open" name="S7"/>
			<line/>
			<coil type="open" name="S8"/>
		</row>
		<row>
			<contact type="open" name="S8" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="S8"/>
			<line/>
			<line/>
			<coil type="set" name="RTBeltConveyorRaiseSolenoid"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="set" name="RTBeltConveyorMotor"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="PartPresentRTKnurledRoll"/>
			<contact type="open" name="S8"/>
			<line/>
			<coil type="open" name="S9"/>
		</row>
		<row>
			<contact type="open" name="S9" or="true"/>
			<empty/>
			<empty/>
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
			<contact type="open" name="S9"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="Ton6Done"/>
		</row>
		<row>
			<analog type="input" name="PivotTablePreset[6]"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="S9"/>
			<contact type="open" name="Residential"/>
			<contact type="open" name="LenLTWidth"/>
			<coil type="open" name="Jump1"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="closed" name="Residential"/>
			<contact type="open" name="LenGTWidth" or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="S9"/>
			<contact type="closed" name="Jump1"/>
			<line/>
			<coil type="set" name="RTKnurledRollLowerSolenoid"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="Ton6Done"/>
			<contact type="open" name="S9"/>
			<line/>
			<coil type="open" name="S10"/>
		</row>
		<row>
			<contact type="closed" name="Jump1" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="S10" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="S10"/>
			<contact type="open" name="Jump1"/>
			<line/>
			<coil type="set" name="CushionRollRaiseSolenoid"/>
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
			<contact type="open" name="S10"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="Ton9Done"/>
		</row>
		<row>
			<analog type="input" name="PivotTablePreset[9]"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="Ton9Done"/>
			<contact type="open" name="S10"/>
			<line/>
			<coil type="open" name="S11"/>
		</row>
		<row>
			<contact type="closed" name="Jump1" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="S11" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="S11"/>
			<contact type="open" name="Jump1"/>
			<line/>
			<coil type="set" name="RTKnurledRollLowerSolenoid"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="TON_4" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="S11"/>
			<contact type="closed" name="S12"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="Ton4Done"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="PivotTablePreset[3]"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="Ton4Done"/>
			<contact type="open" name="S11"/>
			<line/>
			<coil type="open" name="S12"/>
		</row>
		<row>
			<contact type="closed" name="Jump1" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="S12" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="S12"/>
			<contact type="open" name="Jump1"/>
			<line/>
			<coil type="reset" name="RTKnurledRollGateSolenoid"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="TON_11" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="S12"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="Ton11Done"/>
		</row>
		<row>
			<analog type="input" name="PivotTablePreset[4]"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="Ton11Done"/>
			<contact type="open" name="S12"/>
			<line/>
			<coil type="open" name="S13"/>
		</row>
		<row>
			<contact type="closed" name="Jump1" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="S13" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="S13"/>
			<contact type="open" name="Jump1"/>
			<line/>
			<coil type="set" name="RTKnurledRollsMotor"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="PartPresentRTKnurledRoll"/>
			<contact type="open" name="S13"/>
			<line/>
			<coil type="open" name="S14"/>
		</row>
		<row>
			<contact type="open" name="S14" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="S14"/>
			<line/>
			<line/>
			<coil type="reset" name="RTSkewTableRelay"/>
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
			<contact type="open" name="S14"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="Ton10Done"/>
		</row>
		<row>
			<analog type="input" name="PivotTablePreset[6]"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="Ton10Done"/>
			<contact type="open" name="S14"/>
			<line/>
			<coil type="open" name="S15"/>
		</row>
		<row>
			<contact type="open" name="S15" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="positive transition" name="S15"/>
			<line/>
			<line/>
			<coil type="reset" name="RTKnurledRollsMotor"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="RTKnurledRollLowerSolenoid"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="set" name="CushionRollRaiseSolenoid"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="open" name="RTCycleComplete"/>
		</row>
	</network>
</networks>
END_PROGRAM


