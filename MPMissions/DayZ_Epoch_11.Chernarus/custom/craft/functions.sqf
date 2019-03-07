diag_log ("[#Ultima]: [Создание предметов]: Компиляция клиентских функций...");
//	Открытие диалога крафта
craft_open_dialog	=
	{
		//diag_log("Открытие диалога");
		Private ["_craft","_array","_partition"];
		_craft = createDialog ("Ultima_Craft");
		disableSerialization;
		if (!_craft) exitWith
			{hint "Нет возможности открыть диалог торговли!"};
		lbClear 23002;
		_array	=	[];
		{
			_partition	=	_x select 0;
			if !(_partition in _array) then 
				{
					lbAdd[23002,_partition];
					_array set [count _array, _partition];
				};
		} forEach Ultima_Craft_Array;
	};
	
	
//	Заполняем список предметов, которые крафтятся в выбраном разделе
craft_list_fill	=
	{
		Private ["_partition"];
		lbClear 23003;
		_partition = lbText [23002, (lbCurSel 23002)];
		//diag_log(format["_partition: %1",_partition]);
		{
			if ( _partition == (_x select 0) ) then
				{
					_item				=	_x select 1;
					_text_pic			=	[_item] call Terminal_Get_Item_Text_Pic;
					if ( (count(_text_pic)) > 0) then
						{
							_text	=	_text_pic select 0;
							_pic	=	_text_pic select 1;
							_index	=	lbAdd[23003,_text];
							lbSetPicture [23003, _index, _pic];
						};
				};
		} forEach Ultima_Craft_Array;
	};	

//	Заполняем список крафта для выбраного предмета
craft_required_list_fill	=
	{
		Private ["_craft_item","_item","_required_array","_required_item","_required_value","_text_pic","_text","_pic","_index"];
		lbClear 23004;
		_craft_item = lbText [23003, (lbCurSel 23003)];
		
		//diag_log(format["_craft_item: %1",_craft_item]);
		{
			_item		=	(_x select 1);
			_text_pic	=	[_item] call Terminal_Get_Item_Text_Pic;
			_text		=	_text_pic select 0;
			
			if (_text == _craft_item) exitWith
				{
					lbAdd[23004,"---Список необходимых предметов---"];
					lbSetColor [23004, 0, [128,0,128, 1]];
					//	Получаем название предмета
					_required_array	=	_x select 2;	//	Массив: Требуемые предметы на крафт [["Binocular",1],["ItemGoldBar",5]]
					for "_i" from 0 to (count(_required_array) - 1) do
						{
							_required_item	=	(_required_array select _i) select 0;	//	Предмет
							_required_value	=	(_required_array select _i) select 1;	//	Кол-во
							//	Выводим имя, иконку, и необходимое кол-во предметов в правую часть. - Заполняем список.
							_text_pic	=	[_required_item] call Terminal_Get_Item_Text_Pic;
							if ( (count(_text_pic)) > 0) then
								{
									_text	=	format["x%1 %2",str(_required_value),(_text_pic select 0)];
									_pic	=	_text_pic select 1;
									_index	=	lbAdd[23004,_text];
									lbSetPicture [23004, _index, _pic];
								};
						};
					_index	=	lbAdd[23004,"---Список необходимых инструментов---"];
					lbSetColor [23004, _index, [128,0,128, 1]];
					_required_array	=	_x select 3;	//	Массив: Требуемые инструменты на крафт ["ItemToolbox","ItemKnife"]
					for "_i" from 0 to (count(_required_array) - 1) do
						{
							//	Выводим имя, и иконку, инструмента. - Заполняем список.
							_text_pic	=	[(_required_array select _i)] call Terminal_Get_Item_Text_Pic;
							if ( (count(_text_pic)) > 0) then
								{
									_text	=	_text_pic select 0;
									_pic	=	_text_pic select 1;
									_index	=	lbAdd[23004,_text];
									lbSetPicture [23004, _index, _pic];
								};
						};
					_index	=	lbAdd[23004,"---Список необходимых объектов---"];
					lbSetColor [23004, _index, [128,0,128, 1]];					
					_required_array	=	_x select 4;	//	Массив: Требуемые постройки. [["WorkBench_DZ","Верстак",5]]
					for "_i" from 0 to (count(_required_array) - 1) do
						{
							_required_item	=	(_required_array select _i) select 1;	//	Предмет
							_required_value	=	(_required_array select _i) select 2;	//	Радиус
							//	Выводим имя, и радиус, объекта. - Заполняем список.
							lbAdd[23004,format["%1. Радиус: %2м",_required_item, _required_value]];
						};
				};
		} forEach Ultima_Craft_Array;
	};
	
