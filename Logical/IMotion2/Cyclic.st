PROGRAM _CYCLIC
	(* Electric Servo Brake Motion Control*)
	difference := IMotion2Target - (BrakeEncoder + IBrakeReference);
	AbsoluteDifference := ABS(difference);
	CASE MotionStatus2 OF
		(*Hold Position*)
		0: 
			IF NOT InPosition2 THEN
				IF AbsoluteDifference <= BrakeTolerance THEN
					TargetCount2 := TargetCount2 + UpdateRate2;
					IF TargetCount2 >= SettleTime2 THEN
						InPosition2 := TRUE;
						MotionStatus2 := -1; (*Disable Drive And Put On Brake*)
					END_IF;
				END_IF;		
			END_IF;
		
			IF (difference * 6) < MaxDAC THEN
				Ratio2 := DINT_TO_INT(difference * 6); (*Was 15 *)
			ELSE
				Ratio2 := 15000;
		    END_IF;		
			IF Counter2 > 0 THEN
				Counter2 := Counter2 - UpdateRate2;
			ELSE
				Counter2 := 500;
				IF Hold2 <> Ratio2 THEN
					Hold2 := Ratio2;
				ELSE
					DACBalance2 := ActualDAC2;
				END_IF;
			END_IF;
		  
			TargetDAC2 := Ratio2 + DACBalance2;
			ActualDAC2 := TargetDAC2;
		
			IF ActualDAC2 > TopDAC2 THEN
				ActualDAC2 := TopDAC2;
			END_IF;
			IF ActualDAC2 < -TopDAC2 THEN
				ActualDAC2 := -TopDAC2;
			END_IF
		
		(*Initialize Move*)
		1:		
			Axis2Scaler := (BrakeDesired / BrakeActual);
			IMotion2Target := REAL_TO_DINT(BrakeCarriageTarget * BrakeResolution * Axis2Scaler);
			IBrakeReference := REAL_TO_DINT(BrakeReference * BrakeResolution * Axis2Scaler);
			DACAdd2 := INT_TO_REAL(MaxDAC) / AccelRampReal2;
			ActualSpeed2 := (TopAxis2Speed * DINT_TO_REAL(BackGaugeRunPercent)) / 100.0; (*Real Inches Per Second*)
			(*ActualRunPercent2 := REAL_TO_DINT(DINT_TO_REAL(BackGaugeRunPercent) / 100.0);*)
			ActualRunPercent2 := DINT_TO_REAL(BackGaugeRunPercent) / 100.0;
			TopDAC2 := REAL_TO_INT(INT_TO_REAL(MaxDAC) * ActualRunPercent2);
			IF ActualRunPercent2 = 1.0 THEN
				TopDAC2 := TopDAC2 - REAL_TO_INT(DACAdd2);
			END_IF;			
			AverageSpeed2 := ActualSpeed2 / 2.0;
			DecelTime2 := (AccelRampReal2 / 1000.0) * ActualRunPercent2;
			(*DecelDistance2 := REAL_TO_DINT(((AverageSpeed2 * DecelTime2 ) * Axis2Scaler) * BrakeResolution);*)
			DecelDistance2 := REAL_TO_DINT((AverageSpeed2 * DecelTime2 ) * Axis2Scaler);
			SRM2 := MaxDACSquared / ((TopAxis2Speed * (AccelRampReal2 / 1000.0)) / 2.0);
			MoveLength2 := IMotion2Target - (BrakeEncoder + IBrakeReference);
			AMoveLength2 := ABS(MoveLength2);
			IF DecelDistance2 > (AMoveLength2 / 2) THEN
				DecelDistance2 := AMoveLength2 / 2;
				TopDAC2 := REAL_TO_INT(SQRT((DINT_TO_REAL(DecelDistance2) / Axis2Scaler) * SRM2));
				IF TopDAC2 < 3276 THEN
					TopDAC2 := 3276;
				END_IF;
			END_IF;	
			InPosition2 := FALSE;
			FirstTarget2 := FALSE;
			StopWatch2 := 0.0;
			IF AMoveLength2 > REAL_TO_DINT(BrakeResolution / 16.0) THEN			
				IF MoveLength2 >= 0 THEN
				  MotionStatus2 := 2;
			    ELSE
				  MotionStatus2 := 10;
				END_IF;					
			ELSE
				MotionStatus2 := 12;
		    END_IF;
		(*Ramp Up To Speed*)
		2:
			IF DecelDistance2 < difference THEN				
				IF ActualDAC2 < TopDAC2 THEN (*Accelerate*)
					StopWatch2 := StopWatch2 + INT_TO_REAL(UpdateRate2);
					ActualDAC2 := REAL_TO_INT(StopWatch2 * DACAdd2);
				ELSE  (*Constant Speed*)
					ActualDAC2 := TopDAC2;
				END_IF;	
			ELSE (*Switch To Decel MotionState*)
				DecelCounter2 := 200;
				LastPosition2 := BrakeEncoder;
				TargetCount2 := 0;
				FirstTarget2 := FALSE	;
				MotionStatus2 := 3;
			END_IF;
		3:
			(*Stall Detection*)
			DecelCounter2 := DecelCounter2 - UpdateRate2;
			IF DecelCounter2 <= 0 THEN
				DecelCounter2 := 200;
				IF LastPosition2 = BrakeEncoder THEN
					DACBalance2 := ActualDAC2;
					Counter2 := 500;
					TopDAC2 := MaxDAC / 4;
					MotionStatus2 := 0;
				ELSE
					LastPosition2 := BrakeEncoder;
				END_IF;
			END_IF;
		
			RealDAC2 := REAL_TO_INT(SQRT(DINT_TO_REAL(AbsoluteDifference) * SRM2));
			IF RealDAC2 > INT_TO_REAL(MaxDAC) THEN
				RealDAC2 := INT_TO_REAL(MaxDAC);
			END_IF;	
			ActualDAC2 := REAL_TO_INT(RealDAC2);		
			
			IF FirstTarget2 THEN
				(*ActualDAC2 := ActualDAC2 / 8;*)
			END_IF;
			
			IF difference < 0 THEN
				ActualDAC2 := -ActualDAC2;
			END_IF;	
			
			IF AbsoluteDifference < BrakeTolerance THEN
				FirstTarget2 := TRUE;
				TargetCount2 := TargetCount2 + UpdateRate2;
				IF TargetCount2 >= SettleTime2 THEN
					Counter2 := 500;
					InPosition2 := TRUE;
					(*MotionStatus2 := 0;*)
					MotionStatus2 := -1; (*Disable Drive And Put On Brake*)
					TopDAC2 := MaxDAC / 4;
				END_IF;
			ELSE
				TargetCount2 := 0;
			END_IF;
		4: (*Setup Forward Jog*)
			DACAdd2 := INT_TO_REAL(MaxDAC) / AccelRampReal2; 
			TopDAC2 := DINT_TO_INT((INT_TO_DINT(MaxDAC) * BackGaugeJogPercent) / 100);
			TopDAC2 := TopDAC2 - REAL_TO_INT(DACAdd2);
			IBrakeReference := REAL_TO_DINT(BrakeReference * BrakeResolution * Axis2Scaler);
			StopFlag2 := FALSE;
			MotionStatus2 := 7;
		5: (*Setup Reverse Jog*)
			DACAdd2 := INT_TO_REAL(MaxDAC) / AccelRampReal2; 
			TopDAC2 := DINT_TO_INT((INT_TO_DINT(MaxDAC) * BackGaugeJogPercent) / 100);
			TopDAC2 := TopDAC2 - REAL_TO_INT(DACAdd2);
			IBrakeReference := REAL_TO_DINT(BrakeReference * BrakeResolution * Axis2Scaler);
			StopFlag2 := FALSE;
			MotionStatus2 := 8;
		7: (*Forward Jog*)
			IF StopFlag2 THEN
				IF ActualDAC2 > REAL_TO_INT(DACAdd2) THEN (*Decelerate*)
					ActualDAC2 := ActualDAC2 - REAL_TO_INT(DACAdd2);
				ELSE (*Hold Position*)
					ActualDAC2 := 0;
					IMotion2Target := BrakeEncoder + IBrakeReference;
					InPosition2 := TRUE;					
					MotionStatus2 := -1;
				END_IF;
			ELSE
				InPosition2 := FALSE;
				IF ActualDAC2 < TopDAC2 THEN (*Accelerate*)
					ActualDAC2 := ActualDAC2 + REAL_TO_INT(DACAdd2);
				ELSE
					ActualDAC2 := TopDAC2; (*Maintain Constant Speed*)
				END_IF;
			END_IF;				  
		8: (*Reverse Jog*)
			IF BackGaugeHomeLS THEN
				StopFlag2 := TRUE;
			END_IF;	
			IF StopFlag2 THEN
				IF ActualDAC2 < REAL_TO_INT(-DACAdd2) THEN (*Decelerate*)
					ActualDAC2 := ActualDAC2 + REAL_TO_INT(DACAdd2);
				ELSE (*Hold Position*)
					ActualDAC2 := 0;
					IMotion2Target := BrakeEncoder + IBrakeReference;
					InPosition2 := TRUE;
					MotionStatus2 := -1;
				END_IF;
			ELSE
				InPosition1 := FALSE;
				IF ActualDAC2 > -TopDAC2 THEN (*Accelerate*)
					ActualDAC2 := ActualDAC2 - REAL_TO_INT(DACAdd2);
				ELSE
					ActualDAC2 := -TopDAC2; (*Maintain Constant Speed*)
				END_IF;
			END_IF;	
		9:
			IF ActualDAC2 > REAL_TO_INT(DACAdd1) THEN (*Decelerate*)
				ActualDAC2 := ActualDAC2 - REAL_TO_INT(DACAdd2);
			ELSE (* Hold Position *)
				MetalTarget := ActlMetalEncoder;
				IncrementalRealTarget := DINT_TO_REAL(difference) / UnitsPerInch1 / MetalScaler;
				MotionStatus1 := 0;
			END_IF;
		10:
			IF DecelDistance2 < AbsoluteDifference THEN				
				IF ActualDAC2 > -TopDAC2 THEN (*Accelerate*)
					StopWatch2 := StopWatch2 + INT_TO_REAL(UpdateRate2);
					ActualDAC2 := -(REAL_TO_INT(StopWatch2 * DACAdd2));
				ELSE  (*Constant Speed*)
					ActualDAC2 := -TopDAC2;
				END_IF;	
			ELSE (*Switch To Decel MotionState*)
				DecelCounter2 := 200;
				LastPosition2 := BrakeEncoder;
				TargetCount2 := 0;
				FirstTarget2 := FALSE	;
				MotionStatus2 := 3;
			END_IF;	
		12:		
			StopWatch2 := StopWatch2 + INT_TO_REAL(UpdateRate2);
			IF StopWatch2 > 100 THEN
				InPosition2 := TRUE;
				MotionStatus2 := -1;
			END_IF;
		ELSE (*Not Moving Or Holding*)
			ActualDAC2 := 0;
			IMotion2Target := BrakeEncoder + IBrakeReference;
			InPosition2 := TRUE;
	END_CASE;	
	
	IF ActualDAC2 > MaxDAC THEN
		ActualDAC2 := MaxDAC;
	END_IF;	
	IF ActualDAC2 < -MaxDAC THEN
		ActualDAC2 := -MaxDAC;
	END_IF;
	
	IF MotionStatus2 >= 0 AND MotionStatus2 <> 12 THEN
		BrakeDriveEnable := TRUE;
		BackGaugeAirBrake := TRUE;
	ELSE
		BrakeDriveEnable := FALSE;
		BackGaugeAirBrake := FALSE;
	END_IF;
	
END_PROGRAM

