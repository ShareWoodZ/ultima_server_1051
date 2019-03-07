//	Событие при смерти АнтиРелог бота.
Anti_Bot_Killed	=
	{
		Private ["_unit","_player","_humanity","_killerHumanity","_killerUID","_killerBanditKills","_relogerName"];
		_unit				=	_this select 0;
		_player				=	_this select 1;
		_humanity			=	_unit getVariable["humanity", 0];
		_relogerName		=	_unit getVariable ["Ultima_Reloger_Name", "Релогер"];		
		_killerHumanity		=	_player getVariable["humanity", 0];
		_killerBanditKills	=	_player getVariable["banditKills", 0];		
		//	Добавляем человечность убийце, если у убитого было хуманити больше 200, или меньше -200
		if ( (_humanity > 199) || (_humanity < -199) ) then
			{
				if (_killerHumanity > -1) then
					{_player setVariable["humanity", _killerHumanity + 200, true];}
				else
					{_player setVariable["humanity", _killerHumanity - 200, true];};
			};
		//	Наращиваем счетчки убийств бандитов, если человечность убитого была ниже нуля
		if (_humanity < 0) then
			{_player setVariable["banditKills", _killerBanditKills + 1, true];};
		diag_log(format["[#Ultima]: [АнтиРелог]: Игрок(или NPC): %1, убил релогера: %2",name _player, _relogerName]);
	};
//	Процедура АнтиРелог
Ultima_Anti_Relog	=
	{
		private ["_antiRelogTime","_playerExist","_antiRelogBot","_items","_counts","_item","_count","_i","_y","_charID","_uid","_name","_pos","_dir","_backpack","_weapons","_weapons_backpack","_magazines","_current_magazine","_magazines_backpack","_skin","_humanity","_cash"];
		_charID				=	(_this select 0);
		_uid				=	(_this select 1);
		_name				=	(_this select 2);
		_pos				=	(_this select 3);
		_dir				=	(_this select 4);
        _backpack			=	(_this select 5);
        _weapons			=	(_this select 6);
        _weapons_backpack	=	(_this select 7);
        _magazines			=	(_this select 8);
        _current_magazine	=	(_this select 9);
        _magazines_backpack	=	(_this select 10);
		_skin				=	(_this select 11);
		_veh				=	(_this select 12);
		_humanity			=	(_this select 13);		
		_cash				=	(_this select 14);
		_antiRelogTime		=	20;					//	Сколько времени бот существует в мире
		_playerExist		=	false;
		
		
		sleep 2;	//	подождем 2 секунды на всякий случай
		//	проверим - нет ли игрока в массиве playableUnits
		{
			if (isPlayer _x) then
				{
					if ( (getPlayerUID _x) == _uid ) exitWith
						{_playerExist	=	true;};
				};
		}forEach playableUnits;
		//	если есть - не будем создавать бота, чтоб не дюпнули
		if (_playerExist) exitWith {diag_log ("Игрок был в playableUnits, создание бота отменено");};
		
		//	Если игрок вышел в технике, спавним бота в радиусе 15 метров от его местоположения.
		if (_skin != _veh) then
			{_pos = [_pos, 5, 15, 0, 0, 2000, 0] call BIS_fnc_findSafePos;};		
		//	Создаем бота
		_antiRelogBot	=	createAgent [_skin, _pos, [], 0, "CAN_COLLIDE"];
		_antiRelogBot setDir _dir;
		_antiRelogBot setVehicleInit "this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
		_antiRelogBot setUnitAbility 0.60000002;
		_antiRelogBot disableAI "FSM";
		_antiRelogBot disableAI "MOVE";
		_antiRelogBot disableAI "AUTOTARGET";
		_antiRelogBot disableAI "TARGET";
		_antiRelogBot setBehaviour "CARELESS";
		_antiRelogBot forceSpeed 0;
		_antiRelogBot enableSimulation false;
		_antiRelogBot setVariable ["Ultima_Reloger_Name", "Релогер: "+_name, true];
		_antiRelogBot setVariable ["humanity", _humanity, true];		
		_antiRelogBot setVariable ["Ultima_Cash_Body", _cash, true];	//	Устанавливаем наличку, если бота убьют	(Только для серверов с моей сборкой!)
		//	Удаление инвентаря
		removeAllWeapons _antiRelogBot;
		removeAllItems _antiRelogBot;
		//	[Заполняем инвентарь]
			//	Магазины
		{
			_antiRelogBot addMagazine _x;
		}forEach _magazines;
			//	Оружие
		{
			_antiRelogBot addWeapon _x;
		}forEach _weapons;
			//	Рюкзак
		if !(isNil "_backpack") then
			{_antiRelogBot addBackpack _backpack;};
		//	Получаем ссылку на новый объект - рюкзак	
		_backpack	=	unitBackpack _antiRelogBot;
			
		//	Вешаем событие, которое сработает при убийстве бота
		_antiRelogBot addEventHandler ["Killed",{ [(_this select 0), (_this select 1)] Spawn Anti_Bot_Killed;}];
		
		//	Цикл
		while {true} do
			{
				//	Ищем игрока на сервере
				{
					if (isPlayer _x) then
						{
							if ( (getPlayerUID _x) == _uid ) exitWith
								{_playerExist	=	true;};
						};
				}forEach playableUnits;
				//	Если игрок зашел в мир, или вышло время анти-релога
				if	( (_playerExist) || (_antiRelogTime < 0) ) exitWith
					{deleteVehicle _antiRelogBot;};
				//	Если бот мертв
				if !(alive _antiRelogBot) exitWith
					{
						Private ["_i","_stime","_hours","_minutes","_minutes2","_key"];
						//	Изменим запись в БД, что игрок теперь мертв
						if (_charID != "0") then
							{
								if (serverTime > 36000) then
									{_stime = time;}
								else
									{_stime = serverTime;};
								_hours		=	(_stime/60/60);
								_hours		=	toArray (str _hours);
								_hours resize 1;
								_hours		=	toString _hours;
								_hours		=	compile _hours;
								_hours		=	call  _hours;									
								_minutes	=	floor(_stime/60);
								_minutes2	=	((_minutes - (_hours*60)) min 60) max 0;
								_key	=	format["CHILD:202:%1:%2:%3:",_charID, _minutes2, 0];
								#ifdef DZE_SERVER_DEBUG_HIVE
								diag_log ("[БД]: Запись: "+ str(_key));
								#endif
								_key call server_hiveWrite;
							};
						//	Добавляем инвентарь в рюкзак
						if (typename _weapons_backpack == "ARRAY") then
							{
								_i = 0;
								{
									_backpack addWeaponCargoGlobal [_x,((_weapons_backpack select 1) select _i)];
									_i = _i + 1;
								} count (_weapons_backpack select 0);
							};
						if (typename _magazines_backpack == "ARRAY") then
							{
								_i = 0;
								{
									_backpack addMagazineCargoGlobal [_x,((_magazines_backpack select 1) select _i)];
									_i = _i + 1;
								} count (_magazines_backpack select 0);
							};
						//	Обнулим карманные деньги умершего игрока. Только для серверов с моей сборкой!!!
						for "_i" from 0 to (count Ultima_Cash) -1 do
							{
								if (_uid == ((Ultima_Cash select _i) select 0)) exitWith
									{
										Ultima_Cash set [_i,[_uid,0]];
										_rec	= [_uid,0];	
										"ultima_ini" callExtension format["9|%1|%2|%3","cash",_uid,_rec];
									};
							};
					};
				_antiRelogTime	=	_antiRelogTime - 1;
				uiSleep 1;
			};
	};	