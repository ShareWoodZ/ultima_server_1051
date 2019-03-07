/*
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
В файл init.sqf, добавить переменную:

Ultima_Diag_Level = 0; //    Уровень диагностики для вывода в RPT, от 0 до 3.
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Как добавлять предметы в массивы: (см. _aSpawnItems - это массивы предметов, которые вы можете возрождать в ящиках).
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
1 - Идентификатор предмета.
2 - Максимальное кол-во возрождаемых предметов. (от 0, до числа которое Вы укажете). Чтобы возрождалось точное кол-во указанных предметов, см. Спавн ящика, п.13
3 - Процент вероятности, что предметы вообще появятся в ящике - от 1 до 100.
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Спавн ящика: *Внимательно смотрите на цифры переменных!!!! (см. _Data - Это список ящиков, которые вы создаете на карте).
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
0 - Координата X *см. сноску ниже, для случайных координат.
1 - Координата Y *см. сноску ниже, для случайных координат.
2 - Координата Z *см. сноску ниже, для случайных координат.
3 - Угол под которым будет создан ящик.
4 - Время между обновлением предметов в ящике.
5 - Радиус от центра ящика, - если в пределах данного радиуса находится какой либо игрок, предметы не будут возрождаться. - Обновление предметов в ящике происходит, только если в пределах радиуса никого нет.
6 - Вместо цифры, впишите номер массива предметов.(см. _aSpawnItems).
7 - Внешний вид ящика.
8 - Задержка перед созданием ящика.
9 - Случайно выбирать позицию возрождения ящика(false - установить в указанных координатах. true - установить в случайных координатах).
10 - Возрождать ли предметы в ящике, или создать его один раз.(false - возрождать предметы. true - создать ящик  один раз при старте сервера(после задержки. см. п.9)).
11 - Не трогать.
12 - Не трогать.
13 - Кол-во предметов в ящике подбирать случайно от 0 до  - стольки, сколько указано, или ровно столько, сколько указано. - true - случайно.
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
*/
if (isServer) then
	{
		if (isNil "Ultima_Diag_Level") then
			{Ultima_Diag_Level	=	3;};
		if (Ultima_Diag_Level > 0) then
			{diag_log("[#Ultima]: [Ящики с лутом]: Создание ящиков с лутом.");};
		private ["_Data","_aSpawnItems","_worldname","_mapcenter","_Map_Radius"];
		_worldname	=	toLower format ["%1", worldName];
        _mapcenter	= (getMarkerPos "center");
		_Map_Radius = (_mapcenter select 0);

		if (Ultima_Diag_Level > 1) then
			{
				diag_log format["[#Ultima]: [Ящики с лутом]: Карта определена как %1.", _worldname];
				diag_log format["[#Ultima]: [Ящики с лутом]: Установлен центр координат: %1.", _mapcenter];
				diag_log format["[#Ultima]: [Ящики с лутом]: Установлен радиус карты: %1.", _Map_Radius];				
			};
		_aSpawnItems	=	
			[
				[
					["ItemPole",4,90]
					,["ItemTankTrap",4,80]
					,["ItemGenerator",2,40]
					,["ItemWire",2,30]
					,["ItemTent",1,30]
					,["CinderBlocks",6,50]
					,["MortarBucket",6,40]
					,["ItemMixOil",1,10]
					,["ItemOilBarrel",1,5]
					,["ItemSandbag",5,40]
					,["ItemSandbagLarge",2,20]
					,["ItemSandbagExLarge",1,10]
					,["ItemJerrycanEmpty",3,50]
					,["ItemJerrycan",2,30]
					,["ItemFuelBarrelEmpty",3,20]
					,["ItemFuelBarrel",2,10]
					,["ItemFireBarrel_kit",1,5]
					,["fuel_pump_kit",1,1]
					,["PartWoodLumber",10,50]
					,["PartPlankPack",7,30]
					,["PartWoodPlywood",10,40]
					,["PartPlywoodPack",5,20]
					,["metal_panel_kit",4,10]
					,["ItemComboLock",2,5]
					,["ItemLockbox",1,1]
					,["PartGeneric",10,80]
					,["ItemCopperBar",2,40]
				]
				,[
					["8Rnd_9x18_Makarov",10,90]
					,["8Rnd_9x18_MakarovSD",4,20]
					,["30Rnd_545x39_AK",8,70]
					,["30Rnd_762x39_AK47",6,60]
					,["Makarov",4,50]
					,["AK_74",5,30]
					,["AK_47_M",7,40]
					,["PartGeneric",10,80]
					,["ItemCopperBar",2,40]
				]
				,[
					["ItemBandage",8,80]
					,["ItemPainkiller",4,70]
					,["ItemMorphine",2,30]
					,["ItemEpinephrine",6,90]
					,["ItemBloodbag",4,60]
					,["ItemAntibiotic",2,30]
					,["PartGeneric",10,80]
					,["ItemCopperBar",2,40]
				]
			];
		_Data = 
			[
				[12968, 3551, 9, 59, 300, 50, (_aSpawnItems select 0),"USVehicleBox", 0, false, false, _mapcenter, _Map_Radius, true]
				,[13153, 3662, 9, 59, 300, 50, (_aSpawnItems select 1),"TKVehicleBox_EP1", 0, false, false, _mapcenter, _Map_Radius, true]
				,[13120, 3616, 9, 59, 300, 50, (_aSpawnItems select 2),"USVehicleBox", 0, false, false, _mapcenter, _Map_Radius, true]
				,[13099, 3615, 9, 59, 300, 50, (_aSpawnItems select 0),"USVehicleBox", 0, false, false, _mapcenter, _Map_Radius, true]
				,[13032, 3562, 9, 59, 300, 50, (_aSpawnItems select 2),"USVehicleBox", 0, false, false, _mapcenter, _Map_Radius, true]
				,[12978, 3539, 9, 59, 300, 50, (_aSpawnItems select 1),"RUVehicleBox", 0, false, false, _mapcenter, _Map_Radius, true]
				,[12994, 3547, 9, 59, 300, 50, (_aSpawnItems select 0),"USVehicleBox", 0, false, false, _mapcenter, _Map_Radius, true]
			];
		{
			[_x] spawn
				{
					private ["_Map_Radius","_random_count","_mapcenter","_Data","_aSpawnItems","_TimerSpawn","_SpawnItems","_SpawnDelay","_randomPos","_SpawnOneTime","_Box","_BoxID","_nearPlayers","_Item","_Count","_Percent","_Random","_Model"];
					_Data			=	(_this select 0);
					_Angle			=	(_data select 3);
					_TimerSpawn		=	(_data select 4);
					_Radius			=	(_data select 5);
					_boxID			=	str(round(random 999999));
					_box			=	objNull;
					_SpawnItems		=	true;					
					_aSpawnItems	=	(_data select 6);
					_Model			=	(_data select 7);
					_SpawnDelay		=	(_data select 8);
					_randomPos		=	(_data select 9);
					_SpawnOneTime	=	(_data select 10);
					_mapcenter		=	(_data select 11);
					_Map_Radius		=	(_data select 12);
					_random_count	=	(_data select 13);
					_Coords			=	[(_data select 0), (_data select 1), (_data select 2)];
					if (_randomPos) then
						{_Coords	=	[_mapcenter, 100, _Map_Radius, 20, 0, 20, 0] call BIS_fnc_findSafePos;};
					sleep _SpawnDelay;
					if (Ultima_Diag_Level > 1) then
						{diag_log(format["[#Ultima]: [Ящики с лутом]: Создание ящика в координатах: %1", _Coords]);};
					_box = createVehicle [_Model, _Coords, [], 0, "CAN_COLLIDE"];
					_box setDir _Angle;
					_box setPos _Coords;
					_box setVariable ["ObjectID", _boxID, true];
					_box setVariable ["ObjectUID", _boxID, true];
					_box setVariable ["permaLoot",true];
					PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor, _box];		
					while {true} do
						{
							if (_SpawnItems) then
								{
									clearWeaponCargoGlobal _box;
									clearMagazineCargoGlobal _box;
									clearBackpackCargoGlobal _box;
									{
										_Percent	=	_x select 2;
										_Random		=	random(100);
										if (_Random < _Percent) then
											{
												if (_random_count) then
													{_Count		=	round(random(_x select 1));}
												else
													{_Count		=	(_x select 1);};
												if (_Count > 0) then
													{
														_Item		=	(_x select 0);
														if (getText (configFile >> "CfgMagazines" >> _item >> "displayName")	!=	"") then
															{_box addMagazineCargoGlobal [_Item, _Count];}
														else
															{
																if (getText (configFile >> "CfgWeapons" >> _item >> "displayName")	!=	"") then
																	{_box addWeaponCargoGlobal [_Item, _Count];}
																else
																	{
																		if (getText (configFile >> "CfgVehicles" >> _item >> "displayName")	!=	"") then
																			{_box addBackpackCargoGlobal [_Item, _Count];};
																	};
															};
													};
											};
									} forEach _aSpawnItems;
									if (_SpawnOneTime) ExitWith {};
									_SpawnItems	=	false;
									sleep _TimerSpawn;
								};
							if (_SpawnOneTime) ExitWith {};
							while {!_SpawnItems} do
								{
									sleep 10;
									_nearPlayers	=	nearestObjects [_Coords, ["CAManBase"], _Radius];
									if (count(_nearPlayers) <= 0) then
										{_SpawnItems	=	true;};
								};
						};
				};
		} forEach _Data;
		if (Ultima_Diag_Level > 0) then
			{diag_log("[#Ultima]: [Ящики с лутом]: Создание ящиков с лутом завершено.");};
	};