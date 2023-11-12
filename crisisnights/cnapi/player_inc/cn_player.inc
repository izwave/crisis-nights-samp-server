/*index_SetPlayerSpawn


"kill" white
"Double Kill" Yellow
"Multi kill" Yellow + 
"Ultra Kill" Orange+ 
"Fantastic" Orange-red
"Unbelievable" red
*/

index_IncreasePlayerScore(playerid, scoreincrease=1, bool:forcecase=false)
{
	if(scoreincrease < 0) return 0;
	if(forcecase)
	{
		SetPlayerScore(playerid, scoreincrease);
		PlayerDataInPlay[playerid][SINGLE_PLAYER_POINT][0] = scoreincrease;
		return 1;
	}
	new playerscore = GetPlayerScore(playerid) + scoreincrease;
	SetPlayerScore(playerid, playerscore);
	PlayerDataInPlay[playerid][SINGLE_PLAYER_POINT][0] = playerscore;
	return 1;
}
index_IncreasePlayerKills(playerid, killsincrease=1, bool:forcecase=false)
{
	if(killsincrease < 0) return 0;
	if(forcecase)
	{
		PlayerDataInPlay[playerid][SINGLE_PLAYER_POINT][1] = killsincrease;
		return 1;
	}
	new playerscore = PlayerDataInPlay[playerid][SINGLE_PLAYER_POINT][1] + killsincrease;
	PlayerDataInPlay[playerid][SINGLE_PLAYER_POINT][1] = playerscore;
	return 1;
}
index_IncreasePlayerDeaths(playerid, deathsincrease=1, bool:forcecase=false)
{
	if(deathsincrease < 0) return 0;
	if(forcecase)
	{
		PlayerDataInPlay[playerid][SINGLE_PLAYER_POINT][2] = deathsincrease;
		return 1;
	}
	new playerdeaths = PlayerDataInPlay[playerid][SINGLE_PLAYER_POINT][2] + deathsincrease;
	PlayerDataInPlay[playerid][SINGLE_PLAYER_POINT][2] = playerdeaths;
	return 1;
}
index_IncreasePlayerSkill(playerid, bool:caseincrease=true)
{
	if(!caseincrease)
	{
		PlayerDataInPlay[playerid][SINGLE_PLAYER_SKILL] = SKILL_NONE;
		return 1;
	}
	new playercurrent = _:PlayerDataInPlay[playerid][SINGLE_PLAYER_SKILL];
	switch(PlayerDataInPlay[playerid][SINGLE_PLAYER_SKILL])
	{
		case (SKILL_AMAZING):
		{
			return 1;
		}
		default:
		{
			playercurrent ++;
		}
	}
	PlayerDataInPlay[playerid][SINGLE_PLAYER_SKILL] = SERVER_PLAYER_SKILLS:playercurrent;
	return 1;
}

SERVER_PLAYER_SKILLS:index_GetPlayerSkillLevel(playerid)
{
	return PlayerDataInPlay[playerid][SINGLE_PLAYER_SKILL];
}