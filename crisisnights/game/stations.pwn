

// API Game Functions : on player enter in post
game_playerEnterStation(playerid, stationid) {
	if((stationid && game_Station[stationid][STATE]) || IsPlayerInAnyVehicle(playerid)) return 0;

	if(game_Station[0][STATE]) // -- mode : capital
	{
		switch(stationid)
		{
			case 0: // -- area : capital
			{
				if(game_Station[0][TEAM] != player.gettag(playerid, TEAM))
				{
					if(game_Station[stationid][TIMER])
					{
						new tmp[82];
						format(tmp, sizeof(tmp), "Ainda restam %i s e %i Minutos. Proteja este local contra dominios.", game_Station[stationid][TIMER], game_Station[stationid][TIMER] / 60);
						game.alert(playerid, WARNING, tmp);
					}
					return 0;
				}
				else
				{
                    new max_catch = (1 << 8) - (1 << 0);
                    new player_catch = binSize(player.gettag(playerid, STATIONS));
                    if (player_catch + 1 != max_catch) {
                        game.alert(playerid, WARNING, "Você não pode controlar. Ainda restam empresas!");
						return 0;
					}
                    game_Station[0][TIMER] = gettime() + random(15) + (60 * 7); //+7min
					game.alert(playerid, WARNING, "Parabéns!~n~Você dominou todas as empresas e fortaleceu sua bandeira.");
					return 1;
				}
            }
            default: // -- area : any
            {
                if(game_Station[stationid][TEAM] != player.gettag(playerid, TEAM)) {
                    game.alert(playerid, WARNING, "Sua equipe não tem poder. Recupere controlando a capital.");
                    return 0;
                }
                else if(binGet(player.gettag(playerid, STATIONS), stationid)) {
                    game.alert(playerid, WARNING, "Esta empresa já está incorporada. Você precisa incorporar outra empresa!");
                    return 0;
                }
            }
		}
	}
    else // mode : standard
	{
		if(!stationid) {
			game.alert(playerid, WARNING, "The capital is not active.");
			return 0;
		}
        if(game_Station[stationid][TEAM] == player.gettag(playerid, TEAM)) {
			game.alert(playerid, WARNING, "~h~~h~~r~Owned by your team.");
			return 0;
		}
	}
    // -- start to domain -- //
    game_Station[stationid][STATE] = true; 
    game_Station[stationid][PLAYER] = POST_PLAYER_TIME;  // 45
    GangZoneFlashForAll(game.get(GZONE_POSTS, stationid),
    game_Station[0][STATE] ? CAPITAL_MODE_COLOR : ((GAME_TEAM_COLOR[player.gettag(playerid, TEAM)] &~0xFF) | 0xAA));
    
	CallLocalFunction("playerStation", "ii", playerid, stationid);
	/* Player
	cn.SetPlayerState(playerid, STATE_COMPANIE_DOMAIN);
	OnPlayerDomainCompany(playerid, companyid);
	GameTextForPlayer(playerid, "~h~~h~~b~Wait between 25 and 40 seconds~n~For domain completion", 3000, 5);

    */

	return 1;
}

public playerStation(playerid, stationid)
{
	/* if player leaves 
	if(!(cn.GetPlayerState(playerid, STATE_COMPANIE_DOMAIN)))
	{
		// post
		game_Station[stationid][PLAYER] = -1;
		game_Station[stationid][STATE] = false; 
		GangZoneStopFlashForAll(game.get(GZONE_POSTS, stationid));
		return 1;
	}*/
	if(game_Station[stationid][PLAYER])
	{
		game_Station[stationid][PLAYER]--;
		new tmp[] = "~h~~h~~r~100s";
		format(tmp, sizeof(tmp), "~h~~h~~p~%02ds", game_Station[stationid][PLAYER]);
		SetTimerEx("playerStation", 1000, false, "ii", playerid, stationid);
		GameTextForPlayer(playerid, tmp, 1000, 5);
		PlayerPlaySound(playerid, 4203, 0.0, 0.0, 0.0);
	}
	else
	{
		// post : data update
		game_Station[stationid][STATE] = false; 
		game_Station[stationid][TEAM] = player.gettag(playerid, TEAM);
		game_Station[stationid][PLAYER] = -1;
		// post : zone
		new GAME_TEAMS:teamid = player.gettag(playerid, TEAM);
		game.append(STATIONS, teamid, 1);

		GangZoneStopFlashForAll(game.get(GZONE_POSTS, stationid));
		GangZoneHideForAll(game.get(GZONE_POSTS, stationid));
		GangZoneShowForAll(game.get(GZONE_POSTS, stationid), (GAME_TEAM_COLOR[teamid] &~0xFF) | 0xBC);

		// post : player
		//cn.SetPlayerState(playerid, STATE_COMPANIE_DOMAIN, false); // remove
		new tmp[47+11];
		format(tmp, sizeof(tmp), "Congratulations! You just mastered the %s station", nameStations[stationid]);
		game.alert(playerid, WARNING, tmp);
		PlayerPlaySound(playerid, 5203, 0.0, 0.0, 0.0);
		
		// Add post id as true (captured)
		binSet(player.gettag(playerid, STATIONS), stationid);
		
		if(game_Station[0][STATE]) // post : capital mode
		{
			if(!game_Station[0][TIMER]) // post : end capital mode
			{
				game_Station[0][STATE] = false;
				GangZoneHideForAll(game.get(GZONE_POSTS, 0));		
			}
			return 1;
		}
		
		// post checks : if all stations are the same and are in static state
		yTimes(1,7,x) {
			if(!game_Station[x][STATE] && game_Station[x][TEAM] == player.gettag(playerid, TEAM)) continue;
			return 0;
		}
		// capital mode : truly
		game_Station[0][STATE] = true;
		game_Station[0][TEAM] = player.gettag(playerid, TEAM);
		game_Station[0][TIMER] = gettime() + random(15) + (60 * POST_CAPITAL_MINUTES); // 21 min
		
		// It's on!
		GangZoneHideForAll(game.get(GZONE_POSTS, 0));
		GangZoneShowForAll(game.get(GZONE_POSTS, 0), CAPITAL_MODE_COLOR);
		game.call(WARNING, "Todas as empresas foram dominazadas. Modo capital ativado.");
	}
	return 1;
}