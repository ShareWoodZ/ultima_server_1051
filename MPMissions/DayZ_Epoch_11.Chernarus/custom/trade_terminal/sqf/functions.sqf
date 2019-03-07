diag_log ("[#Ultima]: [Торговый терминал]: Компиляция клиентских функций...");
//Открытие диалогов

Terminal_Create_Vehicle	=
	{
		Private ["_keyColor","_keyNumber","_keySelected","_isOk","_helipad","_location","_sign","_vehicle","_city"];
		_vehicle			=	_this select 0;		
		if (isNil "inTraderCity") then
			{_city	=	"Неизвестно"}
		else
			{_city	=	inTraderCity};
		_keyColor			=	["Green","Red","Blue","Yellow","Black"] call BIS_fnc_selectRandom;
		_keyNumber			=	(floor(random 2500)) + 1;
		_keySelected		=	format[("ItemKey%1%2"),_keyColor,_keyNumber];
		//	_isOk будет true если ключ добавился на пояс. false - если ячейки заняты или другие ошибки
		_isOk				=	[player,_keySelected] call BIS_fnc_invAdd;
		waitUntil {!isNil "_isOk"};
		_helipad			=	nearestObjects [player, ["HeliHCivil","HeliHempty"], 100];
		if(count _helipad > 0) then
			{_location	=	(getPosATL (_helipad select 0));}
		else
			{
				if !(_vehicle isKindOf "Ship") then
					{_location	=	[([player] call FNC_GetPos),0,20,1,0,20,0] call BIS_fnc_findSafePos;}	//	Для наземных
				else
					{_location	=	[([player] call FNC_GetPos),0,20,2,0,20,1] call BIS_fnc_findSafePos;};	//	Для морских
			};
		_sign				=	createVehicle ["Sign_arrow_down_large_EP1", _location, [], 0, "CAN_COLLIDE"];
		_location			=	(getPosATL _sign);
		PVDZE_veh_Publish2	=	[_sign,[0,_location],_vehicle,false,_keySelected,player];
		PublicVariableServer  "PVDZE_veh_Publish2";

		Terminal_Server	=	[player, "buy_diag", _vehicle, _city];
		publicVariableServer "Terminal_Server";
	};
	
Transfer_Receive	=
	{
		Private ["_receiver","_summa","_message"];
		_receiver	=	(_this select 0);
		_summa		=	round (parseNumber ( (_this select 1) ) );
		_message	=	"";
		if (_receiver == "") then
			{_message	=	localize "Ultima_TT_No_ID_Transfer_Reject"};
		if (_summa < 1) then
			{_message	=	localize "Ultima_TT_No_Summa_Transfer_Reject"};
		if (_summa > (player getVariable ["Ultima_Money", 0])) then
			{_message	=	localize "Ultima_TT_No_Enough_Money_Transfer_Reject"};
		if (_message != "") exitWith
			{taskHint [_message, [1,0,0.1,1], 'taskFailed'];};
		//diag_log (format["receiver: %1, summa: %2",_receiver,_summa]);
		Terminal_Server	=	[player, "transfer", _receiver, _summa];
		publicVariableServer "Terminal_Server";
	};	

	
