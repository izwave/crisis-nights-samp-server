// -- enums :

// -- const arrays : 

new const GAME_SKIN_CLASS[][] = {
	{299, 272, 29, 125},
	{211, 141, 298, 0},
	{295, 119, 28, -1},
	{290, 289, 121, -1},
	{294, 146, 292, -1}
};
new const GAME_TEAM_NAME[][] = {
    {"Secret Society"},
    {"Cyber Skull"},
    {"Red Revenge"},
    {"Moon Gray"},
	{"Darknight"}
};
new const GAME_TEAM_TEXT_COLOR[] = {
	"bgrw"
};
new const GAME_TEAM_COLOR[GAME_TEAMS] = {
	0x3b5998FF,
	0x50c878FF,
	0xee4242FF,
	0xC0C0C0FF,
    0xCC8899F0,
};

// -- const arrays : spawn coordinates
new const BLACK_SPAWN[][COORDS_EX] = {
    {264.6909, 81.3334, 1001.0391, 298.6096, 0, 6},
    {268.3798, 79.3490, 1001.0391, 0.6501, 0, 6},
    {254.3723, 83.9376, 1002.4453, 312.3966, 0, 6},
    {215.9684, 76.2516, 1005.0391, 324.2336, 0, 6},
    {237.9876, 78.8896, 1005.0391, 196.3925, 0, 6},
    {264.0953, 70.8116, 1003.2422, 43.1709, 0, 6}
};
new const BLACK_SPAWN_EX[][COORDS_EX] = {
    {1549.9272, -1674.8060, 15.1761, 93.7109, 0, 0},
    {1547.9886, -1676.5522, 14.3312, 91.5175, 0, 0},
    {1554.0911, -1675.2037, 16.1953, 95.2775, 0, 0},
    {1551.3102, -1675.6194, 15.7930, 80.5508, 0, 0}
};
new const GRAY_SPAWN[][COORDS_EX] = {
    {1580.0193, -1024.8859, 25.1346, 232.9624, 0, 0},
    {1562.2594, -1026.0569, 23.9140, 276.8061, 0, 0},
    {1595.1389, -1005.0225, 23.9063, 198.7854, 0, 0},
    {1595.1389, -1005.0225, 23.9063, 198.7854, 0, 0},
    {1588.2161, -1031.4341, 23.9063, 90.6843, 0, 0},
    {1578.4957, -1021.2268, 25.1346, 214.4290, 0, 0}
};


enum E_SPAWN {
    Float:X,
    Float:Y,
    Float:Z,
    TEXT[28]
}


new SPAWN_CAM_POS[][E_SPAWN] = {
    {2433.7908, -1641.1267, 59.4106, {"Groove Street"}},
    {2452.0479, -1715.8682, 66.9632, {"Constructions"}}, //Groove Street
    {2359.6572, -1528.8662, 46.1791, {"Basketball street"}},
    {2453.0557, -1286.0845, 54.1057, {"Pig Pen"}},
    {2163.1960, -1064.8162, 66.4236, {"Jefferson"}},
    {1960.0940, -1491.5940, 41.1279, {"Hospital"}},
    {2151.5916, -1390.3162, 63.6300, {""}}, // Basketball street"
    {2060.5295, -1315.7717, 37.0433, {""}},
    {2058.2239, -1131.6541, 93.3848, {"Glen Park"}},
    {1963.7458, -1448.9670, 19.1579, {"Risky Maneuvers"}},
    {1924.4456, -1379.6594, 62.7247, {"Under construction"}},
    {1855.7708, -1015.0869, 56.0943, {""}},
    {1342.1057, -1132.3894, 32.4604, {"Avenue"}},
    {784.36430, -1415.5774, 53.7430, {"River"}},
    {1214.2424, -1400.8894, 28.4460, {"All Saints General Hospital"}},
    {1133.2600, -1360.0129, 57.0020, {"Vinewood"}},
    {834.16380, -1352.9612, 71.9007, {"Vinewood"}},
    {810.47140, -1320.1531, 39.6985, {"Stage 25"}},
    {779.99240, -1313.9436, 28.8975, {"Market Station"}},
    {997.51440, -1101.6936, 51.8670, {"Cemetery gates"}},
    {813.48680, -2086.4260, 30.1884, {"Verona Beach"}},
    {1206.2532, -1621.4451, 54.3564, {"Store"}},
    {1187.8870, -1698.3157, 41.9820, {"Conference Center"}},
    {883.64480, -1805.8191, 36.5873, {"Swim"}},
    {1498.4551, -2021.5291, 105.750, {"Verdant Bluffs"}},
    {1244.1172, -2340.2263, 66.6217, {"Airport Parking"}},
    {2201.7925, -2671.3953, 117.247, {"LS International Airport"}},
    {956.79760, -2450.3503, 63.0156, {"Lake"}},
    {2464.0273, -2179.6838, 50.5069, {"Bridges"}},
    {2817.4531, -2108.7708, 37.1314, {"Playa del Seville"}},
    {2898.6670, -2587.5374, 35.3315, {"Ship"}},
    {2579.3545, -2134.8362, 44.7137, {"Menor Bridge"}},
    {2871.4150, -1934.3855, 81.0841, {"Los Santos Race"}},
    {2866.2881, -1671.1809, 32.0482, {"East Beach"}},
    {2749.9824, -1102.7043, 95.8652, {"Black Florest"}},
    {2642.2256, -1396.7769, 52.1927, {"Some Street"}},
    {1819.5796, -1550.3188, 38.4994, {"Idlewood"}},
    {2062.4536, -1508.0068, 25.1056, {"Houses and Avenue"}},
    {1973.0264, -1733.8345, 25.2479, {"Fuel"}},
    {2093.3896, -1610.6030, 24.0270, {"Idlewood houses"}},
    {1854.3491, -1804.2598, 38.1314, {"Unity Station"}},
    {1819.9385, -2096.0845, 54.8339, {"El Corona"}},
    {2139.2847, -1848.6680, 56.2406, {"Parking"}},
    {1978.4683, -2176.6230, 36.2406, {"Nude shoop"}},
    {1695.8984, -1781.3569, 30.9264, {"Commerce"}},
    {1741.4800, -1718.6030, 31.5109, {"Constructions"}},
    {1450.1738, -1508.1548, 14.1436, {"Fly"}},
    {1467.7681, -1299.9214, 15.5070, {"Constructions"}}
};

