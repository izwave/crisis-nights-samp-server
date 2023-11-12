/* Crisis Nights: map icons
	map icons index: Works and manages server icons in an organized and structured way
	* index_servermenus: create or destroy all server menus
	* OnPlayerSelectedMenuRow: when a line is pressed with the 'space' key
	* OnPlayerExitedMenu: when the 'enter' key is pressed
*/

enum e_server_mapicon
{
	ICON_TEAM_BLACK0,
	ICON_TEAM_BLACK1,
	ICON_TEAM_BLACK2,
	ICON_TEAM_BLACK3,
	ICON_COMPANIES_CAPITAL,
	ICON_COMPANIES_OCEAN,
	ICON_COMPANIES_SANTA,
	ICON_COMPANIES_VERDANT,
	ICON_COMPANIES_DOWNTOWN,
	ICON_COMPANIES_COLINAS,
	ICON_COMPANIES_MULHOLLAND,
	ICON_COMPANIES_IDLEWOOD
}

index_MapIcon(playerid, bool:action)
{
	if(action)
	{
		// equipe Black (Sociedade Secreta)
		SetPlayerMapIcon(playerid, ICON_TEAM_BLACK0, 1531.4042, -1675.5704, 12.3883, 38, 0, MAPICON_LOCAL);
		SetPlayerMapIcon(playerid, ICON_TEAM_BLACK1, 1501.4042, -1675.5704, 12.3883, 38, 0, MAPICON_LOCAL);
		SetPlayerMapIcon(playerid, ICON_TEAM_BLACK2, 2737.7500, -1760.0625, 26.2266, 46, 0, MAPICON_LOCAL);
		SetPlayerMapIcon(playerid, ICON_TEAM_BLACK3, 702.8672, -1276.0313, 20.9063, 43, 0, MAPICON_LOCAL);

		// capital
		SetPlayerMapIcon(playerid, ICON_COMPANIES_CAPITAL, 701.785400, -446.865300, 15.289000, 12, 0, MAPICON_GLOBAL_CHECKPOINT);
		
		// empresas básicas
		SetPlayerMapIcon(playerid, ICON_COMPANIES_OCEAN, 2742.56104, -2465.78174, 13.648400, 0, 0x4e81ff77, MAPICON_GLOBAL);
		SetPlayerMapIcon(playerid, ICON_COMPANIES_SANTA, 380.279390, -2078.86890, 6.7986000, 0, 0x4e81ff77, MAPICON_GLOBAL);
		SetPlayerMapIcon(playerid, ICON_COMPANIES_VERDANT, 1549.34338, -2087.08252, 25.515600, 0, 0x4e81ff77, MAPICON_GLOBAL);
		SetPlayerMapIcon(playerid, ICON_COMPANIES_DOWNTOWN, 1544.70313, -1353.26953, 326.03223, 0, 0x4e81ff77, MAPICON_GLOBAL);
		SetPlayerMapIcon(playerid, ICON_COMPANIES_COLINAS, 2553.23730, -1127.17090, 60.673500, 0, 0x4e81ff77, MAPICON_GLOBAL);
		SetPlayerMapIcon(playerid, ICON_COMPANIES_MULHOLLAND, 1042.98035, -907.853880, 41.341600, 0, 0x4e81ff77, MAPICON_GLOBAL);
		SetPlayerMapIcon(playerid, ICON_COMPANIES_IDLEWOOD, 2164.82007, -1800.71326, 12.320500, 0, 0x4e81ff77, MAPICON_GLOBAL);
		
		// empresas moderadas
		//.

		// empresas complexas
		//.
	}
	else
	{
		gTimes<_:e_server_mapicon,x> 
		{
			RemovePlayerMapIcon(playerid, x);
		}
	}
	return 1;
}