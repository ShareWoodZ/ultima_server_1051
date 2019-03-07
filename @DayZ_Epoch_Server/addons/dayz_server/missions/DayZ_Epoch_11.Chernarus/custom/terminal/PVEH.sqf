diag_log("[#Ultima]: [Терминал торговли]: Регистрация публичного события.");
"Terminal_Server" addPublicVariableEventHandler
	{
		private["_packet","_client","_command"];
		_packet =  (_this select 1);
		_client = owner (_packet select 0);	//	Кто отправил пакет и ждет получения ответа.
		//	Если не прогружен терминал
		if !(isNil "Terminal_Start") exitWith
			{
				Terminal_Client = ["not_terminal", 0];
				_client publicVariableClient "Terminal_Client";
			};
		
		_command	=	(_packet select 1);	//	Тип запроса клиента
		switch (_command) do				//	Выборка - какая команда пришла.
			{
				//	Запрос на раздел пистолетов
				case "pistols":
					{
						Terminal_Client = ["partition", Terminal_Array_Pistols];			//	Кладем массив в ответ для клиента
						_client publicVariableClient "Terminal_Client";		//	Отправляем получателю данные
					};
				case "shotguns":
					{
						Terminal_Client = ["partition", Terminal_Array_Shotguns];
						_client publicVariableClient "Terminal_Client";
					};
				case "rifles":
					{
						Terminal_Client = ["partition", Terminal_Array_Rifles];
						_client publicVariableClient "Terminal_Client";
					};
				case "machineguns":
					{
						Terminal_Client = ["partition", Terminal_Array_Machineguns];
						_client publicVariableClient "Terminal_Client";
					};
				case "sniperrifles":
					{
						Terminal_Client = ["partition", Terminal_Array_SniperRifles];
						_client publicVariableClient "Terminal_Client";
					};
				case "ammo_pistols":
					{
						Terminal_Client = ["partition", Terminal_Array_Ammo_Pistols];
						_client publicVariableClient "Terminal_Client";
					};
				case "ammo_shotguns":
					{
						Terminal_Client = ["partition", Terminal_Array_Ammo_Shotguns];
						_client publicVariableClient "Terminal_Client";
					};
				case "ammo_rifles":
					{
						Terminal_Client = ["partition", Terminal_Array_Ammo_Rifles];
						_client publicVariableClient "Terminal_Client";
					};
				case "ammo_machineguns":
					{
						Terminal_Client = ["partition", Terminal_Array_Ammo_Machineguns];
						_client publicVariableClient "Terminal_Client";
					};
				case "ammo_sniperrifles":
					{
						Terminal_Client = ["partition", Terminal_Array_Ammo_SniperRifles];
						_client publicVariableClient "Terminal_Client";
					};
				case "ammo_bombs":
					{
						Terminal_Client = ["partition", Terminal_Array_Ammo_Bombs];
						_client publicVariableClient "Terminal_Client";
					};
				case "woods":
					{
						Terminal_Client = ["partition", Terminal_Array_Woods];
						_client publicVariableClient "Terminal_Client";
					};
				case "stones":
					{
						Terminal_Client = ["partition", Terminal_Array_Stones];
						_client publicVariableClient "Terminal_Client";
					};
				case "materials":
					{
						Terminal_Client = ["partition", Terminal_Array_Materials];
						_client publicVariableClient "Terminal_Client";
					};
				case "constructions":
					{
						Terminal_Client = ["partition", Terminal_Array_Constructions];
						_client publicVariableClient "Terminal_Client";
					};
				case "bikes":
					{
						Terminal_Client = ["partition", Terminal_Array_Bikes];
						_client publicVariableClient "Terminal_Client";
					};
				case "cars":
					{
						Terminal_Client = ["partition", Terminal_Array_Cars];
						_client publicVariableClient "Terminal_Client";
					};
				case "jeeps":
					{
						Terminal_Client = ["partition", Terminal_Array_Jeeps];
						_client publicVariableClient "Terminal_Client";
					};
				case "cargos":
					{
						Terminal_Client = ["partition", Terminal_Array_Cargos];
						_client publicVariableClient "Terminal_Client";
					};	
				case "military_no_weapons":
					{
						Terminal_Client = ["partition", Terminal_Array_Military_No_Weapons];
						_client publicVariableClient "Terminal_Client";
					};
				case "military_with_weapons":
					{
						Terminal_Client = ["partition", Terminal_Array_Military_With_Weapons];
						_client publicVariableClient "Terminal_Client";
					};	
				case "airships":
					{
						Terminal_Client = ["partition", Terminal_Array_Airships];
						_client publicVariableClient "Terminal_Client";
					};
				case "helis":
					{
						Terminal_Client = ["partition", Terminal_Array_Helis];
						_client publicVariableClient "Terminal_Client";
					};
				case "helis_weapons":
					{
						Terminal_Client = ["partition", Terminal_Array_Helis_weapons];
						_client publicVariableClient "Terminal_Client";
					};
				case "ships":
					{
						Terminal_Client = ["partition", Terminal_Array_Ships];
						_client publicVariableClient "Terminal_Client";
					};
				case "ships_with_weapons":
					{
						Terminal_Client = ["partition", Terminal_Array_Ships_With_Weapons];
						_client publicVariableClient "Terminal_Client";
					};
				case "medicals":
					{
						Terminal_Client = ["partition", Terminal_Array_Medicals];
						_client publicVariableClient "Terminal_Client";
					};
				case "foodother":
					{
						Terminal_Client = ["partition", Terminal_Array_FoodOther];
						_client publicVariableClient "Terminal_Client";
					};					
				case "tools":
					{
						Terminal_Client = ["partition", Terminal_Array_Tools];
						_client publicVariableClient "Terminal_Client";
					};
				case "parts":
					{
						Terminal_Client = ["partition", Terminal_Array_Parts];
						_client publicVariableClient "Terminal_Client";
					};

				//	Запрос на пополнение баланса, за счет убийства зомби, или бота
				case "reward":
					{ 
						Private ["_player_UID","_reward"];
						_player_UID	=	getPlayerUID(_packet select 0);
						_reward		=	_packet select 2;
						if !([_player_UID, _reward, -1, false] call Terminal_Set_Cash) then
							{
								Terminal_Client = ["error", "Не удалось пополнить баланс"];
								_client publicVariableClient "Terminal_Client";
							};
					};
				
				//	Запрос на понижение баланса ИЗ БАНКА при покупке у торговца
				case "trader_buy":
					{ 
						Private ["_player_UID","_reward"];
						_player_UID	=	getPlayerUID(_packet select 0);
						_reward		=	_packet select 2;
						if !([_player_UID, _reward, -1, false, true] call Terminal_Set_Balance) then
							{
								Terminal_Client = ["error", "Не удалось пополнить баланс"];
								_client publicVariableClient "Terminal_Client";
							};
					};
					
				//	Запрос на покупку предмета
				case "buy":
					{ 
						private["_player_UID","_trader_UID","_item","_price","_array_type"];
						_player_UID	=	getPlayerUID(_packet select 0);
						_trader_UID	=	(_packet select 2);
						_item		=	(_packet select 3);
						_price		=	(_packet select 4);
						_array_type	=	(_packet select 5);
						[_player_UID,_trader_UID, _item, _price, _array_type,_client] call Terminal_Buy; 
					};
				//	Запрос на снятие предмета с продажи
				case "drop":
					{ 
						private["_player_UID","_test_UID","_item","_price","_array_type"];
						_player_UID	=	getPlayerUID(_packet select 0);
						_test_UID	=	(_packet select 2);
						if (_player_UID != _test_UID) exitWith
							{diag_log(format["ЧИТ: Юиды не совпадают! _UID отправляющего: %1, _UID отослал: %2",_player_UID,_test_UID]);};	//	Записать что читанул и отослал поддельный ЮИД на снятие предмета с продажи
						_item		=	(_packet select 3);
						_price		=	(_packet select 4);
						_array_type	=	(_packet select 5);
						[_player_UID, _item, _price, _array_type, _client] call Terminal_Drop; 
					};					
					
				//	Запрос на отображение предметов игрока, выставленных на продажу
				case "terminal_my_items":
					{
						Private ["_player_UID"];
						_player_UID	=	getPlayerUID(_packet select 0);	
						Terminal_Client	=	["terminal_my_items", [_player_UID] call Terminal_Get_Player_Items];
						_client publicVariableClient "Terminal_Client";
					};
					
				//	Запрос на добавление предмета на торги
				case "add":
					{
						Private ["_player","_player_UID","_item","_price","_array_type"];
						_player		=	(_packet select 0);
						_player_UID	=	getPlayerUID(_packet select 0);
						_item		=	(_packet select 3);
						_price		=	(_packet select 4);
						_array_type	=	(_packet select 5);
						[_player, _player_UID, _item, _price, _array_type, _client] call Terminal_Add_Item;
					};
				case "buy_diag":	
					{
						Private ["_Name","_UID","_item","_location"];
						_Name		=	name (_packet select 0);
						_UID		=	getPlayerUID(_packet select 0);
						_item		=	_packet select 2;
						_location	=	_packet select 3;
						diag_log(format["[#Ultima]: [Терминал торговли]: [Покупка]: Игрок: %1, UID: %2, купил, или снял с продажи: %3, в локации: %4",_Name,_UID,_item,_location]);
					};
				case "sell_diag":
					{
						Private ["_Name","_UID","_item","_location"];
						_Name		=	name (_packet select 0);
						_UID		=	getPlayerUID(_packet select 0);
						_item		=	_packet select 2;
						_location	=	_packet select 3;
						diag_log(format["[#Ultima]: [Терминал торговли]: [Ставка на продажу]: Игрок: %1, UID: %2, поставил на продажу: %3, в локации: %4",_Name,_UID,_item,_location]);
					};
				case "rebalance":
					{[(_packet select 0)] spawn Terminal_Rebalance;};
				case "transfer":
					{[_client,_packet] call Terminal_Transfer;};
				case "cashtobank":
					{[(_packet select 0)] call Terminal_CashToBank;};
				case "depositetocash":
					{[(_packet select 0)] call Terminal_DepositeToCash;};
				case "admin_event":
					{
						private ["_action","_uid","_value","_setValue"];
						_action		=	_packet select 2;
						_uid		=	_packet select 3;
						_value 		=	_packet select 4;
						_setValue	=	_packet select 5;
						[_action, _uid,_value,_setValue] call Terminal_Admin_Event;
					};
				case "base_defense":
					{_packet spawn Ultima_Donat_Base_Create;};
				case "base_add_friend":
					{_packet spawn Ultima_Donat_Base_Add_Friend;};
				case "base_update":
					{_packet spawn Ultima_Donat_Base_Update;};
				case "base_days":
					{_packet spawn Ultima_Get_Days_Base;};
				case "donator_buy":
					{_packet spawn Ultima_Donator_Buy;};
				case "moderator_control":
					{	
						{
							Terminal_Client	=	["system", (_packet select 2)];
							(owner _x) publicVariableClient "Terminal_Client";
						}forEach playableUnits;
					};
				case "quest_accept":
					{_packet spawn Ultima_Quest_Server_Accept;};
				case "quest_decline_delete":
					{_packet spawn Ultima_Quest_Server_Decline_Delete;};
				case "ultima_update_display_106":
					{_packet spawn Ultima_Update_Display_106;};
				case "ultima_update_ping":
					{_packet spawn Ultima_Update_Ping;};
				case "ultima_ban_chat":
					{_packet spawn Ultima_Ban_Chat_On_Off;};
			};
	};
diag_log("[#Ultima]: [Терминал торговли]: Зарегистрировано публичное событие Terminal_Server!");