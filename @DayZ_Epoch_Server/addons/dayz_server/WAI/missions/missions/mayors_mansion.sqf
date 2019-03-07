//Мэр

private ["_spawn_radius","_mapcenter","_position","_box","_missiontimeout","_cleanmission","_playerPresent","_starttime","_currenttime","_cleanunits","_rndnum"];
vehclass = military_unarmed call BIS_fnc_selectRandom;
 
_mapcenter		=	(getMarkerPos "center");
_spawn_radius	=	(_mapcenter select 0) - 1000;
_position		=	[_mapcenter, 100, _spawn_radius, 20, 0, 20, 0] call BIS_fnc_findSafePos;

//Large Gun Box
_box = createVehicle ["BAF_VehicleBox",[(_position select 0),(_position select 1), .5], [], 0, "CAN_COLLIDE"];
[_box] call Large_Gun_Box;
 
diag_log format["WAI: Mission Mayors Mansion Started At %1",_position];

//Mayors Mansion
_baserunover = createVehicle ["Land_A_Villa_EP1",[(_position select 0), (_position select 1),0],[], 0, "CAN_COLLIDE"];

_rndnum = round (random 3) + 4;
[[_position select 0, _position select 1, 0],8,1,"Random",4,"","TK_INS_Soldier_AT_EP1","Random",true] call spawn_group;
[[_position select 0, _position select 1, 0],4,1,"Random",4,"","TK_INS_Soldier_AT_EP1","Random",true] call spawn_group;
[[_position select 0, _position select 1, 0],4,1,"Random",4,"","TK_INS_Soldier_AT_EP1","Random",true] call spawn_group;
[[_position select 0, _position select 1, 0],4,1,"Random",4,"","TK_INS_Soldier_AT_EP1","Random",true] call spawn_group;

//The Mayor Himself
[[_position select 0, _position select 1, 0],1,1,"Random",4,"","Functionary1_EP1_DZ","Random",true] call spawn_group;
 
[[[(_position select 0) - 15, (_position select 1) + 15, 8]],"M2StaticMG",1,"TK_INS_Soldier_AT_EP1",1,2,"","Random",true] call spawn_static;
[[[(_position select 0) + 60, (_position select 1) - 40, 8]],"Stinger_Pod_US_EP1",1,"TK_INS_Soldier_AT_EP1",1,2,"","Random",true] call spawn_static;
[[[(_position select 0) - 60, (_position select 1) + 70, 8]],"ZU23_TK_EP1",1,"TK_INS_Soldier_AT_EP1",1,2,"","Random",true] call spawn_static;
 
[_position,"Дезертир"] execVM "\z\addons\dayz_server\WAI\missions\compile\markers.sqf";
[nil,nil,rTitleText,"Мэр города, возглавляет преступную группировку. Уничтожьте его, и захватите вооружение черного рынка!", "PLAIN",10] call RE;
_missiontimeout = true;
_cleanmission = false;
_playerPresent = false;
_starttime = floor(time);
while {_missiontimeout} do {
	sleep 5;
	_currenttime = floor(time);
	{if((isPlayer _x) AND (_x distance _position <= 150)) then {_playerPresent = true};}forEach playableUnits;
	if (_currenttime - _starttime >= wai_mission_timeout) then {_cleanmission = true;};
	if ((_playerPresent) OR (_cleanmission)) then {_missiontimeout = false;};
};
if (_playerPresent) then {
	waitUntil
	{
		sleep 5;
		_playerPresent = false;
		{if((isPlayer _x) AND (_x distance _position <= 30)) then {_playerPresent = true};}forEach playableUnits;
		(_playerPresent)
	};
	diag_log format["WAI: Mission Mayors Mansion Ended At %1",_position];
	[nil,nil,rTitleText,"Мэр был уничтожен выжившими. Кто будет следующим?", "PLAIN",10] call RE;
} else {
	clean_running_mission = True;
	deleteVehicle _box;
	{_cleanunits = _x getVariable "missionclean";
	if (!isNil "_cleanunits") then {
		switch (_cleanunits) do {
			case "ground" :  {ai_ground_units = (ai_ground_units -1);};
			case "air" :     {ai_air_units = (ai_air_units -1);};
			case "vehicle" : {ai_vehicle_units = (ai_vehicle_units -1);};
			case "static" :  {ai_emplacement_units = (ai_emplacement_units -1);};
		};
		deleteVehicle _x;
		sleep 0.05;
	};
	} forEach allUnits;
 
	diag_log format["WAI: Mission Mayors Mansion At %1",_position];
	[nil,nil,rTitleText,"Выжившие не сумели остановить мэра во время!", "PLAIN",10] call RE;
};
 
missionrunning = false;