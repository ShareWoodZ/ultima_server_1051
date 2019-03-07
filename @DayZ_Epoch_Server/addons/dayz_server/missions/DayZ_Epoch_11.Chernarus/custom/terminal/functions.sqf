diag_log("[#Ultima]: [Терминал торговли]: Компиляция функций.");

//	Поиск предметов игрока в массиве, для отправки клиенту, на запрос о списке его предметов
Terminal_Get_Player_Items	=
	{
		Private ["_UID","_result"];
		_UID	=	_this select 0;
		_result	=	[];
		{
			if ( _UID == (_x select 1) ) exitWith
				{_result	=	_x select 3;};
		} forEach Terminal_Array;
		_result
	};	

//	Сортировка массивов терминала
Terminal_Sort_Arrays	=
	{
		Private	["_array","_a_array","_record","_items","_item","_price","_item_count","_Terminal_Record","_Terminal_Item","_Terminal_Price","_i","_y","_add","_Name","_UID"];
		_a_array	=	_this select 0;
		_array		=	[];																		//	Обнуляем сортируемый массив
		{																						//	Перебор предметов по всему массиву
			_record	=	_x select 3;															//	Массив: Предметы игрока
			for "_i" from 0 to (count _record) -1 do											//	Цикл по предметам игрока
				{
					_items	=	_record	select _i;												//	Массив: Предмет, цена, кол-во!!!
					_item	=	_items select 0;												//	Предмет
					if (_item in _a_array) then													//	Если предмет есть в массиве для поиска
						{
							_price		=	_items select 1;									//	Цена
							_add		=	true;
							if ( (count _array) > -1) then
								{
									for "_y" from 0 to (count _array) -1 do								//	Цикл по текущим предметам
										{
											_Terminal_Record	=	_array select _y;					//	Массив: Предмет, цена кол-во
											_Terminal_Item		=	_Terminal_Record select 2;
											if (_item	==	_Terminal_Item) exitWith					//	Если предметы одинаковые
												{
													_Terminal_Price		=	_Terminal_Record select 3;	//	Текущая цена
													if (_price	>=	_Terminal_Price) then				//	Если новая цена выше текущей
														{_add		=	false;}							//	Не будем добавлять
													else
														{
															_array set [_y,-1];
															_array = _array - [-1];
														};
												};
										};
								};
							if (_add) then
								{
									_item_count	=	_items select 2;									//	Кол-во
									_Name		=	_x select 0;
									_UID		=	_x select 1;
									_array set [count _array, [_Name, _UID, _item, _price, _item_count]];
								};
						};
				};
		} forEach Terminal_Array;
		_array
	};
	
//	Удаляем предмет из ОСНОВНОГО массива* текущий не нужен - он будет переинициализирован
Terminal_Delete_Item	=
	{
		Private ["_Name","_UID","_Balance","_item","_price","_seller_count","_seller_item","_seller_price","_item_price","_items_array","_i","_counter","_rec"];
		_UID		=	_this select 0;
		_item		=	_this select 1;
		_price		=	_this select 2;
		_counter	=	0;
		{
			if ( _UID == (_x select 1) ) exitWith
				{
					_Name			=	_x select 0;
					_Balance		=	_x select 2;
					_items_array	=	_x select 3;							//	Предметы игрока
					for "_i" from 0 to (count _items_array) -1 do				//	Цикл по предметам игрока
						{
							_item_price		=	_items_array select _i;			//	Массив: Предмет, цена, кол-во.
							_seller_item	=	_item_price select 0;			//	Предмет
							_seller_price	=	_item_price select 1;			//	Цена
							_seller_count	=	_item_price select 2;			//	Кол-во предметов
							
							if ( (_item == _seller_item) && (_price == _seller_price) ) exitWith	//	Если название предмета, и цена совпадают
								{
									if (_seller_count > 1) then					//	Если выставлено несколько предметов, удалим один
										{
											_seller_count	=	_seller_count - 1;
											_items_array set [_i, [_seller_item,_seller_price,_seller_count]];
										}
									else										//	Если предмет последний, удалим из массива
										{
											_items_array set [_i,-1];
											_items_array = _items_array - [-1];
										};
								};
						};
					_rec	=	[_Name, _UID, _Balance, _items_array];
					Terminal_Array set [_counter, _rec];
					"ultima_ini" callExtension format["9|%1|%2|%3","auction",_UID,_rec];
				};
			_counter	=	_counter + 1;
		} forEach Terminal_Array;
	};	

