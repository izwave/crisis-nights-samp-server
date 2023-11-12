

enum SERVER_GENERAL_COMPANIES (<<= 1) /* from system "domain-companies" */ 
{
	COMPANIES_BASIC_NONE,		// null
	COMPANIES_OCEAN_SIDE = 1,	// Docas
	COMPANIES_SANTA_MARIA, 		// Parque
	COMPANIES_VERDANT, 			// De baixo da ponte
	COMPANIES_DOWNTOWN,			// Predio de LS
	COMPANIES_MULHOLLAND,		// Posto de gasolina	
	COMPANIES_LAS_COLINAS,		// Superior direito
	COMPANIES_IDLEWOOD			// Idlewood
}

enum SERVER_GENERAL_TEAMS
{
	TEAM_BASE_NONE=-1,
	TEAM_DARKNIGHT,
	TEAM_BASE_BLACK,		
	TEAM_BASE_GREEN,
	TEAM_BASE_RED,
	TEAM_BASE_GRAY,
}

enum SERVER_GENERAL_ACCOUNTS
{
	// Input information
	ACCOUNT_REGIS_NAME,
	ACCOUNT_GAME_NAME,
	ACCOUNT_IP_ADRESS,
	ACCOUNT_REGIS_KEY,

	// Dated information
	ACCOUNT_REGIS_DATE,
	ACCOUNT_LAST_DATE,
	
	// In-game information
	ACCOUNT_ARCADE_SCORE,
	ACCOUNT_REGIS_EXPERIENCE,
	ACCOUNT_ARCADE_EXPERIENCE,
	
	// Achievements
	ACCOUNT_KILLING_MEDALS, //[SERVER_GENERAL_MEDALS]
	ACCOUNT_COMPANY_DOMAIN,//[3]

	// Certifications
	ACCOUNT_BEST_PLAYER,//[3] 'Day / Week / Month
}

enum SERVER_GENERAL_MEDALS
{
	MEDAL_FIGHTING, // matar inimigo em sua base
	MEDAL_DEFENDER, // matar inimigo na base de spawn
	MEDAL_MERCENARY, // matar o maior matador desde o spawn / matar sendo o maior matador
	MEDAL_TERRORIST, // matar inimigo que está em missão
}

enum SERVER_GENERAL_STATE (<<= 1)
{
	STATE_MODE_NONE,
	STATE_MODE_DEFAULT = 1,
	STATE_MODE_SPECIAL_EDITION
}/*
enum SERVER_GENERAL_SYSTEMS (<<= 1)
{
	SYSTEM_PLAYER_BET_DUEL // (player vs player $money)
	SYSTEM_PLAYER_TEAM_DUEL //(player team vs player other team) em um mapa grande (floresta etc, sem cor de jogador)[PODE TER +1 JOGADOR]
	SYSTEM_CHALLENGES //player & vehicle
	SYSTEM_VEHICLE_STORE,
	SYSTEM_VEHICLE_TOURNAMENT,
	SYSTEM_VEHICLE_STREET_RACING,

	SYSTEM_COMPANIES_LOCAL,
	SYSTEM_COMPANIES_INTERLOCAL,
	SYSTEM_COMPANIES_EXTERNAL,
}*/

enum SERVER_GENERAL_MANAGEMENT
{
	SERVER_GENERAL_STATE:STATE_CRISIS_NIGHTS,
	SERVER_GENERAL_SYSTEMS:SYSTEMS_CRISIS_NIGHTS,

	bool:COMPANIES_DOMAIN[8],
	COMPANIES_TIMER[8],
	COMPANIES_TIMER_PLAYER[8],
	SERVER_GENERAL_TEAMS:COMPANIES_TEAMMODE[8],
}

enum SEVER_GENERAL_AREA
{
	CIRCLE_FIBONACCI_ORIGIN,
}

new const KillingSkillData[5][40] =
{
	{"Double"},
	{"Triple"},
	{"Multiple"},
	{"Extraordinary"},
	{"Amazing"}
};

new const KillingSkillColor[5] = {0x394793FF, 0x482054FF, 0x254893FF, 0x357090FF, 0x950244FF};

new ServerDataInPlay[SERVER_GENERAL_MANAGEMENT];
new ServerDynamicArea[SEVER_GENERAL_AREA];
new vehtraintest;

init_add_vehicles()
{
	// empresas
	vehtraintest = AddStaticVehicleEx(537, 1713.2605, -1953.6948, 15.2283, 90.0, 0, 0, 60, 0);
	return 1;
}

index_DynamicArea()
{
	ServerDynamicArea[CIRCLE_FIBONACCI_ORIGIN] = CreateDynamicCircle(0.0, 0.0, 750.0);
}