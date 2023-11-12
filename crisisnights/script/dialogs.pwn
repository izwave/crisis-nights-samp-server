#include <mdialog>


// test

DialogCreate:test(playerid) {
    Dialog_Open(playerid, Dialog:test, DIALOG_STYLE_MSGBOX,
        "Hello",
        "Are you ok?",
        "Yes", "No");
}
DialogResponse:test(playerid, response, listitem, inputtext[]) {
    if(!response) {
        SendClientMessage(playerid, -1, "This club only for OK guys!");
        Dialog_Show(playerid, Dialog:test);
        return 1;
    }
    SendClientMessage(playerid, -1, "Welcome to the club");
    return 1;
}

// register

DialogCreate:register(playerid) {     
    Dialog_Open(playerid, Dialog:register, DIALOG_STYLE_INPUT,
        "{FFFFFF}Register - [ Server CNSA ]",
        "\t\t\t{FFFFFF}Hello {38B0DE}%s[%d] !\n\n\n\
        {FFFFFF}Feel free on the server {4F4F2F}Night Of Crime - San Andreas [0.3.7]\n\n\
        {FFFFFF}You do not have a {3366FF}PROFILE!\n\
        {FF0000}* {FFFFFF}Registration is very important because it will save your data\nas: {FF6600}ScoreSPANOL, {009900}VehiclESPANOL, {fff68f}profile {FFFFFF}among others.\n\n\
        {FFFFFF}Make sure your caps lock\n\
        {FFFFFF}Characters [ {00FFFF}5 {FFFFFF}- {00FFFF}16 {FFFFFF}]\n\n\
        {c6e2ff}Write a keyword..",
        "Confirm", "Cancel");
}
DialogResponse:register(playerid, response, listitem, inputtext[]) {
    if(!response) {
        SendClientMessage(playerid, -1, "This club only for OK guys!");
        Dialog_Show(playerid, Dialog:register);
        return 1;
    }
    SendClientMessage(playerid, -1, "Welcome to the club");
    return 1;
}

// vehiclestore

DialogCreate:vehiclestore(playerid) {
    /*
    new vehicleplayerid, currentplayervehicle = GetPlayerVehicleID(playerid);
    vehicleplayerid = GetVehicleModel(currentplayervehicle);
    */
    Dialog_Open(playerid, Dialog:vehiclestore, DIALOG_STYLE_LIST,
        "Hello",
        "vehicle name\npurchase options",
        "Continue", "Leave");
}
DialogResponse:vehiclestore(playerid, response, listitem, inputtext[]) {
    if(!response) {
        Dialog_Show(playerid, Dialog:vehiclestore);
        return 1;
    }
    return 1;
}

//corrida

DialogCreate:V_BATTLE(playerid) {
    /*
    new vehicleplayerid, currentplayervehicle = GetPlayerVehicleID(playerid);
    vehicleplayerid = GetVehicleModel(currentplayervehicle);
    */
    Dialog_Open(playerid, Dialog:V_BATTLE, DIALOG_STYLE_LIST,
        "AAAA",
        "Bullet\nSavanna\nBloodring Banger\nSlamvan\nBandito\nYosemite",
        "Continue", "Leave");
}
DialogResponse:V_BATTLE(playerid, response, listitem, inputtext[]) {
    if(!response) {
        return 1;
    }
    return 1;
}