
ACTION myAction: 
	(* This was for a test *)
	IF myAction.x AND NOT myAction._x THEN
		FinalScan := TRUE;
	ELSE	
	    IF ShearHits < 120000 THEN	
			ShearHits := ShearHits + 1;
		END_IF;	
	END_IF;
	
END_ACTION

ACTION getNextMove:
	IF getNextMove.x AND NOT getNextMove._x THEN
		FinalScan := TRUE;
    ELSE
	(*Find smallest move*)
		(*The shear will always be used*)		
	NextMoveDone := TRUE;
	SmallResult := ShearMove;
	IF LTNotchMove < SmallResult AND LTNotchMove > InvalidDistREAL THEN
		SmallResult := LTNotchMove;		
	END_IF;
	IF VNotchMove < SmallResult AND VNotchMove > InvalidDistREAL THEN
		SmallResult := VNotchMove;
	END_IF;
	IF LeftHoleMove < SmallResult AND LeftHoleMove > InvalidDistREAL THEN
		SmallResult := LeftHoleMove;
	END_IF;	
	IF CenterHoleMove < SmallResult AND CenterHoleMove > InvalidDistREAL THEN
		SmallResult := CenterHoleMove;
	END_IF;
	IF RightHoleMove < SmallResult AND RightHoleMove > InvalidDistREAL THEN
		SmallResult := RightHoleMove;
	END_IF;
	IF ButtonMove < SmallResult AND ButtonMove > InvalidDistREAL THEN
		SmallResult := ButtonMove;
	END_IF;
	IF ShearBrakeMove < SmallResult AND ShearBrakeMove > InvalidDistREAL THEN
		SmallResult := ShearBrakeMove;
	END_IF;
	IF CustomLTMove < SmallResult AND CustomLTMove > InvalidDistREAL THEN
		SmallResult := CustomLTMove;
	END_IF;
	IF CleatMove < SmallResult AND CleatMove > InvalidDistREAL THEN
		SmallResult := CleatMove;
	END_IF;
	IF CustomVMove < SmallResult AND CustomVMove > InvalidDistREAL THEN
		SmallResult := CustomVMove;
	END_IF;
	IF BeadRollMove < SmallResult AND BeadRollMove > InvalidDistREAL THEN
		SmallResult := BeadRollMove;
	END_IF;
	
	ShearMove := ShearMove - SmallResult;
	IF LTNotchMove > InvalidDistREAL THEN
		LTNotchMove := LTNotchMove - SmallResult;
	END_IF;
	IF VNotchMove > InvalidDistREAL THEN
		VNotchMove := VNotchMove - SmallResult;
	END_IF;
	IF LeftHoleMove > InvalidDistREAL THEN
		LeftHoleMove := LeftHoleMove - SmallResult;
	END_IF;
	IF CenterHoleMove > InvalidDistREAL THEN
		CenterHoleMove := CenterHoleMove - SmallResult;
	END_IF;
	IF RightHoleMove > InvalidDistREAL THEN
		RightHoleMove := RightHoleMove - SmallResult;
	END_IF;
	IF ButtonMove > InvalidDistREAL THEN
		ButtonMove := ButtonMove - SmallResult;
	END_IF;
	IF ShearBrakeMove > InvalidDistREAL THEN
		ShearBrakeMove := ShearBrakeMove - SmallResult;
	END_IF;
	IF CustomLTMove > InvalidDistREAL THEN
		CustomLTMove := CustomLTMove - SmallResult;
	END_IF;
	IF CleatMove > InvalidDistREAL THEN
		CleatMove := CleatMove - SmallResult;
	END_IF;
	IF CustomVMove > InvalidDistREAL THEN
		CustomVMove := CustomVMove - SmallResult;
	END_IF;
	IF BeadRollMove > InvalidDistREAL THEN
		BeadRollMove := BeadRollMove - SmallResult;
	END_IF;
  END_IF;
END_ACTION

