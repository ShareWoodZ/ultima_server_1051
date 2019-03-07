private ["_aObjs","_bldObj"];
_bldObj	=	objNull;
_aObjs	=	[
					["Hhedgehog_concreteBig", [6428.166, 13703.226, 9.1552734e-005], -38.70013, false],
					["Hhedgehog_concreteBig", [6446.499, 13718.129, 9.1552734e-005], -39.165802, false],
					["Hhedgehog_concreteBig", [6453.6748, 13720.462, 0.00021362305], 51.636414, false],
					["Hhedgehog_concreteBig", [6459.6543, 13713.08, 0.00018310547], 51.176537, false],
					["Hhedgehog_concreteBig", [6465.707, 13705.574, 0.00021362305], 51.181641, false],
					["Hhedgehog_concreteBig", [6471.7495, 13698.263, 6.1035156e-005], 50.172783, false],
					["Hhedgehog_concreteBig", [6478.2075, 13690.796, 0.00015258789], 49.468601, false],
					["Hhedgehog_concreteBig", [6484.8882, 13683.101, 0.00021362305], 49.561787, false],
					["Hhedgehog_concreteBig", [6491.1099, 13675.854, 0.00057983398], 50.245815, false],
					["Hhedgehog_concreteBig", [6497.2529, 13668.31, 0.00030517578], 50.834297, false],
					["Hhedgehog_concreteBig", [6503.2959, 13660.819, 0.00036621094], 51.280373, false],
					["Hhedgehog_concreteBig", [6509.4531, 13653.455, 0.00048828125], 49.592266, false],
					["Hhedgehog_concreteBig", [6515.9688, 13645.919, 3.0517578e-005], 48.602627, false],
					["Hhedgehog_concreteBig", [6424.3828, 13700.202, -6.1035156e-005], -38.109745, false],
					["Hhedgehog_concreteBig", [6416.98, 13694.463, 3.0517578e-005], -38.90102, false],
					["Hhedgehog_concreteBig", [6412.855, 13688.36, 0.00033569336], 51.405804, false],
					["Hhedgehog_concreteBig", [6418.8838, 13680.722, 0.00018310547], 50.484921, false],
					["Hhedgehog_concreteBig", [6425.0146, 13673.205, 0.00057983398], 51.010902, false],
					["Hhedgehog_concreteBig", [6431.0542, 13665.595, 0.00021362305], 52.166862, false],
					["Hhedgehog_concreteBig", [6437.1392, 13657.892, 0.0002746582], 51.250431, false],
					["Hhedgehog_concreteBig", [6443.1816, 13650.247, 0.00030517578], 52.034451, false],
					["Hhedgehog_concreteBig", [6449.1841, 13642.581, 9.1552734e-005], 52.128624, false],
					["Hhedgehog_concreteBig", [6455.3691, 13634.589, 0.00018310547], 51.738041, false],
					["Hhedgehog_concreteBig", [6461.563, 13626.71, 0.00021362305], 50.700474, false],
					["Hhedgehog_concreteBig", [6467.8384, 13618.914, 0.00024414063], 51.233994, false],
					["Hhedgehog_concreteBig", [6473.8247, 13611.442], 51.066223, false],
					["Hhedgehog_concreteBig", [6480.0566, 13607.458, 0.00012207031], -39.191441, false],
					["Hhedgehog_concreteBig", [6487.3428, 13613.378, 0.00021362305], -38.456196, false],
					["Hhedgehog_concreteBig", [6504.4595, 13626.603, 0.00051879883], -39.762726, false],
					["Hhedgehog_concreteBig", [6511.9272, 13632.681, 0.00036621094], -39.617546, false],
					["Hhedgehog_concreteBig", [6518.8169, 13638.606, 0.00039672852], -41.455242, false],
					["BMP2Wreck", [6424.77, 13711.572, 3.0517578e-005], 102.12718, false],
					["UralWreck", [6473.4639, 13668.585, 9.1552734e-005], 170.76129, false],
					["C130J_wreck_EP1", [6549.7935, 13527.301, 0.00015258789], -62.993118, false],
					["MAP_vez", [6429.02, 13701.14, 9.1552734e-005], -37.893456, false],
					["HeliHRescue", [6519.4326, 13597.197, 0], 1234567890, false],
					["MAP_sign_noDrivingWronWay", [6431.9023, 13707.251, 6.1035156e-005], 143.80959, false],
					["dum_olez_istan1", [6433.5044, 13682.842, 0.19147892], 681.18085, false],
					["dum_olez_istan2_maly", [6452.5386, 13702.564, 9.1552734e-005], 51.390659, false],
					["dum_olez_istan2", [6442.8057, 13668.315, 9.1552734e-005], 321.53021, false],
					["dum_olez_istan1", [6465.3062, 13686.878, 6.1035156e-005], 230.61098, false],
					["dum_olez_istan2_maly2", [6447.6211, 13659.379, 6.1035156e-005], 51.551083, false],
					["Land_Ind_TankSmall2", [6477.1694, 13678.3, 0.00024414063], -158.0498, false],
					["Land_stand_waterl_EP1", [6448.4136, 13668.64, 0.00018310547], -124.9806, false],
					["Paleta2", [6446.0435, 13670.002, 6.1035156e-005], 1234567890, false],
					["MAP_Ind_IlluminantTower", [6454.8638, 13711.738, 6.1035156e-005], 140.35301, false],
					["USMC_WarfareBVehicleServicePoint", [6484.168, 13673.156, 0.00036621094], -36.917835, false],
					["LAV25_HQ_unfolded", [6475.293, 13621.333, 6.1035156e-005], 140.37704, false],
					["Ins_WarfareBContructionSite", [6489.6362, 13662.478, 0.00036621094], 17.69566, false],
					["MAP_Hlidac_budka", [6449.0757, 13713.181, 0.00021362305], 321.13354, false],
					["USMC_WarfareBFieldhHospital", [6459.8101, 13640.888, 0.00030517578], 141.20094, false],
					["GUE_WarfareBFieldhHospital", [6468.8198, 13631.002, 0.00051879883], -38.79464, false],
					["GUE_WarfareBFieldhHospital", [6496.6963, 13652.99, 0.00024414063], -39.039196, false],
					["GUE_WarfareBFieldhHospital", [6503.3018, 13645.067, 0.00012207031], -38.963806, false]
				];
{
	_bldObj = createVehicle [(_x select 0), (_x select 1), [], 0, "CAN_COLLIDE"];
	if ((_x select 2) != 1234567890) then
		{_bldObj setDir (_x select 2);};
	if (_x select 3) then
		{_bldObj setVehicleInit "this allowDammage false; this enableSimulation false;";};
	_bldObj setPos (_x select 1);
} forEach _aObjs;