PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="" row="18" column="0" commented="0">
		<row>
			<contact type="positive transition" name="CleatRollerSheetSense"/>
			<line/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="CleatOnDelay"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="tmCleatOnDelay"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="CleatOffDelay"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="tmCleatOffDelay"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<line/>
			<coil type="reset" name="CleatLeft"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<line/>
			<coil type="reset" name="CleatRight"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<function position="top" type="EQ"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="CleatSide"/>
			<function position="middle" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="CleatLeft"/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="CleatLeftSideOnly"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<function position="top" type="EQ"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="CleatSide"/>
			<function position="middle" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="CleatLeft"/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="CleatBothSides"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<function position="top" type="EQ"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="CleatSide"/>
			<function position="middle" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="CleatRight"/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="CleatRightSideOnly"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<function position="top" type="EQ"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
			<empty/>
		</row>
		<row>
			<analog type="input" name="CleatSide"/>
			<function position="middle" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="CleatRight"/>
			<empty/>
		</row>
		<row>
			<analog type="input" name="CleatBothSides"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="positive transition" name="CleatRollerSheetSense"/>
			<line/>
			<line/>
			<coil type="reset" name="blCleat1And3"/>
		</row>
		<row>
			<empty or="true"/>
			<function position="top" type="EQ"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="CleatControl"/>
			<function position="middle" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="blCleat1And3"/>
		</row>
		<row>
			<analog type="input" name="Cleat1And3"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="positive transition" name="CleatRollerSheetSense"/>
			<line/>
			<line/>
			<coil type="reset" name="blCleat2And4"/>
		</row>
		<row>
			<empty or="true"/>
			<function position="top" type="EQ"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="CleatControl"/>
			<function position="middle" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="blCleat2And4"/>
		</row>
		<row>
			<analog type="input" name="Cleat2And4"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="positive transition" name="CleatRollerSheetSense"/>
			<line/>
			<line/>
			<coil type="reset" name="blCleatFull"/>
		</row>
		<row>
			<empty or="true"/>
			<function position="top" type="EQ"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="CleatControl"/>
			<function position="middle" type="EQ"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="blCleatFull"/>
		</row>
		<row>
			<analog type="input" name="CleatFull"/>
			<function position="bottom" type="EQ"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="CEFNotchDetect"/>
			<contact type="closed" name="CRReset"/>
			<contact type="closed" name="cleat4"/>
			<coil type="open" name="cleat1"/>
		</row>
		<row>
			<contact type="open" name="cleat1" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="CEFNotchDetect"/>
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
			<contact type="open" name="CEFNotchDetect"/>
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
			<contact type="closed" name="CEFNotchDetect"/>
			<contact type="open" name="cleat3"/>
			<line/>
			<coil type="open" name="cleat4"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="cleat1"/>
			<contact type="closed" name="cleat2"/>
			<contact type="open" name="blCleat1And3"/>
			<coil type="open" name="CleatOutputRaw"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="blCleatFull"/>
			<line or="true"/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="cleat3"/>
			<contact type="closed" name="cleat4"/>
			<contact type="open" name="blCleat2And4" or="true"/>
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
			<contact type="open" name="CleatOutputRaw"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="CleatOutputDOM"/>
		</row>
		<row>
			<analog type="input" name="tmCleatOnDelay"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="TOF_0" type="TOF"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TOF"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="CleatOutputDOM"/>
			<functionblock position="middle" type="TOF"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="CleatOutputDOB"/>
		</row>
		<row>
			<analog type="input" name="tmCleatOffDelay"/>
			<functionblock position="bottom" type="TOF"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="CleatOutputDOM"/>
			<line/>
			<line/>
			<coil type="open" name="CleatOutput"/>
		</row>
		<row>
			<contact type="open" name="CleatOutputDOB" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="CleatOutput"/>
			<contact type="open" name="CleatLeft"/>
			<line/>
			<coil type="open" name="LeftCleatKDRollValve"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="CleatOutput"/>
			<contact type="open" name="CleatRight"/>
			<line/>
			<coil type="open" name="RightCleatKDRollValve"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="TON_1" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="cleat2"/>
			<contact type="closed" name="cleat3"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="CRReset"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="T#2s"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
</networks>
END_PROGRAM







