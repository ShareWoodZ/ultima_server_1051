private ["_aObjs","_bldObj","_aObj"];
_bldObj	=	objNull;
_aObjs	=	[
					["Land_tent_East", [13009.6, 3562.61, 9], 1234567890, false],
					["Land_tent_East", [13176.3, 3651.89, 9], 1234567890, false],
					["HMMWVWreck", [13022.2, 3596.73, 8.35], -1234567890, false],
					["CampEast_EP1", [13054.6, 3605.39, 9], 92, false],
					["CampEast_EP1", [13066.5, 3612.23, 9], 82, false],
					["Misc_Cargo1B_military", [13094.5, 3627.44, 8.85], 42, false],
					["Misc_Cargo1B_military", [13138.5, 3625.63, 8.85], 62, false],
					["Misc_Cargo1B_military", [13102.7, 3630.55, 8.85], 12, false],
					["Misc_Cargo1Bo_military", [13147.7, 3630.59, 8.85], 2, false],
					["Misc_Cargo1Bo_military", [13142.1, 3635.59, 8.85], 102, false],
					["MAP_Misc_G_Pipes", [13002.5, 3568.19, 8.85], 1234567890, false],
					["UH60_wreck_EP1", [13128, 3635, 9.5], -62, false],
					["MASH_EP1", [13170, 3670, 8.85], 150, false],
					["MASH_EP1", [13163, 3666, 8.85], 150, false],
					["ForestLargeCamoNet_DZ", [12975.9, 3542.13, 8.85], 239.246, false],
					["ForestLargeCamoNet_DZ", [12989.8, 3550.38, 8.85], 59.024, false],
					["FuelPump_DZ", [13039.2, 3572.38, 8.85], 58.34, false],
					["SandNest_DZ", [12991.7, 3535.12, 8.85], 333.237, false],
					["Sandbag1_DZ", [12985.6, 3558.3, 8.85], 328.408, false],
					["Sandbag1_DZ", [12983.2, 3556.86, 8.85], 328.408, false],
					["Sandbag1_DZ", [12980.9, 3555.42, 8.85], 328.408, false],
					["Sandbag1_DZ", [12978.5, 3553.98, 8.85], 328.408, false],
					["Sandbag1_DZ", [12976.2, 3552.54, 8.85], 328.408, false],
					["Sandbag1_DZ", [12975.7, 3550.65, 8.85], 238.408, false],
					["SandNest_DZ", [12988.2, 3560.8, 8.85], 149.116, false],
					["SandNest_DZ", [13129.7, 3617.93, 8.85], 328.633, false],
					["Sandbag1_DZ", [13004.9, 3573.52, 8.85], 331.463, false],
					["Sandbag1_DZ", [13004.2, 3571.56, 8.85], 242.135, false],
					["Sandbag1_DZ", [13007.3, 3574.83, 8.85], 151.463, false],
					["Sandbag1_DZ", [13009.8, 3576.14, 8.85], 331.463, false],
					["Sandbag1_DZ", [13012.2, 3577.46, 8.85], 331.463, false],
					["Sandbag1_DZ", [13014.6, 3578.77, 8.85], 331.463, false],
					["Sandbag1_DZ", [13017, 3580.09, 8.85], 331.463, false],
					["Land_HBarrier5_DZ", [12996.7, 3546.15, 8.85], 149.485, false],
					["Land_HBarrier5_DZ", [12988, 3541.63, 8.85], 152.05, false]
				];
{
	_bldObj = createVehicle [(_x select 0), (_x select 1), [], 0, "CAN_COLLIDE"];
	if ((_x select 2) != 1234567890) then
		{_bldObj setDir (_x select 2);};
	if (_x select 3) then
		{_bldObj setVehicleInit "this allowDammage false; this enableSimulation false;";};
	_bldObj setPos (_x select 1);
} forEach _aObjs;
{
	_bldObj = createVehicle [_x, [13072,3600,-7], [], 0, "CAN_COLLIDE"];
	_bldObj setDir 59;
	_bldObj setPos [13072,3600,-7];
} forEach ["Land_LHD_1","Land_LHD_2","Land_LHD_3","Land_LHD_4","Land_LHD_5","Land_LHD_6","Land_LHD_elev_R","Land_LHD_house_1","Land_LHD_house_2"];
_bldObj = createVehicle ["MAP_P_LadderLong", [13104.966, 3640.644, 4.4], [], 0, "CAN_COLLIDE"];
_bldObj setDir 59;
_bldObj setPos [13104.966, 3640.644, 4.4];