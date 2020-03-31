(********************************************************************
 ********************************************************************
 * Program: Server
 * File: Server.st
 * Created: May, 2018
 ********************************************************************
 * Implementation of program Server
 ********************************************************************)

PROGRAM _CYCLIC


	CASE Server.sStep OF
 	
		0:  (* Open Ethernet Interface *)
			Server.TcpOpen_0.enable := 1;	
			Server.TcpOpen_0.pIfAddr := 0;  (* Listen on all TCP/IP Interfaces*)
			Server.TcpOpen_0.port := 12000;  (* Port to listen*)
			Server.TcpOpen_0.options := 0;	
			Server.TcpOpen_0;  (* Call the Function*)
						
			IF Server.TcpOpen_0.status = 0 THEN  (* TcpOpen successfull*)
				Server.sStep := 5;	
			ELSIF Server.TcpOpen_0.status = ERR_FUB_BUSY THEN  (* TcpOpen not finished -> redo *)			
				(* Busy *)	
			ELSE  (* Goto Error Step *)
				Server.recv_timeout := 0;
				Server.sStep := 100;
			END_IF
				
		5:
			Server.linger_opt.lLinger := 0; (* linger Time = 0 *)
			Server.linger_opt.lOnOff := 1; (* linger Option ON *)			 
			Server.TcpIoctl_0.enable := 1;
			Server.TcpIoctl_0.ident := Server.TcpOpen_0.ident; (* Connection Ident from AsTCP.TCP_Open *)
			Server.TcpIoctl_0.ioctl := tcpSO_LINGER_SET; (* Set Linger Options *)
			Server.TcpIoctl_0.pData := ADR(Server.linger_opt);
			Server.TcpIoctl_0.datalen := SIZEOF(Server.linger_opt);
			Server.TcpIoctl_0;	    
		
			IF Server.TcpIoctl_0.status = 0 THEN  (* TcpIoctl successfull *)
				Server.sStep := 10;											
			ELSIF Server.TcpIoctl_0.status = ERR_FUB_BUSY THEN  (* TcpIoctl not finished -> redo *)				
				(* Busy *)
			ELSE  (* Goto Error Step *)
				Server.recv_timeout := 0;
				Server.sStep := 100;
			END_IF
		  
		10: (* Wait for Client Connection *)
			Server.TcpServer_0.enable := 1;
			Server.TcpServer_0.ident := Server.TcpOpen_0.ident;  (* Connection Ident from AsTCP.TCP_Open *)
			Server.TcpServer_0.backlog := 1;  (* Number of clients waiting simultaneously for a connection*)
			Server.TcpServer_0.pIpAddr := ADR(Server.client_address);  (* Where to write the client IP-Address*)
			Server.TcpServer_0;  (* Call the Function*)
			
			IF Server.TcpServer_0.status = 0 THEN  (* Status = 0 if an client connects to server *)
				Server.sStep := 15;
			ELSIF Server.TcpServer_0.status = ERR_FUB_BUSY THEN  (* TcpServer not finished -> redo *)			
				(* Busy *)	
			ELSE  (* Goto Error Step *)
				Server.recv_timeout := 0;
				Server.sStep := 100;
			END_IF
			
			
		15:
			Server.TcpIoctl_0.enable := 1;
			Server.TcpIoctl_0.ident := Server.TcpServer_0.identclnt; (* Connection Ident from AsTCP.TCP_Server *)
			Server.TcpIoctl_0.ioctl := tcpSO_LINGER_SET;  (* Set Linger Options *)
			Server.TcpIoctl_0.pData := ADR(Server.linger_opt);
			Server.TcpIoctl_0.datalen := SIZEOF(Server.linger_opt);
			Server.TcpIoctl_0;	    
		
			IF Server.TcpIoctl_0.status = 0 THEN  (* TcpIoctl successfull *)
				Server.sStep := 20;				
			ELSIF Server.TcpIoctl_0.status = ERR_FUB_BUSY THEN  (* TcpIoctl not finished -> redo *)				
				(* Busy *)
			ELSE  (* Goto Error Step *)
				Server.recv_timeout := 0;
				Server.sStep := 100;
			END_IF
			
		20: (* Wait for Data *)
			Server.TcpRecv_0.enable := 1;
			Server.TcpRecv_0.ident := Server.TcpServer_0.identclnt;  (* Client Ident from AsTCP.TCP_Server *)	
			Server.TcpRecv_0.pData	:= ADR(Server.data_buffer);  (* Where to store the incoming data *)
			Server.TcpRecv_0.datamax := SIZEOF(Server.data_buffer);  (* Length of data buffer *)
			Server.TcpRecv_0.flags := 0;
			Server.TcpRecv_0;  (* Call the Function*)
		
			IF Server.TcpRecv_0.status = 0 THEN 
				(* This gets Server.sStep out of here when the PC program stop executing*)
				Server.recv_timeout := Server.recv_timeout + 1;
				IF Server.recv_timeout > 250 THEN
					Server.sStep := 40;
					Server.recv_timeout := 0;
				END_IF
			ELSIF Server.TcpRecv_0.status = tcpERR_NO_DATA THEN  
				(*This criteria isn't true when the PC program isn't executing*)
				Server.recv_timeout := Server.recv_timeout + 1;
				IF Server.recv_timeout > 500 THEN
					Server.sStep := 40;
					Server.recv_timeout := 0;
				END_IF
			ELSIF Server.TcpRecv_0.status = ERR_FUB_BUSY THEN  					
			  
			ELSIF Server.TcpRecv_0.status = tcpERR_NOT_CONNECTED THEN
				(* This doesn't appear to work.*)
				Server.sStep := 40;
			ELSE  
				Server.recv_timeout := 0;
				Server.sStep := 100;
			END_IF 
		
			LastByte := Server.TcpRecv_0.recvlen - 3;
			IF Server.data_buffer[LastByte] = 13 THEN
				(*Receive Transmission Complete, Parse Data*)
				Server.recv_timeout := 0;
				Server.data_buffer[LastByte] := 0;
				HandleIndex := 0;
				UpperLimit := LastByte; (* Parsing Loop Will Run To Here *)				
				TrueString := 'True';
				Server.sStep := 25;
				(*Server.sStep := 90;*)
			END_IF
		25: (* Parse Out Values *)
			REPEAT
				(* Get The Tag Handle *)
				CommaPosition1 := HandleIndex;
				WHILE Server.data_buffer[CommaPosition1] <> 44 DO
					CommaPosition1 := CommaPosition1 + 1;
				END_WHILE;
				SLength := CommaPosition1 - HandleIndex;
				nxt_adr := memmove(ADR(HandleStringA), ADR(Server.data_buffer[HandleIndex]), SLength);
				HandleStringB := LEFT(HandleStringA, UDINT_TO_INT(SLength));
				TagHandle := atoi(ADR(HandleStringB));
				HandleIndex := CommaPosition1 + 1;
				
				(* Get The String Containing The Value *)
				CommaPosition1 := HandleIndex;
				WHILE Server.data_buffer[CommaPosition1] <> 44 DO
					CommaPosition1 := CommaPosition1 + 1;
				END_WHILE;
				SLength := CommaPosition1 - HandleIndex;
				nxt_adr := memmove(ADR(ValueStringA), ADR(Server.data_buffer[HandleIndex]), SLength);
				ValueStringB := LEFT(ValueStringA, UDINT_TO_INT(SLength));
				HandleIndex := CommaPosition1 + 1;
				CASE TagHandle OF
					0:
						RunJob := atoi(ADR(ValueStringB));
					1: 
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							RunJobClick := TRUE;
						ELSE
							RunJobClick := FALSE;
						END_IF;
					2:
						NewRunJob := atoi(ADR(ValueStringB));
					3:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							StartSignal := TRUE;
						ELSE
							StartSignal := FALSE;
						END_IF;
					4..9:
						ShearTable[TagHandle - 4] := atof(ADR(ValueStringB));
					10..15:
						LTNotchTable[TagHandle - 10] := atof(ADR(ValueStringB));
					16..21:
						VNotchTable[TagHandle - 16] := atof(ADR(ValueStringB));
					22..39:
						LeftHoleTable[TagHandle - 22] := atof(ADR(ValueStringB));
					40..57:
						CenterHoleTable[TagHandle - 40] := atof(ADR(ValueStringB));
					58..75:
						RightHoleTable[TagHandle - 58] := atof(ADR(ValueStringB));
					76:
						ShearHits := atoi(ADR(ValueStringB));
					77:
						LTNotchHits := atoi(ADR(ValueStringB));
					78:
						VNotchHits := atoi(ADR(ValueStringB));
					79:
						LeftHoleHits := atoi(ADR(ValueStringB));
					80:
						CenterHoleHits := atoi(ADR(ValueStringB));
					81:
						RightHoleHits := atoi(ADR(ValueStringB));
					82:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							SealantRequired := TRUE;
						ELSE
							SealantRequired := FALSE;
						END_IF;
					83:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							CropCut := TRUE;
						ELSE
							CropCut := FALSE;
						END_IF;
					84:
						WarningDelay1 := DINT_TO_TIME(atoi(ADR(ValueStringB)));
					85:
						PartsMade := atoi(ADR(ValueStringB));
					86:
						MetalDesired := atof(ADR(ValueStringB));
					87:
						MetalActual := atof(ADR(ValueStringB));
					88:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							InCycle := TRUE;
						ELSE
							InCycle := FALSE;
						END_IF;
					89:
						PercentSpeed1 := atoi(ADR(ValueStringB));
					90:
						CropPercent1 := atoi(ADR(ValueStringB));
					91:
						TotalInches := atof(ADR(ValueStringB));
					92:
						PartLength := atof(ADR(ValueStringB));
					93:
					94:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							MakeShearTable := TRUE;
						ELSE
							MakeShearTable := FALSE;
						END_IF;
					95:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							MakeLTTable := TRUE;
						ELSE
							MakeLTTable := FALSE;
						END_IF;
					96:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							MakeVTable := TRUE;
						ELSE
							MakeVTable := FALSE;
						END_IF;
					97:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							MakeLHoleTable := TRUE;
						ELSE
							MakeLHoleTable := FALSE;
						END_IF;
					98:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							MakeCHoleTable := TRUE;
						ELSE
							MakeCHoleTable := FALSE;
						END_IF;
					99:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							MakeRHoleTable := TRUE;
						ELSE
							MakeRHoleTable := FALSE;
						END_IF;
					100:
						ShearFFlag := atoi(ADR(ValueStringB));
					101:
						NotchFFlag1 := atoi(ADR(ValueStringB));
					102:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							BatchCancelSignal := TRUE;
						ELSE
							BatchCancelSignal := FALSE;
						END_IF;
					103:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							RunContinuousSignal := TRUE;
						ELSE
							RunContinuousSignal := FALSE;
						END_IF;
					104:
						ShearJob := atoi(ADR(ValueStringB));
					105:
						LTJob := atoi(ADR(ValueStringB));
					106:
						VJob := atoi(ADR(ValueStringB));
					107:
						LHoleJob := atoi(ADR(ValueStringB));
					108:
					    BackGaugeJogPercent := atoi(ADR(ValueStringB)); (*Iowa Servo Brake Uses This, too*)
					109:
					    RHoleJob := atoi(ADR(ValueStringB)); (* Iowa *)
					    BackGaugeRunPercent := RHoleJob; (* Engel *)
					110:
						ShearDwell := atoi(ADR(ValueStringB));
					111:
						LTDwell := atoi(ADR(ValueStringB));
					112:
						VDwell := atoi(ADR(ValueStringB));
					113:
						LHoleDwell := atoi(ADR(ValueStringB));
					114:
						CHoleDwell := atoi(ADR(ValueStringB));
					115:
						RHoleDwell := atoi(ADR(ValueStringB));
					116:
						GapTime := atoi(ADR(ValueStringB));
					117..134:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							LeftDiePosition[TagHandle - 117] := TRUE;
						ELSE
							LeftDiePosition[TagHandle - 117] := FALSE;
						END_IF;
					135..152: 
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							CenterDiePosition[TagHandle - 135] := TRUE;
						ELSE
							CenterDiePosition[TagHandle - 135] := FALSE;
						END_IF;
					153..170:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							RightDiePosition[TagHandle - 153] := TRUE;
						ELSE
							RightDiePosition[TagHandle - 153] := FALSE;
						END_IF;
					171:
						LTRemainder := atof(ADR(ValueStringB));
					172:
						VRemainder := atof(ADR(ValueStringB));
					173:
						LHoleRemainder := atof(ADR(ValueStringB));
					174:
						CHoleRemainder := atof(ADR(ValueStringB));
					175:
						RHoleRemainder := atof(ADR(ValueStringB));
					176:
						PercentJogSpeed1 := atoi(ADR(ValueStringB));
					177:
						MetalEncoder := atoi(ADR(ValueStringB));
					178:
						MarkEncoder := atoi(ADR(ValueStringB));
					179:
						PinspotEncoder := atoi(ADR(ValueStringB));
					180:
						BrakeEncoder := atoi(ADR(ValueStringB));
					181:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							RollDriveEnableButton := TRUE;
						ELSE
							RollDriveEnableButton := FALSE;
						END_IF;
					182:
					(*Lift3DownDwell := STRING_TO_TIME(ValueStringB);*)
					    Lift3DownDwell := DINT_TO_TIME(atoi(ADR(ValueStringB)));
					183:
					(*Lift3UpDwell := STRING_TO_TIME(alueStringB);*)
					    Lift3UpDwell := DINT_TO_TIME(atoi(ADR(ValueStringB)));
					184:
						EngelBrakeModelNumber := atoi(ADR(ValueStringB));
					185:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							SideDischargeBrake := TRUE;
						ELSE
							SideDischargeBrake := FALSE;
						END_IF;
					186: (* The E1000 PC program turns this on. *)
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							E1000CoilLine := TRUE;
						ELSE
							E1000CoilLine := FALSE;
						END_IF;
					187:	
						BrakeEjectTarget := atof(ADR(ValueStringB));
					188..272: (*Obsolete Data*)
					273:
						LatestConnector := DINT_TO_INT(atoi(ADR(ValueStringB)));
					274:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							WaitToFire1 := TRUE;
						ELSE
							WaitToFire1 := FALSE;
						END_IF;
					275:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							WaitToFire2 := TRUE;
						ELSE
							WaitToFire2 := FALSE;
						END_IF;
					276:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							WaitToFire3 := TRUE;
						ELSE
							WaitToFire3 := FALSE;
						END_IF;
					277: (*Obsolete Boolean*)
					278:
						MarkTableDecelDelay := atoi(ADR(ValueStringB));
					279:
						MarkGateUpDwell := atoi(ADR(ValueStringB));
					280:
						MarkPStartDelay := atoi(ADR(ValueStringB));
					281:
						MarkPPauseDwell := atoi(ADR(ValueStringB));
					282:
						MarkPStageTime := atoi(ADR(ValueStringB));
					283:
						MarkPStopDelay := atoi(ADR(ValueStringB));
					284:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							BeginMarkHoming := TRUE;
						ELSE
							BeginMarkHoming := FALSE;
						END_IF;
					285:
						MarkTarget := atof(ADR(ValueStringB));
					286:
						MarkInPosBand := atoi(ADR(ValueStringB));
					287:
						MarkSlowBand := atoi(ADR(ValueStringB));
					288:
						MarkReference := atof(ADR(ValueStringB));
					289:
						MarkResolution := atof(ADR(ValueStringB));
					290:
						MarkStatus := atoi(ADR(ValueStringB));
					291:
						MarkMinLength := atof(ADR(ValueStringB));
					292:
						MarkDesired := atof(ADR(ValueStringB));
					293:
						MarkActual := atof(ADR(ValueStringB));
					294:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							ClearLengthCountSignal := TRUE;
						ELSE
							ClearLengthCountSignal := FALSE;
						END_IF;
					295:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							MarkButtonSignal := TRUE;
						ELSE
							MarkButtonSignal := FALSE;
						END_IF;
					296:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							MarkSetSignal := TRUE;
						ELSE
							MarkSetSignal := FALSE;
						END_IF;
					297:
						TDCPushSetupDwell := atoi(ADR(ValueStringB));
					298:
						TDCSquareDelay := atoi(ADR(ValueStringB));
					299:
						TDCTablePauseDwell := atoi(ADR(ValueStringB));
					300:
						PinspotResolution := atof(ADR(ValueStringB));					
					301:
						PSpotDesired := atof(ADR(ValueStringB));
					302:
						PSpotActual := atof(ADR(ValueStringB));
					303:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							PinsRequired := TRUE;
						ELSE
							PinsRequired := FALSE;
						END_IF;
					304:
						PinTarget0 := atof(ADR(ValueStringB));
					305:
						PinTarget1 := atof(ADR(ValueStringB));
					306:
						PinTarget2 := atof(ADR(ValueStringB));
					307:
						PinTarget3 := atof(ADR(ValueStringB));
					308:
						PinTarget4 := atof(ADR(ValueStringB));
					309:
						PinTarget5 := atof(ADR(ValueStringB));
					310:
						PinTarget6 := atof(ADR(ValueStringB));
					311:
						PinTarget7 := atof(ADR(ValueStringB));
					312:
						PinTarget8 := atof(ADR(ValueStringB));
					313:
						PinTarget9 := atof(ADR(ValueStringB));
					314:
						PinRepeat0 := atoi(ADR(ValueStringB));
					315:
						PinRepeat1 := atoi(ADR(ValueStringB));
					316:
						PinRepeat2 := atoi(ADR(ValueStringB));
					317:
						PinRepeat3 := atoi(ADR(ValueStringB));
					318:
						PinRepeat4 := atoi(ADR(ValueStringB));
					319:
						PinRepeat5 := atoi(ADR(ValueStringB));
					320:
						PinRepeat6 := atoi(ADR(ValueStringB));
					321:
						PinRepeat7 := atoi(ADR(ValueStringB));
					322:
						PinRepeat8 := atoi(ADR(ValueStringB));
					323:
						PinRepeat9 := atoi(ADR(ValueStringB));
					324:
						PinDriveDwell := atoi(ADR(ValueStringB));
					325:
						PinLoadDwell := atoi(ADR(ValueStringB));
					326:
						PinLoadDelay := atoi(ADR(ValueStringB));
					327:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							PinspotterSetSignal := TRUE;
						ELSE
							PinspotterSetSignal := FALSE;
						END_IF;
					328:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							BrakeRefSignal := TRUE;
						ELSE
							BrakeRefSignal := FALSE;
						END_IF;
					329:
						BrakeReference := atof(ADR(ValueStringB));
					330:
						BrakeTarget0 := atof(ADR(ValueStringB));
					331:
						BrakeTarget1 := atof(ADR(ValueStringB));
					332:
						BrakeTarget2 := atof(ADR(ValueStringB));
					333:
						BrakeTarget3 := atof(ADR(ValueStringB));
					334:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							BrakeRequired := TRUE;
						ELSE
							BrakeRequired := FALSE;
						END_IF;
					335:	
						BrakeSlowWindow := atoi(ADR(ValueStringB)); (*Iowa*)
					    CoilLineSlowWindow := BrakeSlowWindow; (*Engel*)
					336:
						BrakeTargetWindow := atoi(ADR(ValueStringB)); (*Iowa*)
					    CoilLineTargetWindow := BrakeTargetWindow; (*Engel*)
					337:
						BrakeDesired := atof(ADR(ValueStringB));
					338:
						BrakeActual := atof(ADR(ValueStringB));
					339:
						BrakeResolution := atof(ADR(ValueStringB));
					340:
						DuctType := atoi(ADR(ValueStringB));
					341:
						BrakeStatus := atoi(ADR(ValueStringB));
					342:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							PCBrakeSetSignal := TRUE;
						ELSE
							PCBrakeSetSignal := FALSE;
						END_IF;
					343:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							FBBrakeSetSignal := TRUE;
						ELSE
							FBBrakeSetSignal := FALSE;
						END_IF;
					344:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							ULineSelected := TRUE;
						ELSE
							ULineSelected := FALSE;
						END_IF;
					345:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							ZeroCropCut := TRUE;
						ELSE
							ZeroCropCut := FALSE;
						END_IF;
					346:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							Short2ndLeg := TRUE;
						ELSE
							Short2ndLeg := FALSE;
						END_IF;
					347:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							HWBrakeWithPLC := TRUE;
						ELSE
							HWBrakeWithPLC := FALSE;
						END_IF;
					348:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							LBrakeWithPLC := TRUE;
						ELSE
							LBrakeWithPLC := FALSE;
						END_IF;
					349:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							CycleShear := TRUE;
						ELSE
							CycleShear := FALSE;
						END_IF;
					350:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							CycleLTDie := TRUE;
						ELSE
							CycleLTDie := FALSE;
						END_IF;
					351:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							CycleVDie := TRUE;
						ELSE
							CycleVDie := FALSE;
						END_IF;
					352:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							CycleLDie := TRUE;
						ELSE
							CycleLDie := FALSE;
						END_IF;
					353:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							CycleCDie := TRUE;
						ELSE
							CycleCDie := FALSE;
						END_IF;
					354:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							CycleRDie := TRUE;
						ELSE
							CycleRDie := FALSE;
						END_IF;
					355:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							SpareBool1 := TRUE;
						ELSE
							SpareBool1 := FALSE;
						END_IF;
					356:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							ShearBrakeLatch := TRUE;
						ELSE
							ShearBrakeLatch := FALSE;
						END_IF;
					357:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							CycleCustomVDie := TRUE;
						ELSE
							CycleCustomVDie := FALSE;
						END_IF;
					358:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							CycleCustomLTDie := TRUE;
						ELSE
							CycleCustomLTDie := FALSE;
						END_IF;
					359:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							SpareBool2 := TRUE;
						ELSE
							SpareBool2 := FALSE;							
						END_IF;
					360:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							SpareBool3 := TRUE;
						ELSE
							SpareBool3 := FALSE;
						END_IF;
					361:
						CustomLTDwell := atoi(ADR(ValueStringB));
					362:
						CustomVDwell := atoi(ADR(ValueStringB));
					363:
						TDCRFPusherStopDelay := atoi(ADR(ValueStringB));
					364:
						GlueApplicatorType := atoi(ADR(ValueStringB));
					365:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							MakeButtonTable := TRUE;
						ELSE
							MakeButtonTable := FALSE;
						END_IF;
					366:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							MakeShearBrakeTable := TRUE;
						ELSE
							MakeShearBrakeTable := FALSE;
						END_IF;
					367:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							MakeCustomLTTable := TRUE;
						ELSE
							MakeCustomLTTable := FALSE;
						END_IF;
					368:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							MakeCleatTable := TRUE;
						ELSE
							MakeCleatTable := FALSE;
						END_IF;
					369:
						ButtonHits := atoi(ADR(ValueStringB));
					370:
						ShearBrakeHits := atoi(ADR(ValueStringB));
					371:
						CustomLTHits := atoi(ADR(ValueStringB));
					372:
						CleatHits := atoi(ADR(ValueStringB));
					373:
						ButtonJob := atoi(ADR(ValueStringB));
					374:
						ShearBrakeJob := atoi(ADR(ValueStringB));
					375:
						CustomLTJob := atoi(ADR(ValueStringB));
					376:
						CleatJob := atoi(ADR(ValueStringB));
					377:
						ButtonRemainder := atof(ADR(ValueStringB));
					378:
						ShearBrakeRemainder := atof(ADR(ValueStringB));
					379:
						CustomLTRemainder := atof(ADR(ValueStringB));
					380:
						CleatRemainder := atof(ADR(ValueStringB));
					381..386:
						ButtonTable[TagHandle - 381] := atof(ADR(ValueStringB));
					387..392:
						ShearBrakeTable[TagHandle - 387] := atof(ADR(ValueStringB));
					393..398:
						CustomLTTable[TagHandle - 393] := atof(ADR(ValueStringB));
					399..404:
						CleatTable[TagHandle - 399] := atof(ADR(ValueStringB));
					405:
						DieUpDelay := atoi(ADR(ValueStringB));
					406:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							BrakeAuto := TRUE;
						ELSE
							BrakeAuto := FALSE;
						END_IF;
					407:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							DuctSelected := TRUE;
						ELSE
							DuctSelected := FALSE;
						END_IF;
					408:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							EngelEServoOption := TRUE;
						ELSE
							EngelEServoOption := FALSE;
						END_IF;
					409:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							ConfigureServos := TRUE;
						ELSE
							ConfigureServos := FALSE;
						END_IF;
					410:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							SpareBool4 := TRUE;
						ELSE
							SpareBool4 := FALSE;
						END_IF;
					411:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							SpareBool5 := TRUE;
						ELSE
							SpareBool5 := FALSE;
						END_IF;
					412:
						NotchFFlag2 := atoi(ADR(ValueStringB));
					413:
						ITmr1 := atoi(ADR(ValueStringB));
					414:
						ITmr2 := atoi(ADR(ValueStringB));
					415:
						ITmr3 := atoi(ADR(ValueStringB));
					416:
						ITmr4 := atoi(ADR(ValueStringB));
					417:
						ITmr5 := atoi(ADR(ValueStringB));
					418:
						ITmr6 := atoi(ADR(ValueStringB));
					419:
						ITmr7 := atoi(ADR(ValueStringB));
					420:
						ITmr8 := atoi(ADR(ValueStringB));
					421:
						ITmr9 := atoi(ADR(ValueStringB));
					422:
						ITmr10 := atoi(ADR(ValueStringB));
					423:
						ITmr11 := atoi(ADR(ValueStringB));
					424:
						ITmr12 := atoi(ADR(ValueStringB));
					425:
						ITmr13 := atoi(ADR(ValueStringB));
					426:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							InsulationRequired := TRUE;
						ELSE
							InsulationRequired := FALSE;
						END_IF;
					427:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							HeartBeat := TRUE;
						ELSE
							HeartBeat := FALSE;
						END_IF;
					428:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							TDCRunSignal := TRUE;
						ELSE
							TDCRunSignal := FALSE;
						END_IF;
					429:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							TDCRFMotor := TRUE;
						ELSE
							TDCRFMotor := FALSE;
						END_IF;
					430:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							TDCPushSignal := TRUE;
						ELSE
							TDCPushSignal := FALSE;				
						END_IF;
					431:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							TDCPusherEnable := TRUE;
						ELSE
							TDCPusherEnable := FALSE;
						END_IF;
					432..481:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							ButtonSignal[TagHandle - 432] := TRUE;
						ELSE
							ButtonSignal[TagHandle - 432] := FALSE;
						END_IF;
					482..531:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							ButtonStatus[TagHandle - 482] := TRUE;
						ELSE
							ButtonStatus[TagHandle - 482] := FALSE;
						END_IF;
					532:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							MarkRFInSignal := TRUE;
						ELSE
							MarkRFInSignal := FALSE;
						END_IF;
					533:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							MarkRFOutSignal := TRUE;
						ELSE
							MarkRFOutSignal := FALSE;
						END_IF;
					534:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							ExitBeltsOn := TRUE;
						ELSE
							ExitBeltsOn := FALSE;
						END_IF;
					535:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							BrakeIsRefed := TRUE;
						ELSE
							BrakeIsRefed := FALSE;
						END_IF;
					536:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							BrakeIsSetUp := TRUE;
						ELSE
							BrakeIsSetUp := FALSE;
						END_IF;
					537:
						WBPreset1 := DINT_TO_TIME(atoi(ADR(ValueStringB)));
					538:
						WBPreset2 := DINT_TO_TIME(atoi(ADR(ValueStringB)));
					539:
						WBPreset3 := DINT_TO_TIME(atoi(ADR(ValueStringB)));
					540:
						WBPreset4 := DINT_TO_TIME(atoi(ADR(ValueStringB)));
					541:
						WBPreset5 := DINT_TO_TIME(atoi(ADR(ValueStringB)));
					542:
						WBPreset6 := DINT_TO_TIME(atoi(ADR(ValueStringB)));
					543:
						MaleLeafDwell := atoi(ADR(ValueStringB));
					544:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							PowerOn := TRUE;
						ELSE
							PowerOn := FALSE;
						END_IF;
					545:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							TDCKnurlRollStyle := TRUE;
						ELSE
							TDCKnurlRollStyle := FALSE;
						END_IF;
					546:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							TDCPusherStyle := TRUE;
						ELSE
							TDCPusherStyle := FALSE;
						END_IF;
					547:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							ElectricWrapBrake := TRUE;
						ELSE
							ElectricWrapBrake := FALSE;
						END_IF;
					548:
						MetalGauge := atoi(ADR(ValueStringB));
					549:
						LightPGain := atoi(ADR(ValueStringB));
					550:
						MediumPGain := atoi(ADR(ValueStringB));
					551:
						HeavyPGain := atoi(ADR(ValueStringB));
					552:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							DClampTest := TRUE;
						ELSE
							DClampTest := FALSE;
						END_IF;
					553:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							UClampTest := TRUE;
						ELSE
							UClampTest := FALSE;
						END_IF;
					554:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							DLeafTest := TRUE;
						ELSE
							DLeafTest := FALSE;
						END_IF;
					555:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							ULeafTest := TRUE;
						ELSE
							ULeafTest := FALSE;
						END_IF;
					556:
						BDelay1 := atoi(ADR(ValueStringB));
					557:
						BDelay2 := atoi(ADR(ValueStringB));
					558:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							ShearBrakeInstalled := TRUE;
						ELSE
							ShearBrakeInstalled := FALSE;
						END_IF;
					559:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							PittsButton := TRUE;
						ELSE
							PittsButton := FALSE;
						END_IF;
					560:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							PassThruButton := TRUE;
						ELSE
							PassThruButton := FALSE;
						END_IF;
					561:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							SnapButton := TRUE;
						ELSE
							SnapButton := FALSE;
						END_IF;
					562:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							PittsPosition := TRUE;
						ELSE
							PittsPosition := FALSE;
						END_IF;
					563:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							PassThruPosition := TRUE;
						ELSE
							PassThruPosition := FALSE;
						END_IF;
					564:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							SnapPosition := TRUE;
						ELSE
							SnapPosition := FALSE;
						END_IF;
					565:
						ColdSealLeadDelay := atoi(ADR(ValueStringB));
					566:
						ColdSealTrailDelay := atoi(ADR(ValueStringB));
					567:
						MarkTransferModel := atoi(ADR(ValueStringB));
					568:
						TDCTableLength := atof(ADR(ValueStringB));
					569:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							LeftCleatEnable := TRUE;
						ELSE
							LeftCleatEnable := FALSE;
						END_IF;
					570:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							RightCleatEnable := TRUE;
						ELSE
							RightCleatEnable := FALSE;
						END_IF;
					571:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							InsulmaticSwingBlade := TRUE;
						ELSE
							InsulmaticSwingBlade := FALSE;
						END_IF;
					572:
						TDCRFPushDelay := atoi(ADR(ValueStringB));
					573:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							BlockingValveButton := TRUE;
						ELSE
							BlockingValveButton := FALSE;
						END_IF;
					574:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							MMCHeartBeat := TRUE;
						ELSE
							MMCHeartBeat := FALSE;
						END_IF;
					575:
						GlueLeadDelay := atoi(ADR(ValueStringB));
					576:
						GlueTrailDelay := atoi(ADR(ValueStringB));
					577:
						CleanCycleLength := atoi(ADR(ValueStringB));
					578:
						FlushTubeRaiseTime := atoi(ADR(ValueStringB));
					579:
						LightIGain := atoi(ADR(ValueStringB));
					580:
						MediumIGain := atoi(ADR(ValueStringB));
					581:
						HeavyIGain := atoi(ADR(ValueStringB));
					582:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							GainsReceived := TRUE;
						ELSE
							GainsReceived := FALSE;
						END_IF;
					583:
						MaxSpeed1 := atof(ADR(ValueStringB));
					584:
						UnitsPerInch1 := atof(ADR(ValueStringB));
					585:
						AccelRampReal := atof(ADR(ValueStringB));
					586:
						DecelRampReal := atof(ADR(ValueStringB));	
					587:
						BrakePGain := atoi(ADR(ValueStringB));
					588:
						BrakeIGain := atoi(ADR(ValueStringB));
					589:
						AccelRampReal2 := atof(ADR(ValueStringB));
					590:
						DecelRampReal2 := atof(ADR(ValueStringB));
					591:
						BrakePercentSpeed := atoi(ADR(ValueStringB));
					592:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							ElectricDriveFaulted := TRUE;
						ELSE
							ElectricDriveFaulted := FALSE;
						END_IF;
					593:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							InvertShuttle := TRUE;
						ELSE
							InvertShuttle := FALSE;
						END_IF;
					594:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							HasInsulmaticOnInput := TRUE;
						ELSE
							HasInsulmaticOnInput := FALSE;
						END_IF;
					595:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							StandAloneCleatRoller := TRUE;
						ELSE
							StandAloneCleatRoller := FALSE;
						END_IF;
					596:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							MarkHeadJoggingIn := TRUE;
						ELSE
							MarkHeadJoggingIn := FALSE;
						END_IF;
					597:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							MarkHeadJoggingOut := TRUE;
						ELSE
							MarkHeadJoggingOut := FALSE;
						END_IF;
					598:
						PivotTable := atoi(ADR(ValueStringB));
					599:
						KnurledRollLength := atof(ADR(ValueStringB));
					600:
						RotateCompleteLength := atof(ADR(ValueStringB));
					601:
						PivotClampLength := atof(ADR(ValueStringB));
					602..614:
						(*PivotTablePreset[TagHandle - 602] := atoi(ADR(ValueStringB));*)
					    PivotTablePreset[TagHandle - 602] := DINT_TO_TIME(atoi(ADR(ValueStringB)));
					615:
						CustomVMove := atof(ADR(ValueStringB));
					616:
						CustomVIndex := DINT_TO_USINT(atoi(ADR(ValueStringB)));
					617:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							MakeCustomVTable := TRUE;
						ELSE
							MakeCustomVTable := FALSE;
						END_IF;
					618..623:
						CustomVTable[TagHandle - 618]:= atof(ADR(ValueStringB));
					624:
						CustomVHits := atoi(ADR(ValueStringB));
					625:
						CustomVJob := atoi(ADR(ValueStringB));
					626:
						CustomVRemainder := atof(ADR(ValueStringB));
					627:
						MarkCleanLength := atof(ADR(ValueStringB));
					628:
						MarkCleanDwell := atoi(ADR(ValueStringB));					
					629:
						CleatControl := atoi(ADR(ValueStringB));
					630:
						CleatSide := atoi(ADR(ValueStringB));
					631:
						CleatOnDelay := atoi(ADR(ValueStringB));
					632:
						CleatOffDelay := atoi(ADR(ValueStringB));	
					633:
						CoilWidth := atof(ADR(ValueStringB));
					634:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							ZeroCropButton := TRUE;
						ELSE
							ZeroCropButton := FALSE;
						END_IF;
					635:
						ZeroCropOffset := atof(ADR(ValueStringB));
					636:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							MakeBeadRollTable := TRUE;
						ELSE
							MakeBeadRollTable := FALSE;
						END_IF;
					637..646:
						BeadRollTable[TagHandle - 637] := atof(ADR(ValueStringB));
					647:
						BeadRollHits := atoi(ADR(ValueStringB));
					648:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							ChangeBeadRoll := TRUE;
						ELSE
							ChangeBeadRoll := FALSE;
						END_IF;
					649:
						BeadRollJob := atoi(ADR(ValueStringB));
					650:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							LBrakeWithNoPLC := TRUE;
						ELSE
							LBrakeWithNoPLC := FALSE;
						END_IF;
					651:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							HWBrakeWithNoPLC := TRUE;
						ELSE
							HWBrakeWithNoPLC := FALSE;
						END_IF;
					652:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							SlipAndDriveButton := TRUE;
						ELSE
							SlipAndDriveButton := FALSE;
						END_IF;
					653:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							NotchShuttleValve := TRUE;
						ELSE
							NotchShuttleValve := FALSE;
						END_IF;
					654:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							TDCNotchButton := TRUE;
						ELSE
							TDCNotchButton := FALSE;
						END_IF;
					655:
						FixedTDCHeadReference := atof(ADR(ValueStringB));
					656:
						FixedTDCHeadDesired := atof(ADR(ValueStringB));
					657:
						FixedTDCHeadActual := atof(ADR(ValueStringB));
					658:
						AdjustableTDCHeadReference := atof(ADR(ValueStringB));
					659:
						AdjustableTDCHeadDesired := atof(ADR(ValueStringB));
					660:
						AdjustableTDCHeadActual := atof(ADR(ValueStringB));
					661:
						TDCHomePosition := atof(ADR(ValueStringB));
					662:
						TDCHeadInPositionBand := atof(ADR(ValueStringB));
					663:
						TDCHeadSlowSpeedWindow := atof(ADR(ValueStringB));
					664:
						TDCHeadResolution := atof(ADR(ValueStringB));
					665:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							TDCHeadReferenceButton := TRUE;
						ELSE
							TDCHeadReferenceButton := FALSE;
						END_IF;
					666:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							TDCHeadReferenced := TRUE;
						ELSE
							TDCHeadReferenced := FALSE;
						END_IF;
					667:
						TDCFixedHeadPosition := atoi(ADR(ValueStringB));
					668:
						TDCAHeadPosition := atoi(ADR(ValueStringB));
					669:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							TDCAutoWidthOption := TRUE;
						ELSE
							TDCAutoWidthOption := FALSE;
						END_IF;
					670:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							TDCSetupOutputStyle := TRUE;
						ELSE
							TDCSetupOutputStyle := FALSE;
						END_IF;
					671:
						FittingDischargeType := atoi(ADR(ValueStringB));
					672..689:
						PunchSelect[TagHandle - 672] := atoi(ADR(ValueStringB));
					690:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							HoleSize := TRUE;
						ELSE
							HoleSize := FALSE;
						END_IF;
					691:
						PunchMasterCoilWidth := atof(ADR(ValueStringB));
					692:	
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							PunchMaster := TRUE;
						ELSE
							PunchMaster := FALSE;
						END_IF;
					693:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							TDCTransferTableButton := TRUE;
						ELSE
							TDCTransferTableButton := FALSE;							
						END_IF;
					694:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							InsulmaticButton := TRUE;
						ELSE
							InsulmaticButton := FALSE;							
						END_IF;
					695:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							TDCTTLatch := TRUE;
						ELSE
							TDCTTLatch := FALSE;							
						END_IF;
					696:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							InsulmaticLatch := TRUE;
						ELSE
							InsulmaticLatch := FALSE;							
						END_IF;
					697:
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							OneSpeedExitBelts := TRUE;
						ELSE
							OneSpeedExitBelts := FALSE;							
						END_IF;
					1000: (*Update*)
						IF strcmp(ADR(TrueString), ADR(ValueStringB)) = 0 THEN
							UpdatePC := TRUE;
						ELSE
							UpdatePC := FALSE;							
						END_IF;
				END_CASE;
				
				UNTIL
				HandleIndex >= UpperLimit
			END_REPEAT;
			Server.sStep := 20;
		30:	(* Send Data back to Client *)	
			
			Server.TcpSend_0;  (* Call the Function*)
				
			IF Server.TcpSend_0.status = 0 THEN  (* Data sent *)
				Server.sStep := 20;	(* Go Wait For Another Transmission*)
			ELSIF Server.TcpSend_0.status = ERR_FUB_BUSY THEN  (* TcpSend not finished -> redo *)						
				(* Busy *)
			ELSIF (Server.TcpSend_0.status = tcpERR_NOT_CONNECTED) THEN
				Server.sStep := 40;
			ELSE  (* Goto Error Step *)
				Server.recv_timeout := 0;
				Server.sStep := 100;
			END_IF
			
		40:
			Server.TcpClose_0.enable := 1;
			Server.TcpClose_0.ident := Server.TcpServer_0.identclnt;
			Server.TcpClose_0.how := 0;; // tcpSHUT_RD OR tcpSHUT_WR;
			Server.TcpClose_0;
			
			IF Server.TcpClose_0.status = 0 THEN
				Server.sStep := 50;
			ELSIF Server.TcpClose_0.status = ERR_FUB_BUSY THEN  (* TcpClose not finished -> redo *)	
				(* Busy *)
			ELSE  (* Goto Error Step *)
				Server.recv_timeout := 0;
				Server.sStep := 100;
			END_IF	
		50: 
			Server.TcpClose_0.enable := 1;
			Server.TcpClose_0.ident := Server.TcpOpen_0.ident;
			Server.TcpClose_0.how := 0; //tcpSHUT_RD OR tcpSHUT_WR;
			Server.TcpClose_0;
			
			IF Server.TcpClose_0.status = 0 THEN
				Server.sStep := 0;
			ELSIF Server.TcpClose_0.status = ERR_FUB_BUSY THEN  (* TcpClose not finished -> redo *)	
				(* Busy *)
			ELSE  (* Goto Error Step *)
				Server.recv_timeout := 0;
				Server.sStep := 100;
			END_IF
						
	    
		100:  (* Here some error Handling has to be implemented *)
			Server.recv_timeout := Server.recv_timeout + 1;
			IF Server.recv_timeout > 250 THEN
				Server.sStep := 0; (* Try Again *)
            END_IF
	END_CASE
		
	IF Tracer < 32767 THEN
		Tracer := Tracer + 1;
	ELSE
		Tracer := 0;
	END_IF;

	IF UpdatePC THEN
		UpdatePC := FALSE;
		
        outStrLen := 0;
		outString := BOOL_TO_STRING(CropCut);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); (*Comma*)
		outStrLen := outStrLen + 1;
		
		itoa(RunJob, ADR(outString));
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));		
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;
		
		outString := BOOL_TO_STRING(StartSignal);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;	
	
		outString := DINT_TO_STRING(PartsMade);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;	
		
		outString := REAL_TO_STRING(TotalInches);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;	
		
		outString := DINT_TO_STRING(MetalEncoder);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;	
		
		outString := DINT_TO_STRING(MarkEncoder);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;	
		
		outString := DINT_TO_STRING(PinspotEncoder);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;	
		
		outString := REAL_TO_STRING(RealBrakePosition);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;	
		
		outString := BOOL_TO_STRING(InCycle);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;	
		
		outString := BOOL_TO_STRING(MakeShearTable);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;	
		
		outString := BOOL_TO_STRING(MakeLTTable);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;	

		outString := BOOL_TO_STRING(MakeVTable);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;	
		
		outString := BOOL_TO_STRING(MakeLHoleTable);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;	
		
		outString := BOOL_TO_STRING(MakeCHoleTable);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;	
		
		outString := BOOL_TO_STRING(MakeRHoleTable);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;	
		
		outString := BOOL_TO_STRING(ChangeConnector);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;	
		
		outString := DINT_TO_STRING(MarkStatus);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;	
		
		outString := BOOL_TO_STRING(MarkButtonSignal);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;		
		
		outString := DINT_TO_STRING(BrakeStatus);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;
		
		outString := BOOL_TO_STRING(PCBrakeSetSignal);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;	
		
		outString := BOOL_TO_STRING(MakeButtonTable);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;	
		
		outString := BOOL_TO_STRING(MakeShearBrakeTable);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;
		
		outString := BOOL_TO_STRING(MakeCustomLTTable);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;
		
		outString := BOOL_TO_STRING(MakeCleatTable);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;
		
		outString := BOOL_TO_STRING(BrakeAuto);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;
		
		outString := BOOL_TO_STRING(DuctSelected);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;
		
		outString := BOOL_TO_STRING(TDCRFMotor);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;
		
		outString := BOOL_TO_STRING(TDCPusherEnable);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;
				
		outString := BOOL_TO_STRING(PowerOn);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;
		
		FOR Index := 0 TO 21 BY 1 DO
			outString := BOOL_TO_STRING(ButtonStatus[Index]);
			itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
			memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
			outStrLen := outStrLen + itemStrLen;
			Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
			outStrLen := outStrLen + 1;
  	    END_FOR;
				
		outString := BOOL_TO_STRING(PittsPosition);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;
		
		outString := BOOL_TO_STRING(PassThruPosition);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;
		
		outString := BOOL_TO_STRING(SnapPosition);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;
		
		outString := BOOL_TO_STRING(ElectricDriveFaulted);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;
		
		outString := BOOL_TO_STRING(MarkRFInSignal);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;
		
		outString := BOOL_TO_STRING(MarkRFOutSignal);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;
		
		outString := BOOL_TO_STRING(MakeCustomVTable);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;
		
		outString := BOOL_TO_STRING(ZeroCropCut);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;
		
		outString := DINT_TO_STRING(BeadRollHits);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;
		
		outString := BOOL_TO_STRING(MakeBeadRollTable);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;
		
		outString := BOOL_TO_STRING(ChangeBeadRoll);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;
		
		outString := BOOL_TO_STRING(NotchShuttleValve);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;
		
		outString := BOOL_TO_STRING(TDCHeadReferenced);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;
		
		outString := DINT_TO_STRING(TDCFixedHeadPosition);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;
		
		outString := DINT_TO_STRING(TDCAHeadPosition);
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;
		
		outString := BOOL_TO_STRING(TDCTTLatch);	
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;
		
		outString := BOOL_TO_STRING(InsulmaticLatch);		
		itemStrLen := UINT_TO_UDINT(strlen(ADR(outString)));
		memcpy(ADR(Server.data_buffer[outStrLen]), ADR(outString), itemStrLen);	
		outStrLen := outStrLen + itemStrLen;
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(44); 
		outStrLen := outStrLen + 1;
		
		(*Add end of transmission signal*)
		Server.data_buffer[outStrLen] := DINT_TO_BYTE(13); 
		outStrLen := outStrLen + 1;
		
		(*Setup and make 1st call to Server.TcpSend_0*)
		Server.TcpSend_0.enable := 1;				
		Server.TcpSend_0.ident := Server.TcpServer_0.identclnt;  (* Client Ident from AsTCP.TCP_Server *)	
		Server.TcpSend_0.pData := ADR(Server.data_buffer);  (* Which data to send *)
		Server.TcpSend_0.datalen := outStrLen;  (* Length of data to send *)					
		Server.TcpSend_0.flags := 0;
		Server.TcpSend_0;  (* Call the Function*)
		Server.sStep := 30;		
	END_IF;
	
END_PROGRAM