//	Ищем предмет в массиве
Terminal_Find_Array_Item	=
	{
		Private ["_array","_UID","_item","_price","_result"];
		_array	=	_this select 0;
		if (isNil "_array") exitWith {false};
		_UID	=	_this select 1;
		_item	=	_this select 2;
		_price	=	_this select 3;
		_result	=	false;
		{
			if ( ((_x select 1) == _UID) && ((_x select 2) == _Item) && ((_x select 3) == _price) ) exitWith
				{_result	=	true;};
		} forEach _array;
		_result
	};
	
//	Ищем предмет в массиве
Terminal_Find_Main_Array_Item	=
	{
		Private ["_UID","_item","_price","_items_array","_test_item","_test_price","_result"];
		_UID	=	_this select 0;
		_item	=	_this select 1;
		_price	=	_this select 2;
		_result	=	false;
		{
			if ( (_x select 1) == _UID )  exitWith
				{
					_items_array	=	_x select 3;					//	Предметы игрока
					for "_i" from 0 to (count _items_array) -1 do		//	Цикл по предметам игрока
					{
						_item_price	=	_items_array select _i;			//	Массив: Предмет и цена
						_test_item	=	_item_price select 0;			//	Предмет
						_test_price	=	_item_price select 1;			//	Цена
						if ( (_test_item == _item) && (_test_price == _price) ) exitWith 
							{_result	=	true;};
					};
				};
		} forEach Terminal_Array;
		_result
	};	

//	Получаем баланс из массива	
Terminal_Get_Balance	=
	{
		Private ["_UID", "_result"];
		_UID	=	(_this select 0);
		_result	=	-1;
		if ( !(isNil "_UID") && (_UID != "") ) then
			{
				{
					if ( _UID == (_x select 1) ) exitWith
						{_result	=	(_x select 2)};
				} forEach Terminal_Array;
				if (_result == -1) then
					{
						Private ["_playableUID","_Name","_rec"];
						{
							_playableUID	=	getPlayerUID _x;
							if (_UID == _playableUID) exitWith
								{
									_rec	= [name _x,_UID,0,[]];	
									Terminal_Array set [count Terminal_Array,_rec];
									"ultima_ini" callExtension format["9|%1|%2|%3","auction",_UID,_rec];
									_result	=	-1;
								};
						} forEach playableUnits;
					};
			};
		_result
	};
	
//	Получаем наличку
Terminal_Cash	=
	{
		Private ["_UID","_result"];
		_UID	=	(_this select 0);
		_result	=	-1;
		if ( !(isNil "_UID") && (_UID != "") ) then
			{
				{
					if ( _UID == (_x select 0) ) exitWith
						{_result	=	(_x select 1)};
				} forEach Ultima_Cash;
				if (_result == -1) then
					{
						Private ["_rec"];
						_rec	= [_UID,0];	
						Ultima_Cash set [count Ultima_Cash,_rec];
						"ultima_ini" callExtension format["9|%1|%2|%3","cash",_UID,_rec];
						_result	=	-1;
					};
			};
		_result
	};

