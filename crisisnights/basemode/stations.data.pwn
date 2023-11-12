#define POST_CAPITAL_AMOUNT 7
#define POST_CAPITAL_MINUTES 21
#define POST_CIRCLE_SIZE 8.0
#define CAPITAL_MODE_COLOR 0x9400D3BC
#define MAX_POSTS 8
#define MAX_POST_CATCH 11
#define POST_PLAYER_TIME 3

enum STATION_DATA
{
    bool:STATE,
	GAME_TEAMS:TEAM,
    TIMER,
    COUNT,
    PLAYER
}

new const nameStations[][] = {
    {"Capital"},
    {"Ocean Side"},
    {"Santa Maria"},
    {"Verdant"},
    {"Downtown"},
    {"Mulholland"},
    {"Las Colinas"},
    {"Idlewood"}
};

new game_Station[MAX_POSTS][STATION_DATA];

forward playerStation(playerid, stationid);