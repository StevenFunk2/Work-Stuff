
PROGRAM _CYCLIC
	difference := MetalTarget - ActlMetalEncoder;
	AbsoluteDifference := ABS(difference);
	CASE MotionStatus1 OF
		(*Hold Position*)
		0: 
			IF NOT InPosition1 THEN
				IF AbsoluteDifference <= MetalTolerance THEN
					TargetCount1 := TargetCount1 + UpdateRate1;
					IF TargetCount1 >= SettleTime1 THEN
						InPosition1 := TRUE;
					END_IF;
				END_IF;		
			END_IF;
		
			(*Ratio1 := DINT_TO_INT(difference + (difference / 1));*)
			Ratio1 := DINT_TO_INT(difference * 15);
			IF Counter1 > 0 THEN
				Counter1 := Counter1 - UpdateRate1;
			ELSE
				Counter1 := 500;
				IF Hold1 <> Ratio1 THEN
					Hold1 := Ratio1;
				ELSE
					DACBalance1 := ActualDAC1;
				END_IF;
			END_IF;
		  
	    	TargetDAC1 := Ratio1 + DACBalance1;
			ActualDAC1 := TargetDAC1;
		(*	IF TargetDAC1 >= ActualDAC1 THEN
				IF TargetDAC1 - ActualDAC1 > (10 * UpdateRate1) THEN
					ActualDAC1 := ActualDAC1 + (10 * UpdateRate1);
				ELSE
					ActualDAC1 := TargetDAC1;
				END_IF;	
			ELSE
				IF ActualDAC1 - TargetDAC1 > (10 * UpdateRate1) THEN
					ActualDAC1 := ActualDAC1 - (10 * UpdateRate1);
				ELSE
					ActualDAC1 := TargetDAC1;
				END_IF;
			END_IF;*)
		
			IF ActualDAC1 > TopDAC1 THEN
				ActualDAC1 := TopDAC1;
			END_IF;
			IF ActualDAC1 < -TopDAC1 THEN
				ActualDAC1 := -TopDAC1;
			END_IF
		
		(*Initialize Move*)
		1:
			CoilAccumulator := MetalTarget; (*Update Accumulator to last target*)
			(*IncrementalRealTarget is the amount required to move determined elsewhere*)
			IncrementalDINTTarget := REAL_TO_DINT(IncrementalRealTarget * UnitsPerInch1 * MetalScaler);
			MetalTarget := MetalTarget + IncrementalDINTTarget;	
			DACAdd1 := INT_TO_REAL(MaxDAC) / AccelRampReal;
			TopDAC1 := DINT_TO_INT((INT_TO_DINT(MaxDAC) * RunSpeed1) / 100);
			IF RunSpeed1 = 100 THEN
				TopDAC1 := TopDAC1 - REAL_TO_INT(DACAdd1);
			END_IF;	
			ActualSpeed1 := ((MaxSpeed1 / 5.0) * DINT_TO_REAL(RunSpeed1)) / 100.0; (*Real Inches Per Second*)
			AverageSpeed1 := ActualSpeed1 / 2.0;
			DecelTime1 := (DecelRampReal / 1000.0) * (DINT_TO_REAL(RunSpeed1) / 100);
			DecelDistance1 := REAL_TO_DINT(((AverageSpeed1 * DecelTime1 ) * MetalScaler) * UnitsPerInch1);
			MaxCountsPerSecond := (MaxSpeed1 / 5.0) * UnitsPerInch1;
			SRM1 := MaxDACSquared / ((MaxCountsPerSecond * (DecelRampReal / 1000.0)) / 2.0);
			(*SRM1 := MaxDACSquared / ((MaxCountsPerSecond * (DecelRampReal / 1000.0)));*)
			(*IF DecelDistance1 > IncrementalDINTTarget THEN 2-26-19 *)
			IF DecelDistance1 > (IncrementalDINTTarget / 2) THEN
				DecelDistance1 := IncrementalDINTTarget / 2;
				TopDAC1 := REAL_TO_INT(SQRT((DINT_TO_REAL(DecelDistance1) / MetalScaler) * SRM1));
				IF TopDAC1 < 3276 THEN
					TopDAC1 := 3276;
				END_IF;
			END_IF;	
			InPosition1 := FALSE;
			FirstTarget1 := FALSE;
			StopWatch1 := 0.0;			
			MotionStatus1 := 2;
		(*Ramp Up To Speed*)
		2:
			IF DecelDistance1 < difference THEN				
				IF ActualDAC1 < TopDAC1 THEN (*Accelerate*)
					StopWatch1 := StopWatch1 + INT_TO_REAL(UpdateRate1);
					ActualDAC1 := REAL_TO_INT(StopWatch1 * DACAdd1);
				ELSE  (*Constant Speed*)
					ActualDAC1 := TopDAC1;
				END_IF;	
			ELSE (*Switch To Decel MotionState*)
				DecelCounter := 25;
				LastPosition1 := ActlMetalEncoder;
				TargetCount1 := 0;
				FirstTarget1 := FALSE;
				MotionStatus1 := 3;
			END_IF;
		3:
			(*Stall Detection*)
			DecelCounter := DecelCounter - UpdateRate1;
			IF DecelCounter <= 0 THEN
				DecelCounter := 200;
				IF LastPosition1 = ActlMetalEncoder THEN
					DACBalance1 := ActualDAC1;
					Counter1 := 0;
					TopDAC1 := MaxDAC / 4;
					MotionStatus1 := 0;
				ELSE
					LastPosition1 := ActlMetalEncoder;
				END_IF;
			END_IF;
		
			RealDAC1 := REAL_TO_INT(SQRT(DINT_TO_REAL(AbsoluteDifference) * SRM1));
			IF RealDAC1 > INT_TO_REAL(MaxDAC) THEN
				RealDAC1 := INT_TO_REAL(MaxDAC);
			END_IF;	
			ActualDAC1 := REAL_TO_INT(RealDAC1);
			
			IF difference < 0 THEN
				ActualDAC1 := -ActualDAC1;
			END_IF;			
			
			IF FirstTarget1 THEN
				ActualDAC1 := ActualDAC1 / 8;
			END_IF;
			
			IF AbsoluteDifference < MetalTolerance THEN
				FirstTarget1 := TRUE;
				TargetCount1 := TargetCount1 + UpdateRate1;
				IF TargetCount1 >= SettleTime1 THEN
					Counter1 := 0;
					InPosition1 := TRUE;
					MotionStatus1 := 0;
					TopDAC1 := MaxDAC / 4;
				END_IF;
			ELSE
				TargetCount1 := 0;
			END_IF;
		4: (*Setup Forward Jog*)
			DACAdd1 := INT_TO_REAL(MaxDAC) / AccelRampReal; 
			TopDAC1 := DINT_TO_INT((INT_TO_DINT(MaxDAC) * PercentJogSpeed1) / 100);
			TopDAC1 := TopDAC1 - REAL_TO_INT(DACAdd1);
			StopFlag1 := FALSE;
			MotionStatus1 := 7;
		5: (*Setup Reverse Jog*)
			DACAdd1 := INT_TO_REAL(MaxDAC) / AccelRampReal; 
			TopDAC1 := DINT_TO_INT((INT_TO_DINT(MaxDAC) * PercentJogSpeed1) / 100);
			TopDAC1 := TopDAC1 - REAL_TO_INT(DACAdd1);
			StopFlag1 := FALSE;
			MotionStatus1 := 8;
		7: (*Forward Jog*)
			IF StopFlag1 THEN
				IF ActualDAC1 > REAL_TO_INT(DACAdd1) THEN (*Decelerate*)
					ActualDAC1 := ActualDAC1 - REAL_TO_INT(DACAdd1);
				ELSE (*Hold Position*)
					ActualDAC1 := 0;
					MetalTarget := ActlMetalEncoder;
					InPosition1 := TRUE;					
					MotionStatus1 := -1;
				END_IF;
			ELSE
				InPosition1 := FALSE;
				IF ActualDAC1 < TopDAC1 THEN (*Accelerate*)
					ActualDAC1 := ActualDAC1 + REAL_TO_INT(DACAdd1);
				ELSE
					ActualDAC1 := TopDAC1; (*Maintain Constant Speed*)
				END_IF;
			END_IF;				  
		8: (*Reverse Jog*)
			IF StopFlag1 THEN
				IF ActualDAC1 < REAL_TO_INT(-DACAdd1) THEN (*Decelerate*)
					ActualDAC1 := ActualDAC1 + REAL_TO_INT(DACAdd1);
				ELSE (*Hold Position*)
					ActualDAC1 := 0;
					MetalTarget := ActlMetalEncoder;
					InPosition1 := TRUE;
					MotionStatus1 := -1;
				END_IF;
			ELSE
				(*Don't Do This To Prevent Uncoiler From Running Forward*)
				(*InPosition1 := FALSE;*)
				IF ActualDAC1 > -TopDAC1 THEN (*Accelerate*)
					ActualDAC1 := ActualDAC1 - REAL_TO_INT(DACAdd1);
				ELSE
					ActualDAC1 := -TopDAC1; (*Maintain Constant Speed*)
				END_IF;
			END_IF;	
		9:
			IF ActualDAC1 > REAL_TO_INT(DACAdd1) THEN (*Decelerate*)
				ActualDAC1 := ActualDAC1 - REAL_TO_INT(DACAdd1);
			ELSE (* Hold Position *)
				MetalTarget := ActlMetalEncoder;
				IncrementalRealTarget := DINT_TO_REAL(difference) / UnitsPerInch1 / MetalScaler;
				MotionStatus1 := 0;
			END_IF;
		ELSE (*Not Moving Or Holding*)
		  ActualDAC1 := 0;
		  MetalTarget := ActlMetalEncoder;
		  InPosition1 := TRUE;
	END_CASE;	
	
	IF ActualDAC1 > MaxDAC THEN
		ActualDAC1 := MaxDAC;
	END_IF;	
	IF ActualDAC1 < -MaxDAC THEN
		ActualDAC1 := -MaxDAC;
	END_IF;
	
END_PROGRAM
