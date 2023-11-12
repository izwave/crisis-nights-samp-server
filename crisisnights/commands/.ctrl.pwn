#include "..\crisisnights\cnapi\crisis_nights_api.inc"

#include "..\crisisnights\systems\vehicle-store.pwn"


//import
#include "..\crisisnights\script\menus.pwn"
#include "..\crisisnights\script\dialogs.pwn"


new veiculo, Float:floatorb[3];
cmd:vs(playerid, params[])
{
	DestroyVehicle(veiculo);
	GetPlayerPos(playerid, floatorb[0], floatorb[1], floatorb[2]);
	veiculo = CreateVehicle(522, floatorb[0], floatorb[1], floatorb[2]+2, 0.0, random(40), random(40), 30);
	new interior = GetPlayerInterior(playerid);
	new virtualw = GetPlayerVirtualWorld(playerid);
	SetVehicleVirtualWorld(veiculo, virtualw);
	LinkVehicleToInterior(veiculo, interior);
	PutPlayerInVehicle(playerid, veiculo, 0);
	return 1;
}
cmd:clima(playerid, params[])
{
	new hclima;
	if(sscanf(params, "i", hclima))return 1;
	SetPlayerWeather(playerid, hclima);
	return 1;
}
cmd:hora(playerid, params[])
{
	new hhora, hhmin;
	if(sscanf(params, "ii", hhora, hhmin))return 1;
	SetPlayerTime(playerid, hhora, hhmin);
	return 1;
}

cmd:armas(playerid)
{
	if(cn.GetPlayerDelayTimer(playerid, TIMER_BUY_WEAPONS)) return SendClientMessage(playerid, 0xA5D36FFF, "Você precisa esperar 100 segundos.");
	cn.SetPlaterDelayTimer(playerid, TIMER_BUY_WEAPONS, 100);
	SendClientMessage(playerid, 0x3D47E4FF, "Você abriu a loja de armas! KK");

	GivePlayerWeapon(playerid, WEAPON_SAWEDOFF, 250);
	GivePlayerWeapon(playerid, WEAPON_SNIPER, 250);
	GivePlayerWeapon(playerid, WEAPON_TEC9, 250);
	SetPlayerArmour(playerid, 100.0);
	SetPlayerHealth(playerid, 100.0);
	return 1;
}
cmd:skin(playerid, params[])
{
	new skinid;
	if(sscanf(params, "i", skinid)) return SendClientMessage(playerid, -1, "cmd: skin id");
	if(!(0 <= skinid <= 300)) return SendClientMessage(playerid, -1, "skins id: 0-300)");
	SetPlayerSkin(playerid, skinid);
	return 1;
}
cmd:arma(playerid)
{
	GivePlayerWeapon(playerid, WEAPON_PARACHUTE, 1);
	return 1;
}
cmd:voar(playerid)
{
	new  Float:__a, Float:__b,Float:__c;
	GetPlayerPos(playerid,  __a, __b, __c);
	SetPlayerPos(playerid, __a, __b, __c+500);
	return 1;
}
cmd:gravity(playerid, params[])
{
	new Float:gravity;
	if(sscanf(params, "f", gravity)) {
		cn_Text(playerid, "/gravity [decimal]");
		return 1;
	}
	SetGravity(gravity);
	return 1;
}
cmd:camufla(playerid)
{
	SetPlayerAttachedObject(playerid,2, 762,1,0.279999,0.049999,-0.064999,0.000000,0.000000,0.000000,0.205000,-0.094999,-0.119999);
	return 1;
}
cmd:wlevel(playerid)
{
	SetPlayerSkillLevel(playerid, WEAPONSKILL_SAWNOFF_SHOTGUN, 0);
	return 1;
}
cmd:vparams(playerid, params[])
{
	new inttmp = strval(params);
	switch(inttmp)
	{	
		case 0: SetVehicleParamsEx(vehtraintest, 0, 0, 0, 0, 0, 0, 0);
		case 1: SetVehicleParamsEx(vehtraintest, 1, 1, 0, 1, 0, 1, 1);
		default: return 0;
	}
	return 1;
}
cmd:carai(playerid)
{
	ServerDataInPlay[COMPANIES_DOMAIN][0] = true;
	return 1;
}
cmd:man(playerid)
{
	SendClientMessage(playerid, -1, "khc");
	OnPlayerDeath(playerid, INVALID_PLAYER_ID, WEAPON_SNIPER);
	SendClientMessage(playerid, -1, "khc");
	return 1;
}
cmd:kill(playerid)
{
	SetPlayerHealth(playerid, 0.0);
	return 1;
}
cmd:compania(playerid, params[])
{
	new inttmp = strval(params);
	switch(inttmp)
	{
		case 0: SetPlayerPos(playerid, 701.785400+10, -446.865300, 15.289000);
		case 1: SetPlayerPos(playerid, 2742.56104+10, -2465.78174, 13.648400);
		case 2: SetPlayerPos(playerid, 380.279390+10, -2078.86890, 6.7986000);
		case 3: SetPlayerPos(playerid, 1549.34338+10, -2087.08252, 25.515600);
		case 4: SetPlayerPos(playerid, 1544.70313+10, -1353.26953, 326.03223);
		case 5: SetPlayerPos(playerid, 2553.23730+10, -1127.17090, 60.673500);
		case 6: SetPlayerPos(playerid, 2742.56104+10, -2465.78174+10, 13.648400);
		case 7: SetPlayerPos(playerid, 2164.82007+10, -1800.71326, 20.3205-5.0);
		default: return 0;
	}
	return 1;
}
cmd:sm(playerid)
{
	ShowMenuForPlayer(ServerMenus[MENU_VEHICLESTORE], playerid);
	TogglePlayerControllable(playerid,0);
	return 1;
}
cmd:changeteam(playerid)
{
	ForceClassSelection(playerid);
    TogglePlayerSpectating(playerid, true);
    TogglePlayerSpectating(playerid, false);
	return 1;
}


cmd:st(playerid, params[])
{
	new 
		bool: poverview,
		Float: pa, 
		Float: pb,
		Float: pc,
		Float: pang,
		ptimer,
		Float: pheight,
		Float: prange,
		bool: pvision,
		bool: preverse,
		bool: prepeating,
		bool: panticlockwise
	;
	if(sscanf(params, "iiffiiii", poverview, ptimer, pheight, prange, pvision, preverse, prepeating, panticlockwise)) 
		return SendClientMessage(playerid, -1, "/st [360?] [time] [height] [range] [target?] [reverse?] [repeating?] [clockwise?]");

	GetPlayerPos(playerid, pa, pb, pc);
	GetPlayerFacingAngle(playerid, pang);
	index_SetPlayerCirCamMove(playerid, poverview, pa, pb, pc, pang, ptimer, pheight, prange, pvision, preverse, prepeating, panticlockwise);

	SendClientMessage(playerid, -1, "Executando..");
	return 1;
}
cmd:stop(playerid)
{
	index_StopPlayerCirCamMove(playerid, true);
	SendClientMessage(playerid, -1, "Movimento cancelado.");
	return 1;
}
cmd:corrida(playerid) {
	Dialog_Show(playerid, Dialog:corrida);
}