//	Поиск техники игрока для добавления в массив на продажу
Terminal_Find_Vehicle	=
	{
		Private ["_vehicles","_vehID","_vehUID","_vehCharacterID","_notSetup","_keyColor","_i","_y","_notSetup","_hitpoints","_okToSell","_tires","_tireDmg","_damage"];
		Terminal_Vehicle	=	[];
		_vehicles = (getPosATL player) nearEntities [["LandVehicle","Air","Ship"],20];
		{
			//diag_log(format["veh: %1, typeOf: %2",_x, (typeOf _x)]);
			if ([(typeOf _x)] call Terminal_Find_Array_Type != "error") then
				{
					//diag_log("попытка добавить технику");
					_vehID		=	_x getVariable ["ObjectID","0"];
					_vehUID		=	_x getVariable ["ObjectUID","0"];
					_notSetup	=	(_vehID == "0" && _vehUID == "0");
					/*
					if (local _x) then
					 {diag_log("local _x");};
					if (alive _x) then
					 {diag_log("aliive _x");};
					if (!isNull _x) then
					 {diag_log("!isNull _x");};
					if (!_notSetup) then
					 {diag_log("!_notSetup");};
					*/
					if(local _x && !isNull _x && alive _x && !_notSetup) then
						{
							//diag_log("условия выполнены - поиск ключа");
							_keyColor	=	["ItemKeyYellow","ItemKeyBlue","ItemKeyRed","ItemKeyGreen","ItemKeyBlack"];
							for "_i" from 0 to (count (items player)) -1 do
								{
									if (configName(inheritsFrom(configFile >> "CfgWeapons" >> ((items player) select _i))) in _keyColor) then 
										{
											_vehCharacterID	=	_x getVariable ["CharacterID","0"];
											if (str(getNumber(configFile >> "CfgWeapons" >> ((items player) select _i) >> "keyid")) == _vehCharacterID) then
												{
													//diag_log("ключ найден, проверка повреждений");
													//	Проверка повреждений: Нельзя продать технику, поврежденную более чем на 5%
													_hitpoints	=	_x call vehicle_getHitpoints;
													_okToSell	=	true;
													_tires		=	0; 
													_tireDmg	=	0;
													_damage		=	0;
													for "_y" from 0 to (count _hitpoints) -1 do	
														{
															if(["Wheel",(_hitpoints select _y),false] call fnc_inString) then
																{
																	_damage		=	[_x,(_hitpoints select _y)] call object_getHit;
																	_tireDmg	=	_tireDmg + _damage;
																	_tires		=	_tires + 1;
																};
														};
													if(_tireDmg > 0 && _tires > 0) then
														{
															if((_tireDmg / _tires) > 0.05) then
																{_okToSell	=	false;};
														};
													if (_okToSell) exitWith
														{Terminal_Vehicle	=	[(typeOf _x), _vehID, _vehUID, _vehCharacterID];};
												};
										};
									if (count Terminal_Vehicle > 0) exitWith {};
								};
							if (count Terminal_Vehicle > 0) exitWith {};
						};
					if (count Terminal_Vehicle > 0) exitWith {};
				};
			if (count Terminal_Vehicle > 0) exitWith {};
		}forEach _vehicles;
		if (count Terminal_Vehicle < 1) then
			{taskHint [localize "Ultima_TT_No_Find_Vehicle_Or_Vehicle_Damage", [1,0,0.1,1], "taskFailed"];};
	};
	
