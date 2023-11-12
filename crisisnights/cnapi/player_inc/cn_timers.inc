stock index_StartDelayCounting(playerid)
{
	try:
	printf("[%i] gettime = %i", GetTickCount() / 60, gettime());
	PlayerDataInPlay[playerid][SINGLE_PLAYER_TIMER][TIMER_COUNTER] = gettime();
	if(!PlayerDataInPlay[playerid][SINGLE_PLAYER_TIMER][TIMER_COUNTER]) goto try;
	return PlayerDataInPlay[playerid][SINGLE_PLAYER_TIMER][TIMER_COUNTER];
}

stock index_GetDelayCounting(playerid, bool:bury=false)
{
	new playetimer = PlayerDataInPlay[playerid][SINGLE_PLAYER_TIMER][TIMER_COUNTER];
	if(!playetimer) return 0;
	if(bury)
	{
		PlayerDataInPlay[playerid][SINGLE_PLAYER_TIMER][TIMER_COUNTER] = 0;
		return gettime() - playetimer;
	}
	printf("%i - %i = %i", gettime(), playetimer, (gettime() - playetimer));
	return gettime() - playetimer;
}

stock index_SetPlaterDelayTimer(playerid, SERVER_GENERAL_TIMERS:timerid, timersec, bool:addcase=false)
{
	if(timersec <= 0) return 0;
	if(addcase)
	{
		new currenttime = cn.GetPlayerDelayTimer(playerid, timerid);
		PlayerDataInPlay[playerid][SINGLE_PLAYER_TIMER][timerid] = gettime() + currenttime + timersec;
		return 1;
	}
	PlayerDataInPlay[playerid][SINGLE_PLAYER_TIMER][timerid] = gettime() + timersec;
	return 1;
}
stock index_GetPlayerDelayTimer(playerid, SERVER_GENERAL_TIMERS:timerid)
{
	new currenttime = gettime();
	if(currenttime >= PlayerDataInPlay[playerid][SINGLE_PLAYER_TIMER][timerid])
	{
		return 0;
	}
	return PlayerDataInPlay[playerid][SINGLE_PLAYER_TIMER][timerid] - currenttime;
}