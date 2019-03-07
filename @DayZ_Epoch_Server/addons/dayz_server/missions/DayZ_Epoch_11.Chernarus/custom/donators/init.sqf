Private ["_uid_count", "_i", "_uid", "_tmp", "_balances", "_balance", "_key", "_update", "_date", "_days", "_path", "_Ultima_Base_Defense"];
////////////////////////////////////////////////////////INIT.SQF////////////////////////////////////////////////////////
_path	=	(Ultima_Server_Scripts_Path + "donators\");
[] call compile preprocessFileLineNumbers	(_path + "configs.sqf");
[] call compile preprocessFileLineNumbers	(_path + "functions.sqf");
Ultima_Donat_Base_Create		= compile preprocessFileLineNumbers	(_path + "base_create.sqf");
Ultima_Donat_Base_Update		= compile preprocessFileLineNumbers	(_path + "base_update.sqf");
Ultima_Donat_Base_Add_Friend	= compile preprocessFileLineNumbers	(_path + "base_add_friend.sqf");

Ultima_Donators_Admin_Balance	=	[];																//	Массив баланса игроков
Ultima_Base_Defense				=	[];																//	Массив защиты баз
_balances						=	[];																//	Массив с пополнением баланса
"ultima_ini" callExtension format["0|%1payment.ini|1", Ultima_ini_Files];							//	Инициализируем DLL
Ultima_Date	=	"ultima_ini" callExtension "11";													//	Получаем текущую дату и время
Ultima_Date	=	toArray Ultima_Date;																//	Переводим дату и время в массив
Ultima_Date resize 10;																				//	Отрезаем время
Ultima_Date	=	toString Ultima_Date;																//	Переводим дату в строку
_uid_count	=	parseNumber("ultima_ini" callExtension "2|balance");								//	Получаем кол-во записей в ini файле
for "_i" from _uid_count to 0 step -1 do															//	Цикл с конца UID'ов
	{
		_uid	=	"ultima_ini" callExtension format["4|balance|%1", _i];							//	Получаем UID
		_tmp	=	"ultima_ini" callExtension format["10|balance|%1", _uid];						//	Получаем по UID массив [UID, Баланс]
		_tmp	=	call compile format ["%1", _tmp];												//	Переделываем строку в массив
		_balances set [count _balances, _tmp];														//	Добавляем массив в массив балансов
		"ultima_ini" callExtension format["8|balance|%1", _uid];									//	Удаляем запись из ini файла
	};
"ultima_ini" callExtension format["0|%1BD.ini|1",Ultima_ini_Files];									//	Переинициализация DLL
_uid_count	=	parseNumber("ultima_ini" callExtension "2|balance");								//	Получаем кол-во записей в ini файле
for "_i" from _uid_count to 0 step -1 do															//	Цикл с конца UID'ов
	{
		_uid	=	"ultima_ini" callExtension format["4|balance|%1", _i];							//	Получаем UID
		_tmp	=	"ultima_ini" callExtension format["10|balance|%1", _uid];						//	Получаем по UID массив [UID, Баланс]
		_tmp	=	call compile format ["%1", _tmp];												//	Переделываем строку в массив
		if ((_tmp select 1) <= 0) then																//	Если баланс 0, или меньше? -
			{"ultima_ini" callExtension format["8|balance|%1", _uid];}								//	Удаляем данную запись из ini файла
		else																						//	Если баланс положительный -
			{Ultima_Donators_Admin_Balance set [count Ultima_Donators_Admin_Balance, _tmp];};		//	Добавляем массив в массив балансов
	};
{																									//	Цикл для пополнения балансов
	_uid		=	(_x select 0);																	//	Получаем UID из массива для пополнения
	_balance	=	(_x select 1);																	//	Получаем баланс, который надо пополнить
	_key		=	[_uid, _balance];																//	Создаем ключ для добавления в ini
	for "_i" from 0 to (count Ultima_Donators_Admin_Balance) - 1 do									//	Цикл по массиву балансов
		{
			_update	=	false;																		//	Указываем, что запись возможно отсутствует
			if ( ((Ultima_Donators_Admin_Balance select _i) select 0) == _uid ) exitWith			//	Если UID есть -
				{
					_balance	=	_balance + ((Ultima_Donators_Admin_Balance select _i) select 1);//	Устанавливаем новый баланс
					_key		=	[_uid, _balance];												//	Изменяем ключ для обновления записи в ini
					Ultima_Donators_Admin_Balance set [_i, _key];									//	Изменяем запись в массиве
					_update	=	true;																//	Указываем, что запись существовала
				};
			if !(_update) then																		//	Если запись отсутствовала
				{Ultima_Donators_Admin_Balance set [count Ultima_Donators_Admin_Balance, _key];};	//	Добавляем в массив
		};
	"ultima_ini" callExtension format["9|balance|%1|%2", _uid, _key];								//	Обновляем запись в ini файле		
}forEach _balances;

if (Ultima_Diag_Level > 0) then
	{diag_log ( "[#Ultima]: [Защита баз]: Загрузка защищенных территорий..." );};

_uid_count				=	parseNumber("ultima_ini" callExtension "2|base");
_Ultima_Base_Defense	=	[];
for "_i" from _uid_count to 0 step -1 do
	{
		_uid	=	"ultima_ini" callExtension format["4|base|%1", _i];
		_tmp	=	"ultima_ini" callExtension format["10|base|%1", _uid];
		_tmp	=	call compile format ["%1", _tmp];
		_date	=	(_tmp select 0);
		if (_date != Ultima_Date) then
			{
				diag_log(format["[Ultima]: [Базы]: Обновление записи: %1, %2. _DATE: %3, ULTIMA_DATE: %4",_uid, _tmp, _date, Ultima_Date]);
				_days	=	(_tmp select 1);
				_days	=	_days - 1;
				if (_days < 0) then
					{"ultima_ini" callExtension format["8|base|%1", _uid];}							//	Удаление записи
				else
					{
						_tmp set [0, Ultima_Date];													//	Обновление даты
						_tmp set [1, _days];														//	Обновление кол-ва дней до истечения аренды
						_Ultima_Base_Defense set [count _Ultima_Base_Defense, _tmp];
						"ultima_ini" callExtension format["9|base|%1|%2", _uid, _tmp];
						diag_log(format["[Ultima]: [Базы]: Обновлена запись: %1, %2",_uid, _tmp]);
					};
			}
		else
			{_Ultima_Base_Defense set [count _Ultima_Base_Defense, _tmp];};
	};
//	Выворачиваем массив обратно
if ( (count _Ultima_Base_Defense) > 0) then
	{
		for "_i" from ((count _Ultima_Base_Defense) - 1) to 0 step -1 do
			{Ultima_Base_Defense set [count Ultima_Base_Defense, (_Ultima_Base_Defense select _i)];};
	};
	
if (Ultima_Diag_Level > 1) then
	{diag_log (format["[#Ultima]: [Защита баз]: Загружено территорий %1.", (count Ultima_Base_Defense)]);};

[] execVM (_path + "base_protect.sqf");

if (Ultima_Diag_Level > 0) then
	{diag_log ( "[#Ultima]: [Защита баз]: Все территории защиты переданы." );};
////////////////////////////////////////////////////////INIT.SQF////////////////////////////////////////////////////////