Terminal_Sell_Vehicle	=
	{
		Private ["_distance","_sell_vehicle","_vehicles","_veh","_vehID","_vehUID","_vehCharacterID","_notSetup","_keyColor","_city","_veh_sell"];
		_vehType		=	Terminal_Vehicle select 0;
		_vehID			=	Terminal_Vehicle select 1;
		_vehUID			=	Terminal_Vehicle select 2;
		_vehCharacterID	=	Terminal_Vehicle select 3;
		//diag_log(format["Инфо по технике: %1, %2, %3, %4",_vehType,_vehID,_vehUID,_vehCharacterID]);
		//	Найти все тачки в масимально допустимом радиусе
		
		_veh_sell	=	false;
		_vehicles = (getPosATL player) nearEntities [["LandVehicle","Air","Ship"],30];
		{
			if ( (typeOf _x) == _vehType ) then
				{
					if ( (_vehID	==	(_x getVariable ["ObjectID","0"])) && (_vehUID == (_x getVariable ["ObjectUID","0"])) && (_vehCharacterID == (_x getVariable ["CharacterID","0"])) ) exitWith
						{
							_veh		=	_x;
							_veh_sell	=	true;
						};
				};
		} forEach _vehicles;
		if !(_veh_sell) exitWith
			{taskHint [localize "Ultima_TT_No_Find_Vehicle_Near", [1,0,0.1,1], "taskFailed"];};
		_veh_sell	=	false;
		_keyColor	=	["ItemKeyYellow","ItemKeyBlue","ItemKeyRed","ItemKeyGreen","ItemKeyBlack"];
		{
			if (configName(inheritsFrom(configFile >> "CfgWeapons" >> _x)) in _keyColor) then
				{
					if (str(getNumber(configFile >> "CfgWeapons" >> _x >> "keyid")) == _vehCharacterID) exitWith
						{
							[player,_x] call BIS_fnc_invRemove;
							PVDZE_obj_Delete = [_vehID,_vehUID,player];
							publicVariableServer "PVDZE_obj_Delete";
							deleteVehicle _veh;
							_veh_sell	=	true;
						};
				};
		} count (items player);
		if (_veh_sell) then
			{
				if (isNil "inTraderCity") then
					{_city	=	"Неизвестно"}
				else
					{_city	=	inTraderCity};
				Terminal_Server	=	[player, "sell_diag", _vehType, _city];
				publicVariableServer "Terminal_Server";
			}
		else
			{taskHint [localize "Ultima_TT_No_Find_Vehicle_Near", [1,0,0.1,1], 'taskFailed'];};
	};