new const Float:SPAWN_CAM_LOOK[][] = {
    {2434.7173, -1641.5060, 58.6456},
    {2451.1514, -1716.3187, 66.5525},
    {2358.6528, -1528.8654, 45.8535},
    {2452.4077, -1285.3173, 53.6851},
    {2163.7205, -1065.6689, 65.9636},
    {1960.7230, -1490.8171, 40.9778},
    {2152.5303, -1390.6598, 63.2800},
    {2061.3208, -1315.1582, 36.8282},
    {2057.5254, -1132.3702, 92.7648},
    {1962.7678, -1448.7532, 19.4778},
    {1923.8018, -1378.8928, 62.2696},
    {1856.6785, -1015.5050, 55.7992},
    {1342.2109, -1131.3955, 32.5401},
    {783.9880, -1416.5044, 53.4876},
    {1213.6876, -1400.0574, 28.2007},
    {1133.2623, -1361.0133, 56.5517},
    {833.4021, -1352.3127, 71.5404},
    {809.6267, -1320.6884, 39.3832},
    {780.8257, -1314.4957, 28.5873},
    {996.5146, -1101.6990, 51.5867},
    {813.6934, -2085.4470, 29.9482},
    {1205.2531, -1621.4562, 54.1412},
    {1187.2169, -1699.0583, 41.5218},
    {883.6916, -1804.8190, 36.3871},
    {1497.4648, -2021.6628, 105.5403},
    {1245.0477, -2339.8669, 66.4965},
    {2200.9434, -2670.8699, 117.0418},
    {957.2810, -2449.4788, 62.8704},
    {2463.0300, -2179.7554, 50.2817},
    {2817.6643, -2107.7930, 37.0311},
    {2898.1250, -2586.6931, 35.1062},
    {2579.3237, -2133.8325, 44.6133},
    {2870.6638, -1933.7191, 80.7736},
    {2865.7244, -1670.3490, 31.7326},
    {2749.0811, -1102.2593, 95.7146},
    {2642.2007, -1395.7738, 52.1670},
    {1820.1674, -1551.1333, 38.2487},
    {2061.5823, -1508.5078, 25.0999},
    {1972.3713, -1734.5973, 24.9322},
    {2092.8811, -1611.4685, 23.7514},
    {1853.6125, -1804.9423, 37.8757},
    {1820.4596, -2095.2258, 54.2482},
    {2138.7908, -1849.5432, 55.7649},
    {1977.8525, -2175.8311, 35.7749},
    {1695.3809, -1780.4980, 31.1658},
    {1741.9440, -1717.7145, 31.4203},
    {1449.3774, -1507.5463, 15.7130},
    {1468.7670, -1299.8496, 15.7813}
};