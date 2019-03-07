private ["_vehicle", "_cost", "_bank", "_repairTime", "_type", "_name", "_hitpoints", "_allRepaired"];
_vehicle		=	((_this select 3) select 0);
if (!local _vehicle) exitWith
	{ diag_log format["[Ultima]: [Автосервис]: [Ошибка]: вызов repair.sqf с не локальной техники: %1", _vehicle] };
_cost			=	((_this select 3) select 1);
_repairTime		=	((_this select 3) select 2);
_bank			=	player getVariable ["Ultima_Money", 0];
if ( (_bank - _cost) < 0 ) exitWith
	{systemChat "Нехватает средств в банке!"};
_type			=	typeOf _vehicle;
_name			=	getText(configFile >> "cfgVehicles" >> _type >> "displayName");
_vehicle engineOn false;
[_vehicle, "repair", 0, false] call dayz_zombieSpeak;
_hitpoints		=	_vehicle call vehicle_getHitpoints;
_allRepaired	=	true;
if (_cost > 0) then
	{
		Terminal_Server	=	[player, "trader_buy", (-1*_cost)];
		publicVariableServer "Terminal_Server";
	};
{
	private ["_damage", "_selection"];
	if ((vehicle player != _vehicle) || (!local _vehicle) || ([0,0,0] distance (velocity _vehicle) > 1)) exitWith
		{
			_allRepaired = false;
			SystemChat format["Ремонт %1 остановлен", _name];
		};
	_damage = [_vehicle,_x] call object_getHit;
	if (_damage > 0) then
		{
			if (_repairTime > 0) then
				{
					private ["_partName"];
					_partName = toArray _x;
					_partName set [0,20];
					_partName set [1,45];
					_partName set [2,20];
					_partName	=	toString _partName;
					systemChat format["Ремонтируется %1 ...", _partName];
					sleep _repairTime;
				};
			_selection = getText(configFile >> "cfgVehicles" >> _type >> "HitPoints" >> _x >> "name");
			[_vehicle,_selection,0] call object_setFixServer;
		};
} forEach _hitpoints;
if (_allRepaired) then
	{
		_vehicle setDamage 0;
		_vehicle setVelocity [0, 0, 1];
		systemChat format["%1 отремонтирован.", _name];
	};