//	Получаем наличку
Terminal_Deposite	=
	{
		Private ["_UID","_result"];
		_UID	=	(_this select 0);		
		_result	=	-1;
		if ( !(isNil "_UID") && (_UID != "") ) then
			{
				{
					if ( _UID == (_x select 0) ) exitWith
						{_result	=	(_x select 1)};
				} forEach Ultima_Deposite;
				if (_result == -1) then
					{
						Private ["_rec"];
						_rec	= [_UID,0];	
						Ultima_Deposite set [count Ultima_Deposite,_rec];
						"ultima_ini" callExtension format["9|%1|%2|%3","deposite",_UID,_rec];
						_result	=	-1;
					};
			};
		_result
	};
	
//	Переводим депозит в нал
Terminal_DepositeToCash	=
	{
		Private ["_deposite","_UID"];
		_UID	=	getPlayerUID (_this select 0);
		//	Запомним, сколько было на депозите
		_deposite	=	[_UID] call Terminal_Deposite;
		//	Обнулим депозит(будет сразу отправлено клиенту)
		[_UID,0,0,false] call Terminal_Set_Deposite;
		//	Пополним наличку
		[_UID,_deposite,-1,false] call Terminal_Set_Cash;
	};
	
//	Переводим наличку в банк
Terminal_CashToBank	=
	{
		Private ["_cash","_UID"];
		_UID	=	getPlayerUID (_this select 0);
		//	Запомним, сколько было нала
		_cash	=	[_UID] call Terminal_Cash;
		//	Обнулим наличку(будет сразу отправлено клиенту)
		[_UID,0,0,false] call Terminal_Set_Cash;
		//	Пополним баланс в банке
		[_UID,_cash,-1,false,true] call Terminal_Set_Balance;
	};		

//	Устанавливаем новый баланс в массиве
Terminal_Set_Balance	=
	{
		Private ["_Name","_UID","_Balance","_Items_Array","_value","_setValue","_trade","_counter","_result","_player","_i","_XML","_rec"];
		_UID		=	_this select 0;
		if (isNil "_UID") exitWith {false};
		if (_UID == "") exitWith {false};		
		_value		=	_this select 1;
		_setValue	=	_this select 2;
		_trade		=	_this select 3;	//	АнтиЧит баланса
		_XML		=	_this select 4;	//	Надо ли обновлять баланс в файле
		_result		=	false;
		/*
		if !(_trade) then
			{ 
				if ( (_value > 10) || (_setValue > 10) ) exitWith	{ }; //	Отослать лог на сервер
			};
		*/
		_counter	=	0;
		{
			if ( _UID == (_x select 1) ) exitWith
				{
					if (_setValue > -1) then
						{_Balance	=	_setValue;}					//	Заменить баланс на _setValue
					else
						{_Balance	=	(_x select 2) + _value;};	//	Прибавить к текущему балансу _value
					_Name			=	(_x select 0);
					_Items_Array	=	(_x select 3);
					_rec			=	[_Name, _UID, _Balance, _Items_Array];
					Terminal_Array set [_counter, _rec];
					_result	=	true;								//	Для регистрации того, что _UID нашелся в списке
					if (_XML && _UID != "") then					//	В случае с продавцом - излишне. т.к. его запись будет полностью заменена, после удаления предмета.
						{"ultima_ini" callExtension format["9|%1|%2|%3","auction",_UID,_rec];};
					for "_i" from 0 to (count playableUnits) -1 do
						{
							_player	=	playableUnits select _i;
							if ((getplayerUID _player) == _UID) exitWith
								{
									if (alive _player) then
										{_player setVariable ["Ultima_Money", _Balance, true];};
								};
						};
				};
			_counter	=	_counter + 1;
		} forEach Terminal_Array;
		_result
	};

