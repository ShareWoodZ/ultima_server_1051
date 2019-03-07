private["_playerPos","_canDrink","_isPond","_isWell","_pondPos","_objectsWell","_objectsPond"];
_s_player_drinkWater	=	-1;
while {true} do
	{
		_playerPos			=	getPosATL player;
		_canDrink			=	count nearestObjects [_playerPos, ["Land_pumpa", "Land_water_tank"], 4] > 0;
		_isPond				=	false;
		_isWell				=	false;
		_pondPos			=	[];
		_objectsWell		=	[];
		if (!_canDrink) then
			{
				_objectsWell = nearestObjects [_playerPos, [], 4];
				{
					_isWell = ["_well", str(_x), false] call fnc_inString;
					if (_isWell) exitWith
						{_canDrink = true};
				} forEach _objectsWell;
			};
		if (!_canDrink) then
			{
				_objectsPond = nearestObjects [_playerPos, [], 30];
				{
					_isPond	=	["pond", str(_x), false] call fnc_inString;
					if (_isPond) then
						{
							_pondPos	=	(_x worldToModel _playerPos) select 2;
							if (_pondPos < 0) exitWith
								{_canDrink	=	true;};
						};
				} forEach _objectsPond;
			};
		if (_canDrink) then
			{
				if (_s_player_drinkWater < 0) then
					{_s_player_drinkWater	=	player addaction[("<t color=""#0000c7"">" + ("Пить воду") +"</t>"),"custom\drink_water\drink_water.sqf","",5,false,true,"", ""];};
			}
		else
			{
				player removeAction _s_player_drinkWater;
				_s_player_drinkWater	=	-1;
			};
		sleep 2;
	};