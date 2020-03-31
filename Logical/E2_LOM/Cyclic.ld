PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="LOMPower"/>
			<line/>
			<line/>
			<coil type="open" name="LOMConveyorRunRelay"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="LOMPower"/>
			<contact type="open" name="LOMSpeedSelect1"/>
			<line/>
			<coil type="open" name="LOMLowSpeedRelay"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="LOMPower"/>
			<contact type="open" name="LOMSpeedSelect2"/>
			<line/>
			<coil type="open" name="LOMHiSpeedRelay"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="LOMPower"/>
			<contact type="open" name="InsulationRequired"/>
			<line/>
			<coil type="open" name="LinerAirSupply"/>
		</row>
	</network>
</networks>
END_PROGRAM