//	Поиск техники игрока если она требуется при крафте
Craft_Find_Vehicle	=
	{
		Private ["_item","_vehicles","_vehID","_vehUID","_vehCharacterID","_notSetup","_keyColor","_i","_y","_notSetup","_hitpoints","_okToSell","_tires","_tireDmg","_damage"];
		_item	=	_this select 0;
		_radius	=	_this select 1;
		Craft_Vehicle	=	objNull;
		_vehicles = (getPosATL player) nearEntities [[_item],_radius];
		//diag_log(format["Техника _vehicles: %1", _vehicles]);
		{
			//diag_log(format["veh: %1, typeOf: %2",_x, (typeOf _x)]);
			//diag_log("попытка добавить технику");
			_vehID		=	_x getVariable ["ObjectID","0"];
			_vehUID		=	_x getVariable ["ObjectUID","0"];
			_notSetup	=	(_vehID == "0" && _vehUID == "0");
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
											//	Проверка повреждений: Нельзя крафтить, если повреждено более чем на 5%
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
												{Craft_Vehicle	=	_x;};
										};
								};
							if !(isNull Craft_Vehicle) exitWith {};
						};
					if !(isNull Craft_Vehicle) exitWith {};
				};
			if !(isNull Craft_Vehicle) exitWith {};
		}forEach _vehicles;
	};

Craft_Find_Required_Items	=
	{
		Private ["_required_array","_i","_item","_value","_cfg","_magazines","_weapons","_counter","_config","_veh_type","_result"];
		_result	=	"true";
		//	Получаем данные о предмете
		_required_array		=	_this select 0;									//	Массив: Необходимые ресурсы. [["Binocular",1],["ItemGoldBar",5],["ItemAmethyst",1]]
		//diag_log(format["_required_array: %1", _required_array]);
		//	Проверяем наличие предметов в инвентаре пользователя
		for "_i" from 0 to (count(_required_array) - 1) do
			{
				_item	=	((_required_array select _i) select 0);
				_value	=	((_required_array select _i) select 1);
				//diag_log(format["_item: %1, _value: %2", _item,_value]);
				_cfg	=	[_item] call Terminal_Get_Item_Config;
				switch (_cfg) do
					{
						case "CfgMagazines"	:									//	Если требуемый предмет магазинного слота
							{
								_magazines	=	magazines player;
								_counter	=	0;
								for "_y" from 0 to (count(_magazines) - 1) do									
									{	
										if ( (_magazines select _y) == _item ) then
											{_counter	=	_counter + 1;}
									};
								if (_counter < _value) then
									{_result	=	_item;};
							};
						case "CfgWeapons"	:									//	Если требуемый предмет оружейного слота
							{
								_weapons	=	weapons player;
								_counter	=	0;
								for "_y" from 0 to (count(_weapons) - 1) do
									{	
										if ( (_weapons select _y) == _item ) then
											{_counter	=	_counter + 1;}
									};
								if (_counter < _value) then
									{_result	=	_item;};
							};
						case "CfgVehicles"	:									//	Если требуемый предмет рюкзак, или техника
							{
								Private ["_config","_veh_type"];
								_config		=	(configFile >> "CfgVehicles" >> _item);
								_veh_type	=	configName _config;
								if (_veh_type isKindOf "Bag_Base_EP1") then		//	Если требуемый предмет - рюкзак
									{
										if ( (typeOf(unitBackpack player)) != _item) then
											{_result	=	_item;};
									}
								else											//	Если требуемый предмет - техника
									{
										//diag_log("Требуется техника для крафта");
										[_item,_value] call Craft_Find_Vehicle;
										//diag_log("Проверка техники закончена");
										//diag_log(format["CV %1",Craft_Vehicle]);
										if (isNull Craft_Vehicle) then
											{
												//diag_log("техника НЕ найдена");
												_result	=	_item;
											};
									};
							};
					};
				//diag_log(format["_result: %1", _result]);
				if (_result != "true") exitWith 
					{
						_result	=	getText (configFile >> _cfg >> _item >> "displayName");
						//diag_log(format["_result отображаемый: %1", _result]);
						_result
					};
			};
		_result
	};
	