//	Устанавливаем новый баланс депозиту
Terminal_Set_Deposite	=
	{
		Private ["_UID","_deposite","_value","_setValue","_trade","_counter","_result","_i","_rec"];
		_UID		=	_this select 0;
		if (isNil "_UID") exitWith {false};
		if (_UID == "") exitWith {false};		
		_value		=	_this select 1;
		_setValue	=	_this select 2;
		_trade		=	_this select 3;	//	АнтиЧит баланса
		_result		=	false;
		/*
		if !(_trade) then
			{ 
				if ( (_value > 10) || (_setValue > 10) ) exitWith	{ }; //	Отослать лог на сервер
			};
		*/
		_counter	=	0;
		{
			if ( _UID == (_x select 0) ) exitWith
				{
					if (_setValue > -1) then
						{_deposite	=	_setValue;}					//	Заменить баланс на _setValue
					else
						{_deposite	=	(_x select 1) + _value;};	//	Прибавить к текущему балансу _value
					_rec			=	[_UID, _deposite];
					Ultima_Deposite set [_counter, _rec];
					_result	=	true;								//	Для регистрации того, что _UID нашелся в списке
				};
			_counter	=	_counter + 1;
		} forEach Ultima_Deposite;
		if !(_result) then
			{
				_rec		=	[_UID, _value];
				Ultima_Deposite set [count Ultima_Deposite, _rec];
			};
		if (_UID != "") then
			{"ultima_ini" callExtension format["9|%1|%2|%3","deposite",_UID,_rec];};
		{
			if ((getplayerUID _x) == _UID) exitWith
				{
					if (alive _x) then
						{_x setVariable ["Ultima_Deposite", _deposite, true];};
				};
		}forEach playableUnits;
	};	
//	Устанавливаем новый баланс наличных
Terminal_Set_Cash	=
	{
		Private ["_UID","_cash","_value","_setValue","_trade","_result","_i","_rec"];
		_UID		=	(_this select 0);
		if (isNil "_UID") exitWith {false};
		if (_UID == "") exitWith {false};		
		_value		=	(_this select 1);
		_setValue	=	(_this select 2);
		_trade		=	(_this select 3);	//	АнтиЧит баланса
		_result		=	false;
		/*
		if !(_trade) then
			{ 
				if ( (_value > 10) || (_setValue > 10) ) exitWith	{ }; //	Отослать лог на сервер
			};
		*/
		for "_i" from 0 to (count Ultima_Cash) -1 do
			{
				if ( _UID == ((Ultima_Cash select _i) select 0) ) exitWith
					{
						if (_setValue > -1) then
							{_cash	=	_setValue;}					//	Заменить баланс на _setValue
						else
							{_cash	=	((Ultima_Cash select _i) select 1) + _value;};	//	Прибавить к текущему балансу _value
						_rec			=	[_UID, _cash];
						Ultima_Cash set [_i, _rec];
						_result	=	true;								//	Для регистрации того, что _UID нашелся в списке
						if (_UID != "") then
							{"ultima_ini" callExtension format["9|%1|%2|%3","cash",_UID,_rec];};
						{
							if ((getplayerUID _x) == _UID) exitWith
								{
									if (alive _x) then
										{_x setVariable ["Ultima_Cash", _cash, true];};
								};
						}forEach playableUnits;
					};
			};
		_result
	};	
// Для админки инфистар 
Terminal_Admin_Event =
	{
		private ["_action","_uid","_value","_setValue"];
		_action		=	(_this select 0);
		_uid		=	(_this select 1);
		_value		=	(_this select 2);
		_setValue	=	(_this select 3);
		switch (_action) do
			{
				case "deposite" :
					{
						if (_setValue == -1) then
							{[_uid, _value, -1, true] call Terminal_Set_Deposite;}
						else
							{[_uid, 0, _setValue, true] call Terminal_Set_Deposite;};
					};
				case "bank" :
					{
						if (_setValue == -1) then
							{[_uid,_value,-1,false,true] call Terminal_Set_Balance;}
						else
							{[_uid,0,_setValue,false,true] call Terminal_Set_Balance;}
					};
				case "cash" :
					{
						if (_setValue == -1) then
							{[_uid, _value, -1, true] call Terminal_Set_Cash;}
						else
							{[_uid, 0, _setValue, true] call Terminal_Set_Cash;};
					};     
			};
	};
	
