startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];
dayZ_instance				=	11;		//	Инстанс. 11-Чернорусь.
dayzHiveRequest				=	[];
initialized					=	false;
dayz_previousID				=	0;
server_name					=	"NoNameUltima Server";
player setVariable ["BIS_noCoreConversations", true];
enableRadio false;
enableSentences false;
spawnShoremode		 		=	1;	 	//	Возрождение на берегу или нет - 1 на берегу. 0 - в любом месте.
spawnArea					=	1500; 	//	Зона возрождения игрока.
MaxHeliCrashes				=	5;		//	Максимум зон крушений вертолетов.
MaxVehicleLimit				=	100;	//	Максимум пораждаемой техники.
MaxDynamicDebris			=	10;		//	Максимум пораждаемых куч мусора.
MaxMineVeins				=	5;		//	Максимум порождаемых рудников.
MaxAmmoBoxes				=	1;		//	Максимум порождаемых ящиков с патронами.
dayz_MapArea				=	14000;	//	Площадь, возрождения транспорта, дропа и т.п.
dayz_maxLocalZombies		=	15; 	//	Максимум пораждаемых зомби, для одного игрока.
dayz_paraSpawn				=	false;	//	Возрождение игрока в небе с парашютом.
dayz_minpos					=	-1;		//	Координаты за пределами которых игрока сбросит на реконнект?
dayz_maxpos					=	16000;	//	Координаты за пределами которых игрока сбросит на реконнект?
dayz_sellDistance_vehicle	=	10;		//	Дистанция продажи наземной техники.
dayz_sellDistance_boat		=	30;		//	Дистанция продажи морской техники.
dayz_sellDistance_air		=	40;		//	Дистанция продажи воздушной техники.
dayz_maxAnimals				=	5;		//	Максимум животных порождаемых для одного игрока.
dayz_tameDogs				=	true;	//	Можно ли приручить животное?
DynamicVehicleDamageLow		=	60; 	//	Минимальный порог возможных повреждений техники при респе(0  - возможно респ целая)
DynamicVehicleDamageHigh	=	90; 	//	Максимальный порог возможных повреждений техники при респе(100 - полностью сломанная)
DZE_BuildingLimit			=	600;	//	Максимальное кол-во разрешенных построек, вокруг PlotPole(базы).
DZE_MissionLootTable		=	true; 	//	Своя конфигурация возрождения лута.
DZE_LootSpawnTimer			=	10;    	//	Таймер для спавна лута - не проверял.
DZE_BuildOnRoads			=	true;	//	Можно ли строить на дорогах. По умолчанию: нет.
DZE_HeliLift				=	true;	//	Можно ли поднимать машины в Chinook - вертушку.
DZE_PlayerZed				=	false;	//	Если игрок умер инфицированным, - возраждать в виде зомби. По умолчанию: да.
DZE_ConfigTrader			=	false;	//	Свои конфиги для торговцев(требуется переносить все файлы торговли из dayz_code)
DZE_StaticConstructionCount	=	2;		//	Кол-во анимаций-действий, при разборе и строительстве конструкций.
DZE_GodModeBase				=	false;	//	Объекты построенные игроками - базы, не уничтожаются.
DZE_ForceNameTagsInTrader	=	true; 	//	Отображать имена торговцев
DZE_selfTransfuse			=	false;	//	Самозаливка крови Эпохи
DZE_selfTransfuse_Values	=	[14000, 0.3, 10];	//	Настройка самозаливки крови Эпохи: Сколько крови, шанс заражения, снижение температуры? (в секундах)
EpochEvents					=	[["any","any","any","any",30,"crash_spawner"],["any","any","any","any",0,"crash_spawner"],["any","any","any","any",15,"supply_drop"]];
dayz_fullMoonNights			=	true;	//	Ночь с полной луной - светлая, или без луны - темная.
DZE_AntiHack				=	false;	//	Встроенный АнтиЧит
DZE_REsec					=	false;	//	Для встроенного АнтиЧита
DZE_Light					=	false;	//	Локальное освещение
DZE_ForceNameTags			=	false;	//	Принудительно отображать имена игроков.
DZE_R3F_WEIGHT				=	true;	//	Использовать перегрузку персонажа, если персонаж переносит большой вес