Terminal_Open_Dialog	=
	{
		Private ["_dialog", "_Terminal"];
		_dialog		=	(_this select 0);
		_Terminal	=	createDialog _dialog;
		disableSerialization;
		if (!_Terminal) exitWith
			{hint localize "Ultima_TT_Dont_Open_Dialog"};
		//	Перевод меню
		switch (_dialog) do
			{
				case "Terminal":
					{
						ctrlSetText [10001, (localize "Ultima_TT")];
						ctrlSetText [10003, (localize "Ultima_TT_Items_Shall")];
						ctrlSetText [10004, (localize "Ultima_TT_My_Items")];
						ctrlSetText [10005, (localize "Ultima_TT_Add_Item")];						
					};
				case "Terminal_Add_Items":
					{
						ctrlSetText [20001, (localize "Ultima_TT")];
						ctrlSetText [20003, (localize "Ultima_TT_For_Sale")];
						ctrlSetText [20004, (localize "Ultima_TT_Price")];	
					};
				case "Terminal_Buy":
					{
						ctrlSetText [13001, (localize "Ultima_TT")];
						ctrlSetText [13003, (localize "Ultima_TT_Buy")];
						ctrlSetText [13004, (localize "Ultima_TT_Price")];
						ctrlSetText [13005, (localize "Ultima_TT_Trader")];						
					};
				case "Terminal_Drop_Items":
					{
						ctrlSetText [19001, (localize "Ultima_TT")];
						ctrlSetText [19003, (localize "Ultima_TT_Drop")];
						ctrlSetText [19004, (localize "Ultima_TT_Price")];			
					};
				case "Terminal_Partitions":
					{
						ctrlSetText [11001, (localize "Ultima_TT")];				
						ctrlSetText [11002, (localize "Ultima_TP_Weapon")];
						ctrlSetText [11003, (localize "Ultima_TP_Ammuniction")];
						ctrlSetText [11004, (localize "Ultima_TP_Tools")];
						ctrlSetText [11005, (localize "Ultima_TP_Build_Goods")];
						ctrlSetText [11006, (localize "Ultima_TP_Parts")];
						ctrlSetText [11007, (localize "Ultima_TP_Medicine")];
						ctrlSetText [11008, (localize "Ultima_TT_Food_And_Other")];
						ctrlSetText [11009, (localize "Ultima_TT_Tech")];
					};
				case "Terminal_Partitions_Ammo":
					{
						ctrlSetText [14001, (localize "Ultima_TT")];				
						ctrlSetText [14002, (localize "Ultima_TP_Ammo_Pistols")];
						ctrlSetText [14003, (localize "Ultima_TP_Ammo_Rifles")];
						ctrlSetText [14004, (localize "Ultima_TP_Ammo_Assault")];
						ctrlSetText [14005, (localize "Ultima_TP_Ammo_Light_Machinegan")];
						ctrlSetText [14006, (localize "Ultima_TP_Ammo_Snipers")];
						ctrlSetText [14007, (localize "Ultima_TP_Explosive")];
					};
				case "Terminal_Partitions_Vehicles":
					{
						ctrlSetText [18001, (localize "Ultima_TT")];
						ctrlSetText [18007, (localize "Ultima_TT_Land")];
						ctrlSetText [18008, (localize "Ultima_TT_Air")];
						ctrlSetText [18009, (localize "Ultima_TT_Sea")];
					};
				case "Terminal_Partitions_Constructions":
					{
						ctrlSetText [15001, (localize "Ultima_TT")];
						ctrlSetText [15002, (localize "Ultima_TT_Wood")];
						ctrlSetText [15003, (localize "Ultima_TT_Beton")];
						ctrlSetText [15004, (localize "Ultima_TT_Materials")];
						ctrlSetText [15005, (localize "Ultima_TT_Constructions")];
					};
				case "Terminal_Partitions_Vehicles_Air":
					{
						ctrlSetText [16001, (localize "Ultima_TT")];
						ctrlSetText [16002, (localize "Ultima_TP_Aircraft")];
						ctrlSetText [16003, (localize "Ultima_TP_Heli")];
						ctrlSetText [16004, (localize "Ultima_TT_Heli_With_Weapons")];
					};
				case "Terminal_Partitions_Vehicles_Land":
					{
						ctrlSetText [17001, (localize "Ultima_TT")];
						ctrlSetText [17002, (localize "Ultima_TT_Bikes")];
						ctrlSetText [17003, (localize "Ultima_TT_Passenger")];
						ctrlSetText [17004, (localize "Ultima_TT_Offroad")];
						ctrlSetText [17005, (localize "Ultima_TT_Bus")];
						ctrlSetText [17006, (localize "Ultima_TT_Military_No_Weapons")];
						ctrlSetText [17007, (localize "Ultima_TT_Military_With_Weapons")];						
					};
				case "Terminal_Partitions_Vehicles_Water":
					{
						ctrlSetText [15001, (localize "Ultima_TT")];
						ctrlSetText [15002, (localize "Ultima_TT_Without_Weapons")];
						ctrlSetText [15003, (localize "Ultima_TT_With_Weapons")];
					};
				case "Terminal_Partitions_Weapons":
					{
						ctrlSetText [22001, (localize "Ultima_TT")];
						ctrlSetText [22002, (localize "Ultima_TP_Weapon_Pistols")];
						ctrlSetText [22003, (localize "Ultima_TP_Weapon_Rifles")];
						ctrlSetText [22004, (localize "Ultima_TP_Weapon_Assault")];
						ctrlSetText [22005, (localize "Ultima_TP_Weapon_Machinegan")];
						ctrlSetText [22006, (localize "Ultima_TP_Weapon_Snipers")];
					};
				case "Transfer_Dialog":
					{
						ctrlSetText [21001, (localize "Ultima_TT_Bank_Transfer")];
						ctrlSetText [21002, (localize "Ultima_TT_Bank_ID")];
						ctrlSetText [21004, (localize "Ultima_TT_Bank_Summa")];
						ctrlSetText [21006, (localize "Ultima_TT_Bank_Send")];
						ctrlSetText [21007, (localize "Ultima_TT_Bank_Cash_To_Bank")];
						ctrlSetText [21008, (localize "Ultima_TT_Bank_Remove_From_Store")];						
					};
			};
	};
	
