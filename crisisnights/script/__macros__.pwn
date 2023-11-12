#if defined MAX_PLAYERS
	#undef MAX_PLAYERS
#define MAX_PLAYERS (128) 
	#endif

#if defined MAX_PLAYER_NAME
	#undef MAX_PLAYER_NAME
#define MAX_PLAYER_NAME (18) 
	#endif

#if defined MAX_TEXT_CHAT
	#undef MAX_TEXT_CHAT
#define MAX_TEXT_CHAT (100) 
	#endif

#define cn. index_
#define cnapi_%0(%1) cn.%0(%1)
#define gTimes<%0,%1> for (new %1=0; %1 != %0; %1 ++)
#define rTimes<%0,%1> for (new %1=%0; %1 != -1; %1 --)
#define yTimes<%0,%1,%2> for (new %2=%0; %2 != %1; %2 ++)

#define BitFlag_Reset(%0,%1) %0 = %1
#define BitFlag_Set(%0,%1) %0 |= %1
#define BitFlag_Clear(%0,%1) %0 &= ~%1
#define BitFlag_Get(%0,%1) ((%0 & %1) == %1)
#define BitFlag_Toggle(%0,%1) %0 ^= %1

#define DegToRad(%1) (%1 / 57.2957795)
#define RadToDeg(%1) (%1 * 57.2957795)

#define PLAYER_SPEED_FREE_FALLING_ 50.0 // ** m/s (Queda Livre)
#define PLAYER_SPEED_PARACHUTES 29.6296296 // ** m/s (free body / movement) [ROUND 30.0]

minrand(min, max) //By Alex "******" Cole
{
    return random(max - min) + min;
}

stock BinaryToDecimal(binary)
{
	new decimal = floatround(floatlog(float(binary), 2.0));
	return decimal;
}

stock MovePosition(&Float:cordX, &Float:cordY, &Float:cordZ, Float:cordA, Float:addX=0.0, Float:addY=0.0, Float:addZ=0.0)
{
    cordA = 360 - cordA;  
    cordX = floatsin(cordA, degrees) * addY + floatcos(cordA, degrees) * addX + cordX;
    cordY = floatcos(cordA, degrees) * addY - floatsin(cordA, degrees) * addX + cordY;
    cordZ = addZ + cordZ;
}
