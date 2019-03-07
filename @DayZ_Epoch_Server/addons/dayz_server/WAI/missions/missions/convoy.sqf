//Construction Supply

private ["_spawn_radius","_mapcenter","_objPosition3","_objPosition2","_vehclass3","_vehclass2","_veh3","_veh2","_playerPresent","_cleanmission","_currenttime","_starttime","_missiontimeout","_vehname","_veh","_position","_vehclass","_vehdir","_objPosition"];

_vehclass = cargo_trucks call BIS_fnc_selectRandom;
_vehclass2 = refuel_trucks call BIS_fnc_selectRandom;
_vehclass3 = military_unarmed call BIS_fnc_selectRandom;
_mapcenter		=	(getMarkerPos "center");
_spawn_radius	=	(_mapcenter select 0) - 1000;
_position		=	[_mapcenter, 100, _spawn_radius, 20, 0, 20, 0] call BIS_fnc_findSafePos;

//Construction Supply Box
_box = createVehicle ["BAF_VehicleBox",[(_position select 0),(_position select 1),0], [], 0, "CAN_COLLIDE"];
[_box] call Construction_Supply_box;

_veh = createVehicle [_vehclass,[(_position select 0) - 15,(_position select 1),0], [], 0, "CAN_COLLIDE"];
_vehdir = round(random 360);
_veh setDir _vehdir;
clearWeaponCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
_veh setVariable ["ObjectID","1",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_veh];
diag_log format["WAI: Mission Convoy spawned a %1",_vehclass];

_objPosition = getPosATL _veh;

_veh2 = createVehicle [_vehclass2,[(_position select 0) + 15,(_position select 1),0], [], 0, "CAN_COLLIDE"];
_veh2 setDir _vehdir;
clearWeaponCargoGlobal _veh2;
clearMagazineCargoGlobal _veh2;
_veh2 setVariable ["ObjectID","1",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_veh2];
diag_log format["WAI: Mission Convoy spawned a %1",_vehclass2];

_objPosition2 = getPosATL _veh2;

_veh3 = createVehicle [_vehclass3,[(_position select 0) + 30,(_position select 1),0], [], 0, "CAN_COLLIDE"];
_veh3 setDir _vehdir;
clearWeaponCargoGlobal _veh3;
clearMagazineCargoGlobal _veh3;
_veh3 setVariable ["ObjectID","1",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_veh3];
diag_log format["WAI: Mission Convoy spawned a %1",_vehclass3];

_objPosition3 = getPosATL _veh3;

//Troops
_rndnum = round (random 3) + 5;
[[_position select 0, _position select 1, 0],_rndnum,1,"Random",4,"","USMC_LHD_Crew_Yellow","Random",true] call spawn_group;
[[_position select 0, _position select 1, 0],7,1,"Random",4,"","USMC_LHD_Crew_Blue","Random",true] call spawn_group;
[[_position select 0, _position select 1, 0],7,1,"Random",4,"","USMC_LHD_Crew_Blue","Random",true] call spawn_group;
[[_position select 0, _position select 1, 0],7,1,"Random",4,"","USMC_LHD_Crew_Blue","Random",true] call spawn_group;

//Turrets
[[[(_position select 0) + 5, (_position select 1) + 10, 0]], //Позиция(и) (могут быть указанны множественно - несколько).
"M2StaticMG",             // Класс туррели.
1,					  // Уровень навыков, от 0 до 1. Не эффективно, если используется выбор пользовательских навыков.
"USMC_LHD_Crew_Yellow",				          // Одежда. "" для случайного выбора. Или вписать имя класса.
1,						  // Номер оружейного конфига. "Random", для случайного выбора. (Не нужно, если переменная ai_static_useweapon = False)
2,						  // Кол-во магазинов.. (Не нужно, если переменная ai_static_useweapon = False)
"",						  // Рюкзак. "" для случайного выбора. Или вписать имя класса. (Не нужно, если переменная ai_static_useweapon = False)
"Random",				  // Номер конфигурации инвентаря. "Random", для случайного выбора. (Не нужно, если переменная ai_static_useweapon = False)
true						// mission true
] call spawn_static;

