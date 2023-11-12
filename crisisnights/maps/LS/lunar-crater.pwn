
enum GENERAL_SERVER_MAP
{
	
}

new map_LunarCrater[23];

index_lsmap_LunarCrater(bool:action, Float:movezaxis=100.0)
{
	print("Creating LS map 'LunarCrater 4x5'3...");
	if(action)
	{
		// solo (23)
		map_LunarCrater[0] = CreateDynamicObject(4348, -58.33594, -2096.39063, -34.0469+movezaxis, 0.0, 0.0, 0.0, 1, 1, -1, 300.0, 300.0);
		map_LunarCrater[1] = CreateDynamicObject(4347, -70.55469, -1716.74219, -37.38281+movezaxis, 0.0, 0.0, 0.0, 1, 1, -1, 300.0, 300.0);
		map_LunarCrater[2] = CreateDynamicObject(4349, -12.10156, -2471.50781, -45.57031+movezaxis, 0.0, 0.0, 0.0, 1, 1, -1, 300.0, 300.0);
		map_LunarCrater[3] = CreateDynamicObject(4246, 272.48438, -2210.70313, -29.25781+movezaxis, 0.0, 0.0, 0.0, 1, 1, -1, 300.0, 300.0);

		map_LunarCrater[4] = CreateDynamicObject(4245, 272.48438, -2012.19531, -15.47656+movezaxis, 0.0, 0.0, 0.0, 1, 1, -1, 300.0, 300.0);
		map_LunarCrater[5] = CreateDynamicObject(4241, 496.41406, -2210.70313, -29.25781+movezaxis, 0.0, 0.0, 0.0, 1, 1, -1, 300.0, 300.0);
		map_LunarCrater[6] = CreateDynamicObject(4289, 801.65625, -2162.19531, -19.30469+movezaxis, 0.0, 0.0, 0.0, 1, 1, -1, 300.0, 300.0);
		map_LunarCrater[7] = CreateDynamicObject(4344, 801.65625, -1996.77344, -31.57813+movezaxis, 0.0, 0.0, 0.0, 1, 1, -1, 300.0, 300.0);

		map_LunarCrater[8] = CreateDynamicObject(4288, 801.65625, -2387.19531, -20.97656+movezaxis, 0.0, 0.0, 0.0, 1, 1, -1, 300.0, 300.0);
		map_LunarCrater[9] = CreateDynamicObject(4242, 496.41406, -2435.70313, -29.25781+movezaxis, 0.0, 0.0, 0.0, 1, 1, -1, 300.0, 300.0);
		map_LunarCrater[10] = CreateDynamicObject(4247, 272.48438, -2409.20313, -29.25781+movezaxis, 0.0, 0.0, 0.0, 1, 1, -1, 300.0, 300.0);
		map_LunarCrater[11] = CreateDynamicObject(4248, 272.48438, -2609.95313, -34.00781+movezaxis, 0.0, 0.0, 0.0, 1, 1, -1, 300.0, 300.0);

		map_LunarCrater[12] = CreateDynamicObject(4243, 496.41406, -2660.70313, -34.00781+movezaxis, 0.0, 0.0, 0.0, 1, 1, -1, 300.0, 300.0);
		map_LunarCrater[13] = CreateDynamicObject(4286, 801.65625, -2711.45313, -24.05469+movezaxis, 0.0, 0.0, 0.0, 1, 1, -1, 300.0, 300.0);
		map_LunarCrater[14] = CreateDynamicObject(4283, 1157.07813, -2711.45313, -8.75+movezaxis, 0.0, 0.0, 0.0, 1, 1, -1, 300.0, 300.0);
		map_LunarCrater[15] = CreateDynamicObject(4243, 496.41406, -2660.70313, -34.00781+movezaxis, 0.0, 0.0, 0.0, 1, 1, -1, 300.0, 300.0);

		map_LunarCrater[16] = CreateDynamicObject(4350, -50.87500, -2828.79688, -46.3125+movezaxis, 0.0, 0.0, 0.0, 1, 1, -1, 300.0, 300.0);
		map_LunarCrater[17] = CreateDynamicObject(4249, 272.48438, -2836.52344, -48.507813+movezaxis, 0.0, 0.0, 0.0, 1, 1, -1, 300.0, 300.0);
		map_LunarCrater[18] = CreateDynamicObject(4244, 496.41406, -2860.77344, -48.507813+movezaxis, 0.0, 0.0, 0.0, 1, 1, -1, 300.0, 300.0);
		map_LunarCrater[19] = CreateDynamicObject(4240, 496.4141, -2012.1953, -15.5469+movezaxis, 0.0, 0.0, 0.0, 1, 1, -1, 300.0, 300.0);

		map_LunarCrater[20] = CreateDynamicObject(4285, 1157.07813, -2435.70313, -4.90625+movezaxis, 0.0, 0.0, 0.0, 1, 1, -1, 300.0, 300.0);
		map_LunarCrater[21] = CreateDynamicObject(4287, 801.65625, -2911.52344, -69.5625+movezaxis, 0.0, 0.0, 0.0, 1, 1, -1, 300.0, 300.0);
		map_LunarCrater[22] = CreateDynamicObject(4284, 1157.07813, -2911.52344, -54.25781+movezaxis, 0.0, 0.0, 0.0, 1, 1, -1, 300.0, 300.0);

		gTimes<sizeof(map_LunarCrater),x>
		{
		//SetDynamicObjectMaterial(map_LunarCrater, 0, 10755, "airportrminl_sfse", "ws_rotten_concrete1", 0x00000000);
		//SetDynamicObjectMaterial(map_LunarCrater, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000); // lunar 1
		//SetDynamicObjectMaterial(map_LunarCrater, 0, 10765, "airportgnd_sfse", "ws_whiteplaster_top", 0x00000000); //lunar 2 (Mais claro)
			SetDynamicObjectMaterial(map_LunarCrater[x], 0, 4833, "airprtrunway_las", "greyground256", 0x00000000); //lunar 4 (Melhor too)
		//SetDynamicObjectMaterial(map_LunarCrater, 0, 10370, "alleys_sfs", "ws_asphalt", 0x00000000);//lunar 5 mds good
		}
	}
	else
	{
		gTimes<sizeof(map_LunarCrater),x>
		{
			DestroyDynamicObject(map_LunarCrater[x]);
		}
	}
	return 1;	
}
cmd:lunarcrater(playerid)
{
	SetPlayerVirtualWorld(playerid, 1);
	SetPlayerInterior(playerid, 1);
	SendClientMessage(playerid, -1, "Gravity is 0.00132150505");
	SetPlayerPos(playerid, -70.55469, -1716.74219, -37.38281+101.0);
	return 1;
}
