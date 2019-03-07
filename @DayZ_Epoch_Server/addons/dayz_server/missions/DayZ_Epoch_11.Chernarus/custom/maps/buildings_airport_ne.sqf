private ["_aObjs","_bldObj"];
_bldObj	=	objNull;
_aObjs	=	[
					["Land_Mil_Barracks_i", [11888.394, 12636.021, 0.00010681152], 203.30753, false],
					["Land_Mil_Barracks_i", [12368.175, 12556.119, -1.5258789e-005], 651.77905, false],
					["Land_SS_hangar", [11773.477, 12713.312, 0.37380856], -67.406868, false],
					["Land_SS_hangar", [11788.802, 12750.295, 0.50108337], -67.863274, false],
					["Land_Mil_ControlTower", [11982.204, 12811.723, -0.00010681152], -159.72865, false],
					["Land_Mil_House", [11877.972, 12610.757, -1.5258789e-005], -66.021194, false],
					["Land_Hangar_2", [12430.271, 12531.523, -0.12525643], 201.261, false],
					["Land_A_Office01", [12350.079, 12691.594, -0.12129422], 25.082245, false],
					["Land_Hangar_2", [12397.018, 12544.419, -0.13087651], 200.89622, false],
					["Land_Mil_Barracks_i", [12011.249, 12804.187, -1.5258789e-005], 112.11662, false],
					["Land_A_BuildingWIP", [11773.036, 12611.111, 0.12649702], 29.777769, false],
					["Land_SS_hangar", [12249.766, 12597.254, 0.65909827], 201.20877, false],
					["Land_SS_hangar", [12307.665, 12574.459, 0.6841833], -158.7229, false],
					["Land_Mil_Barracks", [11895.548, 12648.499], 203.71419, false],
					["Land_Mil_Barracks_L", [11902.436, 12668.059, 3.0517578e-005], 113.53212, false],
					["Land_Mil_Barracks_L", [12347.893, 12565.811, 1.5258789e-005], 111.60999, false],
					["Land_Mil_Barracks_L", [12272.437, 12573.866, 3.0517578e-005], 202.60869, false]
				];
{
	_bldObj = createVehicle [(_x select 0), (_x select 1), [], 0, "CAN_COLLIDE"];
	if ((_x select 2) != 1234567890) then
		{_bldObj setDir (_x select 2);};
	if (_x select 3) then
		{_bldObj setVehicleInit "this allowDammage false; this enableSimulation false;";};
	_bldObj setPos (_x select 1);
} forEach _aObjs;