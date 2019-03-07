Ultima_Quest_Instance_Registration	=
	{
		Private ["_player", "_uid"];
		_player	=	(_this select 0);
		if (Ultima_Quest_Instance_Start) exitWith
			{
				[(owner _player), ["error", "В данный момент инстанс занят другими игроками!"]] call Terminal_Server_to_Client_Send;
				[_player, 0, ["Инстанс 1", false]] call Ultima_Quest_Server_Decline_Delete;
				[(owner _player), ["quest_expaired", "Инстанс 1"]] call Terminal_Server_to_Client_Send;
				true
			};
		_uid	=	getPlayerUID _player;	
		if (_uid in Ultima_Quest_Instance_End) exitWith
			{	
				[(owner _player), ["error", "Вы не можете взять повторно данное задание!"]] call Terminal_Server_to_Client_Send;
				[_player, 0, ["Инстанс 1", false]] call Ultima_Quest_Server_Decline_Delete;
				[(owner _player), ["quest_expaired", "Инстанс 1"]] call Terminal_Server_to_Client_Send;
				true
			};
		if (_player in Ultima_Quest_Instance_Wait) exitWith
			{
				[(owner _player), ["error", "Вы уже зарегистрированны на данное событие!"]] call Terminal_Server_to_Client_Send;
				true
			};
		Ultima_Quest_Instance_Wait set [(count Ultima_Quest_Instance_Wait), _player];
		false
	};

Ultima_Player_Teleport	=
	{
		Private ["_player", "_coord", "_log"];
		_player	=	(_this select 0);
		_coord	=	(_this select 1);
		_log	=	(_this select 2);
		(vehicle _player) setPosATL _coord;
		_player setVariable['AH_WorldSpace',[0, _coord], true];
		diag_log (format[_log, (name _player)]);		
	};

Ultima_Quest_Instance_Create	=
	{
		Private ["_party", "_boxID", "_box", "_uid"];
		_party	=	(_this select 0);
		//	Создание построек.
		[] call Ultima_Quest_Instance_Buildings_Create;
		//	Создание ботов.
		[] call Ultima_Quest_Instance_Bots_Create;
		//	Создание коробки для миссии
		_boxID	=	str(round(random 999999));
		_box	=	objNull;
		_box 	= createVehicle ["USVehicleBox", [11878.3, 972.191, 128.467], [], 0, "CAN_COLLIDE"];
		_box setPosATL [11878.3, 972.191, 128.467];
		_box setVariable ["ObjectID", _boxID, true];
		_box setVariable ["ObjectUID", _boxID, true];
		_box setVariable ["permaLoot", true];
		PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor, _box];
		clearWeaponCargoGlobal _box;
		clearMagazineCargoGlobal _box;
		_box addWeaponCargoGlobal ["M110_NVG_EP1", 1];
		//	Телепорт участников.
		{
			_uid	=	getPlayerUID _x;
			if (_uid in _party) then
				{[_x, [11825.9, 963.364, 124.117], "[#Ultima]: [Инстанс 1]: Игрок %1, перемещен в зону боевых действий!"] spawn Ultima_Player_Teleport;};
		} forEach playableUnits;
		sleep 10;
		//	Запуск временного цикла миссии.
		[_party, _box] spawn
			{
				Private ["_party", "_box", "_win", "_timer", "_dmg", "_uid", "_alldead"];
				_party	=	(_this select 0);
				_box	=	(_this select 1);
				_win	=	false;
				_timer	=	0;
				while {_timer < 90} do
					{
						uiSleep 10;
						_timer	=	_timer + 1;
						//	Проверка - если коробка уничтожена - победа.
						_dmg		=	getDammage _box;
						if (_dmg >= 1) exitWith
							{_win	=	true;};
						//	Проверка - если нет игроков внутри триггера - поражение - все мертвы
						_alldead	=	true;
						{
							if (alive _x) then
								{
									_uid	=	getPlayerUID _x;
									if (_uid in _party) then
										{
											if ( (_x distance [11822, 966]) < 100 ) exitWith
												{_alldead	=	false;};
										};
									if !(_alldead) exitWith {};
								};
							if !(_alldead) exitWith {};
						} forEach playableUnits;
						if (_alldead) exitWith {};
					};
				diag_log(format["_alldead: %1, _dmg: %2, _timer: %3",_alldead, _dmg, _timer]);
				[_party, _win] call Ultima_Quest_Instance_Destruction;
			};
	};
	
Ultima_Quest_Instance_Destruction	=
	{
		Private ["_party", "_win", "_uid", "_objs"];
		_party	=	(_this select 0);
		_win	=	(_this select 1);
		//	Телепорт участников в Клен, и выдача приза, если они победили
		{
			_uid	=	getPlayerUID _x;
			if (_uid in _party) then
				{
					//	Выдача приза
					if (_win) then
						{[_uid, 1000, -1, true, true] spawn Terminal_Set_Balance;};
					//	Телепорт
					if (alive _x) then
						{
							if ( (_x distance [11822, 966]) < 100 ) exitWith
								{[_x, [11401, 11369, 0], "[#Ultima]: [Инстанс 1]: Игрок %1, перемещен в Клен по завершению миссии!"] spawn Ultima_Player_Teleport;};
						};
				};
		} forEach playableUnits;
		sleep 15;
		//	Уничтожение объектов базы
		_objs	=	[11822, 966] nearEntities ["CAManBase", 300];
		{
			_x setDamage 1;
			deleteVehicle _x;
		} forEach _objs;
		_objs	=	[11822, 966] nearObjects 150;
		{
			deleteVehicle _x;
		}forEach _objs;
		Ultima_Quest_Instance_Start	=	false;
	};	