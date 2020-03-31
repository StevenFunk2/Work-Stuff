PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="Compare!"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<function position="middle" type="Compare!"><input name=""/><output name="56"/></function>
			<analog type="output" name="ApplicatorTypeIs1"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!GlueApplicatorType = 1"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="InsulationRequired"/>
			<line/>
			<line/>
			<coil type="open" name="GlueSprayEnable1"/>
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
			<analog type="output" name="ApplicatorTypeIs2"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!GlueApplicatorType = 2"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="ApplicatorTypeIs2"/>
			<contact type="positive transition" name="GluePartSense"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<contact type="open" name="ApplicatorTypeIs3" or="true"/>
			<analog type="input" name="GlueLeadDelay"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="LeadDelay"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="ApplicatorTypeIs2"/>
			<contact type="positive transition" name="GluePartSense"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<contact type="open" name="ApplicatorTypeIs3" or="true"/>
			<analog type="input" name="GlueTrailDelay"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="TrailDelay"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="TON_0" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="GluePartSense"/>
			<contact type="open" name="InsulationRequired"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="StartGlue"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="LeadDelay"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
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
			<contact type="negative transition" name="GluePartSense"/>
			<contact type="open" name="InsulationRequired"/>
			<functionblock position="middle" type="TP"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="ContinueGlue"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="TrailDelay"/>
			<functionblock position="bottom" type="TP"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="6" column="0" commented="0">
		<row>
			<contact type="open" name="ApplicatorTypeIs1"/>
			<contact type="open" name="GlueSprayEnable1"/>
			<line/>
			<coil type="open" name="GlueSprayEnable"/>
		</row>
		<row>
			<contact type="open" name="ApplicatorTypeIs2"/>
			<contact type="open" name="StartGlue" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="ContinueGlue" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="ApplicatorTypeIs3"/>
			<contact type="open" name="MT1" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="Clean2" or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="GFPB2" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="M &amp; T Glue System Logic" row="3" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="EQ"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="GlueApplicatorType"/>
			<function position="middle" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="ApplicatorTypeIs3"/>
		</row>
		<row>
			<analog type="input" name="3"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="M&amp;T Glue Apply Sequence, Open Plunger Valve, Start Lead Delay Timer" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="GluePartSense"/>
			<contact type="open" name="GluePumpOnSwitch"/>
			<contact type="open" name="ExitBeltsOn"/>
			<contact type="closed" name="GlueServiceSwitch"/>
			<contact type="closed" name="EStopClear"/>
			<contact type="closed" name="ResetMTSequence"/>
			<coil type="open" name="MT0"/>
		</row>
		<row>
			<contact type="open" name="MT0" or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Turn Glue Apply And Blocked Solenoids On When The Lead Timer Finishes" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="MTStartGlue"/>
			<contact type="open" name="MT0"/>
			<line/>
			<coil type="open" name="MT1"/>
		</row>
		<row>
			<contact type="open" name="MT1" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Start Trail Delay Timer When The Glue Part Sense Signal Goes Off" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="GluePartSense"/>
			<contact type="open" name="MT1"/>
			<line/>
			<coil type="open" name="MT2"/>
		</row>
		<row>
			<contact type="open" name="MT2" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Turn Off Plunger Valve, Glue Apply and Blocked Solenoids When The Trail Delay Timer Finishes." row="1" column="0" commented="0">
		<row>
			<contact type="open" name="MTStopGlue"/>
			<contact type="open" name="MT2"/>
			<line/>
			<coil type="open" name="ResetMTSequence"/>
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
			<contact type="open" name="MT0"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="MTStartGlue"/>
		</row>
		<row>
			<analog type="input" name="LeadDelay"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="TON_5" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="MT2"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="MTStopGlue"/>
		</row>
		<row>
			<analog type="input" name="TrailDelay"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="MT0"/>
			<line/>
			<line/>
			<coil type="open" name="MTPlungerValveSolenoid"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="MT1"/>
			<line/>
			<line/>
			<coil type="open" name="MTBlockedValve"/>
		</row>
	</network>
	<network label="" comment="Cleaning Sequence, Start Cycle3 Timer, Turn Water Supply And Water Flush Solenoids On." row="2" column="0" commented="0">
		<row>
			<contact type="negative transition" name="GluePumpOnSwitch"/>
			<contact type="closed" name="Clean3"/>
			<line/>
			<coil type="open" name="Clean1"/>
		</row>
		<row>
			<contact type="open" name="Clean1" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Turn Water Supply and Water Flush Solenoids Off When Time Is Up, Turn On Glue Apply Solenoid." row="2" column="0" commented="0">
		<row>
			<contact type="open" name="C1Done"/>
			<contact type="open" name="Clean1"/>
			<line/>
			<coil type="open" name="Clean2"/>
		</row>
		<row>
			<contact type="open" name="Clean2" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Turn Glue Solenoid Off When Time Is Up And Reset The Sequence." row="1" column="0" commented="0">
		<row>
			<contact type="open" name="C2Done"/>
			<contact type="open" name="Clean2"/>
			<line/>
			<coil type="open" name="Clean3"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="Clean1"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="CleanCycleLength"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="CCLength"/>
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
			<contact type="open" name="Clean1"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="C1Done"/>
		</row>
		<row>
			<analog type="input" name="CCLength"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
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
			<analog type="input" name="Clean2"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="C2Done"/>
		</row>
		<row>
			<analog type="input" name="T#250ms"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="Glue Flush Push Button Sequence, Turn Water Supply And Water Flush Solenoids On." row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="GlueFlushPB"/>
			<contact type="closed" name="GFPBReset"/>
			<line/>
			<coil type="open" name="GFPB1"/>
		</row>
		<row>
			<contact type="open" name="GFPB1" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Turn On Apply For 250 ms, Turn Off Water Supply And Water Flush Solenoids." row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="GlueFlushPB"/>
			<contact type="open" name="GFPB1"/>
			<line/>
			<coil type="open" name="GFPB2"/>
		</row>
		<row>
			<contact type="open" name="GFPB2" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="GFPBTmr"/>
			<contact type="open" name="GFPB2"/>
			<line/>
			<coil type="open" name="GFPBReset"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="TON_4" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="GFPB2"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="GFPBTmr"/>
		</row>
		<row>
			<analog type="input" name="T#250ms"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="Clean1"/>
			<contact type="closed" name="Clean2"/>
			<line/>
			<coil type="open" name="MTWaterFlushSolenoid"/>
		</row>
		<row>
			<contact type="open" name="GFPB1"/>
			<contact type="closed" name="GFPB2" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="Clean1"/>
			<contact type="closed" name="Clean2"/>
			<line/>
			<coil type="open" name="MTWaterSupplySolenoid"/>
		</row>
		<row>
			<contact type="open" name="GFPB1"/>
			<contact type="closed" name="GFPB2" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="negative transition" name="GluePumpOnSwitch"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="FlushTubeRaiseTime"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="FTRTime"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="TP_3" type="TP"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TP"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="negative transition" name="GluePumpOnSwitch"/>
			<functionblock position="middle" type="TP"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="FTRSDelay"/>
		</row>
		<row>
			<analog type="input" name="FTRTime"/>
			<functionblock position="bottom" type="TP"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="closed" name="GluePumpOnSwitch"/>
			<contact type="open" name="EStopClear"/>
			<contact type="closed" name="GlueServiceSwitch"/>
			<contact type="closed" name="FTRSDelay"/>
			<coil type="open" name="MTFlushTubeOpenSolenoid"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="GluePumpOnSwitch"/>
			<contact type="closed" name="GlueServiceSwitch"/>
			<contact type="open" name="EStopClear"/>
			<coil type="open" name="MTFlushTubeCloseSolenoid"/>
		</row>
	</network>
</networks>
END_PROGRAM





