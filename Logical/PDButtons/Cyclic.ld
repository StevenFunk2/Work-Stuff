PROGRAM _CYCLIC
<?xml version="1.0"?>
<?AutomationStudio Version=3.0.71?>
<!-- Automation Studio Generated XML Section -->
<networks maxcolumn="0">
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="ButtonSignal[0]"/>
			<line/>
			<line/>
			<coil type="open" name="hmiUncoilerOnButton"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="hmiUncoilerOnButton"/>
			<contact type="open" name="UncoilerOnLatch"/>
			<line/>
			<coil type="open" name="UOLUnlatch"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="hmiUncoilerOnButton"/>
			<contact type="open" name="EStopClear"/>
			<contact type="closed" name="UOLUnlatch"/>
			<contact type="closed" name="UncoilerJogForwardPB"/>
			<contact type="closed" name="UncoilerJogReversePB"/>
			<coil type="open" name="UncoilerOnLatch"/>
		</row>
		<row>
			<contact type="open" name="UncoilerOnLatch" or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="UncoilerOnLatch"/>
			<line/>
			<line/>
			<coil type="open" name="ButtonStatus[0]"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="ButtonSignal[1]"/>
			<line/>
			<line/>
			<coil type="open" name="hmiUncoilerLoadButton"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="hmiUncoilerLoadButton"/>
			<line/>
			<line/>
			<coil type="set" name="UncoilerLoad"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="UncoilerRunMode"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="UncoilerLoad"/>
			<line/>
			<line/>
			<coil type="open" name="ButtonStatus[1]"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="ButtonSignal[2]"/>
			<line/>
			<line/>
			<coil type="open" name="hmiUncoilerRunButton"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="hmiUncoilerRunButton"/>
			<line/>
			<line/>
			<coil type="set" name="UncoilerRunMode"/>
		</row>
		<row>
			<empty or="true"/>
			<line/>
			<line/>
			<coil type="reset" name="UncoilerLoad"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="UncoilerRunMode"/>
			<line/>
			<line/>
			<coil type="open" name="ButtonStatus[2]"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="ButtonSignal[3]"/>
			<line/>
			<line/>
			<coil type="open" name="hmiProductHydraulicsButton"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="hmiProductHydraulicsButton"/>
			<contact type="open" name="doProDuctHydraulics"/>
			<line/>
			<coil type="open" name="PDHUnlatch"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="hmiProductHydraulicsButton"/>
			<contact type="open" name="EStopClear"/>
			<contact type="closed" name="PDHUnlatch"/>
			<coil type="open" name="doProDuctHydraulics"/>
		</row>
		<row>
			<contact type="open" name="doProDuctHydraulics" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="doProDuctHydraulics"/>
			<line/>
			<line/>
			<coil type="open" name="ButtonStatus[3]"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="ButtonSignal[4]"/>
			<line/>
			<line/>
			<coil type="open" name="hmiBrakeHydraulicsButton"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="hmiBrakeHydraulicsButton"/>
			<contact type="open" name="BrakeHydraulics"/>
			<line/>
			<coil type="open" name="BHUnlatch"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="hmiBrakeHydraulicsButton"/>
			<contact type="open" name="EStopClear"/>
			<contact type="closed" name="BHUnlatch"/>
			<coil type="open" name="BrakeHydraulics"/>
		</row>
		<row>
			<contact type="open" name="BrakeHydraulics" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeHydraulics"/>
			<line/>
			<line/>
			<coil type="open" name="ButtonStatus[4]"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="ButtonSignal[5]"/>
			<line/>
			<line/>
			<coil type="open" name="hmiMarkTableButton"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="hmiMarkTableButton"/>
			<contact type="open" name="MarkTableStart"/>
			<line/>
			<coil type="open" name="MTUnlatch"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="hmiMarkTableButton"/>
			<contact type="open" name="EStopClear"/>
			<contact type="closed" name="MTUnlatch"/>
			<coil type="open" name="MarkTableStart"/>
		</row>
		<row>
			<contact type="open" name="MarkTableStart" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="MarkTableStart"/>
			<line/>
			<line/>
			<coil type="open" name="ButtonStatus[5]"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="ButtonSignal[6]"/>
			<line/>
			<line/>
			<coil type="open" name="hmiFittingsButton"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="ButtonSignal[7]"/>
			<line/>
			<line/>
			<coil type="open" name="hmiDuctSelectButton"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="hmiFittingsButton"/>
			<contact type="open" name="DuctSelected"/>
			<line/>
			<coil type="open" name="DSUnlatch"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="hmiDuctSelectButton"/>
			<contact type="closed" name="DSUnlatch"/>
			<line/>
			<coil type="open" name="DuctSelected"/>
		</row>
		<row>
			<contact type="open" name="DuctSelected" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="closed" name="DuctSelected"/>
			<line/>
			<line/>
			<coil type="open" name="ButtonStatus[6]"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="DuctSelected"/>
			<line/>
			<line/>
			<coil type="open" name="ButtonStatus[7]"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="ButtonSignal[8]"/>
			<line/>
			<line/>
			<coil type="open" name="hmiMarkRollformerButton"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="hmiMarkRollformerButton"/>
			<contact type="open" name="MarkRollformerOn"/>
			<line/>
			<coil type="open" name="MROUnlatch"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="hmiMarkRollformerButton"/>
			<contact type="open" name="EStopClear"/>
			<contact type="closed" name="MROUnlatch"/>
			<coil type="open" name="MarkRollformerOn"/>
		</row>
		<row>
			<contact type="open" name="MarkRollformerOn" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="MarkRollformerOn"/>
			<line/>
			<line/>
			<coil type="open" name="ButtonStatus[8]"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="TDCPusherEnable"/>
			<line/>
			<line/>
			<coil type="open" name="ButtonStatus[10]"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="ButtonSignal[13]"/>
			<line/>
			<line/>
			<coil type="open" name="BrakeSetButton"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeIsSetUp"/>
			<line/>
			<line/>
			<coil type="open" name="ButtonStatus[13]"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="ButtonSignal[14]"/>
			<line/>
			<line/>
			<coil type="open" name="hmiBrakeManualButton"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeManualIndicator"/>
			<line/>
			<line/>
			<coil type="open" name="ButtonStatus[14]"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="ButtonSignal[15]"/>
			<line/>
			<line/>
			<coil type="open" name="hmiBrakeAutoButton"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="BrakeAutoIndicator"/>
			<line/>
			<line/>
			<coil type="open" name="ButtonStatus[15]"/>
		</row>
	</network>
	<network label="" comment="" row="3" column="0" commented="0">
		<row>
			<contact type="positive transition" name="BrakeAutoButton"/>
			<contact type="open" name="BrakeHydraulics"/>
			<contact type="closed" name="hmiBrakeManualButton"/>
			<contact type="closed" name="BrakeManualButton"/>
			<coil type="open" name="BrakeAutoRequest"/>
		</row>
		<row>
			<contact type="positive transition" name="hmiBrakeAutoButton" or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
		<row>
			<contact type="open" name="BrakeAutoRequest" or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="ButtonSignal[16]"/>
			<contact type="open" name="ExitBeltsOn"/>
			<line/>
			<coil type="open" name="EBeltsUnlatch"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="ButtonSignal[16]"/>
			<contact type="open" name="EStopClear"/>
			<contact type="closed" name="EBeltsUnlatch"/>
			<coil type="open" name="ExitBeltsOn"/>
		</row>
		<row>
			<contact type="open" name="ExitBeltsOn" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="ExitBeltsOn"/>
			<line/>
			<line/>
			<coil type="open" name="ButtonStatus[16]"/>
		</row>
	</network>
	<network label="" comment="17 Is Pipe Button, 18 Is Machine Set Button, Handled In SBrake routine" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="ButtonSignal[19]"/>
			<line/>
			<line/>
			<coil type="open" name="hmiFeedInitPB"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="hmiFeedInitPB"/>
			<line/>
			<line/>
			<coil type="open" name="ButtonStatus[19]"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="hmiFeedInitPB"/>
			<line/>
			<line/>
			<coil type="open" name="FeedInitButton"/>
		</row>
		<row>
			<contact type="open" name="diFeedInitButton" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="ButtonSignal[20]"/>
			<line/>
			<line/>
			<coil type="open" name="hmiProcessorEnableButton"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="hmiProcessorEnableButton"/>
			<contact type="open" name="ProcessorDriveEnable"/>
			<line/>
			<coil type="open" name="PDEUnlatch"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="hmiProcessorEnableButton"/>
			<contact type="open" name="doProDuctHydraulics"/>
			<contact type="closed" name="PDEUnlatch"/>
			<coil type="open" name="ProcessorDriveEnable"/>
		</row>
		<row>
			<contact type="open" name="ProcessorDriveEnable" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="ProcessorDriveEnable"/>
			<line/>
			<line/>
			<coil type="open" name="ButtonStatus[20]"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="ButtonSignal[21]"/>
			<line/>
			<line/>
			<coil type="open" name="hmiDuctoAutoButton"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="hmiDuctoAutoButton"/>
			<contact type="open" name="DuctoAuto"/>
			<line/>
			<coil type="open" name="DAUnlatch"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="open" name="hmiDuctoAutoButton"/>
			<contact type="open" name="InCycle"/>
			<contact type="closed" name="DAUnlatch"/>
			<contact type="closed" name="Block_1"/>
			<coil type="open" name="DuctoAuto"/>
		</row>
		<row>
			<contact type="open" name="DuctoAuto" or="true"/>
			<empty/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="DuctoAuto"/>
			<line/>
			<line/>
			<coil type="open" name="ButtonStatus[21]"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="TDCTransferTableButton"/>
			<contact type="open" name="TDCTableOn"/>
			<line/>
			<coil type="open" name="TDCTUnlatch"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="TDCTransferTableButton"/>
			<contact type="open" name="EStopClear"/>
			<contact type="closed" name="TDCTUnlatch"/>
			<coil type="open" name="TDCTableOn"/>
		</row>
		<row>
			<contact type="open" name="TDCTableOn" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="TDCTableOn"/>
			<line/>
			<line/>
			<coil type="open" name="TDCTTLatch"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="TDCRunSignal"/>
			<contact type="open" name="TDCMotorLatch"/>
			<line/>
			<coil type="open" name="TDCRFMUnlatch"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="TDCRunSignal"/>
			<contact type="open" name="EStopClear"/>
			<contact type="closed" name="TDCRFMUnlatch"/>
			<coil type="open" name="TDCMotorLatch"/>
		</row>
		<row>
			<contact type="open" name="TDCMotorLatch" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="open" name="TDCRunSignal"/>
			<line/>
			<line/>
			<coil type="reset" name="TDCRunSignal"/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="positive transition" name="InsulmaticButton"/>
			<contact type="open" name="InsulmaticLatch"/>
			<line/>
			<coil type="open" name="InsulmaticUnlatch"/>
		</row>
	</network>
	<network label="" comment="" row="2" column="0" commented="0">
		<row>
			<contact type="positive transition" name="InsulmaticButton"/>
			<contact type="closed" name="InsulmaticUnlatch"/>
			<contact type="open" name="EStopClear"/>
			<coil type="open" name="InsulmaticLatch"/>
		</row>
		<row>
			<contact type="open" name="InsulmaticLatch" or="true"/>
			<empty/>
			<empty/>
			<empty/>
		</row>
	</network>
	<network label="" comment="" row="1" column="0" commented="0">
		<row>
			<contact type="closed" name="TDCTablePause"/>
			<line/>
			<line/>
			<coil type="open" name="TDCPushPartPresent"/>
		</row>
	</network>
</networks>
END_PROGRAM










