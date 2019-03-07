private ["_guns", "_objID", "_positions", "_static", "_gun", "_aicskill","_position","_unitcount","_skill","_wpRadius","_xpos","_ypos","_unitGroup","_aiskin","_unit","_weapon","_magazine","_wppos1","_wppos2","_wppos3","_wppos4","_wp1","_wp2","_wp3","_wp4","_wpfin"];
//	Массив позиций ботов в инстансе
_positions	=
	[
		[[11879.1, 967.358, 128.629], true]
		,[[11846.9, 970.346, 127.958], true]	
		,[[11826.7, 909.429, 128.44], true]

		,[[11882.7, 926.619, 126.888], true]
		,[[11875.6, 937.419, 126.375], true]
		,[[11863.9, 953.797, 125.581], true]
		,[[11854, 944.932, 125.527], true]
		,[[11843.4, 937.648, 125.408], true]
		,[[11849.5, 941.865, 125.479], true]
		,[[11844.7, 926.076, 125.779], true]
		,[[11835.1, 954.507, 124.668], true]
		,[[11838.1, 958.563, 124.646], true]
		,[[11835.7, 944.453, 124.972], true]
		,[[11824.2, 915.389, 125.429], true]
		,[[11832.7, 915.092, 125.714], true]
		,[[11828.8, 929.193, 125.2], true]	
		,[[11863.2, 969.08, 125.126], true]
		,[[11852.3, 970.745, 124.741], true]
		,[[11865.2, 944.843, 125.87], true]
		,[[11858.5, 920.233, 126.368], true]
		,[[11875.5, 916.054, 126.98], true]
		,[[11852.1, 918.224, 130.006], true]
		,[[11847.6, 918.135, 126.087], true]
		,[[11840.3, 922.231, 125.746], true]
		,[[11824.7, 933.025, 124.959], true]
		,[[11826.7, 911.547, 125.622], true]
		,[[11837.4, 915.816, 125.84], true]
	];
_xpos		=	11859;
_ypos		=	934;
_wpRadius	=	40;
_unitGroup	=	createGroup east;
_skill		=	2;
_guns		=	[];
{
	_position	=	(_x select 0);
	_static		=	(_x select 1);
	_aiskin		=	DZMSBanditSkins call BIS_fnc_selectRandom;
	_unit		=	_unitGroup createUnit [_aiskin, _position, [], 10, "PRIVATE"];
	if (_static) then
		{
			_gun = createVehicle ["DSHKM_TK_INS_EP1", _position, [], 0, "CAN_COLLIDE"];
			_gun setDir 0;
			_gun setPosATL _position;
			_objID	=	floor(random(99999999));
			_gun setVariable ["ObjectID", _objID, true];
			PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor, _gun];
			_guns set [count _guns, [_unit, _gun]];
		};
	[_unit] joinSilent _unitGroup;
	_unit enableAI "TARGET";
	_unit enableAI "AUTOTARGET";
	_unit enableAI "MOVE";
	_unit enableAI "ANIM";
	_unit enableAI "FSM";
	_unit setCombatMode "RED";
	_unit setBehaviour "COMBAT";
	removeAllWeapons _unit;
	removeAllItems _unit;
	_weaponArray	=	[_skill] call DZMSGetWeapon;
	_weapon			=	_weaponArray select 0;
	_magazine		=	_weaponArray select 1;
	_aigearArray	=	[DZMSGear0,DZMSGear1,DZMSGear2,DZMSGear3,DZMSGear4];
	_aigear			=	_aigearArray call BIS_fnc_selectRandom;
	_gearmagazines	=	_aigear select 0;
	_geartools		=	_aigear select 1;
	_aipack			=	DZMSPacklist call BIS_fnc_selectRandom;
	for "_i" from 1 to 3 do
		{_unit addMagazine _magazine;};
	_unit addWeapon _weapon;
	_unit selectWeapon _weapon;
	_unit addBackpack _aipack;
	if (DZMSUseNVG) then
		{_unit addWeapon "NVGoggles";};
	{
		_unit addMagazine _x
	} forEach _gearmagazines;
	{
		_unit addWeapon _x
	} forEach _geartools;
	switch (_skill) do
		{
			case 0: {_aicskill	=	DZMSSkills1;};
			case 1: {_aicskill	=	DZMSSkills2;};
			case 2: {_aicskill	=	DZMSSkills3;};
		};
	{
		_unit setSkill [(_x select 0),(_x select 1)]
	} forEach _aicskill;
	_unit addEventHandler ["Killed",{ [(_this select 0), (_this select 1)] ExecVM DZMSAIKilled; }];
	_unit setVariable ["DZMSAI", true];
	if (DZMSUseRPG) then
		{
			_unit addWeapon "RPG7V";
			_unit addMagazine "PG7V";
			_unit addMagazine "PG7V";
			_unit addMagazine "PG7V";		
		};
	if (_static) then
		{_unit moveingunner _gun;};
	sleep 0.5;
} forEach _positions;
[_guns] spawn
	{
		Private ["_guns"];
		_guns	=	(_this select 0);
		while {Ultima_Quest_Instance_Start} do
			{
				{
					if (alive (_x select 0)) then
						{(_x select 1) setVehicleAmmo 1;};
				} forEach _guns;
				sleep 5;
			};
	};