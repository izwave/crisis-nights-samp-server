
// -- car : free nitro
cmd:addnitro(playerid) {
    if (!IsPlayerInAnyVehicle(playerid))
        return game.alert(playerid, REQUIRED, "<!> {D9D8D9}You need to be in a vehicle to use this command.");
    new component = GetVehicleComponentInSlot(GetPlayerVehicleID(playerid), CARMODTYPE_NITRO);
    if (1008 <= component <= 1010)
        return game.alert(playerid, ALREADY, ".. This vehicle already has nitro installed. Use /buynitro to customize.");
    game.alert(playerid, SUCCESSFUL, "++ Nitro 2x successfully installed!");
    AddVehicleComponent(GetPlayerVehicleID(playerid), 1009); // 2x nitro
    return 1;
}
// car : specifc nitro :
cmd:buynitro(playerid) {
    game.ShowDialog(playerid, BUY_NITRO);
    return 1;
}