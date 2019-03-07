private ["_remove_actions", "_repair_vehicle", "_refuel_vehicle", "_rearm_vehicle", "_get_data", "_isArmed", "_getWeapons", "_vehicle", "_inVehicle", "_playerPos", "_canRepair", "_canRefuel", "_canRearm", "_data", "_cost", "_title"];

_remove_actions	=
	{
		Private	["_action"];
		_action	=	(_this select 0);
		switch (_action) do
			{
				case 0:
					{
						if !(isNil "_repair_vehicle") then
							{
								_repair_vehicle removeAction su_player_repair;
								su_player_repair	=	-1;
								_repair_vehicle		=	nil;
							};
					};
				case 1:
					{
						if !(isNil "_refuel_vehicle") then
							{
								_refuel_vehicle removeAction su_player_refuel;
								su_player_refuel	=	-1;
								_refuel_vehicle		=	nil;
							};
					};
				case 2:
					{
						if !(isNil "_rearm_vehicle") then
							{
								{_rearm_vehicle removeAction _x;} forEach su_player_rearms;
								su_player_rearm		=	-1;
								_rearm_vehicle		=	nil;
								su_player_rearms	=	[];
							};	
					};
				case 3:
					{
						if !(isNil "_repair_vehicle") then
							{
								_repair_vehicle removeAction su_player_repair;
								su_player_repair	=	-1;
								_repair_vehicle		=	nil;
							};	
						if !(isNil "_refuel_vehicle") then
							{
								_refuel_vehicle removeAction su_player_refuel;
								su_player_refuel	=	-1;
								_refuel_vehicle		=	nil;
							};
						if !(isNil "_rearm_vehicle") then
							{
								{_rearm_vehicle removeAction _x;} forEach su_player_rearms;
								su_player_rearm		=	-1;
								_rearm_vehicle		=	nil;
								su_player_rearms	=	[];
							};			
					};
			};			
	};
	
_get_data	=
	{
		Private ["_vehicle", "_action", "_type", "_result"];
		_vehicle	=	(_this select 0);
		_action		=	(_this select 1);
		_type		=	(typeOf _vehicle);
		_result		=	[_vehicle];
		switch (_action) do
			{
				case 0: 
					{
						_result	set [(count _result), Ultima_Repair_Cost];
						_result	set [(count _result), Ultima_Repair_Delay];
						{
							if ( (_x select 0) == _type ) exitWith
								{
									_result	set [1, (_x select 1)];
									_result	set [2, (_x select 2)];
								};
						}forEach Ultima_Repair_Veh;
					};
				case 1: 
					{
						_result	set [(count _result), Ultima_Refuel_Cost];
						_result	set [(count _result), Ultima_Refuel_Delay];
						_result	set [(count _result), Ultima_Refuel_Amount];
						{
							if ( (_x select 0) == _type ) exitWith
								{
									_result	set [1, (_x select 1)];
									_result	set [2, (_x select 2)];
									_result	set [3, (_x select 3)];
								};
						}forEach Ultima_Refuel_Veh;
					};
				case 2: 
					{
						_result	set [(count _result), Ultima_Rearm_Cost];
						_result	set [(count _result), Ultima_Rearm_Delay];
						_result	set [(count _result), Ultima_Rearm_Amount];
						{
							if ( (_x select 0) == _type ) exitWith
								{
									_result	set [1, (_x select 1)];
									_result	set [2, (_x select 2)];
									_result	set [3, (_x select 3)];
								};
						}forEach Ultima_Rearm_Veh;
					};
			};
		_result			
	};

_isArmed	=
	{
		private ["_role", "_result"];
		_role	=	_this;
		_result	=	count _role > 1;
		_result
	};

_getWeapons	=
	{
		private ["_vehicle", "_role", "_result"];
		_vehicle	=	(_this select 0);
		_role		=	(_this select 1);
		_result		=	[];
		if (count _role > 1) then
			{
				private ["_turret", "_weaponsTurret"];
				_turret			=	(_role select 1);
				_weaponsTurret	=	_vehicle weaponsTurret _turret;
				{
					private "_weaponName";
					_weaponName	=	getText (configFile >> "CfgWeapons" >> _x >> "displayName");
					_result set [count _result, [_x, _weaponName, _turret]];
				} forEach _weaponsTurret;
			};
		_result
	};	

su_player_repair	=	-1;
su_player_refuel	=	-1;
su_player_rearm		=	-1;
su_player_rearms	=	[];

while {true} do
	{
		_vehicle	=	(vehicle player);
		_inVehicle	=	_vehicle != player;
		if (local _vehicle && _inVehicle) then
			{
				_playerPos	=	getPosATL player;
				_canRepair	=	count nearestObjects [_playerPos, Ultima_Repair_Objects, Ultima_Repair_Distance] > 0;
				_canRefuel	=	count nearestObjects [_playerPos, Ultima_Refuel_Objects, Ultima_Refuel_Distance] > 0;
				_canRearm	=	count nearestObjects [_playerPos, Ultima_Rearm_Objects, Ultima_Rearm_Distance] > 0;
				if (_canRepair) then
					{
						if (su_player_repair < 0) then
							{
								_data				=	[_vehicle, 0] call _get_data;
								_cost				=	(_data select 1);								
								_title				=	format["Ремонт - %1 баксов", _cost];
								_repair_vehicle		=	_vehicle;
								su_player_repair	=	_vehicle addaction[_title,"custom\service\repair.sqf",_data,5,false,true,"", ""];
							};
					}
				else
					{[0] call _remove_actions;};
				if (_canRefuel) then
					{
						if (su_player_refuel < 0) then
							{
								_data				=	[_vehicle, 1] call _get_data;
								_cost				=	(_data select 1);								
								_title				=	format["Заправка - %1 баксов", _cost];
								_refuel_vehicle		=	_vehicle;
								su_player_refuel	=	_vehicle addaction[_title,"custom\service\refuel.sqf",_data,5,false,true,"", ""];
							};
					}
				else
					{[1] call _remove_actions;};
				_role	=	assignedVehicleRole player;
				if ( (_canRearm) && (_role call _isArmed) ) then
					{
						if ( (su_player_rearm < 0) && (count su_player_rearms == 0) ) then
							{
								private ["_weapons", "_weaponName", "_rdata"];
								_rearm_vehicle		=	_vehicle;
								_data				=	[_vehicle, 2] call _get_data;
								_cost				=	(_data select 1);
								_role				=	assignedVehicleRole player;
								_weapons = [_vehicle, _role] call _getWeapons;
								{
									_rdata	=	[];
									{
										_rdata set [(count _rdata), _x];
									} forEach _data;
									_weaponName		=	(_x select 1);
									_rdata	set [(count _rdata), _x];
									_title			=	format["Пополнение БК: %1 - %2 баксов", _weaponName, _cost];
									su_player_rearm	=	_vehicle addaction[_title,"custom\service\rearm.sqf",_rdata,5,false,true,"", ""];
									su_player_rearms set [count su_player_rearms, su_player_rearm];
								} forEach _weapons;
							};
					}
				else
					{[2] call _remove_actions;};
			}
		else
			{[3] call _remove_actions;};
		sleep 2;
	};