Terminal_Get_Item_Config	=	
	{
		Private ["_item","_result"];
		_item	=	_this select 0;
		_result	=	"CfgMagazines";
		if (getText (configFile >> _result >> _item >> "displayName")	!=	"") exitWith {_result};
		_result	=	"CfgWeapons";
		if (getText (configFile >> _result >> _item >> "displayName")	!=	"") exitWith {_result};
		_result	=	"CfgVehicles";
		if (getText (configFile >> _result >> _item >> "displayName")	!=	"") exitWith {_result};	
		_result	=	"";
		_result
	};	
	
Terminal_Get_Item_Text_Pic	=	
	{
		Private ["_cfg","_item","_text","_pic","_result"];
		_item	=	_this select 0;
		_cfg	=	[_item] call Terminal_Get_Item_Config;
		if (_cfg != "") then
			{
				_text	=	getText (configFile >> _cfg >> _item >> "displayName");
				_pic	=	getText (configFile >> _cfg >> _item >> "picture");
				_result	=	[_text,_pic];
			}
		else
			{_result	=	[];};
		_result
	};
	
Terminal_Find_Array_Type	=
	{
		Private ["_item"];
		_item	=	_this select 0;
		//	Оружие
		if (_item in a_Terminal_Array_Pistols)						exitWith	{"pistols"};
		if (_item in a_Terminal_Array_Shotguns)						exitWith	{"shotguns"};
		if (_item in a_Terminal_Array_Rifles)						exitWith	{"rifles"};
		if (_item in a_Terminal_Array_Machineguns)					exitWith	{"machineguns"};
		if (_item in a_Terminal_Array_Sniperrifles)					exitWith	{"sniperrifles"};
		//	Патроны
		if (_item in a_Terminal_Array_Ammo_Pistols)					exitWith	{"ammo_pistols"};
		if (_item in a_Terminal_Array_Ammo_Shotguns)				exitWith	{"ammo_shotguns"};
		if (_item in a_Terminal_Array_Ammo_Rifles)					exitWith	{"ammo_rifles"};
		if (_item in a_Terminal_Array_Ammo_Machineguns)				exitWith	{"ammo_machineguns"};
		if (_item in a_Terminal_Array_Ammo_SniperRifles)			exitWith	{"ammo_sniperrifles"};
		if (_item in a_Terminal_Array_Ammo_Bombs)					exitWith	{"ammo_bombs"};
		//	Конструкции - деревянные, железо-бетонные, материалы, готовые конструкции(сейфы и т.п.)
		if (_item in a_Terminal_Array_Woods)						exitWith	{"woods"};
		if (_item in a_Terminal_Array_Stones)						exitWith	{"stones"};
		if (_item in a_Terminal_Array_Materials)					exitWith	{"materials"};
		if (_item in a_Terminal_Array_Constructions)				exitWith	{"constructions"};
		//	Наземная техника
		if (_item in a_Terminal_Array_Bikes)						exitWith	{"bikes"};
		if (_item in a_Terminal_Array_Cars)							exitWith	{"cars"};
		if (_item in a_Terminal_Array_Jeeps)						exitWith	{"jeeps"};
		if (_item in a_Terminal_Array_Cargos)						exitWith	{"cargos"};
		if (_item in a_Terminal_Array_Military_No_Weapons)			exitWith	{"military_no_weapons"};
		if (_item in a_Terminal_Array_Military_With_Weapons)		exitWith	{"military_with_weapons"};		
		//	Воздушная техника
		if (_item in a_Terminal_Array_AirShips)						exitWith	{"airships"};
		if (_item in a_Terminal_Array_Helis)						exitWith	{"helis"};
		if (_item in a_Terminal_Array_Helis_Weapons)				exitWith	{"helis_weapons"};			
		//	Морская техника
		if (_item in a_Terminal_Array_Ships)						exitWith	{"ships"};
		if (_item in a_Terminal_Array_Ships_With_Weapons)			exitWith	{"ships_with_weapons"};	
		//	Инструменты
		if (_item in a_Terminal_Array_Tools)						exitWith	{"tools"};
		//	Медицина
		if (_item in a_Terminal_Array_Medicals)						exitWith	{"medicals"};
		//	Еда и другое - одежда, рюкзаки
		if (_item in a_Terminal_Array_FoodOther)					exitWith	{"foodother"};
		//	Запчасти
		if (_item in a_Terminal_Array_Parts)						exitWith	{"parts"};
		"error"
	};
	
