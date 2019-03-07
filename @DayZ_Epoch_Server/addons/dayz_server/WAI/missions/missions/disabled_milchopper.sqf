//Военный вертолет
private ["_spawn_radius","_mapcenter","_playerPresent","_cleanmission","_currenttime","_starttime","_missiontimeout","_vehname","_veh","_position","_vehclass","_vehdir","_objPosition"];
_vehclass = armed_chopper call BIS_fnc_selectRandom;
_vehname	= getText (configFile >> "CfgVehicles" >> _vehclass >> "displayName");
_mapcenter		=	(getMarkerPos "center");
_spawn_radius	=	(_mapcenter select 0) - 1000;
_position		=	[_mapcenter, 100, _spawn_radius, 20, 0, 20, 0] call BIS_fnc_findSafePos;
_box		=	createVehicle ["BAF_VehicleBox",[(_position select 0),(_position select 1) + 5,0], [], 0, "CAN_COLLIDE"];
[_box] call Sniper_Gun_Box;
_veh		=	createVehicle [_vehclass,_position, [], 0, "CAN_COLLIDE"];
_vehdir		=	round(random 360);
_veh setDir _vehdir;
clearWeaponCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
_veh setVariable ["ObjectID","1",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_veh];
diag_log format["[WAI]: [Миссия]: [Военный вертолет]: Cоздана в координатах %1",_vehname];
_objPosition = getPosATL _veh;
_rndnum = round (random 3) + 3;
[[_position select 0, _position select 1, 0],_rndnum,1,"Random",4,"","Bandit2_DZ","Random",true] call spawn_group;
[[_position select 0, _position select 1, 0],18,1,"Random",4,"","Bandit2_DZ","Random",true] call spawn_group;
[[[(_position select 0), (_position select 1) + 10, 0]],"M2StaticMG",1,"Bandit2_DZ",1,2,"","Random",true] call spawn_static;
[[[(_position select 0), (_position select 1) - 10, 0]],"Stinger_Pod_US_EP1",1,"Bandit2_DZ",1,2,"","Random",true] call spawn_static;
[[[(_position select 0), (_position select 1) + 20, 0]],"ZU23_TK_EP1",1,"Bandit2_DZ",1,2,"","Random",true] call spawn_static;
[_position,_vehname] execVM "\z\addons\dayz_server\WAI\missions\compile\markers.sqf";
[nil,nil,rTitleText,"A bandit helicopter is taking off with a crate of snipers! Save the cargo and keep the guns for yourself.", "PLAIN",10] call RE;
_missiontimeout	=	true;
_cleanmission	=	false;
_playerPresent	=	false;
_starttime = floor(time);
while {_missiontimeout} do
	{
		sleep 5;
		_currenttime = floor(time);
		{
			if((isPlayer _x) AND (_x distance _position <= 150)) then
			{_playerPresent = true};
		} forEach playableUnits;
		if (_currenttime - _starttime >= wai_mission_timeout) then
			{_cleanmission = true;};
		if ((_playerPresent) OR (_cleanmission)) then
			{_missiontimeout = false;};
	};
if (_playerPresent) then
	{
		[_veh,[_vehdir,_objPosition],_vehclass,true,"0"];
		waitUntil
		{
			sleep 5;
			_playerPresent = false;
			{
				if((isPlayer _x) AND (_x distance _position <= 30)) then
					{_playerPresent = true};
			} forEach playableUnits;
			(_playerPresent)
		};
		diag_log format["[WAI]: [Миссия]: [Военный вертолет]: Завершена в координатах: %1",_position];
		[nil,nil,rTitleText,"Контроль над военным вертолетом, перешел к выжившим!", "PLAIN",10] call RE;
	}
else
	{
		clean_running_mission = True;
		deleteVehicle _veh;
		deleteVehicle _box;
		{
			_cleanunits = _x getVariable "missionclean";
			if (!isNil "_cleanunits") then
				{
					switch (_cleanunits) do
						{
							case "ground"	:	{ai_ground_units = (ai_ground_units -1);};
							case "air"		:   {ai_air_units = (ai_air_units -1);};
							case "vehicle"	:	{ai_vehicle_units = (ai_vehicle_units -1);};
							case "static"	:	{ai_emplacement_units = (ai_emplacement_units -1);};
						};
					deleteVehicle _x;
					sleep 0.05;
				};	
		} forEach allUnits;
		diag_log format["[WAI]: [Миссия]: [Военный вертолет]: Завершена в координатах: %1. Истекло время отведенное на зачистку.",_position];
		[nil,nil,rTitleText,"Survivors did not secure the armed chopper in time!", "PLAIN",10] call RE;
	};
missionrunning = false;