//	Пересоздаем массив предметов для последующей отправки
Terminal_ReSort_Array	=	
	{
		Private ["_prefix"];
		_prefix	=	(_this select 0);
		call compile ("Terminal_Array_"+_prefix+" = [a_Terminal_Array_"+_prefix+"] call Terminal_Sort_Arrays");
	};
	
Terminal_Find_in_Array	=
	{
		Private ["_array"];
		_array	=	call compile ("a_Terminal_Array_"+(_this select 0));
		((_this select 1) in _array)
	};		

Terminal_Buy	=
	{ 
		Private ["_player_UID","_trader_UID","_item","_price","_dec_price","_array_type", "_array", "_find_item","_balance","_client"];
		_player_UID	=	_this select 0;
		_trader_UID	=	_this select 1;
		_item		=	_this select 2;
		_price		=	_this select 3;
		_array_type	=	_this select 4;
		_client		=	_this select 5;
		_array		=	call compile ("Terminal_Array_"+_array_type);
		_find_item	=	[_array, _trader_UID, _item, _price] call Terminal_Find_Array_Item;
		if !(_find_item) exitWith
			{[_client, ["error","Выбранный предмет, отсутствует!"]] call Terminal_Server_to_Client_Send;};
		//	Проверим, есть ли у покупателя бабло на покупку
		{
			if ( (_x select 0) == _player_UID ) exitWith
				{
					if ( (_x select 2) >= _price ) then	//	Баланс
						{_balance	=	true;}
					else
						{_balance	=	false;};
				};
		} forEach Terminal_Array;
		if !(_balance) exitWith
			{[_client, ["error", "У Вас не хватает средств на покупку товара!"]] call Terminal_Server_to_Client_Send;};
		_dec_price	=	_price * -1;
		if !([_player_UID, _dec_price, -1, true, true] call Terminal_Set_Balance) exitWith
			{[_client, ["error","Произошла ошибка списания средств!"]] call Terminal_Server_to_Client_Send;};
		[_trader_UID, _price, -1, true] call Terminal_Set_Deposite;
		[_trader_UID,_item,_price] call Terminal_Delete_Item;
		[_array_type] call Terminal_ReSort_Array;
		[_client, ["message", format["Предмет: %1, куплен!", _item]]] call Terminal_Server_to_Client_Send;
		[_client, ["acceptDrop",_item]] call Terminal_Server_to_Client_Send;
	};
	
Terminal_Drop	=
	{
		Private ["_player_UID","_item","_price","_dec_price","_array_type","_balance","_client"];
		_player_UID	=	_this select 0;
		_item		=	_this select 1;
		_price		=	_this select 2;
		_array_type	=	_this select 3;
		_client		=	_this select 4;
		if !([_player_UID, _item, _price] call Terminal_Find_Main_Array_Item) exitWith
			{[_client, ["error", "Предмет не найден!"]] call Terminal_Server_to_Client_Send;};
		[_player_UID,_item,_price] call Terminal_Delete_Item;
		[_array_type] call Terminal_ReSort_Array;
		[_client, ["message", format["Предмет: %1, успешно снят с торгов!", _item]]] call Terminal_Server_to_Client_Send;
		[_client, ["acceptDrop",_item]] call Terminal_Server_to_Client_Send;
	};

Terminal_Test_Count_Items	=
	{
		Private ["_UID","_result"];
		_result	=	false;
		_UID	=	_this select 0;
		{
			if ( (_x select 1)  == _UID ) exitWith
				{
					if ( count (_x select 3) < 10 ) then
						{_result	=	true;};
				};
		} forEach Terminal_Array;
		_result
	};
	