ACTION UpdateTables:
	IF UpdateTables.x AND NOT UpdateTables._x THEN
		FinalScan := TRUE;
	ELSE
		UpdateTablesDone := TRUE;
		IF ShearUsedUp AND ShearHits > 0 THEN
			ShearFires := TRUE;
			ShearHits := ShearHits - 1;
			(*Do this before the index changes *)
			IF (ShearIndex = 0 AND ShearFFlag = 1) OR
				(ShearIndex = 1 AND ShearTable[2] <= InvalidDistREAL) OR
				(ShearIndex = 2) THEN
				PartCutOff := TRUE;
			END_IF;
				ShearIndex := ShearIndex + 1;
			IF ShearTable[ShearIndex] <= InvalidDistREAL THEN
				ShearIndex := 1;
			END_IF;
			IF ShearHits <= 0 THEN
				MakeShearTable := TRUE;
				ShearIndex := 0;
			END_IF;
		END_IF;
		IF LTUsedUp THEN
			IF LTNotchHits > 0 THEN
				LTFires := TRUE;
				LTNotchHits := LTNotchHits - 1;
			END_IF;
			LTNotchIndex := LTNotchIndex + 1;	
			IF LTNotchTable[LTNotchIndex] <= InvalidDistREAL THEN
				LTNotchIndex := 1;
			END_IF;
			SavedConnector := LatestConnector;
			IF LTNotchHits <= 0 THEN
				MakeLTTable := TRUE;			
				LTNotchIndex := 0;			
			END_IF;			
		END_IF;
		IF VUsedUp THEN
			IF VNotchHits > 0 THEN
				VFires := TRUE;
				VNotchHits := VNotchHits - 1;
			END_IF;
			VNotchIndex := VNotchIndex + 1;	
			IF VNotchTable[VNotchIndex] <= InvalidDistREAL THEN
				VNotchIndex := 1;
			END_IF;
			IF VNotchHits <= 0 THEN
				MakeVTable := TRUE;			
				VNotchIndex := 0;			
			END_IF;	
		END_IF;
		IF LeftHoleUsedUp THEN
			IF LeftHoleHits > 0 THEN
				LeftHoleFires := TRUE;
				LeftHoleHits := LeftHoleHits - 1;
			END_IF;
			LeftHoleIndex := LeftHoleIndex + 1;	
			IF LeftHoleTable[LeftHoleIndex] <= InvalidDistREAL THEN
				LeftHoleIndex := 1;
			END_IF;
			IF LeftHoleHits <= 0 THEN
				MakeLHoleTable := TRUE;			
				LeftHoleIndex := 0;			
			END_IF;	
		END_IF;
		IF CenterHoleUsedUp THEN
			IF CenterHoleHits > 0 THEN
				CenterHoleFires := TRUE;
				CenterHoleHits := CenterHoleHits - 1;
			END_IF;
			CenterHoleIndex := CenterHoleIndex + 1;	
			IF CenterHoleTable[CenterHoleIndex] <= InvalidDistREAL THEN
				CenterHoleIndex := 1;
			END_IF;
			IF CenterHoleHits <= 0 THEN
				MakeCHoleTable := TRUE;			
				CenterHoleIndex := 0;			
			END_IF;	
		END_IF;
		IF RightHoleUsedUp THEN
			IF RightHoleHits > 0 THEN
				RightHoleFires := TRUE;
				RightHoleHits := RightHoleHits - 1;
			END_IF;
			RightHoleIndex := RightHoleIndex + 1;	
			IF RightHoleTable[RightHoleIndex] <= InvalidDistREAL THEN
				RightHoleIndex := 1;
			END_IF;
			IF RightHoleHits <= 0 THEN
				MakeRHoleTable := TRUE;			
				RightHoleIndex := 0;			
			END_IF;	
		END_IF
		IF ButtonUsedUp THEN
			IF ButtonHits > 0 THEN
				ButtonFires := TRUE;
				ButtonHits := ButtonHits - 1;
			END_IF;
			ButtonIndex := ButtonIndex + 1;	
			IF ButtonTable[ButtonIndex] <= InvalidDistREAL THEN
				ButtonIndex := 1;
			END_IF;
			IF ButtonHits <= 0 THEN
				MakeButtonTable := TRUE;			
				ButtonIndex := 0;			
			END_IF;	
		END_IF;
		IF ShearBrakeUsedUp THEN
			IF ShearBrakeHits > 0 THEN
				ShearBrakeFires := TRUE;
				ShearBrakeHits := ShearBrakeHits - 1;
			END_IF;
			ShearBrakeIndex := ShearBrakeIndex + 1;
			IF ShearBrakeTable[ShearBrakeIndex] <= InvalidDistREAL THEN
				ShearBrakeIndex := 1;
			END_IF;				
			IF ShearBrakeHits <= 0 THEN
				MakeShearBrakeTable := TRUE;			
				ShearBrakeIndex := 0;			
			END_IF;	
		END_IF;
		IF CustomLTUsedUp THEN
			IF CustomLTHits > 0 THEN
				CustomLTFires := TRUE;
				CustomLTHits := CustomLTHits - 1;
			END_IF;
			CustomLTIndex := CustomLTIndex + 1;	
			IF CustomLTTable[CustomLTIndex] <= InvalidDistREAL THEN
				CustomLTIndex := 1;
			END_IF;
			IF CustomLTHits <= 0 THEN
				MakeCustomLTTable := TRUE;			
				CustomLTIndex := 0;			
			END_IF;	
		END_IF;
		IF CleatUsedUp THEN
			IF CleatHits > 0 THEN
				CleatFires := TRUE;
				CleatHits := CleatHits - 1;
			END_IF;
			CleatIndex := CleatIndex + 1;	
			IF CleatTable[CleatIndex] <= InvalidDistREAL THEN
				CleatIndex := 1;
			END_IF;
			IF CleatHits <= 0 THEN
				MakeCleatTable := TRUE;			
				CleatIndex := 0;			
			END_IF;	
		END_IF;
		IF CustomVUsedUp THEN
			IF CustomVHits > 0 THEN
				CustomVFires := TRUE;
				CustomVHits := CustomVHits - 1;
			END_IF;
			CustomVIndex := CustomVIndex + 1;	
			IF CustomVTable[CustomVIndex] <= InvalidDistREAL THEN
				CustomVIndex := 1;
			END_IF;
			IF CustomVHits <= 0 THEN
				MakeCustomVTable := TRUE;			
				CustomVIndex := 0;			
			END_IF;	
		END_IF;
		IF BeadRollUsedUp THEN
			IF BeadRollHits > 0 THEN
				BeadRollFires := TRUE;
				BeadRollHits := BeadRollHits - 1;
			END_IF;
			BeadRollIndex := BeadRollIndex + 1;	
			IF BeadRollTable[BeadRollIndex] <= InvalidDistREAL THEN
				BeadRollIndex := 1;
			END_IF;
			IF BeadRollHits <= 0 THEN
				MakeBeadRollTable := TRUE;			
				BeadRollIndex := 0;			
			END_IF;	
	    END_IF;
	END_IF;
END_ACTION