Terminal_Show_Price	=
	{
		Private["_price","_idc_price","_trader","_idc_trader"];
		//diag_log(format["Terminal_Show_Price: _this: %1",_this]);
		if (count (_this select 0) > 2) then			//	Для товаров продавцов
			{
				_price		=	(_this select 0) select 3;
				_trader		=	(_this select 0) select 0;
				_idc_trader	=	(_this select 2);
				ctrlSetText [_idc_trader, "Продавец: " + _trader];
			}
		else
			{_price	=	(_this select 0) select 1;};	//	Для собственных товаров
		_idc_price	=	_this select 1;
		ctrlSetText [_idc_price, ( (localize "Ultima_TT_Price") + str(_price) )];
		//diag_log(format["Terminal_Show_Price: _price: %1, _idc_price: %2, _idc_trader: %3, _trader: %4",_price,_idc_price,_idc_trader,_trader]);
	};
	
Terminal_Add	=
	{
		Private ["_index","_UID","_item","_price","_array_type","_veh_array","_veh_rent"];
		_price	=	_this select 1;	//	Выставляемая цена на предмет
		_price	=	round(parseNumber _price);
		if ( (_price > 999999) || (_price < 1) ) exitWith	//	Если цена больше, или меньше допустимой 1-999999
			{taskHint [localize "Ultima_TT_Big_Or_Small_Price", [1,0,0.1,1], "taskFailed"];};
		_index			=	_this select 0;							//	Порядковый номер в массиве Terminal_User_Items
		_UID			=	getPlayerUID player;
		_item			=	Terminal_User_Items select _index;
		_array_type		=	[_item] call Terminal_Find_Array_Type;	//	Тип массива, чтоб на сервере по быстрому найти предмет
		
		//	Если это техника, спишем 200у.е. за выставление
		_veh_array	=	["cars","jeeps","military_no_weapons","military_with_weapons","airships","helis","helis_weapons","ships","ships_with_weapon"];
		_veh_rent	=	true;
		if (_array_type in _veh_array) then
			{
				if ((player getVariable ["Ultima_Money", 0]) < 200) exitWith
					{
						taskHint [localize "Ultima_TT_Not_Baxs_To_Send_Auction_Item", [1,0,0.1,1], "taskFailed"];
						_veh_rent	=	false;
					};
				if (_veh_rent) then
					{
						Terminal_Server	=	[player, "trader_buy", -200];
						publicVariableServer "Terminal_Server";
					};
			};
		if (!_veh_rent) exitWith {};
		//diag_log (format["Terminal ADD: _UID: %1, _item: %2, _price: %3, _array_type: %4",_UID,_item,_price,_array_type]);
		//	Запрос на сервер о выставлении товара на торги
		Terminal_Server	=	[player, "add", _UID, _item, _price, _array_type];
		publicVariableServer "Terminal_Server";
	};
	
//	Проверка наличных средств
Terminal_Test_Money	=
	{
		Private	["_price"];
		_price		=	(_this select 0);
		if (_price > (player getVariable ["Ultima_Money", 0])) exitWith							//	Если цена больше, чем есть наличных
			{
				taskHint [localize "Ultima_TT_Not_Enough_Cash", [1,0,0.1,1], "taskFailed"];
				false
			};
		true
	};
	
