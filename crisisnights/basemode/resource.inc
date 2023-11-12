// -- definition macros : settings
#if defined MAX_PLAYERS
	#undef MAX_PLAYERS
#define MAX_PLAYERS (128) 
	#endif

#if defined MAX_PLAYER_NAME
	#undef MAX_PLAYER_NAME
#define MAX_PLAYER_NAME (18) 
	#endif

#define MAX_TEXT_CHAT (100)

// -- shortcuts : loops
#define gTimes(%0,%1) for (new %1=0; %1 != %0; %1 ++)
#define rTimes(%0,%1) for (new %1=%0; %1 != -1; %1 --)
#define yTimes(%0,%1,%2) for (new %2=%0; %2 <= %1; %2 ++)

// -- API : player data
#define player. player_
#define player_set(%0,%1,%2) PlayerGame[%0][%1] = %2
#define player_get(%0,%1) _:PlayerGame[%0][%1]
#define player_gettag(%0,%1) PlayerGame[%0][%1]
#define player_settimer(%0,%1,%2) PlayerGame[%0][TIMERS][%1] = gettime() + %2
#define player_gettimer(%0,%1) PlayerGame[%0][TIMERS][%1]
#define player_addstate(%0,%1) PlayerGame[%0][STATE] |= %1
#define player_remstate(%0,%1) PlayerGame[%0][STATE] &= ~%1
#define player_getstate(%0,%1) (PlayerGame[%0][STATE] & %1)

// -- API : game data
#define game. game_
#define game_alert(%0,%1,%2) SendClientMessage(%0, GAME_MESSAGE_COLORS[%1],%2)
#define game_call(%0,%1) SendClientMessageToAll(GAME_MESSAGE_COLORS[%0],%1)
#define game_text(%0,%1) GameTextForPlayer(%0,%1,1000,5)

#define game_add(%0,%1,%2) GameData[%0][%1] = %2
#define game_append(%0,%1,%2) GameData[%0][%1] += %2
#define game_get(%0,%1) GameData[%0][%1]
#define game_set(%0,%1,%2,%3) GameData[%0][%1][%2] = %3
#define game_iset(%0,%1,%2) GameData[%0][%1] = %2

#define game_getf(%0,%1,%2) GameData[%0][%1][%2]

// API : FLAGS
enum FLAGS (<<= 1) {}
#define binSet(%0,%1) %0 |= FLAGS:(1 << %1)
#define binUnset(%0,%1) %0 &= ~FLAGS:(1 << %1)
#define binGet(%0,%1) (%0 & FLAGS:(1 << %1))
#define binSize(%0) _:%0
#define binReset(%0) %0 = FLAGS:0

// API : F

// not workingo for 2d arrays
stock insertion_sort(arr[][], by=0, width=1, l = sizeof(arr)) {
	for (new i = 1; i < l; i++) {
		new key = arr[i][by];
		new j = i - 1;

		while(j >= 0 && arr[j][by] > key) {
			for (new x; x < width; x ++) {
				arr[j+1][x] = arr[j][x];
			}
			j = j-1;
		}
		for (new x; x < width; x ++) {
			arr[j+1][x] = arr[i][x];
		}
	}
}


