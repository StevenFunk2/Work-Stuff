PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="This File Is The E2000's. Attempting To Isolate The E2000 Touchscreen functions to this file." row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="FSHydraulicsButton"/>
			<contact type="open" name="CoilLinePower"/>
			<line/>
			<coil type="open" name="CLPUnlatch"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="FSHydraulicsButton"/>
			<contact type="open" name="AllSystemsOK"/>
			<contact type="closed" name="CLPUnlatch"/>
			<coil type="open" name="CoilLinePower"/>
		</row>
		<row>
			<contact type="open" name="CoilLinePower" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="TSCDAButton"/>
			<contact type="open" name="CDADecoilPower"/>
			<line/>
			<coil type="open" name="CDAUnlatch"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="TSCDAButton"/>
			<contact type="open" name="EStopClear"/>
			<contact type="closed" name="CDAUnlatch"/>
			<coil type="open" name="CDADecoilPower"/>
		</row>
		<row>
			<contact type="open" name="CDADecoilPower" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="TSCEFButton"/>
			<contact type="open" name="CEFPower"/>
			<line/>
			<coil type="open" name="CEFUnlatch"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="TSCEFButton"/>
			<contact type="open" name="EStopClear"/>
			<contact type="closed" name="CEFUnlatch"/>
			<coil type="open" name="CEFPower"/>
		</row>
		<row>
			<contact type="open" name="CEFPower" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="CEFJogPB" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="FullCleatButton"/>
			<contact type="open" name="FullCleatSelect"/>
			<line/>
			<coil type="open" name="FullCleatUnlatch"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="FullCleatButton"/>
			<contact type="closed" name="FullCleatUnlatch"/>
			<line/>
			<coil type="open" name="FullCleatSelect"/>
		</row>
		<row>
			<contact type="open" name="FullCleatSelect" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="TSLOMButton"/>
			<contact type="open" name="LOMPower"/>
			<line/>
			<coil type="open" name="LOMUnlatch"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="TSLOMButton"/>
			<contact type="open" name="EStopClear"/>
			<contact type="closed" name="LOMUnlatch"/>
			<coil type="open" name="LOMPower"/>
		</row>
		<row>
			<contact type="open" name="LOMPower" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="TSTDFButton"/>
			<contact type="open" name="TDFPower"/>
			<line/>
			<coil type="open" name="TDFUnlatch"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="TSTDFButton"/>
			<contact type="closed" name="TDFUnlatch"/>
			<contact type="open" name="EStopClear"/>
			<coil type="open" name="TDFPower"/>
		</row>
		<row>
			<contact type="open" name="TDFJogPB" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="TDFPower" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
</networks>
END_PROGRAM









