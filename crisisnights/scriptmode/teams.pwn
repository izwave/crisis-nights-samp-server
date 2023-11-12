/*

menor bridge
CreateObject(117, 2699.27637, -2132.17920, 13.57780,   90.00000, 0.00000, 358.03851);
CreateObject(117, 2668.23950, -2123.27271, 13.57780,   90.00000, 0.00000, 358.03851);

Playa del Seville"
CreateObject(117, 2873.92334, -1881.72070, 11.09870,   90.00000, 0.00000, 0.00000);
CreateObject(117, 2870.47266, -2058.70630, 11.09870,   90.00000, 0.00000, 0.00000);

*/


// -- Selection class : Team, Color
public OnPlayerRequestClass(playerid, classid)
{
	if (player.getstate(playerid, JOIN)) {
		game.SetPlayerView(playerid, 0); // groove street
		return 0;
	}
	new Float:coords[] = {2479.40088, -1682.32324, 2501.70776, -1653.48962};
	new Float:x1, Float:y1, Float:x2, Float:y2;
	game.SetDelimiterRandomPos(coords, x1,y1);
	game.SetDelimiterRandomPos(coords, x2,y2);
	SetPlayerPos(playerid, 2488.41504, -1669.44458, 13.40900);
	SetPlayerFacingAngle(playerid, 270.00000);
	ApplyAnimation(playerid, "PED", "WALK_DRUNK", 4.1, 1, 1, 1, 1, 1, 1);
	InterpolateCameraPos(playerid, x1, y2, 45.0, x2, y2, 13.0, 2500, CAMERA_MOVE);
	InterpolateCameraLookAt(playerid, 2488.41504, -1669.44458, 13.40900, 2488.41504, -1669.44458, 13.40900, 2500, CAMERA_MOVE);
	/*
	new Float:coords[] = {1070.7972, -855.4997, 1130.7972, -795.4997};
	new Float:x1, Float:y1, Float:x2, Float:y2;
	game.SetDelimiterRandomPos(coords, x1,y1);
	game.SetDelimiterRandomPos(coords, x2,y2);
	SetPlayerPos(playerid, 1100.7972, -825.4997, 114.5427);
	InterpolateCameraPos(playerid, x1, y2, 140.0, x2, y2, 120.0, 2500, CAMERA_MOVE);
	InterpolateCameraLookAt(playerid, 1100.7972, -825.4997, 114.5427, 1100.7972, -825.4997, 114.5427, 2500, CAMERA_MOVE);
	
	SetPlayerPos(playerid, 2516.9578, 2447.6992, 11.0313);
    SetPlayerFacingAngle(playerid, 269.7719);
    SetPlayerCameraPos(playerid, 2521.2405, 2447.5195, 12.0313);
    SetPlayerCameraLookAt(playerid, 2516.9578, 2447.6992, 11.0313);*/

    new tmp[18+14];
	player.set(playerid, TEAM, GAME_TEAMS:classid);
	SetPlayerTeam(playerid, classid);
	format(tmp, sizeof(tmp), "~d~~d~~%c~%s", GAME_TEAM_TEXT_COLOR[classid], GAME_TEAM_NAME[classid]);
	GameTextForPlayer(playerid, tmp, 4000, 5);
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	if (player.getstate(playerid, JOIN)) {
		game.SetPlayerView(playerid, 0); // groove street
		return 0;
	}
	return 1;
}

public OnPlayerSpawn(playerid)
{
	new GAME_TEAMS:teamid = player.gettag(playerid, TEAM);

	// -- teams : player's team has no spawn
	if (game.get(SPAWN_CASE, 0) == teamid || game.get(SPAWN_CASE, 1) == teamid)
	{
		new region = random(11) * 4;
		new view = region + random(3);
		new spawnid = region + random(1) * 2;

		if (game.get(SPAWN_CASE, 1) == teamid)
		{
			spawnid ++;
		}
		game.SetPlayerView(playerid, view);
	}
	else
	{
		switch(teamid) {
			case GRAY: game.SetRandomPosEx(playerid, GRAY_SPAWN);
			default: game.SetRandomPosEx(playerid, BLACK_SPAWN);
		}
	}
	SetPlayerColor(playerid, GAME_TEAM_COLOR[teamid]);
	return 1;
}

// -- Team commands : weapons
cmd:buyweaps() {
	return 1;
}

cmd:fire(playerid) {
	ForceClassSelection(playerid);
    TogglePlayerSpectating(playerid, true);
    TogglePlayerSpectating(playerid, false);
	return 1;
}




/*
stock ChoseImage() {
	new region = random(11) * 4;
	new view = region + random(3);

	
	SetPlayerWeather(playerid, 7);
	SetPlayerTime(playerid, 17, 30); // Midnight
}*/
game_SetPlayerView(playerid, view) {	
	SetPlayerCameraPos(playerid, SPAWN_CAM_POS[view][X], SPAWN_CAM_POS[view][Y], SPAWN_CAM_POS[view][Z]);
	SetPlayerCameraLookAt(playerid, SPAWN_CAM_LOOK[view][0], SPAWN_CAM_LOOK[view][1], SPAWN_CAM_LOOK[view][2]);
}