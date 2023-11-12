#define WEAPON_MOD_PLAYER_DAMAGE_A 33.0
#define WEAPON_MOD_PLAYER_DAMAGE_B 50.0
#define WEAPON_MOD_PLAYER_DAMAGE_C 100.0
#define WEAPON_MOD_PLAYER_DAMAGE_SE 150.0

#define WEAPON_MOD_VEHICLE_DAMAGE_A 50.0
#define WEAPON_MOD_VEHICLE_DAMAGE_B 75.0
#define WEAPON_MOD_VEHICLE_DAMAGE_C 100.0
#define WEAPON_MOD_VEHICLE_DAMAGE_SE 185.0

#define WEAPON_MOD_LEVEL_1 (165/100) // 1.65 Level 1 <weapon name>[HS=y/n]
#define WEAPON_MOD_LEVEL_2 (265/100) // 2.65 Level 2 <weapon name>
#define WEAPON_MOD_LEVEL_3 (365/100) // 3.65 Level 3
#define WEAPON_MOD_LEVEL_SE (465/100) // 4.65 Level SE

enum WEAPON_DAMAGE_MOD_ID (<<= 1)
{
	WEAPON_MOD_NONE,
	WEAPON_MOD_HEADSHOT = 1,
	WEAPON_MOD_GROINSHOT,
	WEAPON_MOD_DAMAGE_A,
	WEAPON_MOD_DAMAGE_B,
	WEAPON_MOD_DAMAGE_C,
	WEAPON_MOD_DAMAGE_SE
}

public OnPlayerTakeDamage(playerid, issuerid, Float: amount, weaponid, bodypart)
{
	if(issuerid == INVALID_PLAYER_ID) return 1;

	new slottmp = gunstore[weaponid][WEAPON_SLOT];

	if(weaponid == WEAPON_SNIPER && (bodypart == Head || bodypart == Groin))
	{
		SetPlayerSkillLevel(playerid, WEAPONSKILL_SAWNOFF_SHOTGUN, 200);
	}
	if(weaponid == WEAPON_SNIPER && PlayerDataInPlay[playerid][SINGLE_PLAYER_WEAPON_MOD][slottmp] & WEAPON_MOD_HEADSHOT)
	{	// Dano total
		SetPlayerHealth(playerid, 0.0);
		return 1;
	}
	else
	if ()
	{

	}

	new Float:lifetmp, Float:sumtmp;
	GetPlayerArmour(issuerid, lifetmp);
	sumtmp = lifetmp;
	GetPlayerHealth(issuerid, lifetmp);
	sumtmp = sumtmp + lifetmp;
	return 1;
}

enum E_GUN_STORE
{
	WEAPON_ID,
	WEAPON_SLOT,
	WEAPON_REISSUE_NAME_A[50],
	WEAPON_REISSUE_NAME_B[50],
	WEAPON_REISSUE_NAME_C[50],
}

new const gunstore[][E_GUN_STORE] =
{
	// Body
	{WEAPON_KNIFE, 		1, "", "", ""},
	{WEAPON_KATANA, 	1, "", "", ""},
	{WEAPON_CHAINSAW, 	1, "", "", ""},
	// Pistols
	{WEAPON_COLT45,		2, "", "", ""},
	{WEAPON_SILENCED,	2, "", "", ""},		
	{WEAPON_DEAGLE,		2, "", "", ""},		
	//Point-blank 
	{WEAPON_SHOTGUN,	3, "", "", ""},
	{WEAPON_SAWEDOFF,	3, "", "", ""},
	{WEAPON_SHOTGSPA,	3, "", "", ""},
	//SMG
	{WEAPON_UZI,		4, "", "", ""},
	{WEAPON_MP5,		4, "", "", ""},
	{WEAPON_TEC9,		4, "", "", ""},
	//Assault
	{WEAPON_AK47, 		5, "", "", ""},
	{WEAPON_M4, 		5, "", "", ""},
	// Camper
	{WEAPON_RIFLE,		6, "", "", ""},
	{WEAPON_SNIPER,		6, "", "", ""},
	// Explosion / Gun
	{WEAPON_ROCKETLAUNCHER, 7, "", "", ""},
	{WEAPON_MINIGUN, 7, "", "", ""},
	// Explosion
	{WEAPON_GRENADE, 	8, "", "", ""},
	{WEAPON_TEARGAS, 	8, "", "", ""}
};

