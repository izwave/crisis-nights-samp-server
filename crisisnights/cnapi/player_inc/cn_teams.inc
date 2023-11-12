index_SetPlayerTeam(playerid, SERVER_GENERAL_TEAMS:teamid)
{
	PlayerDataInPlay[playerid][SINGLE_PLAYER_TEAM] = teamid;
}
SERVER_GENERAL_TEAMS:index_GetPlayerTeam(playerid)
{
	return PlayerDataInPlay[playerid][SINGLE_PLAYER_TEAM];
}

index_GetTeamColor(SERVER_GENERAL_TEAMS:teamid)
{
	if(teamid != TEAM_BASE_NONE) return PlayerTeamColor[_:teamid];
	return -1;
}
/*
	

	QUALQUER TEAM
	"LV Warehouse 1": 1059.895996, 2081.685791, 10.820312 (interior=0)
	(Adaptavel)

	TEAM_BLUE
	"LS Atruim" 1710.433715,-1669.379272,20.225049 (interiorid=18)
	(Perfeito)

	Spawn Models:
	-> 3 Lugares para o Level 1 e 2. No level 3: escolher o spawn a cada 24H via queda (com paraquedas) com base na sua equipe e 300M de distância dos demais. 
	
	TEAM_BLUE
	A
	SetPlayerCameraPos(playerid, 1305.7827, -2036.4346, 123.3447);
	SetPlayerCameraLookAt(playerid, 1304.7948, -2036.4832, 122.7656);
	B
	SetPlayerCameraPos(playerid, 1604.3325, -1302.3237, 21.4755);
	SetPlayerCameraLookAt(playerid, 1603.6915, -1303.0790, 21.3013);
	C
	SetPlayerCameraPos(playerid, 1829.6324, -1906.5967, 36.0055);
	SetPlayerCameraLookAt(playerid, 1828.6472, -1906.5968, 35.3222);

	TEAM_RED 
	"SF gym": 774.213989, -48.924297, 1000.585937 (interiorid=6)
	
	level 1
	A
	SetPlayerCameraPos(playerid, 1258.1196, -1300.1470, 109.3315);
	SetPlayerCameraLookAt(playerid, 1257.7180, -1299.2347, 107.7616);
	B
	SetPlayerCameraPos(playerid, 457.6391, -1590.6577, 50.4708);
	SetPlayerCameraLookAt(playerid, 456.9311, -1589.9672, 50.1168);
	C
	SetPlayerCameraPos(playerid, 333.5450, -1845.8848, 25.7954);
	SetPlayerCameraLookAt(playerid, 333.5646, -1844.8964, 25.4467);

	TEAM_GREEN
	
	level 1
	A
	SetPlayerCameraPos(playerid, 2303.1816, -1475.1621, 38.6336);
	SetPlayerCameraLookAt(playerid, 2303.1162, -1476.1544, 38.2843);
	B
	SetPlayerCameraPos(playerid, 2118.1631, -1881.6577, 36.7675);
	SetPlayerCameraLookAt(playerid, 2118.1604, -1882.6461, 35.9479);
	C
	SetPlayerCameraPos(playerid, 1975.0757, -2124.5127, 29.1495);
	SetPlayerCameraLookAt(playerid, 1974.0857, -2124.5234, 28.6498);

	TEAM_GRAY

	level 1
	A
	SetPlayerCameraPos(playerid, 1517.7603, -736.8596, 145.9056);
	SetPlayerCameraLookAt(playerid, 1517.3933, -735.9341, 144.9658);
	B
	SetPlayerCameraPos(playerid, 1791.4355, -1270.1719, 18.8359);
	SetPlayerCameraLookAt(playerid, 1791.3484, -1271.1637, 18.7061);
	C
	SetPlayerCameraPos(playerid, 2213.4849, -1116.7148, 36.8944);
	SetPlayerCameraLookAt(playerid, 2213.5847, -1117.7043, 36.5354);

	level 2
	SetPlayerCameraPos(playerid, 1988.9844, -1459.4824, 19.9950);
	SetPlayerCameraLookAt(playerid, 1989.7131, -1458.8059, 19.8708);
	A

	
*/