//	Проверки при покупке предмета
Terminal_Test_Buy_Drop_Item	=
	{
		Private	["_item", "_cfg", "_result"];
		_item		=	(_this select 0);															//	Предмет покупки
		_result		=	true;
		_cfg	=	[_item] call Terminal_Get_Item_Config;
		switch (_cfg) do
			{
				case "CfgMagazines"	:															//	Если покупаем предмет магазинного слота
					{
						//diag_log ("Покупаемый предмет - магазинный!");
						if ((count (magazines player)) > 20) exitWith
							{
								taskHint [localize "Ultima_No_Space_In_Inventory", [1,0,0.1,1], "taskFailed"];
								_result	=	false;
							};
					};
				case "CfgWeapons"	: 															//	Если покупаем предмет оружейного слота
					{
						//diag_log ("Покупаемый предмет - оружейный!");
						Private ["_config","_configName","_wepType","_isToolBelt","_isBinocs","_isPistol","_isRifle","_secondaryWeapon"];
						_config		=	(configFile >> "CfgWeapons" >> _item);
						_configName	=	configName(_config);
						_wepType	=	getNumber(_config >> "Type");
						_isToolBelt	=	(_wepType == 131072);									//	Предмет на поясе
						_isBinocs	=	(_wepType == 4096);										//	Бинокль
						_isPistol	=	(_wepType == 2);										//	Пистолет
						_isRifle	=	(_wepType == 1);										//	Автомат, ружье, дровобовик и т.п.
						if ( (_isRifle) && ((primaryWeapon player) != "") ) exitWith			//	Выходим, если автомат есть в инвентаре
							{
								taskHint [localize "Ultima_TM_Drop_Weapon", [1,0,0.1,1], "taskFailed"];
								_result	=	false;
							};
						if (_isPistol) then
							{
								_secondaryWeapon = "";
								{
									if ((getNumber (configFile >> "CfgWeapons" >> _x >> "Type")) == 2) exitWith
										{_secondaryWeapon = _x;};
								} count (weapons player);
								if (_secondaryWeapon != "") exitWith							//	Выходим, если пистолет есть в инвентаре.
									{
										taskHint [localize "Ultima_TM_Drop_Weapon", [1,0,0.1,1], "taskFailed"];
										_result	=	false;
									};
							};
						if ( (_isToolBelt || _isBinocs) && (_configName in (weapons player)) ) exitWith		//	Выходим если, инструмент есть в инвентаре
							{
								taskHint [localize "Ultima_TM_Drop_Toolbelt", [1,0,0.1,1], "taskFailed"];
								_result	=	false;
							};
					};
				case "CfgVehicles"	:															//	Если предмет имеет тип конфига Vehicle
					{
						//diag_log ("Покупаемый предмет - Vehicle!");
						Private ["_config","_veh_type","_bag","_isOk"];
						_config		=	(configFile >> "CfgVehicles" >> _item);
						_veh_type	=	configName _config;
						if (_veh_type isKindOf "Bag_Base_EP1") then								//	Если покупаем рюкзак
							{
								//diag_log ("Покупаемый предмет - рюкзак!");
								_bag	=	unitBackpack player;
								if !(isNull _bag) exitWith
									{
										taskHint [localize "Ultima_TM_Drop_Backpack", [1,0,0.1,1], "taskFailed"];
										_result	=	false;
									};
							}
						else																	//	Если покупаем технику
							{
								//diag_log ("Покупаемый предмет - техника!");
								_isOk	=	[player,"ItemKeyBlack900"] call BIS_fnc_invAdd;		//	Попробуем добавить левый ключ на пояс.
								waitUntil {!isNil "_isOk"};										//	Ждем ответа от функции добавления
								player removeWeapon "ItemKeyBlack900";							//	Удалим временный, левый ключ
								if !(_isOk) exitWith
									{
										taskHint [localize "Ultima_TM_Drop_Toolbelt", [1,0,0.1,1], "taskFailed"];
										_result	=	false;
									};
							};
					};
			};			
		_result
	};
	
