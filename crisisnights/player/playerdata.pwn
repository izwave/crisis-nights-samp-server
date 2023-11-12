#include "..\crisisnights\script\__macros__.pwn"
#include "..\crisisnights\player\serverdata.pwn"
#include "..\crisisnights\script\gangzones.pwn"

// --------------------------------------------------

enum SERVER_COMPANIES_TYPE
{
	COMPANIE_TYPE_LOCAL,
	COMPANIE_TYPE_INTERLOCAL,
	COMPANIE_TYPE_EXTERNAL,
}
enum SERVER_PLAYER_STATE (<<= 1)
{
	STATE_NONE,
	STATE_LOGGED = 1,
	STATE_SELECTION_TEAM,
	STATE_SELECTION_SKIN,
	STATE_COMPANIE_DOMAIN,
	STATE_SPAWN_ZONE,
	STATE_SPAWN_PLAYING,
}
enum SERVER_PLAYER_PERMISSION (<<= 1)
{
	PERMISSION_NONE,
	PERMISSION_GLOBAL_MESSAGE =1,
	PERMISSION_DRIVE,
	PERMISSION_DRIVE_COMMANDS
}
enum SERVER_GENERAL_TIMERS
{
	TIMER_COUNTER,
	TIMER_SPAWN_VEHICLE,
	TIMER_BUY_WEAPONS,
	TIMER_KILLING_SKILL
}
enum SERVER_PLAYER_DATA
{
	SERVER_PLAYER_STATE:SINGLE_PLAYER_STATUS,
	SERVER_GENERAL_TEAMS:SINGLE_PLAYER_TEAM,
	SERVER_GENERAL_COMPANIES:SINGLE_PLAYER_COMPANIES,
	SINGLE_PLAYER_TIMER[SERVER_GENERAL_TIMERS],

	WEAPON_DAMAGE_MOD_ID:SINGLE_PLAYER_WEAPON_MOD[13],
	WEAPON_DAMAGE_MOD_AMMO:SINGLE_PLAYER_WEAPON_MODAMMO[13],
	
	SINGLE_PLAYER_IG_NAME[MAX_PLAYER_NAME],
	SINGLE_PLAYER_ID_NAME[MAX_PLAYER_NAME],
	SINGLE_PLAYER_POINT[3],
	SINGLE_PLAYER_CREDIT[3],

	SERVER_PLAYER_SKILLS:SINGLE_PLAYER_SKILL,

	SINGLE_PLAYER_WEAPON_AMMO[13],
	SINGLE_PLAYER_WEAPON_ID[13],
	SINGLE_PLAYER_VEHICLE[2]
};

enum SERVER_PLAYER_SKILLS
{
	SKILL_NONE,
	SKILL_KILL=1,
	SKILL_DOUBLE,
	SKILL_TRIPLE,
	SKILL_MULTIPLE,
	SKILL_EXTRAORDINARY,
	SKILL_AMAZING,
}
// --------------------------------------------------

new const selection_class_skins[][] =
{
	{299, 272, 29, 125},
	{211, 141, 298, 0},
	{295, 119, 28, -1},
	{290, 289, 121, -1},
	{294, 146, 292, -1}
};
new const PlayerTeamColor[] = {0x303030FF, 0x3b5998FF, 0x50c878FF, 0xee4242FF, 0xC0C0C0FF};
new PlayerDataInPlay[MAX_PLAYERS][SERVER_PLAYER_DATA];

// --------------------------------------------------

public OnPlayerConnect(playerid)
{	
	new mystrtmp[128];
	GetPlayerName(playerid, PlayerDataInPlay[playerid][SINGLE_PLAYER_IG_NAME], MAX_PLAYER_NAME);
	
    format(mystrtmp, sizeof mystrtmp, "\\Unite> {bc1616}'%s' {FFFFFF}Connected to the server - Crisis Nights <{43E9E9}?!{FFFFFF}>", PlayerDataInPlay[playerid][SINGLE_PLAYER_IG_NAME]); 
    SendClientMessageToAll(0x74bc16FF, mystrtmp);

	//Dialog_Show(playerid, Dialog:register);
	PlayerDataInPlay[playerid][SINGLE_PLAYER_STATUS] = STATE_NONE;

	cn.MapIcon(playerid, true);
	cn.ShowDomainCompanies(playerid, true);
	
	GangZoneShowForPlayer(playerid, ServerGangZone[GANGZONE_FIBONACCI_1], 0x000000A);
	GangZoneShowForPlayer(playerid, ServerGangZone[GANGZONE_FIBONACCI_2], 0x0000014);
	GangZoneShowForPlayer(playerid, ServerGangZone[GANGZONE_FIBONACCI_3], 0x000001E);
	GangZoneShowForPlayer(playerid, ServerGangZone[GANGZONE_FIBONACCI_5], 0x0000032);
	GangZoneShowForPlayer(playerid, ServerGangZone[GANGZONE_FIBONACCI_8], 0x0000050);
	GangZoneShowForPlayer(playerid, ServerGangZone[GANGZONE_FIBONACCI_13], 0x0000082);
	GangZoneShowForPlayer(playerid, ServerGangZone[GANGZONE_FIBONACCI_21], 0x00000D2);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	PlayerDataInPlay[playerid][SINGLE_PLAYER_VEHICLE][0] = INVALID_VEHICLE_ID;

	//remove all
	PlayerDataInPlay[playerid][SINGLE_PLAYER_TEAM] = TEAM_BASE_NONE;			// remove equipe
	PlayerDataInPlay[playerid][SINGLE_PLAYER_STATUS] = STATE_NONE;				// remove status
	PlayerDataInPlay[playerid][SINGLE_PLAYER_COMPANIES] = COMPANIES_BASIC_NONE;	// remove domínios

	cn.MapIcon(playerid, false);
	cn.ShowDomainCompanies(playerid, false);

	// loop: GangZone
	gTimes<_:SEVER_GENERAL_GANGZONE,x>
	{
		GangZoneHideForPlayer(playerid, ServerGangZone[SEVER_GENERAL_GANGZONE:x]);
	}
	return 1;
}



public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
    return 1;
}