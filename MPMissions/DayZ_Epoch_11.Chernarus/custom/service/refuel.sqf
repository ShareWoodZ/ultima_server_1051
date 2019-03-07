private ["_vehicle", "_cost", "_bank", "_updateInterval", "_amount", "_type", "_name"];
_vehicle		=	((_this select 3) select 0);
if (!local _vehicle) exitWith
	{ diag_log format["[Ultima]: [Автосервис]: [Ошибка]: вызов refuel.sqf с не локальной техники: %1", _vehicle] };
_cost			=	((_this select 3) select 1);
_updateInterval	=	((_this select 3) select 2);
_amount			=	((_this select 3) select 3);
_bank			=	player getVariable ["Ultima_Money", 0];
if ( (_bank - _cost) < 0 ) exitWith
	{systemChat "Нехватает средств в банке!"};
_type			=	typeOf _vehicle;
_name			=	getText(configFile >> "cfgVehicles" >> _type >> "displayName");
if (isNil "SP_refueling") then
	{
		if (_cost > 0) then
			{
				Terminal_Server	=	[player, "trader_buy", (-1*_cost)];
				publicVariableServer "Terminal_Server";
			};
		private ["_fuel"];
		SP_refueling	=	true;
		_vehicle engineOn false;
		systemChat format["Заправка %1 ...", _name];
		[_vehicle, "refuel", 0, false] call dayz_zombieSpeak;
		while {(vehicle player == _vehicle) && (local _vehicle)} do
			{
				if ([0, 0, 0] distance (velocity _vehicle) > 1) exitWith
					{systemChat format["Заправка %1 остановлена.", _name];};
				_fuel	=	(fuel _vehicle) + _amount;
				if (_fuel > 0.99) exitWith
					{
						_vehicle setFuel 1;
						systemChat format["%1 заправлен.", _name];
					};
				_vehicle setFuel _fuel;
				sleep _updateInterval;
			};
		SP_refueling	=	nil;
	};