//	Добавляем предмет в массив пользователя* В текущий - "pistols" и т.п. не надо - он будет переинициализирован
Terminal_Add_User_Item	=
	{
		Private ["_Name","_UID","_Balance","_item","_price","_items_count","_inc","_items_array","_counter","_rec","_i"];
		_UID		=	_this select 0;
		_item		=	_this select 1;
		_price		=	_this select 2;
		_counter	=	0;
		{
			if ( _UID == (_x select 1) ) exitWith
				{
					_Name			=	_x select 0;										//	Имя
					_Balance		=	_x select 2;										//	Баланс
					_items_array	=	_x select 3;										//	Массив, предметов и цен игрока
					_inc	=	false;
					for "_i" from 0 to (count _items_array) -1 do
						{
							if ( ( ((_items_array select _i) select 0) == _item) && ( ((_items_array select _i) select 1) == _price ) ) exitWith
								{
									_items_count	=	(_items_array select _i) select 2;
									_items_count	=	_items_count + 1;
									_items_array set [_i, [_item,_price,_items_count]];
									_inc	=	true;
								};
						};
					if !(_inc) then															//	Добавим новый предмет в массив
						{_items_array set [count _items_array, [_item,_price,1]];};
					
					_rec	=	[_Name, _UID, _Balance, _items_array];
		
					Terminal_Array set [_counter, _rec];
					if (_UID != "") then
						{"ultima_ini" callExtension format["9|%1|%2|%3","auction",_UID,_rec];};
				};
			_counter	=	_counter + 1;
		} forEach Terminal_Array;
	};

//	Добавление предмета на торги
Terminal_Add_Item	=
	{
		Private	["_player","_player_UID","_item","_price","_array_type"];
		_player		=	(_this select 0);
		_player_UID	=	(_this select 1);
		_item		=	(_this select 2);
		_price		=	(_this select 3);
		_array_type	=	(_this select 4);
		_client		=	(_this select 5);
		if ( (_price > 999999) || (_price < 0) ) exitWith
			{[_client, ["error", "Ценник не может быть выше 999999 или ниже 0!"]] call Terminal_Server_to_Client_Send;};
		if !([_player_UID] call Terminal_Test_Count_Items) exitWith
			{[_client, ["error", "Превышен лимит предметов на торгах!"]] call Terminal_Server_to_Client_Send;};
		if !([_array_type, _item] call Terminal_Find_in_Array) exitWith
			{[_client, ["error", "Ошибка добавления предмета. Не правильный массив предмета!"]] call Terminal_Server_to_Client_Send;};
		[_player_UID, _item, _price] call Terminal_Add_User_Item;
		[_array_type] call Terminal_ReSort_Array;
		[_client, ["message", format["Предмет: %1, успешно добавлен на продажу", _item]]] call Terminal_Server_to_Client_Send;
		[_client, ["acceptAdd", _item]] call Terminal_Server_to_Client_Send;
	};

//	Перевод средств другому игроку	
Terminal_Transfer	=
	{
		Private ["_client","_packet","_balance","_player_UID","_summa"];
		_client			=	(_this select 0);
		_packet			=	(_this select 1);
		_player_UID		=	getPlayerUID(_packet select 0);
		_balance		=	[_player_UID] call Terminal_Get_Balance;
		_summa			=	(_packet select 3);
		if (_summa > _balance) exitWith
			{[_client, ["error", "На счету недостаточно денег! Перевод отклонен!"]] call Terminal_Server_to_Client_Send;};
		if (_summa < 0) exitWith
			{[_client, ["error", "Не правильно указана сумма перевода! Перевод отклонен!"]] call Terminal_Server_to_Client_Send;};							
		Private ["_dec_summa","_transferID","_find_result"];
		_transferID		=	(_packet select 2);
		_find_result	=	false;
		{
			if ( (_x select 1) == _transferID) exitWith
				{
					_find_result	=	true;
					_dec_summa	=	_summa * -1;
					[_player_UID, _dec_summa, -1, true, true] call Terminal_Set_Balance;
					[_transferID, _summa, -1, true, true] call Terminal_Set_Balance;
					[_client, ["message", "Ваш перевод доставлен получателю."]] call Terminal_Server_to_Client_Send;
					{
						if (getPlayerUID _x == _transferID) exitWith
							{[(owner _x), ["message", "Вам пришел перевод. Баланс обновлен."]] call Terminal_Server_to_Client_Send;};
					} forEach playableUnits;
				};
		} forEach Terminal_Array;
		if !(_find_result) exitWith
			{[_client, ["error", "Клиент не найден! Перевод отклонен!"]] call Terminal_Server_to_Client_Send;};	
	};
	
