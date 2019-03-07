private ["_characterID","_minutes","_newObject","_playerID","_infected","_victim","_victimName","_killer","_killerName","_weapon","_distance","_message","_loc_message","_key","_death_record"];
_characterID	=	_this select 0;
_minutes		=	_this select 1;
_newObject		=	_this select 2;
_playerID		=	_this select 3;
_infected		=	_this select 4;

//	Обнулим карманные деньги умершего игрока
for "_i" from 0 to (count Ultima_Cash) -1 do
	{
		if (_playerID == ((Ultima_Cash select _i) select 0)) exitWith
			{
				Ultima_Cash set [_i,[_playerID,0]];
				_rec	= [_playerID,0];	
				"ultima_ini" callExtension format["9|%1|%2|%3","cash",_playerID,_rec];
			};
	};

if (((count _this) >= 6) && {(typeName (_this select 5)) == "STRING"} && {(_this select 5) != ""}) then
	{_victimName	=	_this select 5;}
else
	{_victimName	=	if (alive _newObject) then {name _newObject;} else {"";};};
_victim	=	_newObject;
_newObject setVariable ["bodyName", _victimName, true];
_killer		=	_victim getVariable["AttackedBy", "nil"];
_killerName	=	_victim getVariable["AttackedByName", "nil"];
if ((typeName _killer) != "STRING") then
	{
		_weapon	=	_victim getVariable["AttackedByWeapon", "nil"];
		_distance	=	_victim getVariable["AttackedFromDistance", "nil"];
		if ((owner _victim) == (owner _killer)) then 
			{
				_message		=	format["%1 совершил самоубийство",_victimName];
				_loc_message	=	format["[Сервер]: [Смерть игрока]: %1 совершил самоубийство", _victimName];
			}
		else
			{
				_message		=	format["%1 был убит: %2, с помощью: %3, с расстояния: %4м",_victimName, _killerName, _weapon, _distance];
				_loc_message	=	format["[Сервер]: [Смерть игрока]: %1 был убит: %2, с помощью: %3, с расстояния: %4м", _victimName, _killerName, _weapon, _distance];
			};
		diag_log _loc_message;
		if (DZE_DeathMsgGlobal) then
			{[nil, nil, rspawn, [_killer, _message], { (_this select 0) globalChat (_this select 1) }] call RE;};
		if(DZE_DeathMsgSide) then
			{[nil, nil, rspawn, [_killer, _message], { (_this select 0) sideChat (_this select 1) }] call RE;};
		if(DZE_DeathMsgTitleText) then
			{[nil,nil,"per",rTITLETEXT,_message,"PLAIN DOWN"] call RE;};
		_death_record	=	[_victimName,_killerName,	_weapon,_distance,ServerCurrentTime];
		PlayerDeaths set [count PlayerDeaths,_death_record];
		_victim setVariable["AttackedBy", "nil", true];
		_victim setVariable["AttackedByName", "nil", true];
		_victim setVariable["AttackedByWeapon", "nil", true];
		_victim setVariable["AttackedFromDistance", "nil", true];
	};
_newObject setVariable["processedDeath",diag_tickTime];
if (typeName _minutes == "STRING") then
	{_minutes	=	parseNumber _minutes;};
diag_log ("[Сервер]: Смерть игрока: Умер игрок: " + _playerID);
if (_characterID != "0") then
	{
		_key	=	format["CHILD:202:%1:%2:%3:",_characterID,_minutes,_infected];
		#ifdef DZE_SERVER_DEBUG_HIVE
		diag_log ("[БД]: Запись: "+ str(_key));
		#endif
		_key call server_hiveWrite;
	}
else
	{deleteVehicle _newObject;};