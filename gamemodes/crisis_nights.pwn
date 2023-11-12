// -- samp : 0.3.7 -- //
#include <a_samp>

// --- libraries : pawn/sa-mp
#include <sscanf2>
#include <Pawn.CMD>
#include <streamer>
#include <RGB>

// -- gamemode modules : basemode
#include "..\crisisnights\basemode\resource.inc"
#include "..\crisisnights\basemode\server.pwn"
#include "..\crisisnights\basemode\player.pwn"
#include "..\crisisnights\basemode\database.pwn"
#include "..\crisisnights\basemode\maps.pwn"

// -- gamemode modules : scriptmode
#include "..\crisisnights\scriptmode\teams.pwn"
#include "..\crisisnights\scriptmode\racing.pwn"

// --- gamemode modules : game (systems)
#include "..\crisisnights\game\stations.pwn"


main()
{
	print("\n[GAMEMODE] ** Crisis Nights Gamemode by @izwave (Izaque)\n");
}

public OnGameModeInit()
{
    // -- databse : SQLite
    print("[DATABASE]");
    game.Instance();
    // -- set : settings
    SetGameModeText("Running/Killing");
	UsePlayerPedAnims();
    DisableInteriorEnterExits();
    EnableVehicleFriendlyFire();
    // -- create : pickups
    game.add(PICKUP, BLACK_TEAM_EXIT, CreatePickup(19605, 1, 246.81580, 62.61800, 1002.95331));
	game.add(PICKUP, HIGH_HOUSE_ENTER, CreatePickup(19605, 1, 1496.96167, -687.71588, 94.80140,-1));
	game.add(PICKUP, HIGH_HOUSE_EXIT, CreatePickup(19605, 1, 234.13139, 1064.03894, 1083.45996,-1));
    // -- create : gangzones
    game.add(GZONE_TEAMS, TEAM_BLACK, GangZoneCreate(0.0, 0.0, 0.0, 0.0));
    game.add(GZONE_TEAMS, TEAM_GREEN, GangZoneCreate(0.0, 0.0, 0.0, 0.0));
    game.add(GZONE_TEAMS, TEAM_RED, GangZoneCreate(0.0, 0.0, 0.0, 0.0));
    game.add(GZONE_TEAMS, TEAM_GRAY, GangZoneCreate(1588, -1152, 1693, -1002));

    game.add(GZONE_POSTS, 0, GangZoneCreate(498, -662.5, 898, -262.5));
    game.add(GZONE_POSTS, 1, GangZoneCreate(2542.991210, -2657.494262, 2942.991210, -2257.494262));
    game.add(GZONE_POSTS, 2, GangZoneCreate(178.984375, -2267.484375, 578.984375, -1867.484375));
    game.add(GZONE_POSTS, 3, GangZoneCreate(1348.9800415039062, -2287.4855041503906, 1748.9800415039062, -1887.4855041503906));
    game.add(GZONE_POSTS, 4, GangZoneCreate(1340.9827880859375, -1554.48974609375, 1740.9827880859375, -1154.48974609375));
    game.add(GZONE_POSTS, 5, GangZoneCreate(840, -1111.5001831054688, 1240, -711.5001831054688));
    game.add(GZONE_POSTS, 6, GangZoneCreate(2356.98828125, -1325.48828125, 2756.98828125, -925.48828125));
    game.add(GZONE_POSTS, 7, GangZoneCreate(1966.0003662109375, -1999.5, 2366.0003662109375, -1599.5));
    // -- create : objects
    print("[MAPS]");
    game.mapBlack();
    game.mapGreyHouse();
    // posts objects : no need to save your id
    new first, last;
    first = CreateDynamicObject(19945, 701.785400, -446.865300, 15.289000, 0.0, 0.0, 0.0, 0, 0);
    CreateDynamicObject(19945, 2742.56104, -2465.78174, -12.61360, 0.0, 0.0, 0.0, 0, 0);
    CreateDynamicObject(19945, 380.279390, -2078.86890, 6.7986000, 0.0, 0.0, 0.0, 0, 0);
    CreateDynamicObject(19945, 1549.34338, -2087.08252, -31.42631, 0.0, 0.0, 0.0, 0, 0);
    CreateDynamicObject(19945, 1544.70313, -1353.26953, 326.03223, 0.0, 0.0, 0.0, 0, 0);
    CreateDynamicObject(19945, 1042.98035, -907.853880, 41.341600, 0.0, 0.0, 0.0, 0, 0);
    CreateDynamicObject(19945, 2553.23730, -1127.17090, 60.673500, 0.0, 0.0, 0.0, 0, 0);
    last = CreateDynamicObject(19945, 2164.82007, -1800.71326, 12.320500, 0.0, 0.0, 0.0, 0, 0);
    yTimes(first,last,x){
        SetDynamicObjectMaterial(x, 0, 10850, "bakerybit2_sfse", "frate64_blue", 0x00000000);
	}
    // -- create : dynamic areas
    game.add(AREA_POSTS, 0, CreateDynamicCylinder(701.785400, -446.865300, 5.64840, 21.6484, 8.0, 0, 0));
    game.add(AREA_POSTS, 1, CreateDynamicCylinder(2742.56104, -2465.78174, 5.64840, 21.6484, 8.0, 0, 0));
    game.add(AREA_POSTS, 2, CreateDynamicCylinder(380.279390, -2078.86890, -1.2014, 14.7986, 8.0, 0, 0));
    game.add(AREA_POSTS, 3, CreateDynamicCylinder(1549.34338, -2087.08252, 17.5156, 33.5156, 8.0, 0, 0));
    game.add(AREA_POSTS, 4, CreateDynamicCylinder(1544.70313, -1353.26953, 318.03223, 334.03223, 8.0, 0, 0));
    game.add(AREA_POSTS, 5, CreateDynamicCylinder(1042.98035, -907.853880, 33.3416, 49.3416, 8.0, 0, 0));
    game.add(AREA_POSTS, 6, CreateDynamicCylinder(2553.23730, -1127.17090, 52.6735, 68.6735, 8.0, 0, 0));
    game.add(AREA_POSTS, 7, CreateDynamicCylinder(2164.82007, -1800.71326, 4.32050, 20.3205, 8.0, 0, 0));
    // -- create : vehicles
    game.add(VEHICLE, BLACK_SPORT, CreateVehicle(415, 1448.3611, -1624.1848, 13.0302, 90.0000, 0, 0, 100));
	game.add(VEHICLE, BLACK_RHINO, CreateVehicle(432, 1445.5608, -1687.6671, 13.2750, 270.0000, -1, -1, 30));
	game.add(VEHICLE, BLACK_HYDRA, CreateVehicle(520, 1446.2686, -1667.2651, 15.0574, 270.0000, -1, -1, 30));
    game.add(VEHICLE, GRAY_SPORT, CreateVehicle(522, 1580.0193, -1024.8859, 25.1346, 232.9624, -1, -1, 30));
    game.add(VEHICLE, RED_CHEETAH, CreateVehicle(415, 1080.8390, -993.3372, 38.2531, 177.5100, 82, 82, 100));
    AddVehicleComponent(game.get(VEHICLE, BLACK_SPORT), 1001);

    //GameData[POSTS][SANTA_MARIA][TEAM] = BLACK;

    // -- set : default

    // spawn case : teams
    game.iset(SPAWN_CASE, 0, GREEN);
	game.iset(SPAWN_CASE, 1, RED);
    // stations : color
    gTimes(MAX_POSTS,x) {
        game_Station[x][TEAM] = DARKNIGHT;
    }
    // -- set : skin class (leave this code below the others)
    gTimes(sizeof(GAME_SKIN_CLASS),x) {
        AddPlayerClass(GAME_SKIN_CLASS[0][x], 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0);
    }
    return 1;
}

public OnGameModeExit()
{
    // -- destroy : pickups

    // -- close : instance 'users' database
    db_close(game.get(DB, USERS));
	return 1;
}
public OnPlayerPickUpPickup(playerid, pickupid)
{
	if(pickupid == game.get(PICKUP, BLACK_TEAM_EXIT)){
		game.SetRandomPosEx(playerid, BLACK_SPAWN_EX);
	}
    if(pickupid == game.get(PICKUP, HIGH_HOUSE_ENTER)){
        game.SetPosEx(playerid, HIGH_HOUSE_EN);
	}
    if(pickupid == game.get(PICKUP, HIGH_HOUSE_EXIT)){
        game.SetPosEx(playerid, HIGH_HOUSE_EX);
	}
	return 1;
}

public OnPlayerEnterDynamicArea(playerid, areaid)
{
    // When the player enters any post
    if (game.get(AREA_POSTS, 0) <= areaid <= game.get(AREA_POSTS, 7)) {
        game.playerEnterStation(playerid, areaid-1);
	}
	return 1;
}