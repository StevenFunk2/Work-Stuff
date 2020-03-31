PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<contact type="open" name="InsulmaticOnA"/>
			<contact type="open" name="HasInsulmaticOnInput"/>
			<line/>
			<coil type="open" name="InsulmaticOn"/>
		</row>
		<row>
			<contact type="open" name="InsulmaticOnB" or="true"/>
			<empty/>
			<empty or="true"/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="InsulmaticLatch"/>
			<line/>
			<line or="true"/>
			<empty/>
		</row>
		<row>
			<contact type="closed" name="HasInsulmaticOnInput"/>
			<contact type="closed" name="InsulmaticOnA"/>
			<contact type="open" name="EStopClear" or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Squaring Pin sequence" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="PartAtISquarePin"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="ITmr13"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="T13"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<functionblock position="header" name="TP_0" type="TP"/>
			<empty/>
		</row>
		<row>
			<line/>
			<line/>
			<line/>
			<line/>
			<functionblock position="top" type="TP"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="InsulmaticOn"/>
			<contact type="open" name="ISquarePinOn"/>
			<contact type="open" name="SP2"/>
			<contact type="positive transition" name="PartAtISquarePin"/>
			<functionblock position="middle" type="TP"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="SP1"/>
		</row>
		<row>
			<empty/>
			<empty/>
			<empty/>
			<analog type="input" name="T13"/>
			<functionblock position="bottom" type="TP"><input name="PT"/><output name="ET"/></functionblock>
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
			<contact type="closed" name="PartAtISquarePin"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="SP2"/>
		</row>
		<row>
			<analog type="input" name="T#1s"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="Blade raise/lower sequence. Swing blade swings when BTimer2 energizes." row="1" column="0" commented="0">
		<row>
			<contact type="open" name="InsulmaticOn"/>
			<contact type="closed" name="RaiseImaticBlade"/>
			<contact type="closed" name="BTimer2Done"/>
			<coil type="open" name="B0"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="PartAtInsulationFeed"/>
			<contact type="open" name="InsulationRequired"/>
			<contact type="open" name="B0"/>
			<coil type="open" name="B1"/>
		</row>
		<row>
			<contact type="open" name="B1" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="BTimer1Done"/>
			<contact type="open" name="B1"/>
			<line/>
			<coil type="open" name="B2"/>
		</row>
		<row>
			<contact type="open" name="B2" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="6" column="0" commented="0">
		<row>
			<contact type="positive transition" name="B1"/>
			<contact type="open" name="ISquarePinOn"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="ITmr9"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="T9"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="closed" name="ISquarePinOn"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="ITmr1"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="T9"/>
		</row>
		<row>
			<empty or="true"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
			<empty/>
		</row>
		<row>
			<analog type="input" name="ITmr6"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="T6"/>
			<empty/>
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
			<contact type="open" name="B1"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="BTimer1Done"/>
		</row>
		<row>
			<analog type="input" name="T9"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="TON_2" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="B1"/>
			<contact type="closed" name="PartAtInsulationFeed"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="BTimer2Done"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="T6"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="Feed Roll raise/lower sequence" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="InsulmaticOn"/>
			<contact type="closed" name="RaiseImaticBlade"/>
			<contact type="closed" name="FRTimer2Done"/>
			<coil type="open" name="FR0"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="PartAtInsulationFeed"/>
			<contact type="open" name="InsulationRequired"/>
			<contact type="open" name="FR0"/>
			<coil type="open" name="FR1"/>
		</row>
		<row>
			<contact type="open" name="FR1" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="FRTimer1Done"/>
			<contact type="open" name="FR1"/>
			<line/>
			<coil type="open" name="FR2"/>
		</row>
		<row>
			<contact type="open" name="FR2" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Add Blade Raise Delay to Feed Roll Delay to calculate when the feed roll output comes on." row="8" column="0" commented="0">
		<row>
			<contact type="positive transition" name="FR1"/>
			<contact type="open" name="ISquarePinOn"/>
			<function position="top" type="ADD"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="ITmr9"/>
			<function position="middle" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="TempFRDelay"/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="ITmr10"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="closed" name="ISquarePinOn"/>
			<function position="top" type="ADD"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="ITmr1"/>
			<function position="middle" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="TempFRDelay"/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="ITmr2"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
			<empty/>
		</row>
		<row>
			<analog type="input" name="TempFRDelay"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="T2"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Add Press Roll Delay to Feed Roll Dwell to calculate when the feed roll output goes off." row="6" column="0" commented="0">
		<row>
			<contact type="positive transition" name="FR1"/>
			<contact type="open" name="ISquarePinOn"/>
			<function position="top" type="ADD"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="ITmr11"/>
			<function position="middle" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="TempFR2Delay"/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="ITmr12"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="closed" name="ISquarePinOn"/>
			<function position="top" type="ADD"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="ITmr3"/>
			<function position="middle" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="TempFR2Delay"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="ITmr4"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="FR1"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="TempFR2Delay"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="T4"/>
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
			<contact type="open" name="FR1"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="FRTimer1Done"/>
		</row>
		<row>
			<analog type="input" name="T2"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
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
			<contact type="open" name="FR1"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="FRTimer2Done"/>
		</row>
		<row>
			<analog type="input" name="T4"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="InsulmaticOn"/>
			<contact type="closed" name="RaiseImaticBlade"/>
			<contact type="closed" name="PRTimer2Done"/>
			<coil type="open" name="PR0"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="PartAtInsulationFeed"/>
			<contact type="open" name="InsulationRequired"/>
			<contact type="open" name="PR0"/>
			<coil type="open" name="PR1"/>
		</row>
		<row>
			<contact type="open" name="PR1" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="PRTimer1Done"/>
			<contact type="open" name="PR1"/>
			<line/>
			<coil type="open" name="PR2"/>
		</row>
		<row>
			<contact type="open" name="PR2" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="6" column="0" commented="0">
		<row>
			<contact type="positive transition" name="PR1"/>
			<line/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="ITmr7"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="T7"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="ISquarePinOn"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="ITmr11"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="T3"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="closed" name="ISquarePinOn"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="ITmr3"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="T3"/>
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
			<contact type="open" name="PR1"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="PRTimer1Done"/>
		</row>
		<row>
			<analog type="input" name="T3"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="TON_6" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="PR1"/>
			<contact type="closed" name="PartAtInsulationFeed"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="PRTimer2Done"/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="T7"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="InsulmaticConveyorsOn"/>
			<contact type="open" name="ISquarePinOn"/>
			<contact type="closed" name="HLTimer2Done"/>
			<coil type="open" name="HLwSq0"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="ExitBeltsOn"/>
			<line/>
			<line/>
			<coil type="open" name="InsulmaticConveyorsOn"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="PartAtISquarePin"/>
			<contact type="open" name="HLwSq0"/>
			<line/>
			<coil type="open" name="HLwSq1"/>
		</row>
		<row>
			<contact type="open" name="HLwSq1" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="InsulmaticConveyorsOn"/>
			<contact type="closed" name="ISquarePinOn"/>
			<contact type="closed" name="HLTimer2Done"/>
			<coil type="open" name="HLwoSq0"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="PartAtInsulationFeed"/>
			<contact type="open" name="InsulationRequired"/>
			<contact type="open" name="HLwoSq0"/>
			<coil type="open" name="HLwoSq1"/>
		</row>
		<row>
			<contact type="open" name="HLwoSq1" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="HLTimer1Done"/>
			<contact type="open" name="HLwoSq1"/>
			<line/>
			<coil type="open" name="HLwoSq2"/>
		</row>
		<row>
			<contact type="open" name="HLwoSq2" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="HLwoSq1"/>
			<function position="top" type="ADD"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="ITmr3"/>
			<function position="middle" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="HLTempTimer"/>
		</row>
		<row>
			<analog type="input" name="ITmr5"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="HLwoSq1"/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<analog type="input" name="HLTempTimer"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="T5"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<functionblock position="header" name="TON_7" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="HLwoSq1"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="HLTimer1Done"/>
		</row>
		<row>
			<analog type="input" name="T5"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="HLwSq1"/>
			<line/>
			<function position="top" type="DINT_TO_TIME"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<contact type="positive transition" name="HLwoSq1" or="true"/>
			<analog type="input" name="ITmr8"/>
			<function position="bottom" type="DINT_TO_TIME"><input name="IN"/><output name="12"/></function>
			<analog type="output" name="T8"/>
		</row>
	</network>
	<network label="" comment="" row="4" column="0" commented="0">
		<row>
			<empty/>
			<empty/>
			<functionblock position="header" name="TON_8" type="TON"/>
			<empty/>
		</row>
		<row>
			<line/>
			<line/>
			<functionblock position="top" type="TON"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></functionblock>
			<empty/>
		</row>
		<row>
			<contact type="open" name="HLwSq1"/>
			<contact type="closed" name="PartAtInsulationFeed"/>
			<functionblock position="middle" type="TON"><input name="IN"/><output name="Q"/></functionblock>
			<analog type="output" name="HLTimer2Done"/>
		</row>
		<row>
			<contact type="open" name="HLwoSq1" or="true"/>
			<analog type="input" name="T8"/>
			<functionblock position="bottom" type="TON"><input name="PT"/><output name="ET"/></functionblock>
			<empty/>
		</row>
	</network>
	<network label="" comment="Feed Roll Output" row="3" column="0" commented="0">
		<row>
			<contact type="open" name="RaiseImaticBlade"/>
			<contact type="open" name="InsulationFeed"/>
			<line/>
			<coil type="open" name="ImaticFeedRoll"/>
		</row>
		<row>
			<contact type="open" name="InsulmaticSwingBlade" or="true"/>
			<empty or="true"/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="FR2"/>
			<line or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="Press Roll Output" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="PR2"/>
			<line/>
			<line/>
			<coil type="open" name="ImaticPressRoll"/>
		</row>
	</network>
	<network label="" comment="Squaring Pin Output" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="SP1"/>
			<line/>
			<line/>
			<coil type="open" name="ImaticSquarePin"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="BTimer2Done"/>
			<line/>
			<line/>
			<coil type="open" name="SwingBlade"/>
		</row>
		<row>
			<contact type="open" name="RaiseImaticBlade" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="6" column="0" commented="0">
		<row>
			<contact type="positive transition" name="SwingBlade"/>
			<line/>
			<function position="top" type="ADD"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="SwingCount"/>
			<function position="middle" type="ADD"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="SwingCount"/>
		</row>
		<row>
			<empty or="true"/>
			<analog type="input" name="1"/>
			<function position="bottom" type="ADD"><input name="" extensible="true"/></function>
			<empty/>
		</row>
		<row>
			<empty or="true"/>
			<function position="top" type="MOD"><input name="EN" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
			<empty/>
		</row>
		<row>
			<analog type="input" name="SwingCount"/>
			<function position="middle" type="MOD"><input name="IN1"/><output name="44"/></function>
			<analog type="output" name="SwingRem"/>
			<empty/>
		</row>
		<row>
			<analog type="input" name="2"/>
			<function position="bottom" type="MOD"><input name="IN2"/></function>
			<empty/>
			<empty/>
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
			<analog type="output" name="SwingCountIsEven"/>
		</row>
		<row>
			<empty/>
			<function position="bottom" type="Compare!"><input name="&lt;!SwingRem = 0"/></function>
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
			<analog type="input" name="SwingCount"/>
			<function position="middle" type="GT"><input name="" extensible="true"/><output name="1"/></function>
			<analog type="output" name="SCIsBig"/>
		</row>
		<row>
			<analog type="input" name="50000"/>
			<function position="bottom" type="GT"><input name="" extensible="true"/></function>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="InsulmaticOn"/>
			<contact type="open" name="SCIsBig"/>
			<function position="top" type="MOVE"><input name="EN" extensible="true" ENO="true"/><output name="ENO" ENO="true"/></function>
			<empty/>
		</row>
		<row>
			<empty/>
			<analog type="input" name="0"/>
			<function position="bottom" type="MOVE"><input name="" extensible="true"/><output name="40"/></function>
			<analog type="output" name="SwingCount"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="closed" name="InsulmaticSwingBlade"/>
			<contact type="open" name="RaiseImaticBlade"/>
			<line/>
			<coil type="open" name="ImaticBladeUp"/>
		</row>
		<row>
			<empty or="true"/>
			<contact type="open" name="B2"/>
			<line or="true"/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="InsulmaticSwingBlade"/>
			<contact type="open" name="InsulmaticOn"/>
			<contact type="open" name="SwingCountIsEven" or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="closed" name="InsulmaticSwingBlade"/>
			<contact type="open" name="B0"/>
			<contact type="closed" name="B2"/>
			<contact type="closed" name="RaiseImaticBlade"/>
			<coil type="open" name="ImaticBladeDown"/>
		</row>
		<row>
			<contact type="open" name="InsulmaticSwingBlade"/>
			<contact type="open" name="InsulmaticOn"/>
			<contact type="closed" name="SwingCountIsEven"/>
			<line or="true"/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="HLwSq1"/>
			<line/>
			<line/>
			<coil type="open" name="InsulmaticConveyorLow"/>
		</row>
		<row>
			<contact type="open" name="HLwoSq2" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="HLwSq0"/>
			<contact type="closed" name="HLwSq1"/>
			<line/>
			<coil type="open" name="InsulmaticConveyorHi"/>
		</row>
		<row>
			<contact type="open" name="HLwoSq0"/>
			<contact type="closed" name="HLwoSq2" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="InsulmaticConveyorHi"/>
			<line/>
			<line/>
			<coil type="open" name="InsulmaticEntranceHiSpeed"/>
		</row>
		<row>
			<contact type="open" name="InsulmaticConveyorLow"/>
			<contact type="open" name="GluePartSense" or="true"/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="InsulmaticConveyorLow"/>
			<contact type="closed" name="GluePartSense"/>
			<line/>
			<coil type="open" name="InsulmaticEntranceLowSpeed"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="InsulmaticConveyorHi"/>
			<line/>
			<line/>
			<coil type="open" name="InsulmaticExitHiSpeed"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="InsulmaticConveyorLow"/>
			<line/>
			<line/>
			<coil type="open" name="InsulmaticExitLowSpeed"/>
		</row>
	</network>
</networks>
END_PROGRAM








