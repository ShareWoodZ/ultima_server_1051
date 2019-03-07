/*
	Подключение скрипта:
	В custom.sqf
	[] ExecVM "custom\anti_spawn.sqf";
*/

Private ["_radius_find_objects", "_warning_items", "_radius_find_players", "_items_count","_objects","_find_object","_real_items_count","_rec","_log", "_i","_players","_near_players"];

//------------------------------------------------------------Настройки-------------------------------------------------------------//

_radius_find_objects	=	10;	//	Радиус поиска oбъектов от позиции игрока.
_warning_items			=	30;	//	Разница в предметах, от предыдущего поиска. Пример: 10. Если было 100 предметов, а стало 110 - сохранение в лог.
_radius_find_players	=	10;	//	Радиус поиска игроков, рядом с текущим игроком. Для сохранения в журнал.

//---------------------------------------------------------Настройки завершены------------------------------------------------------//

//	Массив для хранения объектов на карте, и кол-вом предметов в них
Ultima_Anti_Spawn_Temp_Array	=	[];

//	Функция подсчета кол-ва предметов в объекте
Ultima_Anti_Spawn_Check	=
	{
		Private ["_object","_items_count","_Weapons_Array","_Magazines_Array","_BackPack_Array","_Weapons_Count_Array","_Magazines_Count_Array","_BackPack_Count_Array"];
		_object					=	(_this select 0);		
		_items_count			=	0;		
		_Weapons_Array			=	getWeaponCargo _object;
		_Magazines_Array		=	getMagazineCargo _object;
		_BackPack_Array			=	getBackpackCargo _object;
		_Weapons_Count_Array	=	(_Weapons_Array select 1);
		_Magazines_Count_Array	=	(_Magazines_Array select 1);
		_BackPack_Count_Array	=	(_BackPack_Array select 1);
		{_items_count	=	_items_count + _x;} forEach _Weapons_Count_Array;
		{_items_count	=	_items_count + _x;} forEach _Magazines_Count_Array;
		{_items_count	=	_items_count + _x;} forEach _BackPack_Count_Array;
		_items_count
	};

//	Крутим постоянно
while {true} do
	{
		if ( (isNil "s_player_unlockvault") || (s_player_unlockvault == -1) ) then						//	Работаем, если игрок не занят открытием сейфа
			{
				_objects	=	(getPos player) nearObjects _radius_find_objects;						//	Получаем объекты в радиусе _radius_find_objects
				for "_i" from ((count Ultima_Anti_Spawn_Temp_Array) - 1) to 0 step -1 do				//	Удаляем из массива объекты которые исчезли из радиуса игрока
					{
						_Obj	=	((Ultima_Anti_Spawn_Temp_Array select _i) select 0);
						if !(_Obj in _objects) then
							{
								Ultima_Anti_Spawn_Temp_Array set [_i, -1];
								Ultima_Anti_Spawn_Temp_Array	=	Ultima_Anti_Spawn_Temp_Array - [-1];
							};
					};
				{
					_find_object		=	false;
					_real_items_count	=	[_x] call Ultima_Anti_Spawn_Check;							//	Сколько предметов сейчас внутри объекта
					for "_i" from 0 to ((count Ultima_Anti_Spawn_Temp_Array) - 1) do					//	Ищем объект в массиве - хранилище
						{
							_rec	=	(Ultima_Anti_Spawn_Temp_Array select _i);
							if ( (_rec select 0) == _x ) exitWith										//	Если нашли объект в хранилище
								{
									_find_object		=	true;										//	Объект найден
									_items_count		=	(_rec select 1);							//	Сколько было ранее предметов внутри объекта
									if ( (_real_items_count - _items_count) > _warning_items ) then		//	Если предметов стало больше чем на _warning_items
										{																//	Запись в журнал
											_near_players	=	[];
											_near_players	=	nearestObjects [(getPos player), ["CAManBase"], _radius_find_players];
											_players		=	": ";
											{
												if ( (alive _x) && !(_x isKindOf "zZombie_base") && ((name _x) != (name player)) ) then
													{_players	=	(_players + "Имя: " + (name _x) + " UID: " + (getPlayerUID _x) + " ");};
											} forEach _near_players;
											_log	=	format["%1, UID: %2, позиция: %3, объект: %4. Предметов было: %5. Предметов стало: %6.", (name player), (getPlayerUID player), (getPos Player), (typeOf _x), _items_count, _real_items_count];
											if (_players != ": ") then
												{_log	=	_log + (format[" Рядом с игроком находятся%1", _players]);};
											Ultima_Anti_Spawn_Server	=	["АнтиСпавн", _log];
											publicVariableServer "Ultima_Anti_Spawn_Server";
										};
									Ultima_Anti_Spawn_Temp_Array set [_i, [_x, _real_items_count]];		//	Обновляем кол-во предметов у объекта в массиве - хранилище
								};
						};
					if !(_find_object) then																//	Если объекта не было(только установили, или только что заспавнился)
						{Ultima_Anti_Spawn_Temp_Array set [count Ultima_Anti_Spawn_Temp_Array, [_x, _real_items_count]];};	//	Занесем объект в массив
				} forEach _objects;
			};
		sleep 1;
	};