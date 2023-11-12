/* Crisis Nights: menus
	menu index: Works and manages server menus in an organized and structured way
	* index_servermenus: create or destroy all server menus
	* OnPlayerSelectedMenuRow: when a line is pressed with the 'space' key
	* OnPlayerExitedMenu: when the 'enter' key is pressed
*/

enum SERVER_GENERAL_MENU
{
	Menu:MENU_VEHICLESTORE,
    Menu:MENU_CLASSSELECTION
}

new Menu:ServerMenus[SERVER_GENERAL_MENU];

index_Menus(bool:action)
{
	if(action)
	{
		ServerMenus[MENU_VEHICLESTORE] = CreateMenu("HALIB'S", 1, 40.0, 210.0, 100.0, 100.0);
		SetMenuColumnHeader(ServerMenus[MENU_VEHICLESTORE], 0, "Options");
		AddMenuItem(ServerMenus[MENU_VEHICLESTORE], 0, "(>>>)");
		AddMenuItem(ServerMenus[MENU_VEHICLESTORE], 0, "Select");
		AddMenuItem(ServerMenus[MENU_VEHICLESTORE], 0, "(<<<)");

        ServerMenus[MENU_CLASSSELECTION] = CreateMenu("Spawn Models", 1, 40.0, 210.0, 300.0, 300.0);
        AddMenuItem(ServerMenus[MENU_CLASSSELECTION], 0, "Skin default");
        AddMenuItem(ServerMenus[MENU_CLASSSELECTION], 0, "Skin version 2");
        AddMenuItem(ServerMenus[MENU_CLASSSELECTION], 0, "Skin level 1");
        AddMenuItem(ServerMenus[MENU_CLASSSELECTION], 0, "Skin level 2");
        AddMenuItem(ServerMenus[MENU_CLASSSELECTION], 0, "Skin level 3");
	}
	else
	{
        gTimes<_:SERVER_GENERAL_MENU,x>
        {
            DestroyMenu(ServerMenus[SERVER_GENERAL_MENU:x]);
        }
	}
	return 1;
}


new Float:floator[3], posi=-1, form[22];

public OnPlayerSelectedMenuRow(playerid, row)
{
    if(GetPlayerMenu(playerid) == ServerMenus[MENU_CLASSSELECTION])
    {
        // convert binary to int 2,4,8,16 = 1,2,3,4 with logrithm 
        new inttmp = floatround(floatlog(float(_:PlayerDataInPlay[playerid][SINGLE_PLAYER_TEAM]), 2.0));
        SetPlayerSkin(playerid, selection_class_skins[row][inttmp]);
        SpawnPlayer(playerid);
        TogglePlayerSpectating(playerid, 0);
    }
    if(GetPlayerMenu(playerid) == ServerMenus[MENU_VEHICLESTORE])
    {
    	
    	switch(row)
    	{
    		case 0:
    		{
    			if(posi <= 19) {
    				posi ++;
    			} else {
    				posi = 0;
    			}
    			format(form, 22, "%i (>>>)", posi);
    			SendClientMessage(playerid, 0xFADB44FF, form);
    			if(IsValidVehicle(PlayerDataInPlay[playerid][SINGLE_PLAYER_VEHICLE][0])) {
    				DestroyVehicle(PlayerDataInPlay[playerid][SINGLE_PLAYER_VEHICLE][0]);
		    	}
    		}
    		case 1:
    		{
    			SendClientMessage(playerid, 0xBD57ACFF, "Veículo selecionado");
    			return 1;
    		}
    		case 2:
    		{
    			if(posi >= 0) {
    				posi --;
    			} else {
    				posi = 20;
    			}
    			format(form, 22, "%i (<<<)", posi);
    			SendClientMessage(playerid, 0xFADB44FF, form);
    			if(IsValidVehicle(PlayerDataInPlay[playerid][SINGLE_PLAYER_VEHICLE][0])) {
    				DestroyVehicle(PlayerDataInPlay[playerid][SINGLE_PLAYER_VEHICLE][0]);
		    	}
    		}
    	}
    	
        GetPlayerPos(playerid, floator[0], floator[1], floator[2]);
		PlayerDataInPlay[playerid][SINGLE_PLAYER_VEHICLE][0] = CreateVehicle(vehicle_store_items[posi][VEHICLE_STORE_ID],
		floator[0]+5, floator[1]-1.4, floator[2]+1, 45.0, 1, 1, 200, 0);
		ShowMenuForPlayer(ServerMenus[MENU_VEHICLESTORE], playerid);
    }
    return 1;
}
public OnPlayerExitedMenu(playerid)
{
	TogglePlayerControllable(playerid, 1);
	SendClientMessage(playerid, 0x284293FF, "Enter pressed.");
	return 1;
}

/*
	* CreateMenu: Create a menu.
	* DestroyMenu: Destroy a menu.
	* AddMenuItem: Add an item to a menu.
	* ShowMenuForPlayer: Show a menu for a player.
	* HideMenuForPlayer: Hide a menu for a player.
*/