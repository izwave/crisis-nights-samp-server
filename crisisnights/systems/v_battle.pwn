new const vehicles[6][2][] =
{
	{541, "Bullet"},
	{567, "Savanna"},
	{504, "Bloodring Banger"},
	{535, "Slamvan"},
	{568, "Bandito"},
	{554, "Yosemite"}
};

cmd:vbattle(playerid, params[]) {
	new player, value;
	if (sscanf(params, "ui", player, value)) return SendClientMessage(playerid, -1, ". /vbattle [player] [value]");
	if (!IsPlayerConnected(player)) return SendClientMessage(playerid, -1, "This player has no connection");

	/*
	vehicle_battle[player1] = playerid;
	vehicle_battle[player2] = player;

	for(new o = 0; o < sizeof BattleVehicles; o++)
	{
		strcat(STR, BattleVehicles[o][1], sizeof STR);
		strcat(STR, "\n", sizeof STR);
	}
	*/
	Dialog_Show(playerid, Dialog:V_BATTLE);
	return 1;
}