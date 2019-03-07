private ["_vehicle", "_cost", "_bank", "_delay", "_magazineCount", "_weapon", "_type", "_name", "_weaponType", "_weaponName", "_turret", "_magazines", "_ammo", "_i"];
_vehicle		=	((_this select 3) select 0);
if (!local _vehicle) exitWith
	{ diag_log format["Ошибка: вызов service_point_rearm.sqf с не локальной техники: %1", _vehicle] };
_cost			=	((_this select 3) select 1);
_delay			=	((_this select 3) select 2);
_magazineCount	=	((_this select 3) select 3);
_weapon			=	((_this select 3) select 4);
_bank			=	player getVariable ["Ultima_Money", 0];
if ( (_bank - _cost) < 0 ) exitWith
	{systemChat "Нехватает средств в банке!"};
_type			=	typeOf _vehicle;
_name			=	getText(configFile >> "cfgVehicles" >> _type >> "displayName");
_weaponType		=	(_weapon select 0);
_weaponName		=	(_weapon select 1);
_turret			=	(_weapon select 2);
_magazines		=	getArray (configFile >> "CfgWeapons" >> _weaponType >> "magazines");
_ammo			=	(_magazines select 0);
_magazines		=	_vehicle magazinesTurret _turret;
if (_cost > 0) then
	{
		Terminal_Server	=	[player, "trader_buy", (-1*_cost)];
		publicVariableServer "Terminal_Server";
	};
{_vehicle removeMagazineTurret [_x, _turret];} forEach _magazines;
for "_i" from 1 to _magazineCount do
	{
		_vehicle addMagazineTurret [_ammo, _turret];
		systemChat format["Заряжается %1 магазин...", _i];
		sleep _delay;
	};
systemChat format["%1 %2 заряжен.", _weaponName, _name];
