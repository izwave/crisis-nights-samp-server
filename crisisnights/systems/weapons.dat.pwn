enum SERVER_WEAPON_DATA
{
	SERVER_WEAPON_ID,
	SERVER_WEAPON_SLOT,
	SERVER_WEAPON_MODEL,
	Float:SERVER_WEAPON_DAMAGE,
	Float:SERVER_WEAPON_RANGE,
	Float:SERVER_WEAPON_PLAYER_RANGE,
}

new const weaponsdata[][SERVER_WEAPON_DATA] =
{
	{WEAPON_BRASSKNUCKLE, 0, 331},
	{WEAPON_GOLFCLUB, 1, 333},
	{WEAPON_NITESTICK, 1, 334},
	{WEAPON_KNIFE, 1, 335},
	{WEAPON_BAT, 1, 336},
	{WEAPON_SHOVEL, 1, 337},
	{WEAPON_POOLSTICK, 1, 338},
	{WEAPON_KATANA, 1, 339},
	{WEAPON_CHAINSAW, 1, 341},
	{WEAPON_DILDO, 10, 321},
	{WEAPON_DILDO2, 10, 322},
	{WEAPON_VIBRATOR, 10, 323},
	{WEAPON_VIBRATOR2, 10, 324},
	{WEAPON_FLOWER, 10, 325},
	{WEAPON_CANE, 10, 326},
	{WEAPON_GRENADE, 8, 342},
	{WEAPON_TEARGAS, 8, 343},
	{WEAPON_MOLTOV, 8, 344},
	{WEAPON_COLT45, 2, 346},
	{WEAPON_SILENCED, 2, 347},
	{WEAPON_DEAGLE, 2, 348},
	{WEAPON_SHOTGUN, 3, 349},
	{WEAPON_SAWEDOFF, 3, 350},
	{WEAPON_SHOTGSPA, 3, 351},
	{WEAPON_UZI, 3, 352},
	{WEAPON_MP5, 4, 353},
	{WEAPON_AK47, 5, 355},
	{WEAPON_M4, 5, 356},
	{WEAPON_TEC9, 4, 372},
	{WEAPON_RIFLE, 6, 357},
	{WEAPON_SNIPER, 6, 358},
	{WEAPON_ROCKETLAUNCHER, 7, 359},
	{WEAPON_HEATSEEKER, 7, 360},
	{WEAPON_FLAMETHROWER, 7, 361},
	{WEAPON_MINIGUN, 7, 362},
	{WEAPON_SATCHEL, 8, 363},
	{WEAPON_BOMB, 12, 364},
	{WEAPON_SPRAYCAN, 9, 365},
	{WEAPON_FIREEXTINGUISHER, 9, 366},
	{WEAPON_CAMERA, 9, 367},
	{WEAPON_PARACHUTE, 371}
}