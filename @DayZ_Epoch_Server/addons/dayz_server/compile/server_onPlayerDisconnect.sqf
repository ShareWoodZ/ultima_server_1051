private ["_invehicle","_isplayernearby","_playerObj","_myGroup","_id","_playerUID","_playerName","_characterID","_timeout","_message","_magazines","_playerPos"];
_playerUID	=	_this select 0;
_playerName	=	_this select 1;
_playerObj	=	nil;
_playerPos	=	[];
{
	if ((getPlayerUID _x) == _playerUID) exitWith {_playerObj = _x;};
} count playableUnits;
if (isNil "_playerObj") then
	{
		diag_log format["[Сервер]: Доступ к публичной переменной нуль-игрока: %1", _this];
		_playerObj	=	call compile format["PVDZE_player%1",_playerUID];
	};
if (isNil "_playerObj") exitWith	
	{diag_log format["[Сервер]: %1: обнуление объекта игрока, _this: %2", __FILE__, _this];};
diag_log format["[Сервер]: Получено: %1 (%2), Отправлено: %3 (%4)",typeName (getPlayerUID _playerObj), getPlayerUID _playerObj, typeName _playerUID, _playerUID];
if (!isNull _playerObj) then
	{
		_playerPos	=	getPosATL _playerObj;
		_characterID	=	_playerObj getVariable ["CharacterID","0"];
		_timeout		=	_playerObj getVariable["combattimeout",0];
		_invehicle		=	false;
		if (vehicle _playerObj != _playerObj) then
			{
				_playerObj action ["eject", vehicle _playerObj];
				_invehicle	=	true;
				diag_log format["[Сервер]: Выход из игры в технике: %1 на позиции: %2", _playerName,(getPosATL _playerObj)];
			};
		//	Защита от релога - оставляем игрока в мире на N секунд!
		//	Объект еще существует! Попробуем получить данные:
		private ["_charID","_uid","_name","_pos","_backpack","_weapons","_weapons_backpack","_magazinesObj","_current_magazine","_magazines_backpack","_skin","_veh","_cash","_humanity"];
		_charID				=	_playerObj getVariable["CharacterID","0"];
		_uid				=	getPlayerUID _playerObj;
		_name				=	name _playerObj;		
		_pos				=	getPosAtl _playerObj;
		_dir				=	getDir _playerObj;
        _backpack			=	unitBackpack _playerObj;
        _weapons			=	weapons _playerObj;
        _weapons_backpack	=	getWeaponCargo _backpack;
        _magazinesObj		=	magazines _playerObj;
        _current_magazine	=	currentMagazine _playerObj;
        _magazines_backpack	=	getMagazineCargo _backpack;
		_skin				=	(typeof _playerObj);
		_veh				=	(typeof vehicle _playerObj);
		_humanity			=	_playerObj getVariable["humanity", 0];
		_cash				=	[_uid] call Terminal_Cash;		
		if !(isNil "_backpack") then
			{_backpack	=	(typeOf _backpack);};
		if ((_timeout - time) > 0) then
			{
				_playerObj setVariable["NORRN_unconscious",true, true];
				_playerObj setVariable["unconsciousTime",300,true];
				diag_log format["[Сервер]: Выход в режиме боя: %1 (%2) на позиции: %3", _playerName,_timeout,(getPosATL _playerObj)];
				_message	=	format["Игрок: %1, выходит в режиме боя.",_playerName];
				[nil, nil, rTitleText, _message, "PLAIN"] call RE;
				[_charID,_uid,_name,_pos,_dir,_backpack,_weapons,_weapons_backpack,_magazinesObj,_current_magazine,_magazines_backpack,_skin,_veh,_humanity,_cash] spawn Ultima_Anti_Relog;
			};
		diag_log format["[Сервер]: Отсоединение: %1 (%2) объект: %3, _characterID: %4 на позиции: %5", _playerName,_playerUID,_playerObj,_characterID, (getPosATL _playerObj)];				
		_id	=	[_playerUID,_characterID,2] spawn dayz_recordLogin;
		if (alive _playerObj) then
			{
				_isplayernearby	=	(DZE_BackpackGuard && !_invehicle && ({(isPlayer _x) && (alive _x)} count (_playerPos nearEntities ["AllVehicles", 5]) > 1));
				_magazines		=	[(magazines _playerObj),20] call array_reduceSize;
				[_playerObj,_magazines,true,true,_isplayernearby] call server_playerSync;
				_playerObj call dayz_removePlayerOnDisconnect;
			}
		else
			{
				{ 
					[_x,"gear"] call server_updateObject;
				} count (nearestObjects [_playerPos, dayz_updateObjects, 10]);
			};
	};
