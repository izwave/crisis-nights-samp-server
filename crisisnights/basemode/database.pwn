game_Instance() {
	if((GameData[DB][USERS] = db_open("users.db")) == DB:0)
	{
		// Error
		print("Failed to open a connection to \"users.db\".");
		SendRconCommand("exit");
	}
	else
	{
        new tmp[414];
		format(tmp, sizeof(tmp), "CREATE TABLE IF NOT EXISTS user");
        format(tmp, sizeof(tmp), "%s (id INTEGER PRIMARY KEY AUTOINCREMENT,", tmp);
        format(tmp, sizeof(tmp), "%s nickname TEXT DEFAULT '',", tmp);
        format(tmp, sizeof(tmp), "%s password TEXT DEFAULT '',", tmp);
        format(tmp, sizeof(tmp), "%s user_name TEXT DEFAULT '',", tmp);
        format(tmp, sizeof(tmp), "%s ip TEXT DEFAULT '',", tmp);
        format(tmp, sizeof(tmp), "%s first_time TEXT DEFAULT '',", tmp);
        format(tmp, sizeof(tmp), "%s last_time TEXT DEFAULT '',", tmp);
        format(tmp, sizeof(tmp), "%s score INTEGER DEFAULT 0,", tmp);
        format(tmp, sizeof(tmp), "%s kills INTEGER DEFAULT 0,", tmp);
        format(tmp, sizeof(tmp), "%s deaths INTEGER DEFAULT 0,", tmp);
        format(tmp, sizeof(tmp), "%s money INTEGER DEFAULT 0,", tmp);
        format(tmp, sizeof(tmp), "%s tk INTEGER DEFAULT 0,", tmp);
        format(tmp, sizeof(tmp), "%s exp INTEGER DEFAULT 0,", tmp);
        format(tmp, sizeof(tmp), "%s days INTEGER DEFAULT 0);", tmp);
        db_query(game.get(DB, USERS), tmp);
        print("\topen instance to \"users.db\"");
	}
}
game_playerRegister(playerid, const password[]) {
    
    new tmp[128], playername[MAX_PLAYER_NAME], ip[16] ,day, month, year;
    GetPlayerName(playerid, playername, MAX_PLAYER_NAME);
    GetPlayerIp(playerid, ip, 16);
    getdate(year, month, day);

    // -- register : insert player and basic data in table
    format(tmp, sizeof(tmp), "INSERT INTO user (nickname, password, ip, first_time)");
    format(tmp, sizeof(tmp), "%s VALUES ('%s', '%s', '%s', '%02d-%02d-%02d');", tmp, playername, password, ip, year, month, day);
    db_query(game.get(DB, USERS), tmp);

    // -- primary key : get player id from record for future data update
    new DBResult:result;
    format(tmp, sizeof(tmp), "SELECT id FROM user WHERE name = '%s'", playername);
    result = db_query(game.get(DB, USERS), tmp);
    if(db_num_rows(result))
    {
        player.set(playerid, PK, db_get_field_assoc_int(result, "id"));
    }
    db_free_result(result);
    return 1;
}


/* database = users.db
[user]
- id *pk
- nickname
- password
- user_name
- ip
- first_time
- last_time
- score
- kills
- deaths
- money
- tk
- exp
- days

[admin]
- id *fk
- date
- level
- state
- key

[premium]
- id *fk
- date
- state
- expire

*/

