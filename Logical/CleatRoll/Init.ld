PROGRAM _INIT
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="" row="8" column="0" commented="0">
		<row>
			<line/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="CleatOff"/>
		</row>
		<row>
			<analog type="input" name="1"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="Cleat1And3"/>
		</row>
		<row>
			<analog type="input" name="2"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="Cleat2And4"/>
		</row>
		<row>
			<analog type="input" name="3"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="CleatFull"/>
		</row>
		<row>
			<analog type="input" name="0"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="CleatLeftSideOnly"/>
		</row>
		<row>
			<analog type="input" name="1"/>
			<function position="middle" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="CleatBothSides"/>
		</row>
		<row>
			<analog type="input" name="2"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="CleatRightSideOnly"/>
		</row>
	</network>
</networks>
END_PROGRAM

