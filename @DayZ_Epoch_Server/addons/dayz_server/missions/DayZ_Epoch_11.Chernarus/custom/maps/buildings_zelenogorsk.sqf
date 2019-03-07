private ["_aObjs","_bldObj"];
_bldObj	=	objNull;
_aObjs	=	[
					["MAP_A_Hospital", [2550.3889, 5036.8369], -32.003807, false],
					["MAP_a_stationhouse", [2694.6567, 5429.0488, 0.00010681152], 205.72932, false]
				];
{
	_bldObj = createVehicle [(_x select 0), (_x select 1), [], 0, "CAN_COLLIDE"];
	if ((_x select 2) != 1234567890) then
		{_bldObj setDir (_x select 2);};
	if (_x select 3) then
		{_bldObj setVehicleInit "this allowDammage false; this enableSimulation false;";};
	_bldObj setPos (_x select 1);
} forEach _aObjs;