DZE_noRotate				=	[];		//	Массив объектов, неподлежащих повороту при строительстве

Ultima_Zombie_Reward		=	0;		//	Сколько баксов давать за убийство зомби
Ultima_Donators				=	[];		//	Донаторы
Ultima_Admins				=	[];		//Администрация и модераторы, исключаемые из скриптов телепорта и т.п.
Ultima_Low_Admins			=	[];
Ultima_SpawnMonitor			=	true;	//	Включить выбор спауна в картинках
Ultima_SpawnMonitor_Donator	=	false;	//	Выбор спауна в картинках, только для донаторов
Ultima_Spawn_Humanity		=	1000;	//	Кол-во хуманити(в плюс или минус, неободимое для выбора спавна).
Ultima_Diag_Level			=	1;		//	Уровень диагностики(вывод в RPT дополнительных сообщений из скриптов. От 0 до 2).
if	(Ultima_SpawnMonitor) then
	{dayz_spawnselection	=	1;};	//	Выбор возрождения в картинках
	
//	Цены в баксах за слиток серебра(курс валюты)
Ultima_Bax_Silver	=	0.02;
	
/*
0 = Предотвращает выпадение лута, из закрытой техники (булева величина)
1 = Гарантированных точек создания лута (целое число)
2 = Дополнительные точки лута (целое число)
3 = Радиус, от центра уничтоженной техники, в котором будет создан лут(целое число, или число с плавающей запятой)
4 = Шанс на уничтожение содержимого(от 0 до 1, 0 = Всегда все целое, 0.5 = 50% потерь, 1 = Всегда все уничтожено)
*/
DZE_crashLootConfig			=	[false,8,10,10,0.3];
	
call compile preprocessFileLineNumbers "fixes\init\variables.sqf";								//	Инициализация переменных (IMPORTANT: Must happen very early)
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";					//	Инициализация публичных событий
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "fixes\medical\setup_functions_med.sqf";					//	Клиентские медицинские функции
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "fixes\init\compiles.sqf";								//	Компиляция регулярных функций
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "server_traders.sqf";									//	Компиляция торговцев
progressLoadingScreen 1.0;
"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";
if (isServer) then
	{
		call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\dynamic_vehicle.sqf";
		_serverMonitor	=	[] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
		_nil 			=	[] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\mission.sqf";
	};
if (!isDedicated) then 
	{
		0 fadeSound 0;
		waitUntil {!isNil "dayz_loadScreenMsg"};
		dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
		[] ExecVM "custom\start_inventory.sqf";	//	Выбор стартового инвентаря для игроков, модераторов и донаторов
		_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];

		if (Ultima_SpawnMonitor) then
			{
				if (Ultima_SpawnMonitor_Donator) then
					{
						private ["_pUID"];
						_pUID	=	getPlayerUID player;
						if ((_pUID in Ultima_Donators) || (_pUID in Ultima_Admins) || (_pUID in Ultima_Low_Admins)) then
							{_playerMonitor = 	[] execVM "fixes\system\player_monitor.sqf";}
						else
							{_playerMonitor = 	[] execVM "fixes\system\standart\player_monitor.sqf";};
					}
				else
					{_playerMonitor = 	[] execVM "fixes\system\player_monitor.sqf";};
			}
		else
			{_playerMonitor = 	[] execVM "fixes\system\standart\player_monitor.sqf";};
		if (DZE_AntiHack)	then
			{[] execVM "fixes\system\antihack.sqf";};
		if (DZE_Light) then
			{[false,12] execVM "\z\addons\dayz_code\compile\local_lights_init.sqf";};
		
		["custom\elevator"] execVM "custom\elevator\elevator_init.sqf";
	};
if (DZE_AntiHack) then
	{
		#include "\z\addons\dayz_code\system\REsec.sqf"
	};
//	Динамическая погода
execVM "\z\addons\dayz_code\external\DynamicWeatherEffects.sqf";

#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"

 [] execVM "custom\custom.sqf";
 execVM "R3F_ARTY_AND_LOG\init.sqf";