index_SetPlayerState(playerid, SERVER_PLAYER_STATE:stateid, bool:toggle=true)
{
	if(!toggle)
	{
		if(BitFlag_Get(PlayerDataInPlay[playerid][SINGLE_PLAYER_STATUS], stateid))
		{
			BitFlag_Clear(PlayerDataInPlay[playerid][SINGLE_PLAYER_STATUS], stateid);
			return 1;
		}
		return 0;
	}
	BitFlag_Set(PlayerDataInPlay[playerid][SINGLE_PLAYER_STATUS], stateid);
	return 1;
}
index_GetPlayerState(playerid, SERVER_PLAYER_STATE:stateid)
{
	if(BitFlag_Get(PlayerDataInPlay[playerid][SINGLE_PLAYER_STATUS], stateid)) return 1;
	return 0;
}