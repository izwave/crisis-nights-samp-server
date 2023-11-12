enum E_CIR_CAM_MOVE
{
	Float: CIR_POS[4],
	Float: CIR_HEIGHT,
	Float: CIR_X[4],
	Float: CIR_Y[4],
	bool: CIR_PLAYER,
	bool: CIR_DIR,
	CIR_TIMER
};

static CirCamMovePlayer[MAX_PLAYERS][E_CIR_CAM_MOVE];

index_SetPlayerCirCamMove(playerid, bool:ciroverview, Float:cirx, Float:ciry, Float:cirz, Float:cira, cirtime,
	Float:cirheight=0.0, Float:cirrange=10.0, bool:cirtarget, bool:cirreverse, bool:cirrepeating, bool:ciclockwise)
{
	if(CirCamMovePlayer[playerid][CIR_PLAYER])
	{
		return 0;
	}

	CirCamMovePlayer[playerid][CIR_POS][0] = cirx;
	CirCamMovePlayer[playerid][CIR_POS][1] = ciry; 
	CirCamMovePlayer[playerid][CIR_POS][2] = cirz; 
	CirCamMovePlayer[playerid][CIR_HEIGHT] = cirz + cirheight;

	new cir_left, cir_right, cir_front, cir_back;

	if(!ciroverview)
	{
		cir_front = 1;
		cir_back = 3;
		if(!ciclockwise) // Esquerda -> Direita
		{
			cir_right = 0;
			cir_left = 2;
		}
		else // Direita -> Esquerda
		{
			cir_left = 0;
			cir_right = 2;
		}
	}
	else
	{
		cir_front = 0;
		cir_back = 2;
		if(!ciclockwise) // Esquerda -> Direita
		{
			cir_left = 1;
			cir_right = 3;
		}
		else // Direita -> Esquerda
		{
			cir_right = 1;
			cir_left = 3;
		}
	}
	//front
	CirCamMovePlayer[playerid][CIR_X][cir_front] = floatsin(cira, degrees) * cirrange + floatcos(cira, degrees) * 0.0 + cirx;
	CirCamMovePlayer[playerid][CIR_Y][cir_front] = floatcos(cira, degrees) * cirrange - floatsin(cira, degrees) * 0.0 + ciry;
	//right
	CirCamMovePlayer[playerid][CIR_X][cir_right] = floatsin(cira, degrees) * 0.0 + floatcos(cira, degrees) * cirrange + cirx;
	CirCamMovePlayer[playerid][CIR_Y][cir_right] = floatcos(cira, degrees) * 0.0 - floatsin(cira, degrees) * cirrange + ciry;
	//Back
	CirCamMovePlayer[playerid][CIR_X][cir_back] = floatsin(cira, degrees) * (-1 * cirrange) + floatcos(cira, degrees) * 0.0 + cirx;
	CirCamMovePlayer[playerid][CIR_Y][cir_back] = floatcos(cira, degrees) * (-1 * cirrange) - floatsin(cira, degrees) * 0.0 + ciry;
	//left
	CirCamMovePlayer[playerid][CIR_X][cir_left] = floatsin(cira, degrees) * 0.0 + floatcos(cira, degrees) * (-1 * cirrange) + cirx;
	CirCamMovePlayer[playerid][CIR_Y][cir_left] = floatcos(cira, degrees) * 0.0 - floatsin(cira, degrees) * (-1 * cirrange) + ciry;

	
	if(ciroverview)
	{
		cirtime = cirtime / 4;
	}
	else
	{
		cirtime = cirtime / 2;
	}
	CirCamMovePlayer[playerid][CIR_PLAYER] = true;
	OnPlayerCirMotion(playerid, cirtime, 0, (ciroverview?4:3), cirtarget, cirreverse, cirrepeating);
	return 1;
}

index_StopPlayerCirCamMove(playerid, bool:leaveplayercam=false)
{
	if(CirCamMovePlayer[playerid][CIR_TIMER] == -1 || !CirCamMovePlayer[playerid][CIR_PLAYER]) return 0;
	
	KillTimer(CirCamMovePlayer[playerid][CIR_TIMER]);
	CirCamMovePlayer[playerid][CIR_TIMER] = -1;
	new cirdelvar[E_CIR_CAM_MOVE];
	CirCamMovePlayer[playerid] = cirdelvar;
	
	if(leaveplayercam)
	{
		SetCameraBehindPlayer(playerid);
	}
	return 1;
}

