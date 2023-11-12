// -- enums : player data


enum PLAYER_STATES (<<= 1)
{
    JOIN=1,
    ACTIVE,
    TEAM_ZONE,
	IN_GAME,
	EXPERIENCE,
    PUNISHMENT
}
enum PLAYER_TIMERS
{
    GLOBAL_CHAT,
	COUNTER,
	SPAWN_VEHICLE,
	BUY_WEAPONS,
	KILLING_SKILL
}
enum PLAYER_GAME_DATA {
    PK,
    PASSWORD[28],
    PLAYER_STATES:STATE,
    TIMERS[PLAYER_TIMERS],
    GAME_TEAMS:TEAM,
    SCORE,
    MONEY,
    VEHICLE,
    DIGITAL_MONEY,
    TK_COIN,

    FLAGS:STATIONS

};

// -- Declaration : arrays

new PlayerGame[MAX_PLAYERS][PLAYER_GAME_DATA];


public OnPlayerConnect(playerid)
{	
    // -- player join : message
    new tmp[108], playername[MAX_PLAYER_NAME];
	GetPlayerName(playerid, playername, MAX_PLAYER_NAME);
    format(tmp, sizeof tmp,"\\Unite> {bc1616}'%s' {FFFFFF}Connected to the server - Crisis Nights <{43E9E9}?!{FFFFFF}>", playername); 
    SendClientMessageToAll(0x74bc16FF, tmp);
    player.addstate(playerid, JOIN);

    // -- show player : posts gangzones
    gTimes(MAX_POSTS,x) {
        new GAME_TEAMS:teamid = game_Station[x][TEAM];
		GangZoneShowForPlayer(playerid, game.get(GZONE_POSTS, x), (GAME_TEAM_COLOR[teamid] &~0xFF) | 0xBC);
    }

    // -- show player : team gray
    GangZoneShowForPlayer(playerid, game.get(GZONE_TEAMS, TEAM_GRAY), (GAME_TEAM_COLOR[GRAY] &~0xFF) | 0xAA);

    // -- remove buildings
    game.RemoveBuilding(playerid);
    
    // -- login
    format(tmp, sizeof(tmp), "SELECT password FROM user WHERE nickname = '%s'", playername);
    new DBResult:result = db_query(game.get(DB, USERS), tmp);
    if(db_num_rows(result)) // registered
    {
        print("!!foi encontrado a conta");
        db_get_field_assoc(result, "password", player.gettag(playerid, PASSWORD), 28);
        game.ShowDialog(playerid, SIGN_IN);
    }
    else // not registered
    {
        print("não foi encontrado a conta");
        if(game.validateName(playerid)) {
            game.ShowDialog(playerid, SIGN_UP);
        }
        else
        {
            //edit name
        }
    }
    db_free_result(result);
    return 1;
}
public OnPlayerDisconnect(playerid, reason)
{
    // -- player left : message


    // reset data
    new tmp[PLAYER_GAME_DATA];
    PlayerGame[playerid] = tmp;

    return 1;
}

public OnPlayerText(playerid, text[])
{
    // -- player chat : delay timer
    if (player.gettimer(playerid, GLOBAL_CHAT) > gettime()) {
        game.alert(playerid, WARNING, "Don't write fast in global chat.");
        player.settimer(playerid, GLOBAL_CHAT, 2);
        return 0;
    }
    // -- player chat : character limit
    if (strlen(text) > MAX_TEXT_CHAT) return 0;

    // -- player chat : standardized global message
    new tmp[MAX_TEXT_CHAT + MAX_PLAYER_NAME + 12], playername[MAX_PLAYER_NAME];
    GetPlayerName(playerid, playername, MAX_PLAYER_NAME);
    format(tmp, sizeof (tmp), "%s{FFFFFF}/%i > %s", playername, playerid, text);
    SendClientMessageToAll(GetPlayerColor(playerid), tmp);
    player.settimer(playerid, GLOBAL_CHAT, 4);
	return 0;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
    if (newstate == PLAYER_STATE_PASSENGER) {
        new seats[6] = {-1,...};
        gTimes(GetPlayerPoolSize()+1,x) {
            if(!IsPlayerInVehicle(x, GetPlayerVehicleID(playerid))) continue;
            if (0 <= GetPlayerVehicleSeat(x) <= 5) seats[GetPlayerVehicleSeat(x)] = x;
        }
        if (seats[0] == -1) // -- driverless vehicle
        {
            gTimes(sizeof(seats),x) {
                if(seats[x] == -1) continue;
                game.text(seats[x], "~d~~d~~r~Driverless ~w~vehicle");
                RemovePlayerFromVehicle(seats[x]);
            }
        }
        else // -- passenger from different team
        {
            yTimes(1,sizeof(seats)-1,x) {
                if(player.gettag(seats[x], TEAM) == player.gettag(seats[0], TEAM)) continue;
                if(IsPlayerConnected(seats[x])) {
                    game.text(seats[x], "~d~~d~~r~Invalid ~w~vehicle");
                    RemovePlayerFromVehicle(seats[x]);
                }
            }
        }
    }
    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid) {
		case SIGN_IN: {
            if (response) {
                game.alert(playerid, WARNING, "PARABENS, VC APERTOU NO BUTÃO 1");
                player.remstate(playerid, JOIN);
                CallLocalFunction("OnPlayerRequestClass", "ii", playerid, 0);
            } else {
                game.alert(playerid, WARNING, "Poxa, VC APERTOU NO BUTÃO 2..");
            }
		}
        case SIGN_UP: {
            if (response) {
                if(!(6 <= strlen(inputtext) <= 15))
                {
                    game.alert(playerid, WARNING, "senha muito curta ou muita longa. (8-15)");
                    game.ShowDialog(playerid, SIGN_UP);
                    return 0;
                }
                game.playerRegister(playerid, inputtext);
                game.alert(playerid, SUCCESSFUL, "Parabéns! você está registrado.");

            }
        }
	}
	return 1;
}