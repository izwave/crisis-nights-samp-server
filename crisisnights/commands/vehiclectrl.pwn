#include <pawn.cmd>

/*
	* vehicle control
	* Common vehicle server commands
*/

cmd:vspawn(playerid, params[])
{
	PlayerDataInPlay[playerid][SINGLE_PLAYER_VEHICLE][0] = CreateVehicle(PlayerDataInPlay[playerid][SINGLE_PLAYER_VEHICLE][1],
		0.0, 0.0, 0.0, 90.0, 6, 6, 200, 0);
	return 1;
}