forward OnPlayerCirMotion(playerid, cirtime, cirsteps, cirmax, bool:cirtarget, bool:circirreverse, bool:circirrepeating);
public OnPlayerCirMotion(playerid, cirtime, cirsteps, cirmax, bool:cirtarget, bool:circirreverse, bool:circirrepeating)
{
	if(!IsPlayerConnected(playerid) || !CirCamMovePlayer[playerid][CIR_PLAYER])
	{	
		index_StopPlayerCirCamMove(playerid);
		SendClientMessage(playerid, 0x493FF1F8, "Ta off em.");
		return 1;
	}

	new nextsteptmp = cirsteps + (CirCamMovePlayer[playerid][CIR_DIR]?(-1):(1));

	if(nextsteptmp == cirmax || nextsteptmp == -1)
	{
		if(circirreverse)
		{
			if(circirrepeating)
			{
				if(CirCamMovePlayer[playerid][CIR_DIR]) // -1
				{
					cirsteps = 0;
					nextsteptmp = 1;
					CirCamMovePlayer[playerid][CIR_DIR] = false;	
				}
				else
				{
					cirsteps = cirmax - 1;
					nextsteptmp = cirmax - 2;
					CirCamMovePlayer[playerid][CIR_DIR] = true;
				}
			}
			else
			{
				if(CirCamMovePlayer[playerid][CIR_DIR])
				{
					index_StopPlayerCirCamMove(playerid);
					return 0;
				}
				else
				{
					cirsteps = cirmax - 1;
					nextsteptmp = cirmax - 2;
					CirCamMovePlayer[playerid][CIR_DIR] = true;
				}
			}
		}
		else
		{
			if(circirrepeating)
			{
				nextsteptmp = 1;
				cirsteps = 0;
			}
			else
			{
				nextsteptmp = 0;
				cirsteps = cirmax-1;
				CirCamMovePlayer[playerid][CIR_PLAYER] = false;
				SendClientMessage(playerid, 0x497431F8, "movimento final");
				if(cirmax != 4)
				{
					return CallRemoteFunction("OnPlayerCirMotion", "i", playerid);
				}
			}
		}
	}
	if(cirtarget) // Camera moves
	{
		InterpolateCameraPos(playerid, 
			CirCamMovePlayer[playerid][CIR_X][cirsteps], CirCamMovePlayer[playerid][CIR_Y][cirsteps], CirCamMovePlayer[playerid][CIR_HEIGHT],
			CirCamMovePlayer[playerid][CIR_X][nextsteptmp], CirCamMovePlayer[playerid][CIR_Y][nextsteptmp], CirCamMovePlayer[playerid][CIR_HEIGHT], cirtime, CAMERA_MOVE);

		InterpolateCameraLookAt(playerid, 
			CirCamMovePlayer[playerid][CIR_POS][0], CirCamMovePlayer[playerid][CIR_POS][1], CirCamMovePlayer[playerid][CIR_POS][2], 
			CirCamMovePlayer[playerid][CIR_POS][0], CirCamMovePlayer[playerid][CIR_POS][1], CirCamMovePlayer[playerid][CIR_POS][2], cirtime, CAMERA_MOVE);
	}
	else // Vision moves
	{
		InterpolateCameraPos(playerid, 
			CirCamMovePlayer[playerid][CIR_POS][0], CirCamMovePlayer[playerid][CIR_POS][1], CirCamMovePlayer[playerid][CIR_POS][2], 
			CirCamMovePlayer[playerid][CIR_POS][0], CirCamMovePlayer[playerid][CIR_POS][1], CirCamMovePlayer[playerid][CIR_POS][2], cirtime, CAMERA_MOVE);

		InterpolateCameraLookAt(playerid, 
			CirCamMovePlayer[playerid][CIR_X][cirsteps], CirCamMovePlayer[playerid][CIR_Y][cirsteps], CirCamMovePlayer[playerid][CIR_HEIGHT],
			CirCamMovePlayer[playerid][CIR_X][nextsteptmp], CirCamMovePlayer[playerid][CIR_Y][nextsteptmp], CirCamMovePlayer[playerid][CIR_HEIGHT], cirtime, CAMERA_MOVE);		
	}
	CirCamMovePlayer[playerid][CIR_TIMER] = SetTimerEx("OnPlayerCirMotion", cirtime, false, "iiiibbbb", playerid, cirtime, nextsteptmp, cirmax, cirtarget, circirreverse, circirrepeating);
	return 1;
}

