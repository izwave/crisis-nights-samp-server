#define COMPANIE_CAPITAL_AMOUNT 7
#define COMPANIE_CAPITAL_MINUTES 21
#define COMPANIE_CIRCLE_SIZE 8.0
#define CAPITAL_MODE_COLOR 0x9400D3BC

enum COMPANIE_INDEX
{
	// LOCAL
	COMPANIE_CAPITAL,
	COMPANIE_OCEAN_SIDE,
	COMPANIE_SANTA_MARIA,
	COMPANIE_VERDANT,
	COMPANIE_DOWNTOWN,
	COMPANIE_MULHOLLAND,
	COMPANIE_LAS_COLINAS,
	COMPANIE_IDLEWOOD,
	// INTERLOCAL
	COMPANIE_ANGEL_PINE,
	COMPANIE_FALLEN_TREE,
	COMPANIE_EASTER_BAY,
	COMPANIE_MONTGOMERY,
	COMPANIE_PALOMINO_CREEK
	// EXTERANAL
}

new DomainCompanies[3][COMPANIE_INDEX];


index_init_DomainCompanies(bool:action)
{
	if(action)
	{
		DomainCompanies[0][COMPANIE_CAPITAL] = CreateDynamicCylinder(701.785400, -446.865300, 5.64840, 21.6484, COMPANIE_CIRCLE_SIZE, 0, 0);
		DomainCompanies[1][COMPANIE_CAPITAL] = CreateDynamicObject(19945, 701.785400, -446.865300, 15.289000, 0.000000, 0.000000, 0.000000, 0, 0, -1, 300.00, 300.00);
		DomainCompanies[2][COMPANIE_CAPITAL] = GangZoneCreate(498, -662.5, 898, -262.5);

		DomainCompanies[0][COMPANIE_OCEAN_SIDE] = CreateDynamicCylinder(2742.56104, -2465.78174, 5.64840, 21.6484, COMPANIE_CIRCLE_SIZE, 0, 0);
		DomainCompanies[1][COMPANIE_OCEAN_SIDE] = CreateDynamicObject(19945, 2742.56104, -2465.78174, -12.61360, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
		DomainCompanies[2][COMPANIE_OCEAN_SIDE] = GangZoneCreate(2542.991210, -2657.494262, 2942.991210, -2257.494262);

		DomainCompanies[0][COMPANIE_SANTA_MARIA] = CreateDynamicCylinder(380.279390, -2078.86890, -1.2014, 14.7986, COMPANIE_CIRCLE_SIZE, 0, 0);
		DomainCompanies[1][COMPANIE_SANTA_MARIA] = CreateDynamicObject(19945, 380.279390, -2078.86890, 6.7986000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
		DomainCompanies[2][COMPANIE_SANTA_MARIA] = GangZoneCreate(178.984375, -2267.484375, 578.984375, -1867.484375);

		DomainCompanies[0][COMPANIE_VERDANT] = CreateDynamicCylinder(1549.34338, -2087.08252, 17.5156, 33.5156, COMPANIE_CIRCLE_SIZE, 0, 0);
		DomainCompanies[1][COMPANIE_VERDANT] = CreateDynamicObject(19945, 1549.34338, -2087.08252, -31.42631, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
		DomainCompanies[2][COMPANIE_VERDANT] = GangZoneCreate(1348.9800415039062, -2287.4855041503906, 1748.9800415039062, -1887.4855041503906);

		DomainCompanies[0][COMPANIE_DOWNTOWN] = CreateDynamicCylinder(1544.70313, -1353.26953, 318.03223, 334.03223, COMPANIE_CIRCLE_SIZE, 0, 0);
		DomainCompanies[1][COMPANIE_DOWNTOWN] = CreateDynamicObject(19945, 1544.70313, -1353.26953, 326.03223, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
		DomainCompanies[2][COMPANIE_DOWNTOWN] = GangZoneCreate(1340.9827880859375, -1554.48974609375, 1740.9827880859375, -1154.48974609375);

		DomainCompanies[0][COMPANIE_MULHOLLAND] = CreateDynamicCylinder(1042.98035, -907.853880, 33.3416, 49.3416, COMPANIE_CIRCLE_SIZE, 0, 0);
		DomainCompanies[1][COMPANIE_MULHOLLAND] = CreateDynamicObject(19945, 1042.98035, -907.853880, 41.341600, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
		DomainCompanies[2][COMPANIE_MULHOLLAND] = GangZoneCreate(840, -1111.5001831054688, 1240, -711.5001831054688);

		DomainCompanies[0][COMPANIE_LAS_COLINAS] = CreateDynamicCylinder(2553.23730, -1127.17090, 52.6735, 68.6735, COMPANIE_CIRCLE_SIZE, 0, 0);
		DomainCompanies[1][COMPANIE_LAS_COLINAS] = CreateDynamicObject(19945, 2553.23730, -1127.17090, 60.673500, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
		DomainCompanies[2][COMPANIE_LAS_COLINAS] = GangZoneCreate(2356.98828125, -1325.48828125, 2756.98828125, -925.48828125);

		DomainCompanies[0][COMPANIE_IDLEWOOD] = CreateDynamicCylinder(2164.82007, -1800.71326, 4.32050, 20.3205, COMPANIE_CIRCLE_SIZE, 0, 0);
		DomainCompanies[1][COMPANIE_IDLEWOOD] = CreateDynamicObject(19945, 2164.82007, -1800.71326, 12.320500, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
		DomainCompanies[2][COMPANIE_IDLEWOOD] = GangZoneCreate(1966.0003662109375, -1999.5, 2366.0003662109375, -1599.5);

		gTimes<_:COMPANIE_INDEX,x>
		{
			SetDynamicObjectMaterial(DomainCompanies[1][COMPANIE_INDEX:x], 0, 10850, "bakerybit2_sfse", "frate64_blue", 0x00000000);
		}
	}
	else
	{
		gTimes<_:COMPANIE_INDEX,x>
		{
			DestroyDynamicObject(DomainCompanies[1][COMPANIE_INDEX:x]);
			GangZoneDestroy(DomainCompanies[2][COMPANIE_INDEX:x]);
		}
	}
}

index_ShowDomainCompanies(playerid, bool:action)
{
	if(action)
	{
		yTimes<1,_:COMPANIE_INDEX,x>
		{
			//new inttmp = floatround(floatlog(float(_:ServerDataInPlay[COMPANIES_TEAMMODE][x]), 2.0));		
			new inttmp = _:cn.GetCompanyTeam(COMPANIE_INDEX:x);
			GangZoneShowForPlayer(playerid, DomainCompanies[2][COMPANIE_INDEX:x], (PlayerTeamColor[inttmp] &~0xFF) | 0xBC); 
		}
	}
	else
	{
		gTimes<_:COMPANIE_INDEX,x>
		{
			GangZoneHideForPlayer(playerid, DomainCompanies[2][COMPANIE_INDEX:x]);
		}
	}
}

public OnPlayerEnterCompany(playerid, COMPANIE_INDEX:companyid)
{	
	if((companyid != COMPANIE_CAPITAL && cn.GetCompanyStatus(companyid)) || IsPlayerInAnyVehicle(playerid)) return 0;

	if(cn.GetCompanyMode())
	{
		switch(companyid)
		{
			case (COMPANIE_CAPITAL):
			{
				if (cn.GetCompanyTeam(companyid) != cn.GetPlayerTeam(playerid))
				{
					new capitaltime = cn.GetCompanyDelayTime(companyid);
					if(capitaltime)
					{
						new strcu[82];
						format(strcu, sizeof(strcu), "Ainda restam %i s e %i Minutos. Proteja este local contra dominios.", capitaltime, capitaltime / 60);
						SendClientMessage(playerid, -1, strcu);
					}
					return 1;
				}
				new countertmp = cn.GetCompanyIndexTag(COMPANIE_TYPE_LOCAL, PlayerDataInPlay[playerid][SINGLE_PLAYER_COMPANIES]);
				if(countertmp != 7)
				{
					new tmp[90];
					format(tmp, sizeof(tmp), "~h~~h~~h~~r~You cannot control..~n~~w~There are still ~h~~h~~h~~b~%02d ~w~companies left.", 7-countertmp);
					GameTextForPlayer(playerid, tmp, 5000, 5);
					return 0;
				}
				cn.SetCompanyDelayTime(companyid, gettime() + random(15) + (60 * COMPANIE_CAPITAL_AMOUNT)); // +7 Min
				GameTextForPlayer(playerid, "~h~~h~~y~Congratulations!~n~You have dominated all companies and fortified your flag.", 3000, 5);
				return 1;
			}
			default:
			{
				if(cn.GetCompanyTeam(companyid) != cn.GetPlayerTeam(playerid))
					return GameTextForPlayer(playerid, "~h~~h~~b~Your team has no power.~n~~w~Recover by controlling the ~h~~h~~h~~y~capital!", 3000, 5);
				
				new SERVER_GENERAL_COMPANIES:companytagtmp = COMPANIES_BASIC_NONE;
				cn.GetCompanyIndexTag(COMPANIE_TYPE_LOCAL, companytagtmp, _:companyid);
				if(PlayerDataInPlay[playerid][SINGLE_PLAYER_COMPANIES] & companytagtmp)
					return GameTextForPlayer(playerid, "~h~~h~~g~This company is already incorporated.~n~You need to incorporate another company!", 3000, 5);
			}
		}
	}
	else 
	{
		if(!companyid)
		{
			GameTextForPlayer(playerid, "~h~~h~~r~The capital is not active.", 3000, 5);
			return 0;
		}
		if (cn.GetCompanyTeam(companyid) == cn.GetPlayerTeam(playerid))
		{
			GameTextForPlayer(playerid, "~h~~h~~r~Owned by your team.", 3000, 5);
			return 0;
		}
	}
	// Company
	cn.SetCompanyStatus(companyid, true); // Man domain
	cn.SetCompanyDomainTime(companyid, gettime() + minrand(25, 40)); // [25-40] s
	GangZoneFlashForAll(DomainCompanies[2][COMPANIE_INDEX:companyid],
	(ServerDataInPlay[COMPANIES_DOMAIN][0]) ? CAPITAL_MODE_COLOR : ((PlayerTeamColor[(GetPlayerTeam(playerid))] &~0xFF) | 0xAA));
	
	// Player
	cn.SetPlayerState(playerid, STATE_COMPANIE_DOMAIN);
	OnPlayerDomainCompany(playerid, companyid);
	GameTextForPlayer(playerid, "~h~~h~~b~Wait between 25 and 40 seconds~n~For domain completion", 3000, 5);
	return 1;
}

public OnPlayerDomainCompany(playerid, COMPANIE_INDEX:companyid)
{
	if(!(cn.GetPlayerState(playerid, STATE_COMPANIE_DOMAIN)))
	{
		// Company
		cn.SetCompanyDomainTime(companyid, -1);
		cn.SetCompanyStatus(companyid, false);
		GangZoneStopFlashForAll(DomainCompanies[2][COMPANIE_INDEX:companyid]);
		return 1;
	}
	new sec = cn.GetCompanyDomainTime(companyid);
	switch (sec)
	{
		case 0:
		{
			// Company
			cn.SetCompanyStatus(companyid, false);
			cn.SetCompanyTeam(companyid, cn.GetPlayerTeam(playerid));
			cn.SetCompanyDomainTime(companyid, -1);
			GangZoneStopFlashForAll(DomainCompanies[2][COMPANIE_INDEX:companyid]);
			GangZoneHideForAll(DomainCompanies[2][COMPANIE_INDEX:companyid]);
			new colortmp = _:cn.GetPlayerTeam(playerid);
			GangZoneShowForAll(DomainCompanies[2][COMPANIE_INDEX:companyid], ((PlayerTeamColor[colortmp] &~ 0xFF) | 0xBC));

			// Player
			cn.SetPlayerState(playerid, STATE_COMPANIE_DOMAIN, false); // remove
			cn_Text(playerid, "{2DB6A7}Congratulations. You just dominated this local company.");
			PlayerPlaySound(playerid, 5203, 0.0, 0.0, 0.0);

			new SERVER_GENERAL_COMPANIES:companytagtmp;
			cn.GetCompanyIndexTag(COMPANIE_TYPE_LOCAL, companytagtmp, _:companyid);
			PlayerDataInPlay[playerid][SINGLE_PLAYER_COMPANIES] |= companytagtmp;
			
			if(cn.GetCompanyMode()) 
			{
				new timersec = cn.GetCompanyDelayTime(COMPANIE_CAPITAL);
				if(!timersec)
				{
					cn.SetCompanyMode(false);
					GangZoneHideForAll(DomainCompanies[2][COMPANIE_CAPITAL]);
				}
				return 1;
			}
			// Checks and analyzes capital mode;
			new checkcount = 0;
			yTimes<1,_:COMPANIE_INDEX,x>
			{
				if(cn.GetCompanyTeam(COMPANIE_INDEX:x) != cn.GetPlayerTeam(playerid)) continue;
				checkcount ++;
			}
			if(checkcount != 7) return 1;

			// Capital
			cn.SetCompanyMode(true);
			cn.SetCompanyTeam(COMPANIE_CAPITAL, PlayerDataInPlay[playerid][SINGLE_PLAYER_TEAM]);
			cn.SetCompanyDelayTime(COMPANIE_CAPITAL, gettime() + random(15) + (60 * COMPANIE_CAPITAL_MINUTES)); // 21 min
			
			// It's on!
			GangZoneHideForAll(DomainCompanies[2][COMPANIE_CAPITAL]);
			GangZoneShowForAll(DomainCompanies[2][COMPANIE_CAPITAL], CAPITAL_MODE_COLOR);

			SendClientMessageToAll(0x3A3BDCFF, "Todas as empresas foram dominazadas. Modo capital ativado.");
		}
		case 1..60:
		{
			new strtmp[] = "~h~~h~~g~100s";
			SetTimerEx("OnPlayerDomainCompany", 1000, false, "ii", playerid, _:companyid);
			format(strtmp, sizeof(strtmp), "~h~~h~~g~%02ds", cn.GetCompanyDomainTime(companyid));
			GameTextForPlayer(playerid, strtmp, 1000, 5);
			PlayerPlaySound(playerid, 4203, 0.0, 0.0, 0.0);
			return 1;
		}
	}
	return 1;
}