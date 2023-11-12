/* 
native cn.GetCompanyIndexTag(SERVER_COMPANIES_TYPE:companytype, &SERVER_GENERAL_COMPANIES:companytag, &companyid=0);
native cn.SetCompanyTeam(COMPANIE_INDEX:companyid, SERVER_GENERAL_TEAMS:teamid);
native SERVER_GENERAL_TEAMS:cn.GetCompanyTeam(COMPANIE_INDEX:companyid);
native cn.SetCompanyDelayTime(COMPANIE_INDEX:companyid, timesec);
native cn.GetCompanyDelayTime(COMPANIE_INDEX:companyid);
native cn.SetCompanyDomainTime(COMPANIE_INDEX:companyid, timesec);
native cn.GetCompanyDomainTime(COMPANIE_INDEX:companyid);
native cn.SetCompanyStatus(COMPANIE_INDEX:companyid, bool:status);
native bool:cn.GetCompanyStatus(COMPANIE_INDEX:companyid);
native cn.SetCompanyMode(bool:defaultmode=false);
native bool:cn.GetCompanyMode();
*/

forward OnPlayerEnterCompany(playerid, COMPANIE_INDEX:companyid);
forward OnPlayerDomainCompany(playerid, COMPANIE_INDEX:companyid);


index_GetCompanyIndexTag(SERVER_COMPANIES_TYPE:companytype, &SERVER_GENERAL_COMPANIES:companytag, &companyid=0)
{
	if(companyid != 0)
	{	
		companytag = COMPANIES_BASIC_NONE;
		switch(companyid)
		{
			case 1: companytag |= COMPANIES_OCEAN_SIDE;
			case 2: companytag |= COMPANIES_SANTA_MARIA;
			case 3: companytag |= COMPANIES_VERDANT;
			case 4: companytag |= COMPANIES_DOWNTOWN;
			case 5: companytag |= COMPANIES_MULHOLLAND;
			case 6: companytag |= COMPANIES_LAS_COLINAS; 
			case 7: companytag |= COMPANIES_IDLEWOOD;
			default: return -1;
		}
		return 1;
	}
	new container[SERVER_COMPANIES_TYPE]; 
	if(BitFlag_Get(companytag, COMPANIES_OCEAN_SIDE)) {
		container[COMPANIE_TYPE_LOCAL]++; companyid=1;
	}
	if(BitFlag_Get(companytag, COMPANIES_SANTA_MARIA)) {
		container[COMPANIE_TYPE_LOCAL]++; companyid=2;
	}
	if(BitFlag_Get(companytag, COMPANIES_VERDANT)) {
		container[COMPANIE_TYPE_LOCAL]++; companyid=3;
	}
	if(BitFlag_Get(companytag, COMPANIES_DOWNTOWN)) {
		container[COMPANIE_TYPE_LOCAL]++; companyid=4;
	}
	if(BitFlag_Get(companytag, COMPANIES_MULHOLLAND)) {
		container[COMPANIE_TYPE_LOCAL]++; companyid=5;
	}
	if(BitFlag_Get(companytag, COMPANIES_LAS_COLINAS)) {
		container[COMPANIE_TYPE_LOCAL]++; companyid=6;
	}
	if(BitFlag_Get(companytag, COMPANIES_IDLEWOOD)) {
		container[COMPANIE_TYPE_LOCAL]++; companyid=7;
	}
	return container[companytype];
}

index_SetCompanyTeam(COMPANIE_INDEX:companyid, SERVER_GENERAL_TEAMS:teamid) {
	ServerDataInPlay[COMPANIES_TEAMMODE][_:companyid] = teamid;
}


SERVER_GENERAL_TEAMS:index_GetCompanyTeam(COMPANIE_INDEX:companyid) {
	return ServerDataInPlay[COMPANIES_TEAMMODE][_:companyid];
}

index_SetCompanyDelayTime(COMPANIE_INDEX:companyid, timesec) {
	ServerDataInPlay[COMPANIES_TIMER][_:companyid] = timesec;
}
index_GetCompanyDelayTime(COMPANIE_INDEX:companyid)
{
	new unixtime = gettime();
	if(unixtime >= ServerDataInPlay[COMPANIES_TIMER][_:companyid])
	{
		return 0;
	}
	return ServerDataInPlay[COMPANIES_TIMER][_:companyid] - unixtime;
}
index_SetCompanyDomainTime(COMPANIE_INDEX:companyid, timesec) {
	ServerDataInPlay[COMPANIES_TIMER_PLAYER][_:companyid] = timesec;
}
index_GetCompanyDomainTime(COMPANIE_INDEX:companyid)
{
	if(ServerDataInPlay[COMPANIES_TIMER_PLAYER][_:companyid] == -1)
	{
		return ServerDataInPlay[COMPANIES_TIMER_PLAYER][_:companyid];
	}
	new unixtime = gettime();
	if(unixtime >= ServerDataInPlay[COMPANIES_TIMER_PLAYER][_:companyid])
	{
		return 0;
	}
	return ServerDataInPlay[COMPANIES_TIMER_PLAYER][_:companyid] - unixtime;
}
index_SetCompanyStatus(COMPANIE_INDEX:companyid, bool:status)
{
	ServerDataInPlay[COMPANIES_DOMAIN][_:companyid] = status;
}
bool:index_GetCompanyStatus(COMPANIE_INDEX:companyid)
{
	return ServerDataInPlay[COMPANIES_DOMAIN][_:companyid];
}
index_SetCompanyMode(bool:defaultmode=false)
{
	ServerDataInPlay[COMPANIES_DOMAIN][0] = defaultmode;
}
bool:index_GetCompanyMode()
{
	return ServerDataInPlay[COMPANIES_DOMAIN][0];
}