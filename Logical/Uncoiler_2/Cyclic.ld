PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="open" name="UncoilerOnLatch"/>
			<contact type="closed" name="SlackBar"/>
			<contact type="open" name="UncoilerRunMode"/>
			<contact type="closed" name="InPosition1"/>
			<coil type="open" name="UncoilerRun"/>
		</row>
		<row>
			<contact type="open" name="UncoilerOnLatch"/>
			<contact type="closed" name="SlackBar"/>
			<contact type="open" name="UncoilerLoad"/>
			<line or="true"/>
			<empty/>
		</row>
		<row>
			<contact type="closed" name="UncoilerOnLatch"/>
			<contact type="open" name="UncoilerJogForwardPB"/>
			<line/>
			<line or="true"/>
			<empty/>
		</row>
		<row>
			<contact type="closed" name="UncoilerOnLatch"/>
			<contact type="open" name="UncoilerJogReversePB"/>
			<line/>
			<line or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="5" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<functionblock position="header" name="TOF_0" type="TOF"/>
			<empty/>
		</row>
		<row>
			<line/>
			<line/>
			<line/>
			<line/>
			<line/>
			<functionblock position="top" type="TOF"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="UncoilerOnLatch"/>
			<contact type="closed" name="SlackBar"/>
			<contact type="open" name="UncoilerRunMode"/>
			<contact type="closed" name="InPosition1"/>
			<line/>
			<functionblock position="middle" type="TOF"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="UncoilerRunDOB1"/>
		</row>
		<row>
			<contact type="open" name="UncoilerOnLatch"/>
			<contact type="closed" name="SlackBar"/>
			<contact type="open" name="UncoilerLoad"/>
			<line or="true"/>
			<analog type="input" name="T#500ms"/>
			<functionblock position="bottom" type="TOF"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="closed" name="UncoilerOnLatch"/>
			<contact type="open" name="UncoilerJogForwardPB"/>
			<line/>
			<line or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="UncoilerRunDOB1"/>
			<line/>
			<line/>
			<coil type="open" name="UncoilerForwardSolenoid"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="TOF_1" type="TOF"/>
			<empty/>
		</row>
		<row>
			<line/>
			<line/>
			<functionblock position="top" type="TOF"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="closed" name="UncoilerOnLatch"/>
			<contact type="open" name="UncoilerJogReversePB"/>
			<functionblock position="middle" type="TOF"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="UncoilerDOB2"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="T#500ms"/>
			<functionblock position="bottom" type="TOF"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="UncoilerDOB2"/>
			<line/>
			<line/>
			<coil type="open" name="UncoilerReverseSolenoid"/>
		</row>
	</network>
</networks>
END_PROGRAM







