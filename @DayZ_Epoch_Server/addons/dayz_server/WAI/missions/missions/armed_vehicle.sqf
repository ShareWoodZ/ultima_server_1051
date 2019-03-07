//Armed Vehicle

private ["_spawn_radius","_mapcenter","_playerPresent","_cleanmission","_currenttime","_starttime","_missiontimeout","_vehname","_veh","_position","_vehclass","_vehdir","_objPosition"];

_vehclass = armed_vehicle call BIS_fnc_selectRandom;

_vehname	= getText (configFile >> "CfgVehicles" >> _vehclass >> "displayName");
_mapcenter		=	(getMarkerPos "center");
_spawn_radius	=	(_mapcenter select 0) - 1000;
_position		=	[_mapcenter, 100, _spawn_radius, 20, 0, 20, 0] call BIS_fnc_findSafePos;

//Chain Bullet Box
_box = createVehicle ["USBasicWeaponsBox",[(_position select 0),(_position select 1) + 5,0], [], 0, "CAN_COLLIDE"];
[_box] call Chain_Bullet_Box;

//Armed Land Vehicle
_veh = createVehicle [_vehclass,_position, [], 0, "CAN_COLLIDE"];
_vehdir = round(random 360);
_veh setDir _vehdir;
_veh setVariable ["ObjectID","1",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_veh];
diag_log format["WAI: Mission Armed Vehicle spawned a %1",_vehname];

_objPosition = getPosATL _veh;
[_veh,[_vehdir,_objPosition],_vehclass,true,"0"];//call custom_publish;

//Troops
_rndnum = round (random 3) + 3;
[[_position select 0, _position select 1, 0],                  //position
_rndnum,				  //Кол-во единиц - ботов
1,					      // Уровень навыков, от 0 до 1. Не эффективно, если используется выбор пользовательских навыков.
"Random",			      // Номер оружейного конфига. "Random", для случайного выбора.
4,						  // Кол-во магазинов.
"",						  // Рюкзак. "" для случайного выбора. Или вписать имя класса.
"Ins_Soldier_Sapper",			  // Одежда. "" для случайного выбора. Или вписать имя класса.
"Random",				  // Номер конфигурации инвентаря. "Random", для случайного выбора.
true					  // Mission true or false
] call spawn_group;

[[_position select 0, _position select 1, 0],                  //position
8,						  //Кол-во единиц - ботов
1,					      // Уровень навыков, от 0 до 1. Не эффективно, если используется выбор пользовательских навыков.
"Random",			      // Номер оружейного конфига. "Random", для случайного выбора.
4,						  // Кол-во магазинов.
"",						  // Рюкзак. "" для случайного выбора. Или вписать имя класса.
"Ins_Soldier_Sapper",			  // Одежда. "" для случайного выбора. Или вписать имя класса.
"Random",				  // Номер конфигурации инвентаря. "Random", для случайного выбора.
true					  // Mission true or false
] call spawn_group;

[[_position select 0, _position select 1, 0],                  //position
8,						  //Кол-во единиц - ботов
1,					      // Уровень навыков, от 0 до 1. Не эффективно, если используется выбор пользовательских навыков.
"Random",			      // Номер оружейного конфига. "Random", для случайного выбора.
4,						  // Кол-во магазинов.
"",						  // Рюкзак. "" для случайного выбора. Или вписать имя класса.
"Ins_Soldier_Sapper",						  // Одежда. "" для случайного выбора. Или вписать имя класса.
"Random",				  // Номер конфигурации инвентаря. "Random", для случайного выбора.
true						// mission true
] call spawn_group;

[[_position select 0, _position select 1, 0],                  //position
8,						  //Кол-во единиц - ботов
1,					      // Уровень навыков, от 0 до 1. Не эффективно, если используется выбор пользовательских навыков.
"Random",			      // Номер оружейного конфига. "Random", для случайного выбора.
4,						  // Кол-во магазинов.
"",						  // Рюкзак. "" для случайного выбора. Или вписать имя класса.
"Ins_Soldier_Sapper",						  // Одежда. "" для случайного выбора. Или вписать имя класса.
"Random",				  // Номер конфигурации инвентаря. "Random", для случайного выбора.
true						// mission true
] call spawn_group;

//Turrets
[[[(_position select 0), (_position select 1) + 10, 0]], //Позиция(и) (могут быть указанны множественно - несколько).
"Stinger_Pod_US_EP1",             // Класс туррели.
1,					  // Уровень навыков, от 0 до 1. Не эффективно, если используется выбор пользовательских навыков.
"Ins_Soldier_Sapper",				          // Одежда. "" для случайного выбора. Или вписать имя класса.
1,						  // Номер оружейного конфига. "Random", для случайного выбора. (Не нужно, если переменная ai_static_useweapon = False)
2,						  // Кол-во магазинов.. (Не нужно, если переменная ai_static_useweapon = False)
"",						  // Рюкзак. "" для случайного выбора. Или вписать имя класса. (Не нужно, если переменная ai_static_useweapon = False)
"Random",				  // Номер конфигурации инвентаря. "Random", для случайного выбора. (Не нужно, если переменная ai_static_useweapon = False)
True					  // Mission true or false
] call spawn_static;


[_position,_vehname] execVM "\z\addons\dayz_server\WAI\missions\compile\markers.sqf";
[nil,nil,rTitleText,"Бандиты повредили вооруженное транспортное средство, с большим количеством боеприпасов для транспорта! Проверьте свою карту, что бы узнать местоположение!", "PLAIN",10] call RE;

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
	waitUntil
	{
		sleep 5;
		_playerPresent = false;
		{if((isPlayer _x) AND (_x distance _position <= 30)) then {_playerPresent = true};}forEach playableUnits;
		(_playerPresent)
	};
	diag_log format["WAI: Mission Armed vehicle Ended At %1",_position];
	[nil,nil,rTitleText,"Вооруженное транспортное средство, перешло под контроль выживших!", "PLAIN",10] call RE;
} else {
	clean_running_mission = True;
	deleteVehicle _veh;
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
	
	diag_log format["WAI: Mission Armed vehicle Timed Out At %1",_position];
	[nil,nil,rTitleText,"Бандиты ушли с боеприпасами для транспорта", "PLAIN",10] call RE;
};

missionrunning = false;