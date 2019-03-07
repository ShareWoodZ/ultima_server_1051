Ultima_Get_Admin_Money	=
	{
		Private ["_uid", "_result"];
		_uid	=	(_this select 0);
		_result	=	0;
		{
			if ( _uid == (_x select 0) ) exitWith
				{_result	=	(_x select 1);};
		}forEach Ultima_Donators_Admin_Balance;
		_result
	};
	
Ultima_Admin_Money_Set_Balance	=
	{
		Private ["_player", "_uid", "_balance", "_i"];
		_player		=	(_this select 0);
		_uid		=	(_this select 1);
		_balance	=	(_this select 2);
		for "_i" from 0 to ((count Ultima_Donators_Admin_Balance) - 1) do
			{
				if ( _uid ==  ((Ultima_Donators_Admin_Balance select _i) select 0) ) exitWith
					{Ultima_Donators_Admin_Balance set [_i, [_uid, _balance]];};
			};
		"ultima_ini" callExtension format["9|balance|%1|%2", _uid, [_uid, _balance]];
		_player setVariable ["admin_money", _balance, true];
	};
	
Ultima_Compare_Position	=
	{
		Private ["_pos1", "_pos2"];
		_pos1	=	(_this select 0);
		_pos2	=	(_this select 1);
		if ( ((_pos1 select 0) == (_pos2 select 0)) && ((_pos1 select 1) == (_pos2 select 1)) && ((_pos1 select 2) == (_pos2 select 2)) ) then
			{true}
		else
			{false};
	};
	
Ultima_Get_Days_Base	=
	{
		Private ["_player", "_uid", "_answer", "_client", "_liver", "_pos", "_days"];
		_player	=	(_this select 0);
		_client	=	(owner _player);
		_uid	=	(getPlayerUID _player);
		_answer	=	[];
		{
			_liver	=	((_x select 2) select 2);
			if (_uid in _liver) then
				{
					_pos	=	((_x select 2) select 1);
					_pos	=	(mapGridPosition _pos);
					_days	=	(_x select 1);
					_answer set [(count _answer), [_pos, _days]];
				};
		}forEach Ultima_Base_Defense;
		if ( (count _answer) > 0 ) then
			{[_client, ["base_days", _answer]] call Terminal_Server_to_Client_Send;};
	};

Ultima_Donator_Buy	=
	{
		Private ["_player", "_buy", "_client", "_price", "_script", "_money"];
		_player	=	(_this select 0);		//	Игрок
		_buy	=	(_this select 2);		//	Что хочет купить
		_client	=	(owner _player);		//	Клиент
		_uid	=	(getPlayerUID _player);	//	Идентификатор
		{									//	Ищем предмет покупки
			if ( _buy == (_x select 0) ) exitWith
				{
					_price	=	(_x select 1);	//	Цена
					if ( (count _x) > 2 ) then	//	Если это услуга
						{_script	=	true;};
				};
		}forEach a_Terminal_Admin;
		if (isNil "_price") exitWith
			{[_client, ["error","Предмет покупки не найден!"]] call Terminal_Server_to_Client_Send;};
		//	Проверка наличия средств
		_money	=	[_uid] call Ultima_Get_Admin_Money;
		if (_price > _money) exitWith
			{[_client, ["error", "Не хватает средств на покупку предмета!"]] call Terminal_Server_to_Client_Send;};
		//	Списание средств
		_money	=	(_money - _price);
		[_player, _uid, _money] call Ultima_Admin_Money_Set_Balance;
		//	Отправка сообщения о создании предмета
		if (isNil "_script") then
			{[_client, ["acceptDrop",_buy]] call Terminal_Server_to_Client_Send;}
		else
			{
				diag_log(format["[#Ultima]: [Терминал донаторов]: Игрок: %1, приобрел услугу: %2", _player, _buy]);
				[_player] execVM (Ultima_Server_Scripts_Path + "donators\scripts\" + _buy + ".sqf");
			};	//	Выполнение заданного скрипта
	};
	
	