/*

-	HeadShoot
1. Katana
2. Silenced 9mm
3. Desert Eagle
4. SPAS-12 
5. AK-47
6. Country
7. Sniper

-
-	FatalShoot
1. Katana
2. Silenced 9mm
6. Country

*/

/*

Basic level weapon pack
Moderate level weapon pack
Experienced level weapon pack
Packages (Special Edition) [In special mode]
Sniper SOP MOD
Sniper SOP MOD PRO
Sniper TK
Sniper guillie TK
Minigun KID
Minigun KID

*/

/*
E WEAPONS

Knife
Katana
Chainsaw
Knife Army
Katana Musashi
Chainsaw Leatherface
Knife Army PRO
Katana Musashi PRO
Chainsaw Leatherface PRO
Knife (SE)
Katana (SE)
Chainsaw (SE)

Desert Eagle
9mm 
9mm Browning
Desert Eagle Hawk
Desert Eagle Hawk PRO
9mm Silenced PRO

-- Corpo a corpo --
1, Knife,
1, Katana
1, Knife [1/3]
1, Katana [1/2]
1, Knife [1/2] (SE)
1, Katana (1/1) (SE)
1, Chainsaw
1, Chainsaw [1/5]
1, Chainsaw (SE)
-- Pistols --
2, Desert Eagle
2, 9mm PRO [1/6]
2, Silenced 9mm PRO [1/5][HS]
2, Desert Eagle (SE)
-- Queima roupa --
3, Shotgun
3, Sawnoff Shotgun
3, Combat Shotgun
3, Shotgun [1/3]
3, Sawnoff Shotgun [1/3]
3, Combat Shotgun [1/3]
3, Sawnoff Shotgun X [1/2]
3, Shotgun (SE)
3, Sawnoff Shotgun (SE)
3, Combat Shotgun (SE)
-- Não sei ---
4, Micro SMG/Uzi
4, MP5
4, MP5 PRO [1/5][HS]
-- Assalto --
5, AK-47
5, M4
5, AK-47 PRO [HS]
5, M4 PRO [HS]
-- Snipers --
6, Country Rifle
6, Sniper
6, Country Rifle PRO [HS]
6, Sniper PRO [HS]
6, Sniper II PRO [1/2][HS]
6, Sniper III PRO (SE)
-- outros --
7, RPG
7, Minigun
7, RPG II PRO
7, Minigun PRO [HS]
7, Minigun (SE)
-- Longe ---
8, Grenade
8, Tear Gas
8, Grenade [1/2]
8, Tear Gas [1/3]
8, Grenade (SE)*/


/*
WEAPON_COLT45: 25 * 0.33 //8.25
WEAPON_SILENCED: 40 * 0.33 //13.200012
WEAPON_DEAGLE: 140 * 0.33 //46.200013
WEAPON_SHOTGUN: 10 * 0.33 //30.0 (probably because of pellets)
WEAPON_SAWEDOFF: 10 * 0.33 //30.0 (probably because of pellets)
WEAPON_SHOTGSPA: 15 * 0.33 //30.0 (probably because of pellets)
WEAPON_UZI: 20 * 0.33 //6.599976
WEAPON_TEC9: 20 * 0.33//6.599976
WEAPON_MP5: 25 * 0.33 //8.25
WEAPON_AK47: 30 * 0.33 //9.900024
WEAPON_M4: 30 * 0.33 //9.900024
WEAPON_RIFLE: 75 * 0.33 //24.799987
WEAPON_SNIPER: 125 * 0.33 //41.299987
WEAPON_MINIGUN: 140 * 0.33 //46.200013
*/