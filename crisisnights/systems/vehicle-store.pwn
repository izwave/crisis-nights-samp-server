/*

native cn.GetPlayerVehicleGarage(playerid, VEHICLE_PURCHASE_TYPE:purchasetype, vehicleindex=0)
native cn.GetPlayerVehicles(playerid, VEHICLE_PURCHASE_TYPE:purchasetype)
native cn.GetPlayerGarage(playerid)

*/

forward OnPlayerBuyVehicle(playerid, vehicleid, VEHICLE_PURCHASE_TYPE:purchasetype);
forward OnPlayerSellVehicle(playerid, vehicleid);


/*
vrent_0=558
vrentexpire=22,05,2020
vrent_1=400
vrent_2=584
vrent_3=523
vrent_4=0
vrent_5=0

*/
#define VEHICLE_PRICE_PERMANENT (29/7) //'29' is a tenth prime number, while '7' is the largest prime number less than 10.
#define MAX_VEHICLE_STORE 100 
/*
A -> 65 -> 0
B -> 66 -> 1
C -> 67 -> 2
D -> 68 -> 3

0 -> Tuners
1 -> Sedans
2 -> Muscles
3 -> Choppers
4 -> SUVs
5 -> Bikes
6 -> Exotics

identification, class, club, rental

*/



enum E_VEHICLE_STORE  {
	VEHICLE_STORE_ID,
	VEHICLE_STORE_CLASS,
	VEHICLE_STORE_CLUB,
	VEHICLE_STORE_PRICE
};

enum VEHICLE_PURCHASE_TYPE
{
	VEHICLE_PURCHASE_UNDEFINED,
	VEHICLE_PURCHASE_RENTED,
	VEHICLE_PURCHASE_PERMANENT,
}

new const vehicle_store_items[][E_VEHICLE_STORE] =
{
	{491, 3, 2, 95000},
	{421, 3, 1, 30780},
	{426, 3, 1, 20527},
	{561, 3, 1, 21510},
	{547, 3, 1, 18473},
	{543, 3, 4, 71842},
	{600, 3, 2, 19460},
	{400, 3, 4, 119052},
	{412, 3, 2, 21289},
	{585, 3, 1, 26410},
	{422, 3, 4, 22634},
	{507, 3, 1, 24200},
	{479, 3, 1, 33706},
	{527, 3, 0, 17751},
	{576, 3, 2, 61578},
	{410, 3, 0, 32295},
	{546, 3, 0, 32842},
	{573, 3, 4, 63200},
	{404, 3, 2, 16421},
	{442, 3, 1, 9233},
	{478, 3, 4, 1836}
};
