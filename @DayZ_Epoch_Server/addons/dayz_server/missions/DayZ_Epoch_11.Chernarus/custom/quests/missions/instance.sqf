diag_log ("[#Ultima]: [Миссии]: [Инстанс 1]: Старт скрипта.");
Private ["_party", "_uid", "_mission", "_id", "_player_friends", "_rec_uid", "_rec_id", "_rec_player_friends"];
while {true} do
	{
		if !(Ultima_Quest_Instance_Start) then
			{
				{
					//	Обнуляем группу
					_party		=	[];
					//	UID игрока
					_uid		=	getPlayerUID _x;
					//	Для проверки, что игрок зареган на миссию
					_mission	=	false;
					{
						if ( (_uid == (_x select 0)) && ((_x select 1) == "Инстанс 1") ) exitWith
							{_mission	=	true;};
					} forEach Ultima_Quest_Timer;
					//	Если игрок не отменял миссию
					if (_mission) then
						{
							_id	=	_x getVariable["CharacterID", "0"];	
							//	Добавим UID игрока в массив группы
							_party set [count _party, _uid];
							//	Друзья текущего игрока
							_player_friends = _x getVariable ["friendlies",[]];
							{	
								_rec_uid	=	getPlayerUID _x;
								_mission	=	false;
								{
									if ( (_uid == (_x select 0)) && ((_x select 1) == "Инстанс 1") ) exitWith
										{_mission	=	true;};
								} forEach Ultima_Quest_Timer;
								//	Если игрок не отменял миссию
								if (_mission) then
									{
										_rec_id		=	_x getVariable["CharacterID", "0"];
										if (_rec_id in _player_friends) then	//	Если его ID найден в наших друзьях
											{
												_rec_player_friends = _x getVariable ["friendlies",[]];	//	Получаем список друзей юнита
												if (_id in _rec_player_friends) then	//	Если, мы у него так же в друзьях
													{
														//	Добавим игрока в массив группы
														_party set [count _party, _rec_uid];
														//	Если достаточно для инстанса
														if ((count _party) > 2) exitWith
															{
																{
																	Ultima_Quest_Instance_End set [count Ultima_Quest_Instance_End, _x];
																} forEach _party;
																Ultima_Quest_Instance_Start	=	true;
															};
													};
											};
									};
								if (Ultima_Quest_Instance_Start) exitWith {};
							} forEach Ultima_Quest_Instance_Wait;
						};
					if (Ultima_Quest_Instance_Start) exitWith {};
				} forEach Ultima_Quest_Instance_Wait;
				if (Ultima_Quest_Instance_Start) then
					{
						//	Тем кто в пролете, отсылаем сообщение
						{
							if !( (getPlayerUID _x) in _party ) then
								{
									[(owner _x), ["error", "В данный момент инстанс занят другими игроками!"]] call Terminal_Server_to_Client_Send;
									[_x, 0, ["Инстанс 1", false]] call Ultima_Quest_Server_Decline_Delete;
									[(owner _x), ["quest_expaired", "Инстанс 1"]] call Terminal_Server_to_Client_Send;
								}
							else
								{
									[(owner _x), ["message", "Через 10 секунд Вы будете телепортированы в инстанс!"]] call Terminal_Server_to_Client_Send;
									[_x, 0, ["Инстанс 1", false]] call Ultima_Quest_Server_Decline_Delete;
									[(owner _x), ["quest_expaired", "Инстанс 1"]] call Terminal_Server_to_Client_Send;
								};
						} forEach Ultima_Quest_Instance_Wait;
						[_party] spawn Ultima_Quest_Instance_Create;
					}
				else
					{
						{
							[(owner _x), ["error", "Истекло время регистрации инстанса!"]] call Terminal_Server_to_Client_Send;
							[_x, 0, ["Инстанс 1", false]] call Ultima_Quest_Server_Decline_Delete;
							[(owner _x), ["quest_expaired", "Инстанс 1"]] call Terminal_Server_to_Client_Send;
						} forEach Ultima_Quest_Instance_Wait;
					};
				//	Очищаем очередь инстанса
				Ultima_Quest_Instance_Wait	=	[];
			}
		else	//	Телепорт для тех, кто в зоне триггера и не зареган
			{
				{
					_uid	=	getPlayerUID _x;
					if ((alive _x) and  !(_x isKindOf "zZombie_base") and !(_x isKindOf "Animal") and !(_uid in Ultima_Admins) and !(_uid in _party)) then
						{
							if ( (_x distance [11822, 966]) < 300) then
								{[_x, [11745, 3264, 0], "[#Ultima]: [Инстанс 1]: Игрок %1, перемещен из зоны боевых действий!"] spawn Ultima_Player_Teleport;};
						};
				} forEach playableUnits;
			};
		sleep 10;
	};