[[[(_position select 0) - 5, (_position select 1) - 10, 0]], //Позиция(и) (могут быть указанны множественно - несколько).
"Stinger_Pod_US_EP1",             // Класс туррели.
1,					  // Уровень навыков, от 0 до 1. Не эффективно, если используется выбор пользовательских навыков.
"USMC_LHD_Crew_Blue",				          // Одежда. "" для случайного выбора. Или вписать имя класса.
1,						  // Номер оружейного конфига. "Random", для случайного выбора. (Не нужно, если переменная ai_static_useweapon = False)
2,						  // Кол-во магазинов.. (Не нужно, если переменная ai_static_useweapon = False)
"",						  // Рюкзак. "" для случайного выбора. Или вписать имя класса. (Не нужно, если переменная ai_static_useweapon = False)
"Random",				  // Номер конфигурации инвентаря. "Random", для случайного выбора. (Не нужно, если переменная ai_static_useweapon = False)
true						// mission true
] call spawn_static;

[[[(_position select 0) + 20, (_position select 1) -20, 0]], //Позиция(и) (могут быть указанны множественно - несколько).
"M2StaticMG",             // Класс туррели.
1,					  // Уровень навыков, от 0 до 1. Не эффективно, если используется выбор пользовательских навыков.
"USMC_LHD_Crew_Yellow",				          // Одежда. "" для случайного выбора. Или вписать имя класса.
1,						  // Номер оружейного конфига. "Random", для случайного выбора. (Не нужно, если переменная ai_static_useweapon = False)
2,						  // Кол-во магазинов.. (Не нужно, если переменная ai_static_useweapon = False)
"",						  // Рюкзак. "" для случайного выбора. Или вписать имя класса. (Не нужно, если переменная ai_static_useweapon = False)
"Random",				  // Номер конфигурации инвентаря. "Random", для случайного выбора. (Не нужно, если переменная ai_static_useweapon = False)
true						// mission true
] call spawn_static;

[[[(_position select 0) + 40, (_position select 1) - 40, 0]], //Позиция(и) (могут быть указанны множественно - несколько).
"Stinger_Pod_US_EP1",             // Класс туррели.
1,					  // Уровень навыков, от 0 до 1. Не эффективно, если используется выбор пользовательских навыков.
"USMC_LHD_Crew_Blue",				          // Одежда. "" для случайного выбора. Или вписать имя класса.
1,						  // Номер оружейного конфига. "Random", для случайного выбора. (Не нужно, если переменная ai_static_useweapon = False)
2,						  // Кол-во магазинов.. (Не нужно, если переменная ai_static_useweapon = False)
"",						  // Рюкзак. "" для случайного выбора. Или вписать имя класса. (Не нужно, если переменная ai_static_useweapon = False)
"Random",				  // Номер конфигурации инвентаря. "Random", для случайного выбора. (Не нужно, если переменная ai_static_useweapon = False)
true						// mission true
] call spawn_static;

//Heli Para Drop
[[(_position select 0),(_position select 1),0],[0,0,0],400,"BAF_Merlin_HC3_D",10,1,"Random",4,"","USMC_LHD_Crew_Blue","Random",False] spawn heli_para;


[_position,"Конвой рабочих"] execVM "\z\addons\dayz_server\WAI\missions\compile\markers.sqf";
[nil,nil,rTitleText,"Группа рабочих группировки, устроила лагерную стоянку! Устройте им засаду, чтобы забрать стройматериал!!", "PLAIN",10] call RE;

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
	[_veh,[_vehdir,_objPosition],_vehclass,true,"0"];// call custom_publish;
	[_veh2,[_vehdir,_objPosition2],_vehclass2,true,"0"];// call custom_publish;
	[_veh3,[_vehdir,_objPosition3],_vehclass3,true,"0"];// call custom_publish;
	waitUntil
	{
		sleep 5;
		_playerPresent = false;
		{if((isPlayer _x) AND (_x distance _position <= 30)) then {_playerPresent = true};}forEach playableUnits;
		(_playerPresent)
	};
	diag_log format["WAI: Mission Convoy Ended At %1",_position];
	[nil,nil,rTitleText,"Выжившие обеспечили себя стройматериалом!", "PLAIN",10] call RE;
} else {
	clean_running_mission = True;
	deleteVehicle _veh;
	deleteVehicle _veh2;
	deleteVehicle _veh3;
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
	
	diag_log format["WAI: Mission Convoy timed out At %1",_position];
	[nil,nil,rTitleText,"Группа рабочих ушла с временной стоянки..", "PLAIN",10] call RE;
};
missionrunning = false;