Craft_Delete_Required_Items	=
	{
		Private ["_required_array","_i","_item","_value","_cfg","_magazines","_weapons","_counter","_config","_veh_type","_result"];
		//	Получаем данные о предмете
		_required_array		=	_this select 0;									//	Массив: Необходимые ресурсы. [["Binocular",1],["ItemGoldBar",5],["ItemAmethyst",1]]
		//diag_log(format["_required_array: %1", _required_array]);
		//	Удаляем предметы
		for "_i" from 0 to (count(_required_array) - 1) do
			{
				_item	=	((_required_array select _i) select 0);
				_value	=	((_required_array select _i) select 1);
				//diag_log(format["_item: %1, _value: %2", _item,_value]);
				_cfg	=	[_item] call Terminal_Get_Item_Config;
				switch (_cfg) do
					{
						case "CfgMagazines"	:									//	Если требуемый предмет магазинного слота
							{
								for "_y" from 0 to (_value -1) do									
									{player removeMagazine _item;};
							};
						case "CfgWeapons"	:									//	Если требуемый предмет оружейного слота
							{player removeWeapon _item;};
						case "CfgVehicles"	:									//	Если требуемый предмет рюкзак, или техника
							{
								Private ["_config","_veh_type"];
								_config		=	(configFile >> "CfgVehicles" >> _item);
								_veh_type	=	configName _config;
								if (_veh_type isKindOf "Bag_Base_EP1") then		//	Если требуемый предмет - рюкзак
									{removeBackpack player;}
								else											//	Если требуемый предмет - техника
									{
										Private ["_vehID","_vehUID","_vehCharacterID","_keyColor"];
										_vehID			=	Craft_Vehicle getVariable ["ObjectID","0"];
										_vehUID			=	Craft_Vehicle getVariable ["ObjectUID","0"];
										_vehCharacterID	=	Craft_Vehicle getVariable ["CharacterID","0"];
										_keyColor	=	["ItemKeyYellow","ItemKeyBlue","ItemKeyRed","ItemKeyGreen","ItemKeyBlack"];
										{
											if (configName(inheritsFrom(configFile >> "CfgWeapons" >> _x)) in _keyColor) then
												{
													if (str(getNumber(configFile >> "CfgWeapons" >> _x >> "keyid")) == _vehCharacterID) exitWith
														{
															[player,_x] call BIS_fnc_invRemove;
															PVDZE_obj_Delete = [_vehID,_vehUID,player];
															publicVariableServer "PVDZE_obj_Delete";
															deleteVehicle Craft_Vehicle;
														};
												};
										} count (items player);
									};
							};
					};
			};
	};	
	
Craft_Test_Buildings	=
	{
		Private ["_result","_buildings","_objects"];
		_buildings	=	_this select 0;
		_result		= "true";
		{
			_objects	=	(getPosATL player) nearObjects [(_x select 0),(_x select 2)];
			//diag_log(format["Искомых объектов в радиусе: %1",count (_objects)]);
			if ( count(_objects) < 1) exitWith
				{
					_result	=	(_x select 1);
					_result
				};
		} forEach _buildings;
		_result
	};
	

//	Клик по кнопке - создать предмет
Craft_Button_Click	=
	{
		//diag_log("Крафт предмета");
		Private	["_craft_item","_item","_required","_text_pic","_text"];
		{
			_craft_item = lbText [23003, (lbCurSel 23003)];
			//diag_log(format["_craft_item: %1",_craft_item]);
			_item		=	(_x select 1);
			_text_pic	=	[_item] call Terminal_Get_Item_Text_Pic;
			_text		=	_text_pic select 0;
			if (_text == _craft_item) exitWith
				{
					//diag_log("Проверка наличия расходников");
					//	Проверяем наличие расходников на крафт
					_required	=	[(_x select 2)] call Craft_Find_Required_Items;
					if ( _required != "true" ) exitWith
						{taskHint [format["Не хватает: %1",_required], [1,0,0.1,1], "taskFailed"]};
					//diag_log("Проверка наличия инструментов");
					//	Проверяем наличие инcтрументов для крафта
					{
						if !( _x in (weapons player) ) exitWith
							{_required	=	_x;};
					} forEach (_x select 3);
					if ( _required != "true" ) exitWith
						{
							_text_pic	=	[_required] call Terminal_Get_Item_Text_Pic;
							taskHint [format["Не хватает инструмента: %1",(_text_pic select 0)], [1,0,0.1,1], "taskFailed"]
						};
					//	Проверяем наличие необходимых построек в указанном радиусе
					//diag_log("Проверка наличия объектов в радиусе");
					_required	=	[_x select 4] call Craft_Test_Buildings;
					if ( _required != "true" ) exitWith
						{taskHint [format["Не найден объект: %1",_required], [1,0,0.1,1], "taskFailed"]};
					//diag_log("Все в наличии");
					//	Удаляем из инвентаря расходники
					[(_x select 2)] call Craft_Delete_Required_Items;
					//	Добавляем предмет который крафтили
					[(_x select 1)] call Terminal_Accept_Drop_Buy;
					taskHint [format["Вы создали: %1",_text], [0,1,0,1], 'taskDone'];
				};
		} forEach Ultima_Craft_Array;
	};
diag_log ("[#Ultima]: [Создание предметов]: Компиляция клиентских функций завершена.");	