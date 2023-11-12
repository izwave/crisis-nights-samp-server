enum SERVER_GENERAL_MAPS
{
	// TEAMS
	LS_MAP_TEAM_PERSHING SQUARE,		// Team Base Black
	LS_MAP_TEAM_MULHOLLAND_INTERSEC,	// Team Base Gray
	LS_MAP_TEAM_EAST_BEACH,				// Team Base Green
	LS_MAP_TEAM_VINEWOOD,				// Team Base Red
	
	// COMPANIES
	LS_MAP_COMPANY_DILLIMORE, 			// 0 Capital
	LS_MAP_COMPANY_OCEAN_DOCKS,			// 1 OCEAN
	LS_MAP_COMPANY_SANTA_MARIA,			// 2 Santa Maria Beach
	LS_MAP_COMPANY_VERDANT,				// 3
	LS_MAP_COMPANY_DOWNTOWN,			// 4
	LS_MAP_COMPANY_MULHOLLAND,			// 5
	LS_MAP_COMPANY_LAS_COLINAS,			// 6
	LS_MAP_COMPANY_IDLEWOOD,			// 7

	LS_MAP_BS_VERONA BEACH,				// (SNW) Sturman naval war base

	// PRIVATE MAPS (interior and world above)
	LS_MAP_PRIVATE_LUNAR_CRATER,
}

enum SERVER_DATA_MAPS
{
	Float:SERVER_MAP_AXYZ[3],
	Float:SERVER_MAP_BXYZ[3],
	Float:SERVER_MAP_CXYZ[3],
	SERVER_MAP_VIRTUAL_WORLD,
	SERVER_MAP_INTERIOR
}

new const ServerDataInMaps[][SERVER_DATA_MAPS] =
{
	{{1.0,1.3,1.7},{0.1,0.2,0.3},{7.1,7.2,7.3},0,0}

};

index_PutPlayerOnMap(playerid, GENERAL_SERVER_MAPS:mapid, bool:randompos=true)
{
	if(IsPlayerConnected(playerid)) return 0;
}