/*

index_SetPlayerCamCir(playerid, bool:overview, Float:sx, Float:sy, Float:sz, Float:sa, totaltime, Float:sheight, Float:camrange=10.0, bool:targetvision, bool:reverse, bool:repeating, bool:anticlockwise)
{
	CamMoves[playerid][start_pos][0] = sx;
	CamMoves[playerid][start_pos][1] = sy; 
	CamMoves[playerid][start_pos][2] = sz; 
	CamMoves[playerid][cam_height] = sz + sheight;

	new cam_left_side, cam_right_side, cam_front_side, cam_back_side;

	
	//front
	CamMoves[playerid][cam_x][cam_front_side] = floatsin(sa, degrees) * camrange + floatcos(sa, degrees) * 0.0 + sx;
	CamMoves[playerid][cam_y][cam_front_side] = floatcos(sa, degrees) * camrange - floatsin(sa, degrees) * 0.0 + sy;
	//right
	CamMoves[playerid][cam_x][cam_right_side] = floatsin(sa, degrees) * 0.0 + floatcos(sa, degrees) * camrange + sx;
	CamMoves[playerid][cam_y][cam_right_side] = floatcos(sa, degrees) * 0.0 - floatsin(sa, degrees) * camrange + sy;
	//Back
	CamMoves[playerid][cam_x][cam_back_side] = floatsin(sa, degrees) * (-1 * camrange) + floatcos(sa, degrees) * 0.0 + sx;
	CamMoves[playerid][cam_y][cam_back_side] = floatcos(sa, degrees) * (-1 * camrange) - floatsin(sa, degrees) * 0.0 + sy;
	//left
	CamMoves[playerid][cam_x][cam_left_side] = floatsin(sa, degrees) * 0.0 + floatcos(sa, degrees) * (-1 * camrange) + sx;
	CamMoves[playerid][cam_y][cam_left_side] = floatcos(sa, degrees) * 0.0 - floatsin(sa, degrees) * (-1 * camrange) + sy;

	
	if(overview)
	{
		totaltime = totaltime / 4;
	}
	else
	{
		totaltime = totaltime / 2;
	}


	CamMoves[playerid][cam_is_player] = true;
	OnPlayerMovesCamera(playerid, totaltime, 0, (overview?4:3), targetvision, reverse, repeating, true);
	return 1;
}

forward OnPlayerMovesCamera(playerid, cam_timesec, movementsteps, cam_maxmoves, bool:targetvision, bool:cam_e_reverse, bool:cam_repeating, bool:cam_status);
public OnPlayerMovesCamera(playerid, cam_timesec, movementsteps, cam_maxmoves, bool:targetvision, bool:cam_e_reverse, bool:cam_repeating, bool:cam_status)
{
	if(!IsPlayerConnected(playerid) || !CamMoves[playerid][cam_is_player] || !cam_status)
	{	
		stop_cam:
		index_StopPlayerCamCir(playerid);
		return 1;
	}

	new nextsteptmp = movementsteps + (CamMoves[playerid][cam_inverted_motion]?(-1):(1));

	if(nextsteptmp == cam_maxmoves || nextsteptmp == -1)
	{
		if(cam_e_reverse)
		{
			if(cam_repeating)
			{
				if(CamMoves[playerid][cam_inverted_motion]) // -1
				{
					movementsteps = 0;
					nextsteptmp = 1;
					CamMoves[playerid][cam_inverted_motion] = false;	
				}
				else
				{
					movementsteps = cam_maxmoves - 1;
					nextsteptmp = cam_maxmoves - 2;
					CamMoves[playerid][cam_inverted_motion] = true;
				}
			}
			else
			{
				if(CamMoves[playerid][cam_inverted_motion])
				{
					goto stop_cam;
				}
				else
				{
					movementsteps = cam_maxmoves - 1;
					nextsteptmp = cam_maxmoves - 2;
					CamMoves[playerid][cam_inverted_motion] = true;
				}
			}
		}
		else
		{
			if(cam_repeating)
			{
				nextsteptmp = 1;
				movementsteps = 0;
			}
			else
			{
				nextsteptmp = 0;
				movementsteps = cam_maxmoves-1;
				cam_status = false;
			}
		}
	}
	if(targetvision) // Camera moves
	{
		InterpolateCameraPos(playerid, 
			CamMoves[playerid][cam_x][movementsteps], CamMoves[playerid][cam_y][movementsteps], CamMoves[playerid][cam_height],
			CamMoves[playerid][cam_x][nextsteptmp], CamMoves[playerid][cam_y][nextsteptmp], CamMoves[playerid][cam_height], cam_timesec, CAMERA_MOVE);

		InterpolateCameraLookAt(playerid, 
			CamMoves[playerid][start_pos][0], CamMoves[playerid][start_pos][1], CamMoves[playerid][start_pos][2], 
			CamMoves[playerid][start_pos][0], CamMoves[playerid][start_pos][1], CamMoves[playerid][start_pos][2], cam_timesec, CAMERA_MOVE);
	}
	else // Vision moves
	{
		InterpolateCameraPos(playerid, 
			CamMoves[playerid][start_pos][0], CamMoves[playerid][start_pos][1], CamMoves[playerid][start_pos][2], 
			CamMoves[playerid][start_pos][0], CamMoves[playerid][start_pos][1], CamMoves[playerid][start_pos][2], cam_timesec, CAMERA_MOVE);

		InterpolateCameraLookAt(playerid, 
			CamMoves[playerid][cam_x][movementsteps], CamMoves[playerid][cam_y][movementsteps], CamMoves[playerid][cam_height],
			CamMoves[playerid][cam_x][nextsteptmp], CamMoves[playerid][cam_y][nextsteptmp], CamMoves[playerid][cam_height], cam_timesec, CAMERA_MOVE);		
	}
	if(cam_status)
	{
		SetTimerEx("OnPlayerMovesCamera", cam_timesec, false, "iiiibbbb", playerid, cam_timesec, nextsteptmp, cam_maxmoves, targetvision, cam_e_reverse, cam_repeating, cam_status);
	}
	return 1;
}*/