PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="BlockingValveButton"/>
			<contact type="open" name="ForceBlockingValve"/>
			<line/>
			<coil type="open" name="BlockingValveUnlatch"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="BlockingValveButton"/>
			<contact type="closed" name="BlockingValveUnlatch"/>
			<contact type="closed" name="InCycle"/>
			<coil type="open" name="ForceBlockingValve"/>
		</row>
		<row>
			<contact type="open" name="ForceBlockingValve" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="ZeroCropButton"/>
			<contact type="closed" name="InCycle"/>
			<line/>
			<coil type="open" name="ZeroCropSignal"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="ZeroCropSignal"/>
			<contact type="open" name="ZeroCropCut"/>
			<line/>
			<coil type="open" name="ZeroCropUnlatch"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="ZeroCropSignal"/>
			<contact type="closed" name="ZeroCropUnlatch"/>
			<line/>
			<coil type="open" name="ZeroCropCut"/>
		</row>
		<row>
			<contact type="open" name="ZeroCropCut" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
</networks>
END_PROGRAM

