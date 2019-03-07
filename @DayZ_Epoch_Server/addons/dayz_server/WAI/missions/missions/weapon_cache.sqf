//Weapon Cache
private ["_spawn_radius","_mapcenter","_position","_box","_missiontimeout","_cleanmission","_playerPresent","_starttime","_currenttime","_cleanunits","_rndnum"];
_mapcenter		=	(getMarkerPos "center");
_spawn_radius	=	(_mapcenter select 0) - 1000;
_position		=	[_mapcenter, 100, _spawn_radius, 20, 0, 20, 0] call BIS_fnc_findSafePos;
_box = createVehicle ["BAF_VehicleBox",[(_position select 0),(_position select 1),0], [], 0, "CAN_COLLIDE"];
[_box] call Medium_Gun_Box;
_rndnum = round (random 3) + 4;
[[_position select 0, _position select 1, 0],                  //position
8,						  //	Кол-во единиц - ботов
1,					      //	Уровень навыков, от 0 до 1. Не эффективно, если используется выбор пользовательских навыков.
"Random",			      //	Номер оружейного конфига. "Random", для случайного выбора.
4,						  //	Кол-во магазинов.
"",						  //	Рюкзак. "" для случайного выбора. Или вписать имя класса.
"Bandit2_DZ",			  //	Одежда. "" для случайного выбора. Или вписать имя класса.
"Random",				  //	Номер конфигурации инвентаря. "Random", для случайного выбора.
true
] call spawn_group;
[[_position select 0, _position select 1, 0],8,1,"Random",4,"","Bandit2_DZ","Random",true] call spawn_group;
[[[(_position select 0), (_position select 1) + 30, 0],[(_position select 0) - 60, (_position select 1), 0]], //Позиция(и) (могут быть указанны множественно - несколько).
"ZU23_TK_EP1",	//	Класс туррели.
1,				//	Уровень навыков, от 0 до 1. Не эффективно, если используется выбор пользовательских навыков.
"Bandit2_DZ",	//	Одежда. "" для случайного выбора. Или вписать имя класса.
0,				//	Номер оружейного конфига. "Random", для случайного выбора. (Не нужно, если переменная ai_static_useweapon = False)
2,				//	Кол-во магазинов.. (Не нужно, если переменная ai_static_useweapon = False)
"",				//	Рюкзак. "" для случайного выбора. Или вписать имя класса. (Не нужно, если переменная ai_static_useweapon = False)
"Random",		//	Номер конфигурации инвентаря. "Random", для случайного выбора. (Не нужно, если переменная ai_static_useweapon = False)
true
] call spawn_static;
[[[(_position select 0), (_position select 1) - 50, 0],[(_position select 0) + 60, (_position select 1), 0]],"ZU23_TK_EP1",1,"Bandit2_DZ",0,2,"","Random",true] call spawn_static;
[_position,"Ящик с оружием"] execVM "\z\addons\dayz_server\WAI\missions\compile\markers.sqf";
[nil,nil,rTitleText,"Бандиты получили ящик оружия! Проверьте карту что бы узнать его местоположение!", "PLAIN",10] call RE;
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
	diag_log format["WAI: Mission Weapon cache Ended At %1",_position];
	[nil,nil,rTitleText,"Выжившие обеспечили себя оружием!", "PLAIN",10] call RE;
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
	
	diag_log format["WAI: Mission Weapon cache timed out At %1",_position];
	[nil,nil,rTitleText,"Выжившие не успели обеспечить себя оружием!", "PLAIN",10] call RE;
};
missionrunning = false;
