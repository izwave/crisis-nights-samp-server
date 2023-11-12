enum GENERAL_PLAYER_MEDAL_LEVEL
{
	MEDAL_BRONZE,
	MEDAL_SILVER,
	MEDAL_GOLD
}

enum GENERAL_PLAYER_MEDAL
{
	MEDAL_EFFORT,		// 1. esforço	[player who plays]
	MEDAL_DEDICATION,	// 2. dedicação	[company domains]
	MEDAL_MERIT,		// 3. mérito  	[championships/x1]
	MEDAL_BRAVERY,		// 4. bravura 	[spawnkiller kills]
	MEDAL_BATTLE,		// 5. batalha 	[kills inside/out base]
	MEDAL_,				// 6. 			[]
	MEDAL_CRISIS_NIGHT	// 7. medalha do servidor [rare]
}

/*
spawn killer:
seja a, o maior número de mortes por spawn de um jogador;
seja b, o tempo total desde a primeira morte até a morte do jogador;
então, a/b = d, d é a média de matança por tempo.
Qualquer jogador que atingir 70%, 80% ou 90% de 'a' poderá receber medalha de bravura(bronze, prata, ouro) se,
somente se, sua média 'd' atingir a porcentegam atual somado a 10% do valor 'd' original, ou seja, 80%, 90%, 100% de 'd'.
80 a 89.9 % de 'd' bronze
90 a 99.9% de 'd' prata
100 a 109.99% de 'd' ouro
110% acima de 'd' ouro, medalha do servidor bronze
160% acima de 'd' ouro, medalha do servidor prata
200% acima de 'd' ouro, medalha do servidor ouro
*/

index_GivePlayerMedal(playerid, GENERAL_PLAYER_MEDAL:medalid, GENERAL_PLAYER_MEDAL_LEVEL:medallevelid)
{
	if(!IsPlayerConnected(playerid)) return 0;
	return 1;
}