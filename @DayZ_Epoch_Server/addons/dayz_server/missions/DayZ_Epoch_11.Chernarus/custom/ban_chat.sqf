Private ["_getHoursBetween", "_datetime", "_hoursBetween", "_i", "_rec", "_uid", "_tmp"];
Ultima_Ban_Chat_Array	=	[];
_getHoursBetween	=
	{
		_datetime		=	(_this select 0);
		_hoursBetween	=	"ultima_log" callExtension format["13|%1", _datetime];
		_hoursBetween	=	parseNumber _hoursBetween;
		_hoursBetween
	};
"ultima_log" callExtension format["0|%1ultima_anticheat.ini|1", Ultima_ini_Files];
_uid_count	=	parseNumber("ultima_log" callExtension "2|banchat");										//	Получаем кол-во записей в ini файле
for "_i" from _uid_count to 0 step -1 do																	//	Цикл с конца UID'ов
	{
		_uid	=	"ultima_log" callExtension format["4|banchat|%1", _i];									//	Получаем UID
		_tmp	=	"ultima_log" callExtension format["10|banchat|%1", _uid];								//	Получаем по UID массив [UID, Дата и время бана, Часы бана]
		_tmp	=	call compile format ["%1", _tmp];														//	Переделываем строку в массив
		Ultima_Ban_Chat_Array set [count Ultima_Ban_Chat_Array, _tmp];										//	Добавляем массив в массив банов чата
	};
while {true} do
	{
		for "_i" from ((count Ultima_Ban_Chat_Array) - 1) to 0 step -1 do
			{
				_rec			=	(Ultima_Ban_Chat_Array select _i);
				_hoursBetween	=	[_rec select 1] call _getHoursBetween;										//	Разница в часах от времени бана
				if ( _hoursBetween >= (_rec select 2) ) then
					{
						_uid 		=	(_rec select 0);														//	Получаем UID игрока
						"ultima_log" callExtension format["8|banchat|%1|", _uid];								//	Удаляем запись из ini
						Ultima_Ban_Chat_Array set [_i, -1];														//	Заменяем запись в массиве - ставим на удаление
						Ultima_Ban_Chat_Array	=	Ultima_Ban_Chat_Array - [-1];								//	Удаляем запись из массива
						{																						//	Ищем игрока в игре
							if (getPlayerUID _x == _uid) exitWith												//	Если игрок найден
								{[(owner _x), ["ultima_ban_chat_off"]] call Terminal_Server_to_Client_Send;};	//	Шлем клиенту сообщение, что с него снят бан чата
						} forEach playableUnits;
					};
			};	
		sleep 60;
	};