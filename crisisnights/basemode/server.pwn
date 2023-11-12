// -- namespace : data

// -- enums
enum COORDS_EX
{
	Float:POS_X,
	Float:POS_Y,
	Float:POS_Z,
	Float:POS_A,
	WORLD_ID,
	INTERIOR_ID
}
enum GAME_MESSAGE_TYPES
{
	WARNING,
	REQUIRED,
	ALREADY,
	SUCCESSFUL,
	SUPPORT
}
enum GAME_PICKUPS
{
	BLACK_TEAM_EXIT,
	HIGH_HOUSE_ENTER,
	HIGH_HOUSE_EXIT
}
enum GAME_VEHICLES
{
	BLACK_SPORT,
	BLACK_RHINO,
	BLACK_HYDRA,
	GRAY_SPORT,
	RED_CHEETAH
}

enum GAME_TEAM_ZONES
{
	TEAM_BLACK,
	TEAM_GREEN,
	TEAM_RED,
	TEAM_GRAY
}

enum GAME_TELEPORT
{
	HIGH_HOUSE_EN,
	HIGH_HOUSE_EX,
}
enum GAME_DIALOGS
{
	SIGN_IN,
	SIGN_UP,
	BUY_WEAPS,
	BUY_NITRO,
}
enum GAME_DATABASES
{
	DB:USERS,
	DB:RACES
}

enum GAME_TEAMS
{
	BLACK,	
	GREEN,
	RED,
	GRAY,
    DARKNIGHT
}

enum GAME_DATA {
	PICKUP[GAME_PICKUPS],
	VEHICLE[GAME_VEHICLES],
	GZONE_TEAMS[GAME_TEAM_ZONES],
	GZONE_POSTS[8],
	AREA_POSTS[8], // streamer
	DB[GAME_DATABASES], // databse


	KILLS[GAME_TEAMS],
	STATIONS[GAME_TEAMS],

	GAME_TEAMS:SPAWN_CASE[2]
};

// -- const arrays : declaration
new const GAME_MESSAGE_COLORS[GAME_MESSAGE_TYPES] = {
    0xFA8072AA,0x831010FF,0xC9E2EDFF,0x43E9E9FF,0x1213242FF
};

new const GAME_TELEPOS[GAME_TELEPORT][COORDS_EX] = {
	{234.1435, 1066.2775, 1084.2197, 0.0, 0, 6},
	{1496.96130, -690.35632, 94.79600, 0.0, 0, 0}
}; 


new const GAME_DIALOG_DATA[GAME_DIALOGS][][] = {
	{DIALOG_STYLE_INPUT, {"Sign in"}, {"{F93546}You are registered!\n\nEnter your password below:"}, {"Ok"}, {"Cancel"}},
	{DIALOG_STYLE_PASSWORD, {"Sign up"}, {"{AA3546}You do not have an active account.\n\nEnter a password for your registration."}, {"Ok"}, {"Cancel"}},
	{DIALOG_STYLE_MSGBOX, {"weapons buy"}, {"{F93546}Info dos dados"}, {"button 1"}, {"button 2"}},
	{DIALOG_STYLE_LIST, {"Custom nitro"}, 
	{"{7401B8}Collision nitro\t\t{77BC1F}$2.000\n{7401B8}Wings nitro\t\t{77BC1F}$5.000\n{7401B8}Rocket nitro\t\t{77BC1F}$10.000"},
	{"Buy"}, {"Cancel"}}
};

// -- game server : statements
new GameData[GAME_DATA];

// -- game server : include statements
#include "teams.data.pwn"
#include "stations.data.pwn"

// -- API funcitions : Set Position Ex by Array of coordinates
game_SetPosEx(playerid, GAME_TELEPORT:teleid) {
	SetPlayerPos(playerid, GAME_TELEPOS[teleid][POS_X], GAME_TELEPOS[teleid][POS_Y], GAME_TELEPOS[teleid][POS_Z]);
	SetPlayerFacingAngle(playerid, GAME_TELEPOS[teleid][POS_A]);
	SetPlayerInterior(playerid, GAME_TELEPOS[teleid][INTERIOR_ID]);
	SetPlayerVirtualWorld(playerid, GAME_TELEPOS[teleid][WORLD_ID]);
	SetCameraBehindPlayer(playerid);
}
// -- API funcitions : Random Position Ex by Array of coordinates
game_SetRandomPosEx(playerid, const coords[][COORDS_EX], max = sizeof(coords)) {
	new rand = random(max);
	SetPlayerPos(playerid, coords[rand][POS_X], coords[rand][POS_Y], coords[rand][POS_Z]);
	SetPlayerFacingAngle(playerid, coords[rand][POS_A]);
	SetPlayerInterior(playerid, coords[rand][INTERIOR_ID]);
	SetPlayerVirtualWorld(playerid, coords[rand][WORLD_ID]);
	SetCameraBehindPlayer(playerid);	
}
// -- API funcitions : dialogs
game_ShowDialog(playerid, GAME_DIALOGS:dialogid) {
	ShowPlayerDialog(playerid, _:dialogid, GAME_DIALOG_DATA[dialogid][0][0],
	GAME_DIALOG_DATA[dialogid][1], GAME_DIALOG_DATA[dialogid][2],
	GAME_DIALOG_DATA[dialogid][3], GAME_DIALOG_DATA[dialogid][4]);
}
// -- API funcitions : Random Position by Array of delimiter coordinatede
game_SetDelimiterRandomPos(Float:delimiter[], &Float:x, &Float:y) {
	new Float:decimalx = floatdiv(random(9999), 10000);
	new Float:decimaly = floatdiv(random(9999), 10000);

	new xd = floatround(floatsub(delimiter[2], delimiter[0]), floatround_tozero);
	new yd = floatround(floatsub(delimiter[3], delimiter[1]), floatround_tozero);

	if(xd != 0) x = floatadd(random(xd), delimiter[0]);
	if(yd != 0) y = floatadd(random(yd), delimiter[1]);

	x = floatadd(x, decimalx);
	y = floatadd(y, decimaly);
}

game_validateName(playerid) {
	new playername[MAX_PLAYER_NAME];
	GetPlayerName(playerid, playername, MAX_PLAYER_NAME);
	if (strlen(playername) < 4) return 0;

	if (('0' <= playername[0] <= '9') || playername[0] == '.' || playername[0] == '_') return 0;
	new const invalid[] = {"[]()$@"};
	for (new i, l = strlen(invalid); i != l; i++)
	{
		if(strfind(playername, invalid[i], true) == -1) continue;
		return 0;
	}
	new point = strfind(playername, ".");
	if (playername[point+1] == '.') return 0;
	return 1;
}

// -- Commands : basic server commands
cmd:help(playerid) {
	return 1;
}
cmd:gamemode(playerid) {
	return 1;
}
// -- Server : 
cmd:pm(playerid) {
	return 1;
}
cmd:admnins(playerid) {
	return 1;
}
// -- Commands : Commands for picking up items
cmd:camera(playerid) {
	GivePlayerWeapon(playerid, 43, 1);
	return 1;
}
cmd:parachute(playerid) {
	GivePlayerWeapon(playerid, 46, 1);
	return 1;
}