Terminal_Rebalance	=
	{
		Private ["_player", "_uid", "_balance","_cash","_deposite","_admin_money"];
		_player			=	(_this select 0);
		_uid			=	GetPlayerUID (_player);
		_balance		=	[_uid] call Terminal_Get_Balance;
		_player setVariable ["Ultima_Money", _balance, true];
		_cash			=	[_uid] call Terminal_Cash;
		_player setVariable ["Ultima_Cash", _cash, true];
		_deposite		=	[_uid] call Terminal_Deposite;
		_player setVariable ["Ultima_Deposite", _deposite, true];
		_admin_money	=	[_uid] call Ultima_Get_Admin_Money;
		_player setVariable ["admin_money", _admin_money, true];
		{
			if ( (_x select 0) == _uid ) exitWith
				{[(owner _player), ["ultima_ban_chat"]] call Terminal_Server_to_Client_Send;};
		} forEach Ultima_Ban_Chat_Array;
		"ultima_ini" callExtension format["9|date|%1|%2", _uid, Ultima_Date];
	};
	
//	Функция для терминала. Отсылает бан чата.	
Ultima_Ban_Chat_On_Off	=
	{
		Private ["_uid", "_time", "_date_time", "_rec", "_i", "_find"];
		diag_log(format["THIS BAN CHAT: %1", _this]);
		_uid	=	(_this select 2);
		_time	=	(_this select 3);
		{
			if	((getPlayerUID _x) == _uid) exitWith
				{
					if (_time == -1) then
						{
							//	Если снимаем бан
							[(owner _x), ["ultima_ban_chat_off"]] call Terminal_Server_to_Client_Send;
							"ultima_log" callExtension format["8|banchat|%1|", _uid];
							for "_i" from ((count Ultima_Ban_Chat_Array) - 1) to 0 step -1 do
								{
									_rec	=	(Ultima_Ban_Chat_Array select _i);
									if ( (_rec select 0) == _uid ) exitWith
										{
											Ultima_Ban_Chat_Array set [_i, -1];
											Ultima_Ban_Chat_Array	=	Ultima_Ban_Chat_Array - [-1];
										};
								};
						}
					else
						{
							//	Если баним
							_date_time	=	"ultima_log" callExtension "11";
							[(owner _x), ["ultima_ban_chat"]] call Terminal_Server_to_Client_Send;
							_rec	=	[_uid, _date_time, _time];
							"ultima_log" callExtension format["9|banchat|%1|%2", _uid, _rec];
							_find	=	false;
							for "_i" from ((count Ultima_Ban_Chat_Array) - 1) to 0 step -1 do
								{
									_rec	=	(Ultima_Ban_Chat_Array select _i);
									if ( (_rec select 0) == _uid ) exitWith
										{
											_find	=	true;
											Ultima_Ban_Chat_Array set [_i, [_uid, _date_time, _time]];
										};
								};
							if !(_find) then
								{Ultima_Ban_Chat_Array set [count Ultima_Ban_Chat_Array, [_uid, _date_time, _time]];};
						};
				};
		} forEach playableUnits;
	};

	// [] call Terminal_Server_to_Client_Send;	
Terminal_Server_to_Client_Send	=
	{
		Private ["_client", "_packet"];
		_client	=	(_this select 0);
		_packet	=	(_this select 1);		
		Terminal_Client = _packet;
		_client publicVariableClient "Terminal_Client";
	};