Private ["_remove_actions", "_player_pos", "_bases", "_owner", "_charID", "_player_defense", "_baseRadius", "_basePos", "_data", "_cost", "_title", "_su_player_defense"];

su_player_defenses			=	[];
su_player_update_defense	=	-1;
su_player_admin_trade		=	-1;
	
_remove_actions	=
	{
		Private	["_action"];
		_action	=	(_this select 0);
		switch (_action) do
			{
				case 0:
					{
						if ( (count su_player_defenses) != 0 ) then
							{
								{player removeAction _x;} forEach su_player_defenses;
								su_player_defenses	=	[];
							};
					};
				case 1:
					{
						if !(su_player_update_defense < 0) then
							{
								player removeAction su_player_update_defense;
								player removeAction su_player_add_friend_defense;
								su_player_update_defense	=	-1;
							};
					};
				case 2:
					{
						if ( (count su_player_defenses) != 0 ) then
							{
								{player removeAction _x;} forEach su_player_defenses;
								su_player_defenses	=	[];
							};	
						if !(su_player_update_defense < 0) then
							{
								player removeAction su_player_update_defense;
								player removeAction su_player_add_friend_defense;
								su_player_update_defense	=	-1;
							};	
					};
				case 3:
					{
						if !(su_player_admin_trade < 0) then
							{
								player removeAction su_player_admin_trade;
								su_player_admin_trade	=	-1;
							};	
					};
			};			
	};

while {true} do
	{
		_player_pos	=	(getPos player);	
		_bases		=	nearestObjects [_player_pos, ["Plastic_Pole_EP1_DZ"], 3];		//	Ищем базу в пределах 3м от игрока.
		if ( (count _bases) > 0) then													//	Если вблизи есть база -
			{
				_owner	= (_bases select 0) getVariable ["characterID", "-1"];			//	Узнаем, кто владелец базы.
				_charID	=	player getVariable["CharacterID", "-1"];					//	Узнаем ID игрока
				if ( (_owner == _charID) && (_charID != "-1") ) then					//	Если игрок владелец базы -
					{
						_base	=	player getVariable ["ultima_base_defense", []];
						if ( (count _base) > 1 ) then									//	Если у игрока висит переменная с данными защиты
							{
								_baseRadius	=	(_base select 0);						//	Получаем радиус территории защиты.
								_basePos	=	(_base select 1);						//	Получаем координаты территории защиты.
								if ( (player distance _basePos) > _baseRadius) then
									{
										player setVariable ["ultima_base_defense", [], true];
										_base	=	[];
									};
							};
						if ( (count _base) > 1 ) then									//	Если данная база защищена
							{
								[0] call _remove_actions;								//	Удаляем события связанные с защитой
								if (su_player_update_defense < 0) then					//	Если событие обновления и добавления друга еще не создано
									{
										{
											if ( (_x select 0) == _baseRadius ) exitWith
												{_cost	=	(_x select 1);};
										}forEach Ultima_Defense_Cost;
										_data	=	[_baseRadius, _basePos, _cost];
										_title							=	format["Продлить защиту (+30 дней): %1м, %2 монет", _baseRadius, _cost];
										su_player_update_defense		=	player addaction[_title,"custom\donators\defense_update.sqf", _data, 5, false, true, "", ""];
										_title							=	format["Прописать друга: %1 монет", Ultima_Defense_Friend_Cost];
										su_player_add_friend_defense	=	player addaction[_title,"custom\donators\defense_add_friend_dialog.sqf", _data, 5, false, true, "", ""];
									};
							}
						else															//	Если территория НЕ защищена
							{
								[1] call _remove_actions;								//	Удаляем события связанные с обновлением защиты
								if ( (count su_player_defenses) == 0 ) then
									{
										{
											_baseRadius			=	(_x select 0);
											_cost				=	(_x select 1);
											_data				=	[_baseRadius, _player_pos, _cost];
											_title				=	format["Защита (30 дней): %1м - %2 монет", _baseRadius, _cost];
											_su_player_defense	=	player addaction[_title,"custom\donators\defense_create.sqf",_data,5,false,true,"", ""];
											su_player_defenses set [count su_player_defenses, _su_player_defense];
										} forEach Ultima_Defense_Cost;
									};
							};
					}
				else
					{[2] call _remove_actions;};										//	Удаляем события связанные с защитой и обновлением баз
			}
		else
			{[2] call _remove_actions;};												//	Удаляем события связанные с защитой и обновлением баз
			
		// Продавец администратор
		/*
		_adm_trader	=	nearestObjects [_player_pos, ["pook_Doc_Bell47"], 3];			//	Ищем торговца в пределах 3м от игрока
		if ( (count _bases) > 0) then													//	Если вблизи есть торговец -
			{
				if (su_player_admin_trade < 0) then
					{su_player_admin_trade	=	player addaction["Терминал доната",{[] call admin_terminal_open_dialog;}, [], 5, false, true, "", ""];};
			}
		else
			{[3] call _remove_actions;};												//	Удаляем меню торговли с администратором
		*/
		sleep 1;
	};