Terminal_Drop	=
	{
		Private ["_array","_array_type","_UID","_item","_price"];
		_index			=	(_this select 0);				//	Порядковый номер предмета и цены в массиве игрока
		_array			=	Terminal_Array select _index;	//	Массив: ["MakarovSD",1]
		_item			=	(_array select 0);				//	Предмет
		
		//	Проверка, что предмет влезет в инвентарь
		if !([_item] call Terminal_Test_Buy_Drop_Item) exitWith {};
		_price			=	_array select 1;				//	Цена
		_array_type		=	[_item] call Terminal_Find_Array_Type;	//	Тип массива, чтоб на сервере по быстрому найти предмет
		_UID			=	getPlayerUID player;			//	UID игрока
		//diag_log (format["Terminal DROP: %1, _index: %2, _item: %3, _price: %4, _array_type: %5",Terminal_Array,_index,_item,_price,_array_type]);
		//	Запрос на сервер о снятии товара
		Terminal_Server	=	[player, "drop", _UID, _item, _price, _array_type];
		publicVariableServer "Terminal_Server";
	};	
	
Terminal_Buy	=
	{
		Private ["_array","_array_type","_UID","_item","_price"];
		_array			=	_this select 0;		//	Массив: ["NoNameUltima","184787","MakarovSD",1]
		_array_type		=	_this select 1;		//	Тип массива, чтоб на сервере по быстрому найти предмет
		_UID			=	_array select 1;
		_item			=	_array select 2;		
		_price			=	_array select 3;
		//diag_log (format["Trminal_Array: %1, _index: %2, _array_type: %3",Terminal_Array,_index,_array_type]);
		//	Проверка наличных
		if !([_price] call Terminal_Test_Money) exitWith {};
		//	Проверки
		if !([_item] call Terminal_Test_Buy_Drop_Item) exitWith {};
		//diag_log ("Проврерки прошли успешно!");
		//	Запрос на сервер о покупке товара
		Terminal_Server	=	[player, "buy", _UID, _item, _price, _array_type];
		publicVariableServer "Terminal_Server";
	};

//	Удачная покупка или снятие предмета - спавн предмета
Terminal_Accept_Drop_Buy	=
	{
		//diag_log("Добавление предмета в инвентарь");
		Private ["_item","_cfg"];
		_item	=	(_this select 0);
		_cfg	=	[_item] call Terminal_Get_Item_Config;	
		switch (_cfg) do
			{
				case "CfgMagazines"	: {player addMagazine _item;};
				case "CfgWeapons"	: {player addWeapon _item;};
				case "CfgVehicles"	: 
					{
						Private ["_config","_veh_type"];
						_config		=	(configFile >> "CfgVehicles" >> _item);
						_veh_type	=	configName _config;
						if (_veh_type isKindOf "Bag_Base_EP1") then
							{player addBackpack _item;}
						else
							{[_item] call Terminal_Create_Vehicle;};
					};
			};
	};
	
//	Удаление предмета из инвентаря или техники в радиусе, при удачном размещении на терминале торговли
Terminal_Accept_Add	=
	{
		//diag_log("Удаление предмета из инвентаря");
		Private ["_item","_cfg"];
		_item	=	_this select 0;
		_cfg	=	[_item] call Terminal_Get_Item_Config;
		switch (_cfg) do
			{
				case "CfgMagazines"	: {player removeMagazine _item;};
				case "CfgWeapons"	: {player removeWeapon _item;};
				case "CfgVehicles"	: 
					{
					
						Private ["_config","_veh_type"];
						_config		=	(configFile >> "CfgVehicles" >> _item);
						_veh_type	=	configName _config;
						if (_veh_type isKindOf "Bag_Base_EP1") then
							{removeBackpack player;}
						else
							{[] call Terminal_Sell_Vehicle;};
					};
			};
	};

diag_log ("[#Ultima]: [Торговый терминал]: Компиляция клиентских функций завершена.");	