private ["_aObjs","_bldObj"];
_bldObj	=	objNull;
_aObjs	=	[
					["Land_Hangar_2", [4270.0137, 10954.484], -30.028156, false],
					["Land_Hangar_2", [4241.7148, 10938.167, 6.1035156e-005], -30.017132, false],
					["Land_Mil_House", [4197.0757, 10908.443, 0.00018310547], 150.263, false],
					["Land_A_BuildingWIP", [4237.9316, 10362.351, 9.1552734e-005], 57.221092, false],
					["Land_Mil_Barracks_i", [4659.936, 9582.8896, 6.1035156e-005], 186.67348, false],
					["Land_Mil_Barracks_i", [4618.7061, 9608.5479, 3.0517578e-005], 32.393299, false],
					["Misc_Cargo1Bo_military", [4564.3662, 9861.3066, 6.1035156e-005], 66.018982, false],
					["Land_Misc_Cargo1Eo_EP1", [4567.2158, 9855.2178, 6.1035156e-005], 63.830437, false],
					["Land_SS_hangar", [4478.6792, 10593.926], -30.030834, false],
					["Land_SS_hangar", [4437.3857, 10569.98, -0.00012207031], -29.80624, false],
					["Land_Mil_ControlTower", [4912.5083, 9713.2383], -26.323793, false],
					["Land_Ind_TankSmall2", [4506.0093, 9945.8525, 0.00012207031], 6.1595168, false],
					["Land_A_FuelStation_Build", [4499.0264, 9949.5439], -123.75807, false],
					["Land_A_FuelStation_Shed", [4496.9702, 9964.0313, 3.0517578e-005], 235.69679, false],
					["Land_A_FuelStation_Feed", [4503.813, 9959.1582, -3.0517578e-005], -31.522814, false],
					["Land_A_FuelStation_Feed", [4499.9609, 9964.9355], -34.297668, false],
					["Land_A_FuelStation_Feed", [4496.0161, 9970.5674, 3.0517578e-005], -34.354607, false],
					["Land_A_FuelStation_Feed", [4491.1973, 9967.3174, 3.0517578e-005], -35.28075, false],
					["Land_A_FuelStation_Feed", [4495.0713, 9961.5039], -33.094849, false],
					["Land_A_FuelStation_Feed", [4498.9126, 9955.8428], -35.565773, false]
				];
{
	_bldObj = createVehicle [(_x select 0), (_x select 1), [], 0, "CAN_COLLIDE"];
	if ((_x select 2) != 1234567890) then
		{_bldObj setDir (_x select 2);};
	if (_x select 3) then
		{_bldObj setVehicleInit "this allowDammage false; this enableSimulation false;";};
	_bldObj setPos (_x select 1);
} forEach _aObjs;