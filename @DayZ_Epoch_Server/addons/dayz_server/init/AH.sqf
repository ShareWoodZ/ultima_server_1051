private['_dstring','_cconfig','_OpenMenuKey','_LAdmins','_NAdmins','_SAdmins','_BLOCKED','_TopOfESC','_LowerTop','_LowerBottom','_EscColor',
'_BottomDebug','_ODK','_DMS','_DMW','_MEH','_UAB','_BKK','_VON','_ARF','_BHF','_UVC','_UVW','_VTC','_UIC','_UCC','_UFS','_UAT','_UCS','_UDC',
'_RAI','_CHB','_MCC','_CUD','_RCK','_CCM','_BCM','_CSA','_FTG','_ALLOWED_Dialogs','_ForbiddenWeapons','_ALLOWED_Vehicles','_FORBIDDEN_Vehicles','_cMenu','_dayzActions'];
#include "AHconfig.sqf"
if (!isNil "infiSTAR_LoadStatus1") exitWith {diag_log ("[АнтиЧит]: АнтиЧит уже запущен!");};
infiSTAR_LoadStatus1 = true;
diag_log ("[АнтиЧит]: Ожидание функции bis_fnc_init...");
waitUntil {!isNil "bis_fnc_init"};
if (!isNil "infiSTAR_LoadStatus2") exitWith {diag_log ("[АнтиЧит]: АнтиЧит уже запущен!");};
infiSTAR_LoadStatus2 = true;
diag_log ("[АнтиЧит]: инициализация bis_fnc_init завершена. АнтиЧит запускается...!");

_dstring = 'vk.com/dayz_ultima';_cconfig = false;
if (isNil '_OpenMenuKey') then {_OpenMenuKey = 0x3C;_cconfig=true;};
if (isNil '_LAdmins') then {_LAdmins = [];_cconfig=true;};
if (isNil '_NAdmins') then {_NAdmins = [];_cconfig=true;};
if (isNil '_SAdmins') then {_SAdmins = [];_cconfig=true;};
if (isNil '_BLOCKED') then {_BLOCKED = [];_cconfig=true;};
if (isNil '_TopOfESC') then {_TopOfESC = _dstring;_cconfig=true;};
if (isNil '_LowerTop') then {_LowerTop = _dstring;_cconfig=true;};
if (isNil '_LowerBottom') then {_LowerBottom = _dstring;_cconfig=true;};
if (isNil '_EscColor') then {_EscColor = [0.6,0,0,1];_cconfig=true;};
if (isNil '_BottomDebug') then {_BottomDebug = _dstring;_cconfig=true;};
if (isNil '_ODK') then {_ODK = 0xCF;_cconfig=true;};
if (isNil '_DMS') then {_DMS = true;_cconfig=true;};
if (isNil '_DMW') then {_DMW = false;_cconfig=true;};
if (isNil '_MEH') then {_MEH = true;_cconfig=true;};
if (isNil '_UAB') then {_UAB = true;_cconfig=true;};
if (isNil '_BKK') then {_BKK = true;_cconfig=true;};
if (isNil '_VON') then {_VON = true;_cconfig=true;};
if (isNil '_ARF') then {_ARF = true;_cconfig=true;};
if (isNil '_BHF') then {_BHF = true;_cconfig=true;};
if (isNil '_UVC') then {_UVC = false;_cconfig=true;};
if (isNil '_UVW') then {_UVW = false;_cconfig=true;};
if (isNil '_VTC') then {_VTC = true;_cconfig=true;};
if (isNil '_UIC') then {_UIC = true;_cconfig=true;};
if (isNil '_UCC') then {_UCC = false;_cconfig=true;};
if (isNil '_UFS') then {_UFS = true;_cconfig=true;};
if (isNil '_UAT') then {_UAT = true;_cconfig=true;};
if (isNil '_UCS') then {_UCS = true;_cconfig=true;};
if (isNil '_UDC') then {_UDC = true;_cconfig=true;};
if (isNil '_RAI') then {_RAI = true;_cconfig=true;};
if (isNil '_CHB') then {_CHB = true;_cconfig=true;};
if (isNil '_MCC') then {_MCC = 650;_cconfig=true;};
if (isNil '_CUD') then {_CUD = true;_cconfig=true;};
if (isNil '_RCK') then {_RCK = true;_cconfig=true;};
if (isNil '_CCM') then {_CCM = false;_cconfig=true;};
if (isNil '_BCM') then {_BCM = false;_cconfig=true;};
if (isNil '_CSA') then {_CSA = false;_cconfig=true;};
if (isNil '_FTG') then {_FTG = 25;_cconfig=true;};
if (isNil '_ALLOWED_Dialogs') then {_ALLOWED_Dialogs = [-1,106,6900,6901,6902,6903,420420,41144];_cconfig=true;};
if (isNil '_ForbiddenWeapons') then {_ForbiddenWeapons = [''];_cconfig=true;};
if (isNil '_ALLOWED_Vehicles') then {_ALLOWED_Vehicles = [''];_cconfig=true;};
if (isNil '_FORBIDDEN_Vehicles') then {_FORBIDDEN_Vehicles = [''];_cconfig=true;};
if (isNil '_cMenu') then {_cMenu = [''];_cconfig=true;};
if (isNil '_dayzActions') then {_dayzActions = [];_cconfig=true;};
if (_cconfig) then {diag_log ("[АнтиЧит]: В Вашем файле AHconfig.sqf отсутствуют переменные!");};

if ((preProcessFileLineNumbers ("low_admins.sqf")) != "") then {
	_tmpLA = call compile preProcessFileLineNumbers "low_admins.sqf";
	_LAdmins = _LAdmins + _tmpLA;
};
if ((preProcessFileLineNumbers ("normal_admins.sqf")) != "") then {
	_tmpNA = call compile preProcessFileLineNumbers "normal_admins.sqf";
	_NAdmins = _NAdmins + _tmpNA;
};
if ((preProcessFileLineNumbers ("super_admins.sqf")) != "") then {
	_tmpSA = call compile preProcessFileLineNumbers "super_admins.sqf";
	_SAdmins = _SAdmins + _tmpSA;
};
if ((preProcessFileLineNumbers ("blacklist.sqf")) != "") then {
	_tmpBL = call compile preProcessFileLineNumbers "blacklist.sqf";
	_BLOCKED = _BLOCKED + _tmpBL;
};
iproductVersion = '19072014IAHAT332E';
diag_log format['[АнтиЧит]: Версия: %1 | Версия сервера: %2 | Карта: %3 | Инстанс: %4 | Миссия: %5',iproductVersion,productVersion,worldName,dayz_instance,missionName];
_version = productVersion select 3;
if (_version < 103718) then
{
	diag_log format['[АнтиЧит]: Устаревший сервер Arma2OA бета! (%1)',_version];
};
_fnc_RandomGen =
{
	_arr = ["B","K","w","q","s","Q","c","N","t","Q","U","G","g","B","T","U","v","C","i","G","f","u","C","G","i","w","X","I","0","R"];
	_gen = "PV_";
	for "_i" from 1 to 7 do {_gen = _gen + (_arr select (random ((count _arr)-1)));};
	_gen
};diag_log format['[АнтиЧит]: _fnc_RandomGen: %1',_fnc_RandomGen];
_randvar1 = call _fnc_RandomGen;diag_log format['[АнтиЧит]: _randvar1: %1',_randvar1];
_randvar2 = call _fnc_RandomGen;diag_log format['[АнтиЧит]: _randvar2: %1',_randvar2];
_randvar3 = call _fnc_RandomGen;diag_log format['[АнтиЧит]: _randvar3: %1',_randvar3];
_randvar4 = call _fnc_RandomGen;diag_log format['[АнтиЧит]: _randvar4: %1',_randvar4];
_randvar5 = call _fnc_RandomGen;diag_log format['[АнтиЧит]: _randvar5: %1',_randvar5];
_randvar6 = call _fnc_RandomGen;diag_log format['[АнтиЧит]: _randvar6: %1',_randvar6];
_randvar13 = call _fnc_RandomGen;diag_log format['[АнтиЧит]: _randvar13: %1',_randvar13];
_randvar19 = call _fnc_RandomGen;diag_log format['[АнтиЧит]: _randvar19: %1',_randvar19];
_randvar26 = call _fnc_RandomGen;diag_log format['[АнтиЧит]: _randvar26: %1',_randvar26];
_randvar27 = call _fnc_RandomGen;diag_log format['[АнтиЧит]: _randvar27: %1',_randvar27];
_randvar27a = call _fnc_RandomGen;diag_log format['[АнтиЧит]: _randvar27a: %1',_randvar27a];
_randvar28 = call _fnc_RandomGen;diag_log format['[АнтиЧит]: _randvar28: %1',_randvar28];
_randvar10 = call {
	_arr = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
	_gen = 'PVAHR_0_';
	for '_i' from 1 to 12 do {_gen = _gen + (_arr select (random ((count _arr)-1)));};
	_gen
};
BattleFieldClearance = 'STR';publicVariable 'BattleFieldClearance';
loadFile = 'STR';publicVariable 'loadFile';
rcallVarcode = 'STR';publicVariable 'rcallVarcode';
addTeamMember = 'STR';publicVariable 'addTeamMember';
removeTeamMember = 'STR';publicVariable 'removeTeamMember';
saveStatus = 'STR';publicVariable 'saveStatus';
loadStatus = 'STR';publicVariable 'loadStatus';
saveVar = 'STR';publicVariable 'saveVar';
createTeam = 'STR';publicVariable 'createTeam';
BIS_MPF_logic = 'STR';publicVariable 'BIS_MPF_logic';
BIS_MPF_dummygroup = 'STR';publicVariable 'BIS_MPF_dummygroup';
_mPos = getMarkerPos 'respawn_west';
_LoadTest = [];if (_UCC) then {_Loaded = [-1,4,21,24,34,141,142,157,158,159,160,161,162,163,164,165,
166,167,168,169,170,171,172,173,174,175,183,184,185,191,194,195,196,199,215,216,217,218,219,228,229,
230,232,233,240,241,243,244,264,265,274,320,321,324,326,328,329,330,333,334,335,336,337,342,343,344,
345,346,347,348,349,350,351,352,353,354,355,356,358,364,365,497,500,501,503,507,618];
for '_i' from 0 to (count configFile)-1 do {
	if !(_i in _Loaded) then
	{
		_cfg = configFile select _i;
		if(isClass _cfg) then
		{
			_cname = configName _cfg;
			_cfg = configFile >> _cname >> 'controls';
			if(isClass _cfg) then
			{
				_Load = toArray(str(getText(configFile >> _cname >> 'onLoad')));
				_Unload = toArray(str(getText(configFile >> _cname >> 'onUnload')));
				_LoadTest = _LoadTest + [[_cname,_Load,_Unload,_i]];
			};
		};
	};
};};
_CE1 = toArray (getText(configFile >> 'RscDisplayDSinterface' >> 'onLoad'));
_CE2 = toArray (getText(configFile >> 'RscDisplayOptionsVideo' >> 'onLoad'));
_CE3 = toArray (getText(configFile >> 'RscDisplayOptionsVideo' >> 'onUnload'));
_CE4 = toArray (getText(configFile >> 'RscDisplayGear' >> 'onLoad'));
_CE5 = toArray (getText(configFile >> 'RscDisplayInterrupt' >> 'onLoad'));
_CE6 = toArray (getText(configFile >> 'RscDisplayInterrupt' >> 'onUnload'));
_CE7 = toArray (getText(configFile >> 'RscDisplayProfileController' >> 'onLoad'));
_CE8 = toArray (getText(configFile >> 'RscDisplayInterruptEditorPreview' >> 'onLoad'));
_CE9 = toArray (getText(configFile >> 'RscDisplayInterruptEditorPreview' >> 'onUnload'));
_CE10 = toArray (getText(configFile >> 'RscDisplayMPInterrupt' >> 'onLoad'));
_CE11 = toArray (getText(configFile >> 'RscDisplayMPInterrupt' >> 'onUnload'));
_CE12 = toArray (getText(configFile >> 'RscDisplayClientGetReady' >> 'onLoad'));
_CE13 = toArray (getText(configFile >> 'RscDisplayServerGetReady' >> 'onLoad'));
_CE14 = toArray (getText(configFile >> 'RscDisplayOptionsVideo' >> 'controls' >> 'G_VideoOptionsControls' >> 'controls' >> 'HideAdvanced' >> 'OnButtonClick'));
if (isNil 'PV_hackerL0og') then {PV_hackerL0og = [[]];};if (isNil 'PV_SurveillanceLog') then {PV_SurveillanceLog = [[]];};
if (isNil 'infiSTAR_DLL_PATH') then {infiSTAR_DLL_PATH = '';} else {if (typeName infiSTAR_DLL_PATH != 'STRING') then {infiSTAR_DLL_PATH = '';};};
diag_log format['[АнтиЧит]: infiSTAR_DLL_PATH: %1',infiSTAR_DLL_PATH];
DAYZ_INSTANCE_LOGGING = format['   |Instance: %1 - %2 - %3%4%5',dayZ_instance,iproductVersion,productVersion select 1,productVersion select 2,productVersion select 3];
_PV_DevUIDs = ['0","0'];PV_DevUIDs = _PV_DevUIDs;comment 'infiSTAR UID(s)';
_SAdmins= _PV_DevUIDs + _SAdmins;
_allAdmins = _LAdmins + _NAdmins + _SAdmins;
call compile ("
fnc_infiSTAR_PlayerLog =
{
	_puid = _this select 0;_name = _this select 1;
	if ((_puid == '') && (_name == '__NoNameUltima__')) exitWith {};
	
	if (isNil 'PV_filluLog_arr') then {PV_filluLog_arr = [];};
	if (!(_puid in PV_filluLog_arr) || !(_name in PV_filluLog_arr)) then
	{
		_running = 'ID1010';
		_stime = 0;
		if(serverTime > 36000)then{_stime = time;}else{_stime = serverTime;};
		_hours = (_stime/60/60);
		_hours = toArray (str _hours);
		_hours resize 1;
		_hours = toString _hours;
		_hours = compile _hours;
		_hours = call  _hours;
		_minutes = floor(_stime/60);
		_minutes2 = ((_minutes - (_hours*60)) min 60) max 0;if (_minutes2 < 10) then {_minutes2 = format ['0%1',_minutes2];};
		if (_puid in PV_DevUIDs) exitWith {};
		if (_puid in ("+(str _allAdmins)+")) then
		{
			_time = format ['%1ч %2мин | ******Администратор******',_hours,_minutes2];
			PV_filluLog_arr = PV_filluLog_arr + [_time,_puid,_name];
			diag_log format['[АнтиЧит]: [Журнал игроков]: %1(%2) - %3',_name,_puid,_time];
		}
		else
		{
			_time = format ['%1ч %2мин',_hours,_minutes2];
			PV_filluLog_arr = PV_filluLog_arr + [_time,_puid,_name];
			diag_log format['[АнтиЧит]: Журнал игроков: %1(%2) - %3',_name,_puid,_time];
		};
		PlayerLogneedsUpdate = true;
	};
	
	if (count _this > 2) then
	{
		_x = _this select 2;
		_xuid = getPlayerUID _x;
		if (_xuid != '') then
		{
			_rc = _x getVariable ['"+_randvar3+"RC','NONE'];
			if (_rc == 'RC') then
			{
				[_xuid,_name,_x] spawn fnc_infiSTAR_Serverkick;
				"+_randvar10+" = [_name,_xuid,'АнтиЧит не запущен (вышло время проверки)!','',''];
				publicVariableServer '"+_randvar10+"';
			};
			if (!isNull _x) then
			{
				_humanity = 0;_humanity = _x getVariable['humanity',0];
				if ((_humanity > 1000000) || (_humanity < -1000000)) then
				{
					_log = format['Репутация: %1! (возможно чит)',_humanity];
					"+_randvar10+" = [_name, _xuid, _log,'',''];
					publicVariableServer '"+_randvar10+"';
					
					if (_humanity > 1000000) then
					{
						_x setVariable['humanity',500000,true];
					};
					if (_humanity < -1000000) then
					{
						_x setVariable['humanity',-500000,true];
					};
				};
				_uid = _x getVariable ['"+_randvar3+"','NONE'];
				if !(_uid in ['NONE',_xuid]) then
				{
					_log = format ['ClientUID не совпадает с ServerUID (%1/%2)',_uid,_xuid];
					"+_randvar10+" = [format['ID_SPOOFER__%1',_name], _xuid, toArray (_log), toArray ('BANNED')];
					if (_xuid in ("+(str _allAdmins)+")) then
					{
						"+_randvar10+" = [format['ID_SPOOFER__%1',_name], _xuid, _log,'',''];
					};
					publicVariableServer '"+_randvar10+"';
				};
			};
		};
	};
	
	if (isNil 'PVAH_AHBANA') then {PVAH_AHBANA = [];} else {if (typeName PVAH_AHBANA != 'ARRAY') then {PVAH_AHBANA = [];};};
	if ((_puid in PVAH_AHBANA) || (_name in PVAH_AHBANA)) then
	{
		_array = [_puid,_name];
		if (count _this > 2) then
		{
			_array = [_puid,_name,_this select 2];
		};
		_array spawn fnc_infiSTAR_Serverkick;
	};
};
[] spawn {
	waitUntil {!isNil 'sm_done'};
	uiSleep 30;
	if (isNil 'o_object_handleServerKilled') then {o_object_handleServerKilled = object_handleServerKilled;};
	object_handleServerKilled =
	{
		private['_unit','_killer'];
		_unit = _this select 0;
		_killer = _this select 1;
		if (!isNull _unit) then
		{
			if (typeOf _unit == 'Plastic_Pole_EP1_DZ') then
			{
				_pos = getPosATL _unit;
				_nearGuys = [];
				{
					_puid = getPlayerUID _x;
					if (_puid != '') then
					{
						_log = format['%1 (%2)',name _x,_puid];
						_nearGuys = _nearGuys + [_log];
					};
				} forEach (_pos nearEntities ['AllVehicles',150]);
				_log = format['База @1 уничтожена игроком %2, вблизи: %3',mapGridPosition _pos,_killer,_nearGuys];
				"+_randvar10+" = ['SERVER','-',_log];
				publicVariableServer '"+_randvar10+"';
			};
		};
		_y = _this call o_object_handleServerKilled;
		_y
	};
	'PVDZE_obj_Publish' addPublicVariableEventHandler
	{
		private ['_array','_charID','_object','_worldspace','_class'];
		_array = (_this select 1);
		_charID = _array select 0;
		_object = _array select 1;
		_worldspace = _array select 2;
		_class = _array select 3;
		if (typeOf _unit == 'Plastic_Pole_EP1_DZ') then
		{
			_guy = '';
			_pos = _worldspace select 1;
			{
				_puid = getPlayerUID _x;
				if (_puid != '') then
				{
					_characterID = _x getVariable ['CharacterID','-3'];
					if (_characterID == _charID) then
					{
						_guy = format['%1(%2)',name _x,_puid];
					};
				};
			} forEach (_pos nearEntities ['AllVehicles',150]);
			if (_guy == '') then {_guy = 'Неизвестно';};
			
			_log = format['Установлена база в координатах: @1, игроком: %2',mapGridPosition _pos,_guy];
			"+_randvar10+" = ['SERVER','-',_log];
			publicVariableServer '"+_randvar10+"';
		};
		_y = _array call server_publishObj;
		_y
	};
	if ("+str _VTC+") then
	{
		'PVDZE_veh_Publish2' addPublicVariableEventHandler
		{
			_array = (_this select 1);
			_worldspace = _array select 1;
			_class = _array select 2;
			_activatingPlayer = _array select 5;
			_pos = _worldspace select 1;
			_txt = getText (configFile >> 'CfgVehicles' >> _class >> 'displayName');
			if (isNull _activatingPlayer || {!isPlayer _activatingPlayer}) exitWith {
				_log = format['[АнтиЧит]: Создана техника без валидного игрока: %1 (%2) | Позиция: %3',_class,_txt,_pos];
				diag_log _log;
			};
			_state = true;
			{
				if ((!isNull _x) && (alive _x) && (getPlayerUID _x == '') && !(_x isKindOf 'zZombie_Base') && !(_x isKindOf 'CAAnimalBase')) exitWith
				{
					_state = false;
				};
			} forEach ((_activatingPlayer nearEntities ['Man',25])+(_pos nearEntities ['Man',111]));
			if (_state) exitWith
			{
				_log = format['Покупка в отсутствии продавца (S): %1 (%2) | Позиция создания: %3 | Позиция игрока: %4',_txt,_class,_pos,getPosATL _activatingPlayer];
				"+_randvar10+" = [name _activatingPlayer,getPlayerUID _activatingPlayer, toArray (_log), toArray ('BANNED')];
				publicVariableServer '"+_randvar10+"';
			};
			_array spawn server_publishVeh2
		};
	};
	if (!isNil 'vehicle_handleDamage') then
	{
		if (isNil 'Bvehicle_handleDamage') then {Bvehicle_handleDamage = vehicle_handleDamage;};
		vehicle_handleDamage =
		{
			private['_unit','_damage'];
			_unit = _this select 0;
			_damage = _this select 2;
			_unit allowDamage false;
			if (_damage > 2) then {_damage = 0;};
			_unit allowDamage true;
			_y = _this call Bvehicle_handleDamage;
			_y
		};
	};
};
if ("+str _UDC+") then
{
	[] spawn {
		waitUntil {!isNil 'sm_done'};
		uiSleep 30;
		fnc_infiHIT"+_randvar5+" =
		{
			_victim = _this select 0;
			_attacker = _this select 1;
			_damage = _this select 2;
			_clientUID = getPlayerUID _attacker;
			_isMan = (vehicle _attacker) isKindOf 'Man';
			if ((_clientUID != '') && (_isMan)) then
			{
				_clientName = name _attacker;
				_weaponState = weaponState (vehicle _attacker);
				_type = typeOf _victim;
				_posV = getPosATL _victim;
				
				_state = false;
				{
					if ((_victim isKindOf _x) || (_type isKindOf _x)) exitWith
					{
						_state = true;
					};
				} forEach ['ModularItems','DZE_Housebase','Land_DZE_WoodDoorLocked_Base','CinderWallDoorLocked_DZ_Base',
				'VaultStorageLocked','Hedgehog_DZ','Sandbag1_DZ','Land_HBarrier1_DZ','Land_HBarrier3_DZ','Land_HBarrier5_DZ','M240Nest_DZ',
				'OutHouse_DZ','Wooden_shed_DZ','WoodShack_DZ','StorageShed_DZ','Generator_DZ','FuelPump_DZ','DesertCamoNet_DZ','ForestCamoNet_DZ','DesertLargeCamoNet_DZ',
				'ForestLargeCamoNet_DZ','SandNest_DZ','DeerStand_DZ','MetalPanel_DZ','WorkBench_DZ','LockboxStorageLocked','Land_DZE_GarageWoodDoor','Land_DZE_LargeWoodDoor',
				'Land_DZE_WoodDoor','Land_DZE_GarageWoodDoorLocked','Land_DZE_LargeWoodDoorLocked','Land_DZE_WoodDoorLocked','CinderWallDoor_DZ','CinderWallDoorLocked_DZ',
				'CinderWallDoorSmall_DZ','CinderWallDoorSmallLocked_DZ','GunRack_DZ','FireBarrel_DZ','WoodCrate_DZ','Scaffolding_DZ'];
				
				if ((_state) && (_damage > 5)) then
				{
					_log = format['Чит урона? #1: %1 нанес урон из %2 по %3 (%4) @%5 %6',_damage,_weaponState,_type,_victim,mapGridPosition _posV,_posV];
					"+_randvar10+" = [_clientName,_clientUID,toArray (_log), toArray ('BANNED')];
					publicVariableServer '"+_randvar10+"';
					[_clientUID,_clientName,_attacker] spawn fnc_infiSTAR_Serverkick;
				}
				else
				{
					if (_damage > 12000) then
					{
						_log = format['Чит урона? #2: %1 нанес урон из %2 по %3 (%4) @%5 %6',_damage,_weaponState,_type,_victim,mapGridPosition _posV,_posV];
						"+_randvar10+" = [_clientName,_clientUID,toArray (_log), toArray ('BANNED')];
						publicVariableServer '"+_randvar10+"';
						[_clientUID,_clientName,_attacker] spawn fnc_infiSTAR_Serverkick;
					}
					else
					{
						if ((_attacker isKindOf 'LandVehicle') || (_attacker isKindOf 'Air') || (_attacker isKindOf 'Ship')) then
						{
							if (_damage > 200) then
							{
								_log = format['Чит урона? #3: %1 нанес урон из %2 по %3 (%4) @%5 %6',_damage,_weaponState,_type,_victim,mapGridPosition _posV,_posV];
								"+_randvar10+" = [_clientName,_clientUID,_log,'',''];
								publicVariableServer '"+_randvar10+"';
								{if (!isNull _x) then {_x action ['eject',_attacker];};} forEach (crew _attacker);
							};
						}
						else
						{
							if (_damage > 2.5) then
							{
								_log = format['Чит урона? #4: %1 нанес урон из %2 по %3 (%4) @%5 %6',_damage,_weaponState,_type,_victim,mapGridPosition _posV,_posV];
								"+_randvar10+" = [_clientName,_clientUID,_log];
								publicVariableServer '"+_randvar10+"';
							};
						};
						if (_damage > 250) then
						{
							[_clientUID,_clientName,_attacker] spawn fnc_infiSTAR_Serverkick;
						};
					};
				};
			};
			true
		};
		if (isNil 'PVDZE_serverObjectMonitor') then {PVDZE_serverObjectMonitor = [];};
		if (isNil 'dayz_serverObjectMonitor') then {dayz_serverObjectMonitor = [];};
		_objects = PVDZE_serverObjectMonitor + dayz_serverObjectMonitor;
		{
			if (!isNull _x) then
			{
				_x removeAllEventHandlers 'Hit';
				_x addEventHandler ['Hit',{_this call fnc_infiHIT"+_randvar5+";}];
			};
		} forEach _objects;
		
		if (!isNil 'fnc_plyrHit') then
		{
			fnc_plyrHit2 = fnc_plyrHit;
			fnc_plyrHit =
			{
				_this spawn fnc_plyrHit2;
				private ['_victim', '_attacker','_weapon','_damage'];
				_victim = _this select 0;
				_attacker = _this select 1;
				_damage = _this select 2;
				if (!isPlayer _victim || !isPlayer _attacker) exitWith {};
				if ((owner _victim) == (owner _attacker)) exitWith {};
				_isMan = (vehicle _attacker) isKindOf 'Man';
				if ((_damage > 250) && (_isMan)) then
				{
					_attacker = (_this select 1);
					_weapon = weaponState (vehicle _attacker);				
					_clientUID = format['%1',getPlayerUID _attacker];
					_clientName = format['%1',name _attacker];
					_log = format['Чит урона? #5: %1 нанес урон из %2 по %3 @%4',_damage,_weapon,_victim,getPosATL _victim];
					"+_randvar10+" = [_clientName,_clientUID,toArray (_log), toArray ('BANNED')];
					publicVariableServer '"+_randvar10+"';
					[_clientUID,_clientName,_attacker] spawn fnc_infiSTAR_Serverkick;
				};
			};
		};
	};
};
[] spawn {
	"+_randvar28+" = false;
	publicVariable '"+_randvar28+"';
	"+_randvar26+" = true;
	PM_FSM_DONE_QUED = true;
	_one = (""if (isNil 'PM_FSM_DONE_QUED') then
	{
		PM_FSM_DONE_QUED = true;
		[] spawn {
			uiSleep 300;
			PM_FSM_DONE = true;
		};
	};
	if (isNil '"+_randvar26+"') then
	{
		[] spawn {
			_puid = getPlayerUID player;
			if (_puid != '') then
			{
				if ((!isNil 'dayz_animalCheck') || (!isNil 'dayz_medicalH') || (!isNil 'dayz_slowCheck') || (!isNil 'PM_FSM_DONE')) then
				{
					if (isNil '"+_randvar26+"') then
					{
						uiSleep 45;
						if (isNil '"+_randvar26+"') then
						{
							player setVariable ['"+_randvar3+"RC','RC',true];
							disableUserInput true;disableUserInput true;disableUserInput true;
						};
					};
				};
			};
		};
	};"");
	_two = (""if !(isServer) then
	{
		"+_randvar2+" =
		{
			[] spawn {
				uiSleep 0.1;
				for '_r' from 0 to 101 do {(findDisplay _r) closeDisplay 0;};
			};
		};
		[] spawn {
			_puid = getPlayerUID player;
			if (_puid != '') then
			{
				if ((!isNil 'dayz_animalCheck') || (!isNil 'dayz_medicalH') || (!isNil 'dayz_slowCheck') || (!isNil 'PM_FSM_DONE')) then
				{
					if (isNil 'PV_DevUIDs') then
					{
						uiSleep 45;
						if (isNil 'PV_DevUIDs') then
						{
							if (isNil 'BIS_fnc_AAN') then
							{
								[] spawn "+_randvar2+";
								"+_randvar10+" = [dayz_playerName,_puid,'АнтиЧит не запущен (отсутствуют переменные)!','',''];
								publicVariableServer '"+_randvar10+"';
							};
							if (str BIS_fnc_AAN != '{}') then
							{
								[] spawn "+_randvar2+";
								"+_randvar10+" = [dayz_playerName,_puid,'АнтиЧит не запущен (не загружены функции)!','',''];
								publicVariableServer '"+_randvar10+"';
							};
						};
					};
				};
			};
		};
		if (isNil 'FNC_CHECK"+_randvar5+"') then
		{
			[] spawn {
				{
					[_x] spawn {
						_x = _this select 0;
						waitUntil {!(isNil _x)};
						[] spawn "+_randvar2+";
						_log = format['Сломаны игровые функции: %1',_x];
						_name = format['%1',dayz_playerName];
						_puid = format['%1',getPlayerUID player];
						if ((_puid == '') && (!isNil 'dayz_playerUID')) then
						{
							_puid = dayz_playerUID;
						};
						"+_randvar10+" = [_name,_puid, toArray (_log), toArray ('BANNED')];
						publicVariableServer '"+_randvar10+"';
					};
				} forEach ['typeName','lbClear','closedialog','startloadingscreen','endLoadingScreen','findDisplay','setposATL','getPos','to',
				'closeDisplay','getPlayerUID','publicVariableServer','setPos','toArray','setposASL','getPosASL','driver',
				'endMission','str','isNil','diag_log','format','removeMagazines','getPosATL','from','ctrlEnabled','uiNameSpace',
				'removeMagazine','failMission','diag_ticktime','setGroupIconsVisible','groupIconsVisible','publicvariable',
				'profileNamespace','for','displayRemoveAllEventHandlers','ctrlRemoveAllEventHandlers','removeWeapon',
				'&&','||','removeAction','in','spawn','do','displayCtrl','player','select','saveProfileNamespace',
				'exitWith','or','and','visibleMap','uiSleep','alive','isNull','typeOf','distance','true','false','isDedicated',
				'unitRecoilCoefficient','call','setunitRecoilCoefficient','waitUntil','speed','while','if','isServer',
				'then','primaryWeapon','unitBackpack','magazines','weapons','getMagazineCargo','getWeaponCargo','isPlayer',
				'dialog','disableSerialization','count','ctrlSetText','ctrlText','systemChat','commandingMenu','showCommandingMenu',
				'disableUserInput','time','local','forEach','nearEntities','round','onEachFrame'];
			};
			FNC_CHECK"+_randvar5+" = true;
		};
		[] spawn {
			{
				if !(isNil _x) then 
				{
					[] spawn "+_randvar2+";
					_log = format['Плохая переменная: %1',_x];
					"+_randvar10+" = [format['%1',name player],format['%1',getPlayerUID player], toArray (_log), toArray ('BANNED')];
					publicVariableServer '"+_randvar10+"';
				};
			} forEach ['lel','PSwap','toLower_new','BCast','thfile','tlmadminrq','infiSTARBLACK','name','carepkg','scrollAim','BlurExec','quake','menu_run','ZedProtect','actid1','vehicles1','MapClicked',
			'MapClickedPosX','MouseUpEvent','scrollPlayerlist','keypress_xxx','envi','G_A_N_G_S_T_A','ZoombiesCar','timebypass','returnString_z','isori','tangrowth27','PVAH_AdminRequest','AH_OFF_LOL',
			'infiSTAR_fillRE','qwak','infoe','font','title_dialog','sexymenu_adds_Star','boolean_1','initre337','skype_option','bleh','magnetomortal','fnc_allunits','PV_IAdminMenuCode','PVAH_WriteLogRequest',
			'skype_img','Lhacks','PVAHR_0_000000','Lpic','LtToTheRacker','Lexstr','take1','Called','epochExec','sdgff4535hfgvcxghn','adadawer24_1337','fsdddInfectLOL','W_O_O_K_I_E_ANTI_ANTI_HAX','W_O_O_K_I_E_Car_RE',
			'kW_O_O_K_I_E_Go_Fast','epchDeleted','lystobindkeys','lystoKeypress','toggle_1','shiftMenu','dbClicked','b_loop','re_loop','v_bowen','bowen','melee_startAttack','asdasdasd','antihax2','PV_AdminMenuCode',
			'AdminLoadOK','AdminLoadOKAY','PV_TMPBAN','T_o_g_g_l_e_BB','fixMenu','PV_AdminMenuCodee','AdminPlayer','PVAH_AdminRequestVariable','epochBackpack','JME_Red','JME_MENU_Sub','JME_menu_title','JME_Sub','JME_OPTIONS',
			'god','heal','grass','fatguybeingchasedbyalion','night','day','infammo','nvg','thermal','Keybinds'];
		};
		[] spawn "+_randvar19+";
		[] execVM 'ca\Modules\Functions\init.sqf';
	};"");
	while {1 == 1} do
	{
		_unit = createAgent ['Rabbit', [random 9000,random 9000,0], [], 0, 'FORM'];
		if (!isNil '"+_randvar6+"') then {if (!isNull "+_randvar6+") then {deleteVehicle "+_randvar6+";};};
		"+_randvar6+" = _unit;
		_unit setVehicleInit _one;
		_unit setVehicleInit _two;
		call compile 'processInitCommands;';
		_unit removeAllEventHandlers 'handleDamage';
		_unit addEventHandler ['handleDamage', { false }];
		_unit allowDamage false;
		uiSleep 10;
		{
			if (!isNull _x) then
			{
				_puid = getPlayerUID _x;
				if (_puid != '') then
				{
					_name = name _x;
					[_puid,_name,_x] call fnc_infiSTAR_PlayerLog;
				};
			};
		} forEach playableUnits;
		uiSleep 10;
		if (isNil 'PlayerLogneedsUpdate') then {PlayerLogneedsUpdate = true;};
		if (PlayerLogneedsUpdate) then {publicVariable 'PV_filluLog_arr';PlayerLogneedsUpdate = false;};
	};
};
[] spawn {
	BIS_MPF_remoteExecutionServer = {
		private ['_tmpRES','_array','_input','_inputPersistentFnc','_codePersistent','_this'];
		_tmpRES = compile preprocessFile ('\ca\Modules\MP\data\scripts\remExServer.sqf');
		_array = _this select 1;
		_input = _array select 2;
		if (_input in ['switchmove','playmove','say','jipexec','execVM','spawn','titleText','hint','globalChat','setObjectTexture']) exitWith
		{
			_this call _tmpRES;
		};
		if (_input in ['loc','locper','perloc','per']) exitWith
		{
			_inputPersistentFnc = _array select 3;
			if (_inputPersistentFnc == 'hideObject') exitWith
			{
				_obj = _array select 1;
				if ((!isNull _obj) && !(isPlayer _obj)) exitWith
				{
					_this call _tmpRES;
				};
			};
			if (_inputPersistentFnc == 'titleText') exitWith
			{
				_this call _tmpRES;
			};
			if (count _array > 3) then
			{
				_codePersistent = _array select 4;
				if ((_inputPersistentFnc == 'JIPexec') && (typeName _codePersistent == 'ARRAY')) exitWith
				{
					if (_codePersistent select 3 == 'execVM') exitWith {_this call _tmpRES;};
				};
				if ((_inputPersistentFnc == 'execVM') && (typeName _codePersistent == 'STRING')) exitWith
				{
					if (_codePersistent == 'ca\Modules\Functions\init.sqf') exitWith {_this call _tmpRES;};
				};
			};
		};
	};
	publicVariable 'BIS_MPF_remoteExecutionServer';
};
[] spawn {
	AdminLst = ("+(str _allAdmins)+");
	_tALST = str AdminLst;
	_instance = dayZ_instance;
	BIS_MPF_ServerPersistentCallsArray = [[nil,nil,'per','execVM','ca\Modules\Functions\init.sqf']];
	_SPCA = BIS_MPF_ServerPersistentCallsArray;
	BIS_MPF_remoteExecutionServer = {
		if ((_this select 1) select 2 == 'JIPrequest') then
		{
			_playerObj = (_this select 1) select 0;			
			remExField = [nil, nil, format [';if !(isServer) then {[] execVM ''ca\Modules\Functions\init.sqf'';};']];
			(owner _playerObj) publicVariableClient 'remExField';
		};
	};
	_RESO = BIS_MPF_remoteExecutionServer;
	uiSleep 3;
	{
		if (!isNull _x) then
		{
			if (typeOf _x == 'FunctionsManager') then
			{
				_pos = [random 999999,random 999999,random 999999];
				_x setPosATL _pos;
			}
			else
			{
				deleteVehicle _x;
			};
		};
	} forEach (Entities 'Logic');
	uiSleep 3;
	BIS_MPF_ServerPersistentCallsArray = _SPCA;
	BIS_MPF_remoteExecutionServer = _RESO;
	_vehicleChecked = [];
	while {1 == 1} do
	{
		dze_diag_fps = {};
		_mPos = ("+str _mPos+");
		_debug = createMarker ['respawn_west',_mPos];
		'respawn_west' setMarkerPos _mPos;
		{
			if !(isNil _x) then 
			{
				_log = format['ФУНКЦИИ СЛОМАНЫ -[%1]- РЕСТАРТ СЕРВЕРА!',_x];
				"+_randvar10+" = [('УГРОЗА СЕРВЕРУ!'),_log,'','',''];
				publicVariableServer '"+_randvar10+"';
				[] spawn {call compile ('endMission ''END1'';');call compile ('forceEnd;');};
			};
		} forEach ['closeDisplay','processInitCommands','setVehicleInit','removeAllEventHandlers','addEventHandler','allowDamage','Entities','typeName',
		'forceEnd','allMissionObjects','playableUnits','vehicles','PVAH_AdminRequest','PVAH_WriteLogRequest','endMission','failMission','agents','isDedicated','isServer'];
		if ('infiSTAR' != ('i'+'n'+'f'+'i'+'S'+'T'+'A'+'R')) then {[] spawn {call compile ('endMission ''END1'';');call compile ('forceEnd;');};};
		if (str _instance != str dayZ_instance) then
		{
			dayZ_instance = _instance;
			_log = format['dayZ_instance изменен с %1 на %2',_instance,dayZ_instance];
			"+_randvar10+" = [('УГРОЗА СЕРВЕРУ!'),_log,'','',''];
			publicVariableServer '"+_randvar10+"';
		};
		if (str(AdminLst) != _tALST) then
		{
			call compile format['AdminLst = %1;',_tALST];
			"+_randvar10+" = [('УГРОЗА СЕРВЕРУ!'),'список админов изменен!','','',''];
			publicVariableServer '"+_randvar10+"';
		};
		if (str BIS_MPF_ServerPersistentCallsArray != str _SPCA) then
		{
			BIS_MPF_ServerPersistentCallsArray = _SPCA;
			_log = format['[АнтиЧит]: Содержимое сервера модифицировано: %1',_SPCA];
			diag_log _log;
		};
		if (str BIS_MPF_remoteExecutionServer != str _RESO) then
		{
			BIS_MPF_remoteExecutionServer = _RESO;
			_log = format['[АнтиЧит]: модифицирован remExServer: %1',_RESO];
			diag_log _log;
		};
		'remExField' addPublicVariableEventHandler {_this call BIS_MPF_remoteExecutionServer;};
		'remExFP' addPublicVariableEventHandler {_this call BIS_MPF_remoteExecutionServer;};
		_logicz = (Entities 'Logic');
		_fncMcnt = {typeOf _x == 'FunctionsManager'} count _logicz;
		if (_fncMcnt > 1) then
		{
			_log = 'Запущен удаленный скрипт - Завершение миссии! #1';
			"+_randvar10+" = [('УГРОЗА СЕРВЕРУ!'), (_log),'','',''];
			publicVariableServer '"+_randvar10+"';
			[] spawn {call compile ('endMission ''END1'';');call compile ('forceEnd;');};
		};
		{
			if (!isNull _x) then
			{
				if (typeOf _x == 'FunctionsManager') then
				{
					_fmg = group _x;
					if (!isNull _fmg) then
					{
						if (isNil 'fncManagerGroup"+_randvar5+"') then {fncManagerGroup"+_randvar5+" = _fmg;};
						if (str _fmg != str(fncManagerGroup"+_randvar5+")) then
						{
							_log = 'Запущен удаленный скрипт - Завершение миссии! #2';
							"+_randvar10+" = [('УГРОЗА СЕРВЕРУ!'), (_log),'','',''];
							publicVariableServer '"+_randvar10+"';
							[] spawn {call compile ('endMission ''END1'';');call compile ('forceEnd;');};
						};
						if (count (units fncManagerGroup"+_randvar5+") > 1) then
						{
							_log = 'Запущен удаленный скрипт - Завершение миссии! #3';
							"+_randvar10+" = [('УГРОЗА СЕРВЕРУ!'), (_log),'','',''];
							publicVariableServer '"+_randvar10+"';
							[] spawn {call compile ('endMission ''END1'';');call compile ('forceEnd;');};
						};
					};
				}
				else
				{
					deleteVehicle _x;
				};
			};
		} forEach _logicz;
		if ("+str _UVC+") then
		{
			{
				if (!isNull _x) then
				{
					if !(_x in _vehicleChecked) then
					{
						_vehicleChecked = _vehicleChecked + [_x];
						_type = typeOf _x;
						if ((!(_type in ("+str _ALLOWED_Vehicles+")) && ("+str _UVW+")) || (_type in ("+str _FORBIDDEN_Vehicles+"))) then
						{
							_posV = getPosATL _x;
							_crew = crew _x;
							
							_crewguys = [];
							if (count _crew > 0) then
							{
								{
									_puid = getPlayerUID _x;
									if (_puid != '') then
									{
										_crewguys = _crewguys + [format['%1 (%2)',name _x,_puid]];
									};
								} forEach _crew;
							};
							
							_nearGuys = [];
							{
								_puid = getPlayerUID _x;
								if (_puid != '') then
								{
									_log = format['%1 (%2)',name _x,_puid];
									if !(_log in _crewguys) then
									{
										_nearGuys = _nearGuys + [_log];
									};
								};
							} forEach (_posV nearEntities ['AllVehicles',150]);
							
							
							if (count _crew == 0) then
							{
								_log = format['Запрещенная техника: %1 (удалено) Вблизи: %2 @%3',_type,_nearGuys,mapGridPosition _posV];
								"+_randvar10+" = ['СЕРВЕР','-',_log,'',''];
								publicVariableServer '"+_randvar10+"';
							}
							else
							{
								{
									_puid = getPlayerUID _x;
									if ((_puid != '') && !(_puid in ("+(str _allAdmins)+"))) then
									{
										_log = format['Запрещенная техника: %1 @%2',_type,_posV];
										"+_randvar10+" = [name _x,_puid, toArray (_log), toArray ('BANNED')];
										publicVariableServer '"+_randvar10+"';
										[_puid,name _x,_x] spawn fnc_infiSTAR_Serverkick;
									};
								} forEach _crew;
							};
							_obj = _x;
							_obj setDamage 5;
							if (!isNull _obj) then
							{
								_objectID 	= _obj getVariable['ObjectID','0'];
								_objectUID	= _obj getVariable['ObjectUID','0'];
								deleteVehicle _obj;
								[_objectID,_objectUID,'АнтиЧит - Проверка техники'] call server_deleteObj;
							};
						};
					};
				};
			} forEach ([0,0,0] nearEntities [['LandVehicle','Air','Ship'], 10000000]);
			uiSleep 2;
		};
		uiSleep 3;
	};
};
"+_randvar1+" = {
	_puid = _this select 0;_name = _this select 1;
	"+_randvar27a+" = true;
	diag_log (format['[АнтиЧит]: randvar1 создал randvar27a (%1)',time]);
	[] spawn {
		_version = productVersion select 3;
		if (_version < 103718) then
		{
			uiSleep 3;
			_log1 = format['Не правильная версия: %1!',_version];
			hint _log1;
			cutText [_log1,'PLAIN DOWN'];
			uiSleep 5;
			[] spawn "+_randvar2+";
			_log2 = format['Не правильная версия: %1 (должна быть обновлена arma2oa beta - отсоединение)',_version];
			"+_randvar10+" = [name player,getPlayerUID player,_log2];
			publicVariableServer '"+_randvar10+"';
		};
	};
	if !(_puid in ("+(str _allAdmins)+")) then
	{
		[_puid,_name] spawn {
			_puid = _this select 0;
			_name = _this select 1;
			_mPos = ("+str _mPos+");
			_zombieCheck = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_zombieCheck.sqf';
			_zombieAttack = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_zombieAttack.sqf';
			disableSerialization;
			while {1 == 1} do
			{
				if !("+str _UCS+") then
				{
					if ((ctrlEnabled ((uiNameSpace getVariable 'BIS_dynamicText') displayctrl 9999)) || (ctrlShown ((uiNameSpace getVariable 'BIS_dynamicText') displayctrl 9999))) then
					{
						[] spawn "+_randvar2+";
						"+_randvar10+" = [_name,_puid, toArray ('dynamicText'), toArray ('CHECK 1')];
						publicVariableServer '"+_randvar10+"';
					};
					if (str(uiNameSpace getVariable 'BIS_dynamicText') != 'No Display') then
					{
						[] spawn "+_randvar2+";
						"+_randvar10+" = [_name,_puid, toArray ('dynamicText'), toArray ('CHECK 2')];
						publicVariableServer '"+_randvar10+"';
					};
				};
				if (!isNil 'dayz_temperatur') then
				{
					if (dayz_temperatur > 42) then
					{
						dayz_temperatur = 37;
						uiSleep 2;
						if (dayz_temperatur > 42) then
						{
							[] spawn "+_randvar2+";
							_log = format['dayz_temperatur: %1',dayz_temperatur];
							"+_randvar10+" = [_name,_puid,toArray (_log),toArray ('BANNED')];
							publicVariableServer '"+_randvar10+"';
						};
					};
				};
				_BadSkins = ['Survivor1_DZ','GoInvisible'];
				_ptype = typeOf player;
				if (_ptype isKindOf 'CAAnimalBase') then
				{
					_ok = player getVariable ['AdminMorph','ok'];
					if (_ok == 'ok') then
					{
						[] spawn "+_randvar2+";
						_log = format['Не правильная одежда: %1 @%2',(typeOf player),getPosATL player];
						"+_randvar10+" = [_name,_puid,toArray (_log), toArray ('BANNED')];
						publicVariableServer '"+_randvar10+"';
					};
				};
				if ((_ptype in _BadSkins) && (player distance _mPos > 500)) then
				{
					[] spawn "+_randvar2+";
					_log = format['Не правильная одежда: %1 @%2',(typeOf player),getPosATL player];
					"+_randvar10+" = [_name,_puid,toArray (_log),toArray ('BANNED')];
					publicVariableServer '"+_randvar10+"';
				};
				
				{
					_ctrlID = _x;
					_control = ((uiNameSpace getVariable 'DAYZ_GUI_display') displayctrl _ctrlID);
					_txt = ctrlText _control;
					if ((_txt != '') && (ctrlShown _control)) then
					{
						_txtArr = toArray _txt;
						if !(46 in _txtArr) then
						{
							_control ctrlShow false;
							[] spawn "+_randvar2+";
							_log = format['Не правильное содержимое:   id %1   txt %2',_ctrlID,_txt];
							"+_randvar10+" = [_name,_puid,toArray (_log), toArray ('BANNED')];
							publicVariableServer '"+_randvar10+"';
						};
					};
				} forEach [1203,1204,1205,1206,1300,1301,1302,1303,1305,1306,1307];
				
				uiSleep 2;
				_pPos = getPosATL player;
				_noSafeZone = true;
				{
					if ((!isNull _x) && (alive _x) && (getPlayerUID _x == '') && !(_x isKindOf 'zZombie_Base') && !(_x isKindOf 'CAAnimalBase')) exitWith
					{
						_noSafeZone = false;
					};
				} forEach (_pPos nearEntities ['Man',250]);
				if (_noSafeZone) then
				{
					if (isNil 'player_zombieCheck') then
					{
						[] spawn "+_randvar2+";
						"+_randvar10+" = [_name,_puid,toArray ('сломана zombieCheck'),toArray ('BANNED')];
						publicVariableServer '"+_randvar10+"';
					}
					else
					{
						if (str player_zombieCheck != str _zombieCheck) then
						{
							[] spawn "+_randvar2+";
							"+_randvar10+" = [_name,_puid,'изменение zombieCheck','',''];
							publicVariableServer '"+_randvar10+"';
						};
					};
					if (isNil 'player_zombieAttack') then
					{
						[] spawn "+_randvar2+";
						"+_randvar10+" = [_name,_puid,toArray ('сломана zombieAttack'),toArray ('BANNED')];
						publicVariableServer '"+_randvar10+"';
					}
					else
					{
						if (str player_zombieAttack != str _zombieAttack) then
						{
							[] spawn "+_randvar2+";
							"+_randvar10+" = [_name,_puid,'изменение zombieAttack','',''];
							publicVariableServer '"+_randvar10+"';
						};
					};
				};
				if (!isNil 'PVDZE_veh_Publish2') then
				{
					_ap = PVDZE_veh_Publish2 select 5;
					_cUID = getPlayerUID _ap;
					_check = _cUID in ['',_puid];
					if (!_check) then
					{
						[] spawn "+_randvar2+";
						_log = format['Попытка подстановки %1(%2)',name _ap,_cUID];
						"+_randvar10+" = [_name,_puid,toArray (_log),toArray ('BANNED')];
						publicVariableServer '"+_randvar10+"';
					};
					if ("+str _VTC+") then
					{
						_cPos = (PVDZE_veh_Publish2 select 1) select 1;
						if (_noSafeZone) then
						{
							[] spawn "+_randvar2+";
							_log = format['Покупка в отсутствии продавца (C):   Позиция игрока: %1 %2 - Позиция техники: %3 %4 - %5',mapGridPosition _pPos,_pPos,mapGridPosition _cPos,_cPos,PVDZE_veh_Publish2];
							"+_randvar10+" = [_name,_puid,toArray (_log),toArray ('BANNED')];
							publicVariableServer '"+_randvar10+"';
						};
					};
				};
			};
		};
		[_name,_puid] spawn {
			_name = _this select 0;_puid = _this select 1;
			player_death"+_randvar5+" = player_death;
			player_weaponFiredNear"+_randvar5+" = player_weaponFiredNear;
			rdh"+_randvar5+" = compile preprocessFileLineNumbers 'fixes\compile\fn_damageHandler.sqf';
			fnc_STAR_damageHandler"+_randvar5+" =
			{
				_unit = _this select 0;
				_damage = _this select 2;
				_source = _this select 3;
				_pr__o_o__jectile = _this select 4;
				player allowDamage false;
				
				_checkdamage =
				{
					_damage = _this select 2;
					
					player allowDamage true;
					_state = true;
					if ((str fnc_usec_damageHandler == '{}') || (str fnc_usec_damageHandler != str rdh"+_randvar5+")) then
					{
						{
							if ((!isNull _x) && (alive _x) && (getPlayerUID _x == '') && !(_x isKindOf 'zZombie_Base') && !(_x isKindOf 'CAAnimalBase')) exitWith
							{
								_state = false;
							};
						} forEach (player nearEntities ['Man',300]);
						if (_state) then
						{
							fnc_usec_damageHandler = rdh"+_randvar5+";
						};
					};
					_this call fnc_usec_damageHandler;
					if ((str fnc_usec_damageHandler != '{}') || (_state)) then
					{
						if (isNil 'r_player_blood') then { r_player_blood = -500; } else { if (typeName r_player_blood != 'SCALAR') then { r_player_blood = -500; }; };
						if ((_damage > 0.4) && (player == vehicle player)) then
						{
							if (isNil 'DMG"+_randvar5+"') then
							{
								if (isNil 'r_player_blood') then { r_player_blood = -500; } else { if (typeName r_player_blood != 'SCALAR') then { r_player_blood = -500; }; };
								DMG"+_randvar5+" = true;
								if (r_player_blood == 12000) then
								{
									[] spawn {
										uiSleep 2;
										if (r_player_blood == 12000) then
										{
											_log = format['Отключена кровопотеря! %1',r_player_blood];
											"+_randvar10+" = [name player, getPlayerUID player,_log];
											publicVariableServer '"+_randvar10+"';
											[] spawn (compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_death.sqf');
											player setHit['Body',1];
										};
										DMG"+_randvar5+" = nil;
									};
								}
								else
								{
									[r_player_blood] spawn {
										_tempBlood = _this select 0;
										uiSleep 1;
										if (((r_player_blood == _tempBlood) || (r_player_blood > _tempBlood)) && (r_player_blood > 3000)) then
										{
											r_player_blood = r_player_blood - ((random 800) + (random 800) + 500);
										};
										DMG"+_randvar5+" = nil;
									};
								};
							};
						};
					};
				};
				if ((_damage < 1.5) && (_damage > 0.1)) then
				{
					if (_source != '') then
					{
						if (!isNull _source) then
						{
							_dist = _source distance player;
							if (_dist < 1000) then
							{
								_this call _checkdamage;
							};
						};
					};
				};
				if (_pr__o_o__jectile in ['DDOPP_B_Taser']) then
				{
					[] spawn {
						call compile ('
							fnc_usec_unconscious = compile preprocessFileLineNumbers ''\z\addons\dayz_code\compile\fn_unconscious.sqf'';
							r_player_timeout = 30;
							r_player_unconscious = true;
							player setVariable [''medForceUpdate'',true,true];
							player setVariable [''unconsciousTime'', r_player_timeout, true];
							player setVariable [''NORRN_unconscious'', true, true];
							player switchMove ''AmovPpneMrunSnonWnonDfr'';
						');
					};
				};				
				if (_pr__o_o__jectile in ['Bo_FAB_250','SmallSecondary','HelicopterExploBig','HelicopterExploSmall','Bo_GBU12_LGB','GyroGrenade','GrenadeHand','G_40mm_HE']) exitWith {};
				_isMan = true;
				if (getPlayerUID _source != '') then
				{
					_isMan = (vehicle _source) isKindOf 'Man';
				};
				if (((_damage > 99) && (_isMan)) || (_damage > 12000)) exitWith {};
				
				_exit = false;
				_sPUID = getPlayerUID _source;
				if (_sPUID != '') then
				{
					_sNAME = name _source;
					_dist = _source distance player;
					if ((_dist > 5000) && (_damage > 0.2)) then
					{
						_dist1 = player distance ("+str _mPos+");
						_dist2 = _source distance ("+str _mPos+");
						_exit = true;
						if ((_dist1 > 2500) && (_dist2 > 2500) && (_sPUID != '') && (getPlayerUID player != '') && (alive player) && (!deathHandled)) then
						{
							_weapon = currentWeapon (vehicle _source);
							_log = format['Урон %1(%2) @%3 с %4 (%5м) из оружия: %6 (%7 размер урона) %8',name player,getPlayerUID player,getPosATL player,getPosATL _source,_dist,_weapon,_damage,_pr__o_o__jectile];
							"+_randvar10+" = [_sNAME,_sPUID,_log,'',''];
							publicVariableServer '"+_randvar10+"';
						};
					};
				};
				if (_exit) exitWith {};
				
				_this call _checkdamage;
			};
			fnc_plyrHitLocal"+_randvar5+" =
			{
				private ['_victim', '_attacker','_weapon','_distance'];
				_victim = _this select 0;
				_attacker = _this select 1;
				if ((getPlayerUID _victim == '') || (getPlayerUID _attacker == '') || (getPlayerUID _victim == getPlayerUID _attacker)) exitWith {};
				_weapon = currentWeapon _attacker;
				_vehA = (vehicle _attacker);
				_vehAtype = typeOf _vehA; 
				if ((getText (configFile >> 'CfgVehicles' >> _vehAtype >> 'vehicleClass')) in ['CarW','Car','CarD','Armored','Ship','Support','Air','ArmouredW','ArmouredD','SupportWoodland_ACR']) then
				{
					_weapon = getText (configFile >> 'CfgVehicles' >> _vehAtype >> 'displayName');
				};
				_distance = _victim distance _attacker;
			};
			infi_fired"+_randvar5+" =
			{
				_cwep = _this select 1;
				_muzzle = _this select 4;
				_pr__o_o__jectile = _this select 6;
				if ((_muzzle isKindOf 'Melee') || (_muzzle isKindOf ('Bol'+'tSteel')) || (_muzzle isKindOf 'WoodenArrow') || (_muzzle isKindOf 'GrenadeHand') || (_muzzle isKindOf 'ThrownObjects') || (_muzzle isKindOf 'RoadFlare') || (_muzzle isKindOf 'ChemLight')) exitWith {};
				_cmag = currentMagazine player;
				_camm = player ammo _cwep;
				if (!(_cwep in ['','Throw','Flare','Put']) && !(_pr__o_o__jectile in ['','PipeBomb']) && (player == vehicle player)) then
				{
					_cfgmuzzle = getText(configFile >> 'CfgMagazines' >> _cmag >> 'ammo');
					if (_muzzle != _cfgmuzzle) then
					{
						player removeMagazines _cmag;
						player removeWeapon _cwep;
					};
					
					_maxAmmo = getNumber (configFile >> 'CfgMagazines' >> _cmag >> 'count');
					if (_maxAmmo > 1) then
					{
						[_maxAmmo,_cwep] spawn {
							uiSleep 0.2;
							_maxAmmo = _this select 0;
							_cwep = _this select 1;
							_cmag = currentMagazine player;
							_camm = player ammo _cwep;
							if (_camm == _maxAmmo) then
							{
								player removeMagazine _cmag;
								_log = format['Бесконечные патроны - Удаление текущего магазина: %1 %2 %3 %4',_cwep,_cmag,_camm,_maxAmmo];
								"+_randvar10+" = [name player,getPlayerUID player,_log];
								publicVariableServer '"+_randvar10+"';
							};
						};
					};
					
					_swep = '';
					{
						if ((getNumber (configFile >> 'CfgWeapons' >> _x >> 'Type')) == 2) exitWith
						{
							_swep = _x;
						};
					} forEach (weapons player);
					if (_cwep == _swep) then
					{
						_spd = speed _pr__o_o__jectile;
						if (_spd >= 1800) then
						{
							player removeMagazines _cmag;
							player removeWeapon _cwep;
						};
					};
					_target = cursorTarget;
					if (!isNull _target) then
					{
						if (_pr__o_o__jectile in ['DDOPP_B_Taser']) then
						{
							if (player distance _target < 200) then
							{
								if ((_target isKindOf 'zZombie_Base') && !(isPlayer _target)) then
								{
									_target setDamage 5;
								};
								if (!(_target isKindOf 'Bicycle') && ((_target isKindOf 'LandVehicle') || (_target isKindOf 'Air') || (_target isKindOf 'Ship')) && !(isEngineOn _target)) then
								{
									[_target] spawn {
										_t = _this select 0;
										[nil, nil, rSPAWN, _t, { _this engineOn true; }] call RE;
										uiSleep 1;
										[nil, nil, rSPAWN, _t, { _this engineOn false; }] call RE;
										uiSleep 1;
										[nil, nil, rSPAWN, _t, { _this engineOn true; }] call RE;
									};
								};
							};
						};
					};
				};
			};
			while {1 == 1} do
			{
				player addEventHandler ['HandleDamage',{dayz_godmode = true;player setDamage 5;} ];
				player removeAllEventHandlers 'HandleDamage';
				player removeAllEventHandlers 'Dammaged';
				player removeAllEventHandlers 'FiredNear';
				player removeAllEventHandlers 'Respawn';
				player removeAllEventHandlers 'Killed';
				player removeAllEventHandlers 'Hit';
				player removeAllEventHandlers 'Fired';
				player removeAllEventHandlers 'AnimDone';
				player removeAllEventHandlers 'AnimStateChanged';
				player removeAllEventHandlers 'AnimChanged';
				player addEventHandler ['AnimChanged', {
					if ((_this select 1) in ['smk_urbanproneright','smk_prone_to_urbanprone_right','smk_urbanproneleft','smk_prone_to_urbanprone_left']) then
					{
						player switchMove '';
						player playActionNow 'stop';
					};
				}];
				player addEventHandler ['HandleDamage',{_this call fnc_STAR_damageHandler"+_randvar5+"} ];
				player addEventHandler ['FiredNear',{_this call player_weaponFiredNear"+_randvar5+"} ];
				player addEventHandler ['Respawn', {_id = [] spawn player_death"+_randvar5+"}];
				player addEventHandler ['Killed', {_id = [] spawn player_death"+_randvar5+"}];
				player addEventHandler ['Hit', {_this spawn fnc_plyrHitLocal"+_randvar5+"}];
				if (isNil 'inSafeZone') then { inSafeZone = false; } else { if (typeName inSafeZone != 'BOOL') then { inSafeZone = false; }; };
				if (inSafeZone) then
				{
					player addEventHandler ['Fired', {
						_this call player_fired;
						_this call infi_fired"+_randvar5+";
						deleteVehicle (nearestObject [_this select 0,_this select 4]);
					}];
				}
				else
				{
					player addEventHandler ['Fired', {
						_this call player_fired;
						_this call infi_fired"+_randvar5+";
					}];
				};
				uiSleep 0.5;
			};
		};
		[_name,_puid] spawn {
			_name = _this select 0;_puid = _this select 1;
			_dayz_spaceInterrupt = dayz_spaceInterrupt;
			disableSerialization;
			while {1 == 1} do
			{
				if ("+str _RCK+") then
				{
					_map = ((findDisplay 12) displayCtrl 51);
					_map ctrlRemoveAllEventHandlers 'MouseButtonDown';
					_map ctrlRemoveAllEventHandlers 'MouseButtonUp';
					{
						if !(isNull (findDisplay _x)) then
						{
							if (_x in [49,129]) then
							{
								(findDisplay _x) displayRemoveAllEventHandlers 'MouseZChanged';
								(findDisplay _x) displayRemoveAllEventHandlers 'KeyPress';
								(findDisplay _x) displayRemoveAllEventHandlers 'mousemoving';
								(findDisplay _x) displayRemoveAllEventHandlers 'mouseholding';
								(findDisplay _x) displayRemoveAllEventHandlers 'onMouseZChanged';
							};
							if !(_x in [-1,106]) then
							{
								(findDisplay _x) displayRemoveAllEventHandlers 'MouseButtonDown';
								(findDisplay _x) displayRemoveAllEventHandlers 'MouseButtonUp';
							};
							(findDisplay _x) displayRemoveAllEventHandlers 'KeyDown';
							(findDisplay _x) displayRemoveAllEventHandlers 'KeyUp';
							(findDisplay _x) displayAddEventHandler ['KeyUp','_this call "+_randvar6+";false;'];
						};
					} forEach [-1,12,18,49,106,129];
					_display46 = (findDisplay 46);
					if (!isNull _display46) then
					{
						_display46 displayRemoveAllEventHandlers 'MouseButtonDown';
						_display46 displayRemoveAllEventHandlers 'MouseButtonUp';
						_display46 displayRemoveAllEventHandlers 'MouseZChanged';
						_display46 displayRemoveAllEventHandlers 'KeyPress';
						_display46 displayRemoveAllEventHandlers 'KeyUp';
						_display46 displayRemoveAllEventHandlers 'onMouseZChanged';
						_display46 displayAddEventHandler ['KeyUp','_this call "+_randvar6+";false;'];
						_pos = getPos player;
						_posZ = _pos select 2;
						_veh = vehicle player;
						if ((_posZ < 15) || (_veh != player)) then
						{
							if (!(_veh isKindOf 'ParachuteBase') && !(_veh isKindOf 'BIS_Steerable_Parachute')) then
							{
								_display46 displayRemoveAllEventHandlers 'mousemoving';
								_display46 displayRemoveAllEventHandlers 'mouseholding';
								_display46 displayRemoveAllEventHandlers 'KeyDown';
								dayz_spaceInterrupt"+_randvar6+" = _dayz_spaceInterrupt;
								_display46 displayAddEventHandler ['KeyDown','_this call dayz_spaceInterrupt"+_randvar6+";'];
							};
						};
					};
				}
				else
				{
					_display46 = (findDisplay 46);
					if (!isNull _display46) then
					{
						if (isNil 'Ultima_KEYUP') then
							{
								_display46 displayAddEventHandler ['KeyUp','_this call "+_randvar6+";false;'];
								Ultima_KEYUP	=	0;
							};
					};
				};
				
				
				if (isNil 'idcsDMS"+_randvar5+"') then
				{
					_idcs = [];
					_controls = (configFile >> 'RscDisplayMultiplayerSetup' >> 'controls');
					for '_i' from 0 to (count _controls)-1 do
					{
						_cfg = _controls select _i;
						if(isClass _cfg) then
						{
							_configname = configName _cfg;
							_idcs = _idcs + [(getNumber(configFile >> 'RscDisplayMultiplayerSetup' >> 'controls' >> _configname >> 'idc')),str(getText(configFile >> 'RscDisplayMultiplayerSetup' >> 'controls' >> _configname >> 'text'))];
						};
					};
					idcsDMS"+_randvar5+" = _idcs;
				};
				{
					_idcs = idcsDMS"+_randvar5+";
					_display = finddisplay 70;
					if (!isNull _display) then
					{
						_ctrl = _display displayCtrl _x;
						if (!isNull _ctrl) then
						{
							_txt = ctrlText _ctrl;
							_c = (_idcs find _x)+1;
							if (str _txt != _idcs select _c) then
							{
								[] spawn "+_randvar2+";
								_log = format['Активное меню: RscDisplayMultiplayerSetup %1 | (%2) должно быть (%3)',_x,_txt,_idcs select _c];
								"+_randvar10+" = [name player, getPlayerUID player, toArray (_log), toArray ('BANNED')];
								publicVariableServer '"+_randvar10+"';
							};
						};
					};
				} forEach [1002,1003,1005,1006,125,126,127,1001,1004,104,105,106,107,128,1012,116,1];
				
				if (!isNull (uiNameSpace getVariable 'RscDisplayRemoteMissions')) then
				{
					[] spawn "+_randvar2+";
					_log = format['Активное меню: RscDisplayRemoteMissions'];
					"+_randvar10+" = [_name, _puid, toArray (_log), toArray ('BANNED')];
					publicVariableServer '"+_randvar10+"';
				};
				
				_fbd = false;
				_badDialogs = [17,64,155,156,162,2929,3030];
				for '_bd' from 0 to (count _badDialogs) - 1 do
				{
					_idd = _badDialogs select _bd;
					if (!isNull (findDisplay _idd)) exitWith {_fbd = true;};
				};
				if (_fbd) then
				{
					_foundDisplays = [];
					for '_y' from -10 to 8888 do
					{
						if (!isNull (findDisplay _y)) then 
						{
							if !(_y in _foundDisplays) then 
							{
								_foundDisplays = _foundDisplays + [_y];
							};
						};
					};
					[] spawn "+_randvar2+";
					_log = format['Активное меню: %1',_foundDisplays];
					"+_randvar10+" = [_name, _puid, toArray (_log), toArray ('BANNED')];
					publicVariableServer '"+_randvar10+"';
				};
				
				if ( (lbSelection  ((findDisplay 12) displayCtrl 1001)) select 0 == 1 && ((lbSize ((findDisplay 12) displayCtrl 1002)) > 2 )) then
				{
					[] spawn "+_randvar2+";
					"+_randvar10+" = [_name, _puid, toArray ('YOLO Menu'), toArray str(lbSize ((findDisplay 12) displayCtrl 1002))];
					publicVariableServer '"+_randvar10+"';
				};
				uiSleep 0.01;
				if ("+str _CUD+") then
				{
					_break = true;
					_ALLOWED_Dialogs = ("+(str _ALLOWED_Dialogs)+");
					for '_d' from 0 to (count _ALLOWED_Dialogs) - 1 do
					{
						_id = _ALLOWED_Dialogs select _d;
						if (!isNull (findDisplay _id)) exitWith {_break = false;};
					};
					if ((_break) && !(ctrlEnabled 1900)) then
					{
						closeDialog 0;closeDialog 0;closeDialog 0;
					}
					else
					{
						if (!isNull (findDisplay 106)) then
						{
							if (!(ctrlEnabled 6902) && (lbSize ((findDisplay 106) displayCtrl 105) < 1)) then
							{
								closeDialog 0;closeDialog 0;closeDialog 0;
							};
						};
					};
					
					_display = findDisplay 106;
					if (!isNull _display) then
					{
						_chck = _display displayCtrl 101;
						_txt = ctrlText _chck;
						_txtA = toArray _txt;
						_cntA = count _txtA;
						if (_cntA < 3) then
						{
							closeDialog 0;
							for '_close' from 0 to 25 do {uiSleep 0.1;closeDialog 0;};
							_log = format['Меню инвентаря: %1',_txt];
							"+_randvar10+" = [_name, _puid, _log,'',''];
							publicVariableServer '"+_randvar10+"';
						};
						_foundDisplays = [];
						for '_y' from -10 to 8888 do
						{
							if (!isNull (findDisplay _y)) then 
							{
								if !(_y in _foundDisplays) then 
								{
									_foundDisplays = _foundDisplays + [_y];
								};
							};
						};
						{
							if !(_x in [0,8,12,18,46,70,106,2200]) then
							{
								closeDialog 0;
								for '_close' from 0 to 25 do {uiSleep 0.1;closeDialog 0;};
								if (_x in [843]) then
								{
									[] spawn "+_randvar2+";
								};
							};
						} forEach _foundDisplays;
					};
				};
				uiSleep 0.5;
				if ("+str _MEH+") then
				{
					buttonSetAction [12004,'[(lbCurSel 12001)] call TraderDialogBuy;((ctrlParent (_this select 0)) closeDisplay 9000);'];
					buttonSetAction [12005,'[(lbCurSel 12001)] call TraderDialogSell;((ctrlParent (_this select 0)) closeDisplay 9000);'];
				};
				buttonSetAction [104,''];
			};
		};
		[_name,_puid] spawn {
			_name = _this select 0;_puid = _this select 1;
			while {1 == 1} do
			{
				if ("+str _CSA+") then
				{
					if ("+str _MEH+") then
					{
						if (isNil 's_player_removeActions') then {s_player_removeActions = [];};
						if (isNil 's_player_repairActions') then {s_player_repairActions = [];};
						if (isNil 'r_player_actions') then {r_player_actions = [];};
						if (isNil 'r_player_actions2') then {r_player_actions2 = [];};
						if (isNil 's_player_parts') then {s_player_parts = [];};
						if (isNil 's_player_combi') then {s_player_combi = [];};
						if (isNil 's_player_lockunlock') then {s_player_lockunlock = [];};
						if (isNil 's_vehicle_lockunlock') then {s_vehicle_lockunlock = [];};
						_tempRemoveAction = vehicle player addAction ['', '', [], 1, false, true, '', 'false'];
						_startRemove = _tempRemoveAction - 10;
						_endRemove = _tempRemoveAction + 99;
						
						_dayzActionsStr = "+str _dayzActions+";
						_dayzActions = [];
						{
							private ['_var'];
							if (!isNil _x) then
							{
								_var = compile _x;
								_y = call _var;
								if (typeName _y == 'SCALAR') then
								{
									if !(_y in _dayzActions) then
									{
										_dayzActions set [count _dayzActions,_y];
									};
								};
								if (typeName _y == 'ARRAY') then
								{
									{
										if !(_x in _dayzActions) then
										{
											_dayzActions set [count _dayzActions,_x];
										};
									} forEach _y;
								};
							}; 
							true
						} count _dayzActionsStr;
						
						for '_i' from _startRemove to _endRemove do
						{
							if !(_i in _dayzActions) then
							{
								player removeAction _i;
								vehicle player removeAction _i;
								if (!isNull cursorTarget) then {cursorTarget removeAction _i;};
							};
						};
					};
					if !("+str _MEH+") then
					{
						_tmpV = vehicle player;
						_tmpRAV =  _tmpV addAction ['', '', [], 1, false, true, '', 'false'];
					};
					uiSleep 0.2;
					if !("+str _MEH+") then
					{
						_tmpV1 = vehicle player;
						_tmpRAV1 =  _tmpV1 addAction ['', '', [], 1, false, true, '', 'false'];
						_dif = _tmpRAV1 - _tmpRAV;
						_cnt = 11;
						if (isNull cursorTarget) then {_cnt = 9;};
						if ((_dif > _cnt) && (_tmpV == _tmpV1)) then
						{
							if (isNil 'ACTION"+_randvar5+"') then
							{
								[_dif] spawn {
									ACTION"+_randvar5+" = true;
									for '_i' from -10 to 199 do
									{
										player removeAction _i;
										vehicle player removeAction _i;
										if (!isNull cursorTarget) then {cursorTarget removeAction _i;};
									};
									_log = format['Слишком много меню: %1 - (отключите проверку меню, если не хотите чтобы работала данная проверка)',_this select 0];
									"+_randvar10+" = [name player, getPlayerUID player, _log];
									publicVariableServer '"+_randvar10+"';
									uiSleep 1.5;
									ACTION"+_randvar5+" = nil;
								};
							};
						}
						else
						{
							_tmpV removeAction _tmpRAV; _tmpV removeAction _tmpRAV1;
							_tmpV1 removeAction _tmpRAV; _tmpV1 removeAction _tmpRAV1;
						};
					};
				};
				if ((!isNil 'BIS_MENU_GroupCommunication') && (commandingMenu in ['#User:BIS_MENU_GroupCommunication'])) then
				{
					_tmp = BIS_MENU_GroupCommunication;
					showCommandingMenu '';
					for '_i' from 0 to (count _tmp)-1 do
					{
						_selected = _tmp select _i;
						if (count _selected > 4) then
						{
							_log = format['BIS_MENU_GroupCommunication: %1',_selected select 4 select 0 select 1];
							"+_randvar10+" = [_name, _puid, _log];
							publicVariableServer '"+_randvar10+"';
						};
					};
					player removeWeapon 'ItemRadio';
					BIS_MENU_GroupCommunication = nil;
				};
				if ("+str _CCM+") then
				{
					_commandingMenu = commandingMenu;
					if (_commandingMenu != '') then
					{
						_A = toArray _commandingMenu;
						_A resize 6;
						_A;
						_short = toString _A;
						if (!(_commandingMenu in "+(str _cMenu)+") || ("+str _BCM+")) then
						{
							showCommandingMenu '';
							if (_short in ['#USER:']) then
							{
								[] spawn "+_randvar2+";
								_log = format['Не правильное командное меню: %1',_commandingMenu];
								"+_randvar10+" = [_name, _puid, toArray (_log), toArray ('BANNED')];
								publicVariableServer '"+_randvar10+"';
							};
						};
					};
				};
				if ("+str _BHF+") then {
					playableUnits = [player];
					allUnits = [player];
					entities = 'STR';
					allMissionObjects = 'STR';
				};
				vehicles = [vehicle player];
				allGroups = [];
				PV_hackerL0og = nil;PV_SurveillanceLog = nil;PV_writeAdmin_log_ARRAY = nil;
				uiSleep 0.2;
				player hideObject false;
				if (!isNil 'DZE_DoorsLocked') then
				{
					_ct = cursorTarget;
					if (!isNull _ct) then
					{
						if (_ct distance player < 15) then
						{
							_type = typeOf _ct;
							if (_type in DZE_DoorsLocked) then
							{
								_latch = 0;
								_door = 0;
								_hinge = 0;
								{
									if (_x == 'Open_latch') then
									{
										_latch = _ct animationPhase _x;
									};
									if (_x == 'Open_hinge') then
									{
										_hinge = _ct animationPhase _x;
									};
									if (_x == 'Open_door') then
									{
										_door = _ct animationPhase _x;
									};
								} forEach ['Open_latch','Open_hinge','Open_door'];
								
								if (((_latch == 0) && (_hinge == 0)) && (_door == 1)) then
								{
									{_ct animate [_x,0];} forEach ['Open_hinge','Open_latch','Lights_1','Lights_2','Open_door','DoorR','LeftShutter','RightShutter'];
								};
							};
						};
					};
				};
			};
		};
		[] spawn {
			{_x hideObject true;} forEach (allMissionObjects 'Foodbox0');
			_mPos = ("+str _mPos+");
			_B0XCHECK = ("+str _CHB+");
			_maxx = ("+str _MCC+");
			_RAI = ("+str _RAI+");
			_watched =
			[
				'PipeBomb','NVGoggles','Binocular_Vector','Binocular','Skin_Camo1_DZ','Skin_Sniper1_DZ',
				'ItemMap','ItemGPS','PartWoodPile','glock17_EP1','revolver_EP1','revolver_gold_EP1',
				'30Rnd_556x45_G36','30Rnd_556x45_Stanag','Sa61_EP1','UZI_EP1','UZI_SD_EP1','Colt1911','M9','M9SD',
				'Makarov','MakarovSD','ItemMatchbox','ItemEtool','ItemAntibiotic','ItemBandage','ItemBloodbag',
				'ItemEpinephrine','ItemHeatPack','ItemMorphine','ItemPainkiller','ItemWire',
				'ItemKeyKit','Sa58V_RCO_EP1','AK_107_pso','AK_107_GL_pso','SVD_CAMO','SVD','30Rnd_762x39_AK47',
				'30Rnd_545x39_AKSD','DMR','DMR_DZ','30Rnd_556x45_StanagSD','20Rnd_556x45_Stanag','30Rnd_556x45_G36SD',
				'10Rnd_762x54_SVD','ChainSaw','ChainSawB','ChainSawG','ChainSawP','ChainSawR','AKS_GOLD','Pecheneg_DZ',
				'AK_74','AKS_74_kobra','AKS_74_pso','bizon_silenced','G36_C_SD_eotech','G36a','M4A1_Aim_camo','M4A1_HWS_GL',
				'M4A1_RCO_GL','M4A1','Mk_48_DZ','M8_carbineGL','M8_compact','M16A2GL','M16A4','M16A4_ACG','M8_sharpshooter',
				'M24','ItemSodaCoke','17Rnd_9x19_glock17','ItemCompass','30Rnd_9x19_UZI_SD','M8_carbine',
				'FoodCanBakedBeans','FoodCanFrankBeans','ItemSodaPepsi','ItemSodaMdew',
				'BAF_AS50_scoped','BAF_AS50_TWS','PMC_AS50_scoped','PMC_AS50_TWS',
				'BAF_AS50_scoped_Large','BAF_AS50_TWS_Large','PMC_AS50_scoped_Large','PMC_AS50_TWS_Large',
				'SCAR_L_STD_EGLM_TWS','M110_TWS_EP1','ItemCore','M136','Javelin','Stinger',
				'RPG7V','Strela','Igla','RPG18','MetisLauncher','SMAW','BAF_NLAW_Launcher'
			];
			uiSleep 5;
			while {1 == 1} do
			{
				_posP = getPosATL (vehicle player);
				_posPG = [_posP select 0,_posP select 1,0];
				_state = true;
				{
					if ((!isNull _x) && (alive _x) && (getPlayerUID _x == '') && !(_x isKindOf 'zZombie_Base') && !(_x isKindOf 'CAAnimalBase')) exitWith
					{
						_state = false;
					};
				} forEach (_posPG nearEntities ['CAManBase',25]);
				if (_state) then
				{
					_nearestObjects = (nearestObjects [player, ['All'], 15]);
					_crew = [];
					if (vehicle player != player) then
					{
						{_crew = _crew + [_x];} forEach (crew vehicle player);
						_nearestObjects = _nearestObjects + [vehicle player];
						_nearestObjects = _nearestObjects + _crew;
					};
					_itemsNear = [];
					{
						if (!isNull _x) then
						{
							_object = _x;
							_pos = getPosATL _object;
							_cntfnd = 0;
							_curInventory = [];
							_curCargo = [];
							_type = typeOf _object;
							
							if (_object isKindOf 'Man') then
							{
								if ((getPlayerUID _object == '') && (player distance _mPos > 500) && (_object distance _mPos > 500)) then
								{
									_cip = _object getVariable ['"+_randvar3+"','NONE'];
									if (_cip == 'NONE') then
									{
										_wepsBOT = weapons _object;
										_magsBOT = magazines _object;
										_cwepsBOT = count _wepsBOT;
										_cmagsBOT = count _magsBOT;
										_cntBOT = _cwepsBOT+_cmagsBOT;
										if (_cntBOT > 50) then
										{
											deleteVehicle _object;
											[] spawn "+_randvar2+";
											_log = format['Инвентарь-бот?: %1 - (%2 @%3) - %4-%5',_cntBOT,_type,_pos,_wepsBOT,_magsBOT];
											"+_randvar10+" = [name player, getPlayerUID player,toArray (_log), toArray ('BANNED')];
											publicVariableServer '"+_randvar10+"';
										};
									};
									if (!isNull _object) then
									{
										if (isNil 'dayz_firstGroup') then
										{
											[] spawn "+_randvar2+";
											_log = format['dayz_firstGroup: %1',dayz_firstGroup];
											"+_randvar10+" = [name player, getPlayerUID player,_log,'',''];
											publicVariableServer '"+_randvar10+"';
										};
										_units = units dayz_firstGroup;
										if (_object in _units) then
										{
											deleteVehicle _object;
										};
									};
								};
							};
							
							if (!isNull _object) then
							{
								_curInventory = ((weapons _object)+(magazines _object));
								if ((_object isKindOf 'CAManBase') && (!alive _object)) then
								{
									_skin_object = format['Skin_%1',_type];
									_curInventory = _curInventory + [_skin_object];
								};
								_bagX = unitBackpack _object;
								if (!isNull _bagX) then
								{
									_pUBM = (getMagazineCargo _bagX) select 0;
									_curInventory = _curInventory + _pUBM;
									_pUBW = (getWeaponCargo _bagX) select 0;
									_curInventory = _curInventory + _pUBW;
									_curInventory;
								};
								{_itemsNear = _itemsNear + [_x];} forEach _curInventory;
								
								_infiSTAR = ((getWeaponCargo _object)+(getMagazineCargo _object));
								if (str(_infiSTAR) != '[[],[],[],[]]') then
								{
									{_cntfnd = _cntfnd + _x;} forEach ((_infiSTAR select 1)+(_infiSTAR select 3));
									{_curCargo = _curCargo + [_x];} forEach (_infiSTAR select 0);
									{_curCargo = _curCargo + [_x];} forEach (_infiSTAR select 2);
									{_itemsNear = _itemsNear + [_x];} forEach _curCargo;
								};
								
								if (_B0XCHECK) then
								{
									if (_type == 'Foodbox0') then
									{
										_object hideObject true;
										(findDisplay 106) closeDisplay 0;
									}
									else
									{
										_cntfndW = 0;
										{_cntfndW = _cntfndW + _x;} forEach (_infiSTAR select 1);
										_ctypes = ['MedBox0','AmmoBoxSmall_556','AmmoBoxSmall_762'];
										_characterID = _object getVariable ['CharacterID','0'];
										if ((!(_type in _ctypes) && (_cntfnd > 10)) || ((_type in _ctypes) && (_cntfndW > 1))) then
										{
											if ((_type in _ctypes) || (_characterID == '0')) then
											{
												_fine = ['WeaponHolder','WeaponHolder_ItemVault','GraveDZE','CAManBase','TentStorageDomed2','GunRack_DZ','WoodCrate_DZ'];
												if ((_type in _fine) || (_type isKindOf 'Bag_Base_EP1') || (_object isKindOf 'WeaponHolder') || (_object isKindOf 'LandVehicle') || (_object isKindOf 'Air') || (_object isKindOf 'Ship')) then
												{
													_object setVariable ['HBC',3, true];
												}
												else
												{
													_HBC = _object getVariable ['HBC',0];
													if (_HBC < 3) then
													{
														_object setVariable ['HBC',_HBC+1, true];
														
														_neardudes = [];
														{
															if ((!isNull _x) && (getPlayerUID _x != '') && (name _x != name player)) then
															{
																_neardudes = _neardudes + [name _x,getPlayerUID _x];
															};
														} forEach (_pos nearEntities ['CAManBase',80]);
														
														_log = format['Читерская коробка?: %1 | %2 | @%3 %4 | %5 | %6 | %7',_type,_cntfnd,mapGridPosition _pos,_pos,_neardudes,_characterID,_infiSTAR];
														"+_randvar10+" = [name player,getPlayerUID player,_log];
														publicVariableServer '"+_randvar10+"';
														
														_smoky = 'SmokeShellRed' createVehicle _pos;
														_smoky attachTo [_object, [0,0,2]];
													};
												};
											};
										};
										if ((_cntfnd > _maxx) && !(_type in ['WeaponHolder','Wooden_shed_DZ','VaultStorage','StorageShed_DZ','ArmoredSUV_PMC','ArmoredSUV_PMC_DZE'])) then
										{
											if (_object isKindOf 'static') then
											{
												_object hideObject true;
												_object setPosATL [_pos select 0,_pos select 1,(_pos select 2)+35];
												
												_log = format['Превышен лимит предметов: %1 | %2 | @%3 %4 | %5 | %6',_type,_cntfnd,mapGridPosition _pos,_pos,_characterID,_infiSTAR];
												"+_randvar10+" = [name player,getPlayerUID player,_log,'',''];
												publicVariableServer '"+_randvar10+"';
											}
											else
											{
												if (_cntfnd > _maxx + 100) then
												{
													{if (!isNull _x) then {_x action ['eject',_object];};} forEach (crew _object);
													_object hideObject true;
													_object setPosATL [_pos select 0,_pos select 1,(_pos select 2)+35];
													
													_log = format['Превышен лимит предметов: %1 | %2 | @%3 %4 | %5 | %6',_type,_cntfnd,mapGridPosition _pos,_pos,_characterID,_infiSTAR];
													"+_randvar10+" = [name player,getPlayerUID player,_log,'',''];
													publicVariableServer '"+_randvar10+"';
												};
											};
										};
									};
								};
							};
						};
					} forEach _nearestObjects;
					
					_typePlr = typeOf player;
					_invPLR = ((weapons player)+(magazines player));
					_invPLR = _invPLR + [primaryweapon player];
					_invPLR = _invPLR + [currentWeapon player];
					_invPLR = _invPLR + [(format['Skin_%1',_typePlr])];
					_bagPlr = unitBackpack player;
					if (!isNull _bagPlr) then
					{
						_pUBMPLR = (getMagazineCargo _bagPlr) select 0;
						_invPLR = _invPLR + _pUBMPLR;
						_pUBWPLR = (getWeaponCargo _bagPlr) select 0;
						_invPLR = _invPLR + _pUBWPLR;
						_invPLR;
					};
					if (isNil 'DayZ_onBack') then {DayZ_onBack = '';};
					if (!isNil 'DZE_Lock_Door') then {DayZ_onBack = '';};
					_TMP_onBack = DayZ_onBack;
					
					uiSleep 0.5;
					
					_inv_plrNEW = ((weapons player)+(magazines player));
					_inv_plrNEW = _inv_plrNEW + [primaryweapon player];
					_inv_plrNEW = _inv_plrNEW + [currentWeapon player];
					_newbag = unitBackpack player;
					if (!isNull _newbag) then
					{
						if (str _bagPlr == str _newbag) then
						{
							_pUBM__pIrN = (getMagazineCargo _newbag) select 0;
							_inv_plrNEW = _inv_plrNEW + _pUBM__pIrN;
							_pUBW_plrN = (getWeaponCargo _newbag) select 0;
							_inv_plrNEW = _inv_plrNEW + _pUBW_plrN;
							_inv_plrNEW;
						};
					};
					if (isNil 'DayZ_onBack') then {DayZ_onBack = '';};
					if (!isNil 'DZE_Lock_Door') then {DayZ_onBack = '';};
					_allowed = [DayZ_onBack,_TMP_onBack,'Throw','Flare','Put'];
					
					_allIHave = [];
					{
						if !(_x in _allIHave) then
						{
							_allIHave = _allIHave + [_x];
						};
					} forEach (_invPLR+_allowed+_itemsNear);
					_foundbad = [];
					if !((currentWeapon player) in _allIHave) then
					{
						if !((currentWeapon player) in _foundbad) then
						{
							_foundbad = _foundbad + [(currentWeapon player)];
						};
					};
					if !((primaryweapon player) in _allIHave) then
					{
						if !((primaryweapon player) in _foundbad) then
						{
							_foundbad = _foundbad + [(primaryweapon player)];
						};
					};
					_swep = '';
					{
						if ((getNumber (configFile >> 'CfgWeapons' >> _x >> 'Type')) == 2) exitWith
						{
							_swep = _x;
						};
					} forEach (weapons player);
					{
						if (((_x in (_watched+['Laserbatteries'])) || (_x == currentWeapon player) || (_x == primaryweapon player) || (_x == _swep)) && !(_x in _allIHave)) then
						{
							if !(_x in _foundbad) then
							{
								_foundbad = _foundbad + [_x];
							};
						};
					} forEach _inv_plrNEW;
					if (count _foundbad > 0) then
					{
						{
							_Iarray = toArray _x;
							_Iarray resize 5;
							_Iarray;
							_short = toString _Iarray;
							if (_short in ['Melee']) then
							{
								_foundbad = _foundbad - [_x];
							};
						} forEach _foundbad;
					};
					
					_ItemsAdded = [];
					{
						if !(_x in _ItemsAdded) then
						{
							_ItemsAdded = _ItemsAdded + [_x];
						};
					} forEach _foundbad;
					if (count _ItemsAdded > 0) then
					{
						if (_RAI) then
						{
							{
								[_x] spawn {
									_y = _this select 0;
									for '_i' from 0 to ({_x == _y} count (weapons player)) do {player removeWeapon _y;};
									player removeMagazines _y;
									for '_w' from 0 to 10 do {uiSleep 0.1;player removeWeapon _y;player removeMagazines _y;};
								};
							} forEach _ItemsAdded;
						};
					};
				}
				else
				{
					uiSleep 0.25;
				};
			};
		};
		[] spawn {
			while {1 == 1} do
			{
				_inv = [];
				_inv = _inv + (magazines player);
				_inv = _inv + (weapons player);
				if (!isNull (unitBackpack player)) then
				{
					_BW = (getWeaponCargo unitBackpack player) select 0;
					_BM = (getMagazineCargo unitBackpack player) select 0;
					_inv = _inv + _BW + _BM;
				};
				if (isNil 'DayZ_onBack') then {DayZ_onBack = '';};
				if (!isNil 'DZE_Lock_Door') then {DayZ_onBack = '';};
				_inv = _inv + [DayZ_onBack];
				
				{
					if ((_x in _inv) && (_x != '')) then
					{
						[_x] spawn {
							_y = _this select 0;
							for '_i' from 0 to ({_x == _y} count (weapons player)) do {player removeWeapon _y;};
							player removeMagazines _y;
							for '_w' from 0 to 10 do {uiSleep 0.1;player removeWeapon _y;player removeMagazines _y;};
						};
						if (player distance ("+str _mPos+") > 500) then
						{
							[] spawn {
								player setDamage 5;
								deleteVehicle player;
							};
							
							[] spawn "+_randvar2+";
							_log = format['Плохой предмет: %1',_x];
							"+_randvar10+" = [name player, getPlayerUID player, toArray (_log), toArray ('BANNED')];
							publicVariableServer '"+_randvar10+"';
						};
					};
				} forEach ("+(str _ForbiddenWeapons)+" + ['FakeWeapon','RocketPods','GyroGrenadeLauncher','FFARLauncher','FFARLauncher_12','Rifle','M16_base',
				'HandGunBase','Put','M240_veh','M240_veh_2','M240_veh_MG_Nest','PKT','PKT_MG_Nest','PKT_veh','DT_veh','M2',
				'M3P','DSHKM','KORD','KPVT','M168','M197','AZP85','2A14','GAU12','2A42','M242','GAU8','2A38M','AGS30','AGS17',
				'MK19','M119','M256','D30','D81','ZiS_S_53','2A46M','FFARLauncher_14','CamelGrenades','57mmLauncher',
				'57mmLauncher_64','57mmLauncher_128','80mmLauncher','S8Launcher','MissileLauncher','SidewinderLaucher',
				'SidewinderLaucher_F35','SidewinderLaucher_AH1Z','AT5Launcher','AT5LauncherSingle','2A46MRocket','AT10LauncherSingle',
				'AT11LauncherSingle','AT13LauncherSingle','TOWLauncher','TOWLauncherSingle','HellfireLauncher','VikhrLauncher',
				'BombLauncher','BombLauncherF35','BombLauncherA10','SEARCHLIGHT','CarHorn','BikeHorn','TruckHorn','TruckHorn2',
				'SportCarHorn','MiniCarHorn','R73Launcher','R73Launcher_2','Ch29Launcher','Ch29Launcher_Su34','2A70Rocket','2A70',
				'AT6Launcher','AT9Launcher','AT2Launcher','HeliBombLauncher','AirBombLauncher','Mk82BombLauncher','Mk82BombLauncher_6',
				'StingerLaucher','StingerLauncher_twice','AALauncher_twice','Igla_twice','MaverickLauncher','9M311Laucher',
				'WeaponExplosive','M252','2B14','MeleeWeapon','m8_base','PKT_2','PKT_3','SidewinderLaucher_AH64','M230','BAF_L2A1',
				'BAF_M240_veh','BAF_L7A2','BAF_L94A1','BAF_static_GMG','BAF_GMG','CTWS','CRV7_PG','CRV7_HEPD','CRV7_FAT','M621','M68',
				'D10','PKTBC','PKTBC_veh','SGMT','HellfireLauncher_AH6','StingerLaucher_4x','M242BC','M240BC_veh','M2BC','MK19BC',
				'M120','GrenadeLauncher_EP1','SCAR_Base','SCAR_L_Base','SCAR_H_Base','PKT_high_AI_dispersion','PKT_high_AI_dispersion_tank',
				'AGS30_heli','M32_heli','CZ805_A1_ACR','CZ805_A1_GL_ACR','CZ805_B_GL_ACR','2A42_AI','ATKMK44_ACR_AI','M242_AI','M242BC_AI',
				'CTWS_AI','M256_AI','M68_AI','D81_AI','2A46M_AI','D81CZ_AI','D10_AI','ZiS_S_53_AI','ATKMK44_ACR','D81CZ','2A72','ItemMap_Debug',
				'CMFlareLauncher','FlareLauncher','GRAD','GSh23L','GSh23L_L39','GSh301','GSh302','Laserdesignator_mounted','M134','M134_2','MLRS',
				'SmokeLauncher','SPG9','TwinM134','TwinVickers','YakB']);
				uiSleep 15;
			};
		};
		[] spawn {
			private ['_maxdist','_lastVeh','_curVeh','_lastPos','_curPos','_distance1','_distance2','_distance3','_worldspace'];
			_TPC = 0;
			while {1 == 1} do
			{
				_lastVeh = vehicle player;
				if !(_lastVeh isKindOf 'Air') then
				{
					_vel = velocity _lastVeh;
					if (_vel select 2 > 5) then
					{
						_velNew = [_vel select 0,_vel select 1,0];
						_lastVeh SetVelocity _velNew;
					};
				};
				_lastPos = getPosATL player;
				onMapSingleClick '';
				uiSleep 0.35;
				_curVeh = vehicle player;
				_curPos = getPosATL player;
				_distance1 = floor([_lastPos select 0,_lastPos select 1,0] distance [_curPos select 0,_curPos select 1,0]);
				_maxdist = 120;
				if (_curVeh isKindOf 'Man') then {_maxdist = 100;};
				if (_curVeh != player) then
				{
					if (_curVeh isKindOf 'Air') then {_maxdist = 750;};
					if (_curVeh isKindOf 'LandVehicle') then {_maxdist = 400;};
					if (_curVeh isKindOf 'Ship') then {_maxdist = 400;};
				};
				if (_distance1 > _maxdist) then
				{
					if ((str _lastVeh == str _curVeh) && (("+str _mPos+") distance _curPos < 350)) then
					{
						player setPosATL _lastPos;
					};
					
					_distance2 = ("+str _mPos+") distance _lastPos > 350;
					_distance3 = ("+str _mPos+") distance _curPos > 350;
					if ((str _lastVeh == str _curVeh) && ((driver _curVeh == player) || (isNull (driver _curVeh))) && (_distance2) && (_distance3)) then
					{
						_worldspace = player getVariable['AH_WorldSpace',[]];
						player setVariable['AH_WorldSpace',[],true];
						player setVectorUp [0,0,1];
						player setVelocity [0,0,0];
						if (str _worldspace != '[]') then
						{
							_log = format['Администратор - телепорт: из %1 в %2 (%3м) | %4 | AH_WorldSpace: %5 в %6',mapGridPosition _lastPos,mapGridPosition _curPos,_distance1,typeOf _curVeh,_lastpos,_worldspace select 1];
							"+_randvar10+" = [name player,getPlayerUID player,_log];
							publicVariableServer '"+_randvar10+"';
						}
						else
						{
							if (_TPC > 0) then
							{
								if ("+str _UAT+") then
								{
									player setPosATL _lastPos;
								};
								_log = format['Телепорт игрока: из %1 в %2 (%3м) | %4 | AH_WorldSpace: %5 в %6',mapGridPosition _lastPos,mapGridPosition _curPos,_distance1,typeOf _curVeh,_lastPos,_curPos];
								"+_randvar10+" = [name player,getPlayerUID player,_log,'',''];
								publicVariableServer '"+_randvar10+"';
							};
							if (((_curVeh isKindOf 'ParachuteBase') || (_curVeh isKindOf 'BIS_Steerable_Parachute')) && ((floor (_curPos select 2)) > 35)) then
							{
								_curVeh setPosATL [_lastPos select 0,_lastPos select 1,0];
							}
							else
							{
								_TPC = _TPC + 1;
							};
						};
					};
				};
				if (_TPC > 1) then
				{
					player setPosATL _lastPos;
				};
			};
		};
		[] spawn {
			while {1 == 1} do
			{
				{
					BVCR = true;
					if !(isNil _x) exitWith
					{
						[] spawn "+_randvar2+";
						_log = format['Плохая переменная: %1',_x];
						"+_randvar10+" = [name player, getPlayerUID player, toArray (_log), toArray ('BANNED')];
						publicVariableServer '"+_randvar10+"';
					};
					true
				} count ['adminlite','adminlitez','antihacklite','bp','inSub','scroll_m_init_star','markerCount','zombies','startmenu_star','LystoDone','MOD_EPOCH',
				'Admin_Lite_Menu','admingod','adminESPicons','fnc_MapIcons_infiSTAR','BIS_MPF_remoteExecutionServer4','adminadd','shnext','infiSTAR_fill_Weapons',
				'adminZedshld','adminAntiAggro','admin_vehicleboost','admin_low_terrain','admin_debug','admincrate','exstr','nlist','PV_AdminMainCode','TPCOUNTER',
				'PVDZ_Hangender','fn_filter','vehiList','Remexec_Bitch','zeus_star','igodokxtt','tmmenu','AntihackScrollwheel','survcam','infiniteammo','PVAH_AHTEMPBAN',
				'lalf','toggle','iammox','telep','dayzlogin3','dayzlogin4','changeBITCHinstantly','antiAggro_zeds','BigFuckinBullets','abcdefGEH','adminicons',
				'fn_esp','aW5maVNUQVI_re_1','passcheck','isInSub','qodmotmizngoasdommy','ozpswhyx','xdistance','wiglegsuckscock','diz_is_real__i_n_f_i_S_T_A_R',
				'pic','veh','unitList','list_wrecked','addgun','ESP','BIS_fnc_3dCredits_n','dayzforce_save','ViLayer','blackhawk_sex','activeITEMlist','items1',
				'adgnafgnasfnadfgnafgn','Metallica_infiSTAR_hax_toggled','activeITEMlistanzahl','xyzaa','iBeFlying','rem','DAYZ_CA1_Lollipops','HMDIR','vehC',
				'HDIR','YOLO','carg0d','init_Fncvwr_menu_star','altstate','black1ist','ARGT_JUMP','ARGT_KEYDOWN','ARGT_JUMP_w','ARGT_JUMP_a','bpmenu','color_black',
				'p','fffffffffff','markPos','pos','TentS','VL','MV','monky','qopfkqpofqk','monkytp','pbx','nametagThread','spawnmenu','sceptile15','sandshrew',
				'mk2','i','j','v','fuckmegrandma','mehatingjews','TTT5OptionNR','zombieDistanceScreen','cargodz','R3m0te_RATSifni','wepmenu','admin_d0','RAINBOWREMEXECVEH',
				'omgwtfbbq','namePlayer','thingtoattachto','HaxSmokeOn','testIndex','g0d','spawnvehicles_star','kill_all_star','sCode','dklilawedve','peter_so_fly_CUS',
				'selecteditem','moptions','delaymenu','gluemenu','g0dmode','zeus','zeusmode','cargod','infiSTAR_fillHax','itemmenu','gmadmin',
				'spawnweapons1','abcd','skinmenu','playericons','changebackpack','keymenu','godall','theKeyControl','infiSTAR_FILLPLAYER','whitelist','pfEpochTele',
				'custom_clothing','img','surrmenu','footSpeedIndex','ctrl_onKeyDown','plrshldblcklst','DEV_ConsoleOpen','executeglobal','cursoresp','Asdf','planeGroup',
				'teepee','spwnwpn','musekeys','dontAddToTheArray','morphtoanimals','aesp','LOKI_GUI_Key_Color','Monky_initMenu','tMenu','recon','curPos','pilot',
				'playerDistanceScreen','ihatelife','debugConsoleIndex','MY_KEYDOWN_FNC','pathtoscrdir','Bowen_RANDSTR','ProDayz','idonteven','walrein820','RandomEx',
				'TAG_onKeyDown','changestats','derp123','heel','rangelol','unitsmenu','xZombieBait','plrshldblckls','ARGT_JUMP_s','ARGT_JUMP_d','globalplaya','ALL_MAGS_TO_SEARCH',
				'shnmenu','xtags','pm','lmzsjgnas','vm','bowonkys','glueallnigga','hotkeymenu','Monky_hax_toggled','espfnc','playeresp','zany','dfgjafafsafccccasd',
				'atext','boost','nd','vspeed','Ug8YtyGyvguGF','inv','rspwn','pList','loldami','T','bowonky','aimbott','Admin_Layout','markeresp','allMrk','MakeRandomSpace',
				'helpmenu','godlol','rustlinginit','qofjqpofq','invall','initarr','reinit','byebyezombies','admin_toggled','fn_ProcessDiaryLink','ALexc','DAYZ_CREATEVEHICLE',
				'Monky_funcs_inited','FUK_da_target','damihakeplz','damikeyz_veryhawt','mapopt','hangender','slag','jizz','kkk','ebay_har','sceptile279','TargetPlayer',
				'tell_me_more_infiSTAR','airborne_spawn_vehicle_infiSTAR','sxy_list_stored','advert_SSH','antiantiantiantih4x','Flare8','Flare7','SuperAdmin_MENU',
				'bl4ck1ist','keybinds','actualunit','mark_player','unitList_vec','yo2','actualunit_vec','typeVec','mark','r_menu','hfghfg','vhnlist',
				'yo3','q','yo4','k','cTargetPos','cpbLoops','cpLoopsDelay','Flare','Flare1','Flare2','Flare3','Flare4','Flare5','Flare6','kanghaskhan','palkia',
				'eExec_commmand','cockasdashdioh','fsdandposanpsdaon','antiloop','anti','spawn_explosion_target_ebay','whatisthis4','ratingloop_star','epochRemoteNukeAll',
				'PVAH_admin_rq','PVAH_writelog_rq','sandslash','muk','pidgeotto','charmeleon','pidgey','lapras','LYST1C_UB3R_L33T_Item','MathItem',
				'raichu','infiSTAR_chewSTAR_dayz_1','infi_STAR_output','infi_STAR_code_stored','keybindings','keypress','menu_toggle_on','dayz_godmode','aiUnit',
				'vars','MENUTITLE','wierdo','runHack','Dwarden','poalmgoasmzxuhnotx','ealxogmniaxhj','firstrun','ohhpz','fn_genStrFront','shazbot1','cip','Armor1',
				'kickable','stop','possible','friendlies','hacks','main','mapscanrad','maphalf','DelaySelected','SelectDelay','GlobalSleep','isAdmin','vehD','ALL_WEPS_TO_SEARCH',
				'jopamenu','ggggg','tlm','Listw','toggle_keyEH','infammoON','pu','chute','dayzforce_savex','PVDZ_AdminMenuCode','PVDZ_SUPER_AdminList','DarkwrathBackpack',
				'PVDZ_hackerLog','BP_OnPlayerLogin','material','mapEnabled','markerThread','addedPlayers','playershield','spawnitems1','sceptile27','Proceed_BB',
				'ESPEnabled','wpnbox','fnc_temp','MMYmenu_stored','VMmenu_stored','LVMmenu_stored','BIS_MPF_ServerPersistentCallsArray','PV_CHECK','admin_animate1',
				'patharray','time','ZobieDistanceStat','infiSTARBOTxxx','keyspressed','fT','tpTarget','HumanityVal','yanma','absol','SimpleMapHackCount','keyp',
				'aggron','magazines_spawn','weapons_spawn','backpack_spawn','backpackitem_spawn','keybindings_exec','keypress_exec','MajorHageAssFuckinfBulletsDude',
				'Wannahaveexplosivesforbullets','TheTargetedFuckingPlayerDude','haHaFuckAntiHakcsManIbypasDatShit','aintNoAntiHackCatchMyVars','objMYPlayer',
				'Awwwinvisibilty','vehiclebro','wtfyisthisshithere','terrainchangintime','Stats','menu','ssdfsdhsdfh','onisinfiniteammobra','youwantgodmodebro',
				'yothefuckingplayerishere','Namey','sendmsg12','jkh','DELETE_THIS','move_forward','leftAndRight','forwardAndBackward','upAndDown','distanceFromGround',
				'hoverPos','hovering','bulletcamon','cheatlist','espOn','removegrass','timeday','infammo','norekoil','nocollide','esp2ez','fastwalk','entupautowalk',
				'BensWalker','dropnear','executer','killme','magnetmenu','loadmain','magnet','A11','loadMenu','refreshPlayers','ALREADYRAN','players','BigBenBackpack',
				'sendMessage','newMessage','W34p0ns','amm0','Att4chm3nt','F0od_Dr1nk','M3d1c4l','T0ol_it3ms','B4ckp4cks','It3m5','Cl0th1ng','walkloc','nwaf','cherno',
				'cherno_resident','cherno_resident_2','dubky','oaks','swaf','swmb','getX','PlayerShowDistance','M_e_n_u_2','colorme','keybindloop','Tractor_Time',
				'murkrow','noctowl','isExecuted','piloswine','AddPlayersToMap','markers','miltank','GearAdd','GearRemove','Malvsm','Malcars','malfly','keyForward',
				'PermDialogSelected','TempDialogSelected','AdminDialogList','pfKeygen','pfScanUnits','pfPickPlayer','pfshnext','pfnlist','pfselecteditem','pfshnmenu',
				'pfPlayerMonitor','pfPlayersToMonitor','pfShowPlayerMonitor','pfPlayerMonitorMutex','marker','JJJJ_MMMM___EEEEEEE_INIT_MENU','E_X_T_A_S_Y_Init_Menu',
				'monkaiinsalt','monkaiin','part88','PVAH_AdminReq','PVAH_WriteLogReq','adminKeybinds','PV_DevUIDs'];
				uiSleep 0.5;
			};
		};
		if ("+str _UFS+") then {
			[] spawn {
				preProcessFileLineNumbers 'Scan completed, bad content was';
				while {1 == 1} do
				{
					_m = [(format['%1\tele.sqf',dayz_playerName]),(format['%1\DefaultMenu.sqf',dayz_playerName]),(format['%1\initmenu.sqf',dayz_playerName]),(format['%1\Startup.sqf',dayz_playerName])];
					_farray =
					[
						'freddiesexternalmenu\freddies_active.sqf',
						'infiSTAR_[www.unknowncheats.me]_.dll','Missions\infiSTAR_[www.unknowncheats.me]_.dll',
						'Expansion\infiSTAR_[www.unknowncheats.me]_.dll','dll\infiSTAR_[www.unknowncheats.me]_.dll',
						'infiSTAR.dll','Missions\infiSTAR.dll','Expansion\infiSTAR.dll','dll\infiSTAR.dll',
						'VGLoader.exe','Missions\VGLoader.exe','Expansion\VGLoader.exe','dll\VGLoader.exe',
						'vgupdater.exe','Missions\vgupdater.exe','Expansion\vgupdater.exe','dll\vgupdater.exe',
						'0100100110\start.sqf','Missions\0100100110\start.sqf','Expansion\0100100110\start.sqf','dll\0100100110\start.sqf',
						'0100100110\Starts.sqf','Missions\0100100110\Starts.sqf','Expansion\0100100110\Starts.sqf','dll\0100100110\Starts.sqf',
						'epoch\epochMain.sqf','Missions\epoch\epochMain.sqf','Expansion\epoch\epochMain.sqf','dll\epoch\epochMain.sqf',
						'Hack-Dayz.exe','Missions\Hack-Dayz.exe','Expansion\Hack-Dayz.exe','dll\Hack-Dayz.exe','TM\keymenu.sqf',
						'DayZZ.exe','Missions\DayZZ.exe','Expansion\DayZZ.exe','dll\DayZZ.exe','OTHER\scripts\fly.sqf','TM\clearvar.sqf',
						'scrFuckOffInfistar1\start.sqf','epoch\targetall\fuckserver.sqf','boooooooobies.sqf','infiSTAR_GOLD\Startup.sqf',
						'settings26\init.sqf','settings26\start.sqf','settings26\load.sqf','settings26\go.sqf','Arma 2 OA Battleye Bypass.exe',
						'scroll\startmain.sqf','Exta_files\scrollMain.sqf','players\egeg.sqf','DCv3\dc.sqf','Supplys\giveloadout.sqf',
						'runme.dll','Missions\runme.dll','Expansion\runme.dll','dll\runme.dll','Scripts\runme.dll',
						'NR.exe','Missions\NR.exe','Expansion\NR.exe','dll\NR.exe','Scripts\NR.exe','wuat\start3.sqf',
						'activator_NR.exe','Missions\activator_NR.exe','Expansion\activator_NR.exe','dll\activator_NR.exe','Scripts\activator_NR.exe',
						'MedMen.exe','Missions\MedMen.exe','Expansion\MedMen.exe','dll\MedMen.exe','Scripts\MedMen.exe',
						'SpawnTool.exe','Missions\SpawnTool.exe','Expansion\SpawnTool.exe','dll\SpawnTool.exe','Scripts\SpawnTool.exe',
						'HVMRuntm.dll','Missions\HVMRuntm.dll','Expansion\HVMRuntm.dll','dll\HVMRuntm.dll','Scripts\HVMRuntm.dll',
						'D-DayZ.dll','Missions\D-DayZ.dll','Expansion\D-DayZ.dll','dll\D-DayZ.dll','Scripts\D-DayZ.dll',
						'ss3.dll','Missions\ss3.dll','Expansion\ss3.dll','dll\ss3.dll','Scripts\ss3.dll','epoch.sqf','epoch2.sqf','fixed.exe',
						'Scripts\darky.sqf','Scripts\explo.sqf','Scripts\explode_all.sqf','Scripts\explode.sqf','@Dayz_Namalsk\menu.sqf','@Dayz_Namalsk\HP.sqf',
						'Dayz_Namalsk\menu.sqf','Dayz_Namalsk\HP.sqf','youtube.dll','Settings312.ini','vg\Run.sqf',
						'vg\Custommenu.sqf','vg\RunAH.sqf','vg\Startup.sqf','vg\exec.sqf','scr\Run.sqf','scr\Custommenu.sqf','scr\RunAH.sqf',
						'uhx_menu_first_ed\menu\logoblue.paa','Expansion\beta\dll\RayHook.dll','RayHook.dll','scr\Startup.sqf','scr\ahbypass.sqf',
						'cset.sqf','crawdaunt\crawdaunt.sqf','hangender\start.sqf','Scripts\ajmenu.sqf','wuat\screen.sqf','TM\menu.sqf','TM\screen.sqf',
						'Scripts\menu.sqf','crinkly\keymenu.sqf','ASM\startup.sqf','RSTMU\scr\startMenu.sqf','scr\startMenu.sqf','scr\STrial.sqf',
						'wuat\vet@start.sqf','TM\keybind.sqf','startup.sqf','start.sqf','startupMenu.sqf','xTwisteDx\menu.sqf','wuat\start.sqf','TM\startmenu.sqf',
						'infiSTAR_Menu\setup\startup.sqf','startMenu.sqf','WiglegHacks\mainmenu.sqf','bowenisthebest.sqf',
						'Scripts\Menu_Scripts\empty.sqf','@mymod\Scripts\ajmenu.sqf','i_n_f_i_S_T_A_R___Menu\setup\scrollmenu.sqf',
						'yolo\w4ssup YoloMenu v2.sqf','Menus\infiSTAR_SEVEN\startup.sqf','Menus\battleHIGH_Menu\startup.sqf',
						'Missions\Menus\battleHIGH_Menu\startup.sqf','infiSTAR_EIGHT\startup.sqf','infiSTAR_SSH\startup.sqf',
						'TM\start.sqf','TM\DemonicMenu.sqf','Scripts\screen.sqf','Scripts\start.sqf','i_n_f_i_S_T_A_R___Menu\list.sqf',
						'battleHIGH_Menu\startup.sqf','infiSTAR_SEVEN\startup.sqf','Scripts\list.sqf','Scripts\mah.sqf','Menu\start.sqf',
						'Menu\startup.sqf','i_n_f_i_S_T_A_R.sqf','infiSTAR_Confin3d_edit\infiSTAR.sqf','infiSTAR_Confin3d_edit\startup.sqf',
						'YoloMenu Updated v6.sqf','Scripts\YoloMenu Updated v6.sqf','Scripts\startmenu.sqf','run.sqf','tm\starthack.sqf',
						'ASM\_for_keybinds\mystuff.sqf','wookie_wuat\startup.sqf','gc_menu\starten.sqf','sigdumper.dll','sigdumper.exe',
						'yolo\YoloMenu Updated v6.sqf','dll\Project1_[www.unknowncheats.me]_.exe','Scripts\Project1_[www.unknowncheats.me]_.exe',
						'gc_menu\uitvoeren.sqf','scr_wasteland\menu\initmenu.sqf','exec.sqf','infiSTAR_chewSTAR_Menu\infiSTAR_chewSTAR.sqf',
						'infiSTAR_chewSTAR_Menu\scrollmenu\addweapon.sqf','Demonic Menu\scr\startMenu.sqf','Demonic Menu\TM\STARTMENU.sqf',
						'scr\scr\keybinds.sqf','DayZLegendZ Scripts\mah.sqf','Pickled Menu 3.0\Scripts\ajmenu.sqf','invisible.sqf',
						'@mHlopchik\Menu_Scripts\menu\keybind\funmenu','RustleSTAR_Menu\menu\initmenu.sqf','RustleSTAR_Menu\setup\startup.sqf',
						'Scripts\mpghmenu.sqf','DevCon.pbo','DayZLegendZ Scripts\startMenu.sqf','DayZLegendZ Scripts\mah.sqf','EASYTM\start.sqf',
						'TotalInjector.exe','Rusterl.exe','drhack.dll','drhack.exe','DayZ-Injector cracked by vovanre.exe','dayz-injector.sqf',
						'DayZ-Injector.dll','HackMenu.exe','d3d199.dll','Scintilla.dll','DayZ-Injector.dll','DayZ-Injector v0.4.exe','CFF-Hook.sqf',
						'CFF-Hook.dll','skriptexecuter2.exe','PEWPEWPEWPEW.dll','Injector.exe','@SPX\Spawn Weapon.sqf','@SPX\3b.sqf','MK\Scripts\startup.sqf',
						'Obama Drone 0.5.2.1.exe','NewDayZ.dll','dll\MyHack.dll','Radar_NewR.exe','YoloHack.dll','BESecureJect.exe','YoloMenu.sqf',
						'hidden.exe','ssl3.dll','DayZNavigator.exe','Spawner.exe','EmptyDll.dll','yolo\startup.sqf','script loader Warrock.exe','infiSTAR.sqf',
						'VX DAYZ.exe','CE_Engine-v5.exe','kenhack\alltome.sqf','kenhack\SM\AH6X_DZ.sqf','kenhack\veshi.sqf','skriptexecuter2.ini','lcc.exe',
						'scripts\new.sqf','new.sqf','Dayz Hack v 1.0.exe','dayz cheat\lcc.exe','Scripts\@Hak_script\1.GLAVNOYE\000.sqf','cheater.sqf',
						'@Hak_script\1.GLAVNOYE\000.sqf','scripts\2dmap.sqf','2dmap.sqf','scripts\addweapon.sqf','addweapon.sqf','scripts\ammo 2.sqf',
						'ammo 2.sqf','DayZ-Injector v.0.2.2.exe','DayZ AimJunkies.exe','CheatDayZUniversal.exe','DayZ Private AIM,MAP,WH v1.2.exe',
						'AimJunkies.exe','FABISDayZLauncher.exe','gluemenu.sqf','DayZ Item spawner.exe','Dayz AIM ESP Shield.exe','ChernoNuke.sqf',
						'Scripts\Menu_Scripts\ChernoNuke.sqf','Menu_Scripts\ChernoNuke.sqf','Nuke.sqf','Scripts\Menu_Scripts\NWAFNuke.sqf',
						'NWAFNuke.sqf','Scripts\Menu_Scripts\newsbanner.sqf','newsbanner.sqf','Scripts\Menu_Scripts\ElektroNuke.sqf',
						'ElektroNuke.sqf','Scripts\Nuke.sqf','Scripts\different_AK\AKS-74 Kobra.sqf','Scripts\ESP\esp_TEST.sqf',
						'ESP\esp_TEST.sqf','esp_TEST.sqf','esp.sqf','Scripts\GodMode.sqf','GodMode.sqf','Scripts\God mode 1.sqf',
						'God mode 1.sqf','MapHack.sqf','infiSTAR_chewSTAR_Menu\all_misc\nukes\nuke.sqf','@Hak_script\1.Teleport.sqf',
						'TheBatmanHack v2.6.exe','X-ray.exe','Project1.exe','Dayz injector-by vovan.exe','explode_all.sqf','explode.sqf',
						'Ubu5Ukg3.sqf','customizethis.sqf','Z__i_n_f_i_S_T_A_R__Z\Run.sqf','Missions\infiSTAR_SEVEN\startup.sqf',
						'Missions\infiSTAR_SSH\startup.sqf','renamethis.sqf','round2\runthis.sqf','safe scripts\gm.sqf','scr\exec.sqf',
						'Scripts\exec.sqf','scrollz\tp.sqf','Settings36.ini','ShadowyFaze\exec.sqf','infiSTAR_BLACK\Startup.sqf',
						'Settings230.ini','infiSTAR_NEW\Startup.sqf','Settings##.ini','DayZ_Settings.txt','Optix_DayZ_Auto.txt','ldr.cnf',
						'Aspire Menu v.0.5\ALL TEH SCRIPTS!\esp.sqf','Aspire Menu v.0.5\ALL TEH SCRIPTS!\heal.sqf','SpawnTool.exe','LoganNZL\LoganNZL@execute.sqf',
						'LoganNZL\LoganNZL@start.sqf','LoganNZL@start.sqf','nightsuck.sqf','Project1_[www.unknowncheats.me]_.exe','wuat\RUN.sqf',
						'Missions\Project1_[www.unknowncheats.me]_.exe','Expansion\Project1_[www.unknowncheats.me]_.exe','wuat\Scripts.txt','wuat\start1.sqf',
						'GiveItTheDLL.exe','Missions\GiveItTheDLL.exe','Expansion\GiveItTheDLL.exe','dll\GiveItTheDLL.exe','Scripts\GiveItTheDLL.exe',
						'spawner.dll','Missions\spawner.dll','Expansion\spawner.dll','dll\spawner.dll','Scripts\spawner.dll','wuat\scripts\runMagicaly.sqf',
						'inject.bat','Missions\inject.bat','Expansion\inject.bat','dll\inject.bat','Scripts\inject.bat','wuat\screen2.sqf','wuat\standalonemenu.sqf',
						'spawner\GiveItTheDLL.exe','spawner\Missions\GiveItTheDLL.exe','spawner\Expansion\GiveItTheDLL.exe','spawner\dll\GiveItTheDLL.exe','spawner\Scripts\GiveItTheDLL.exe',
						'spawner\spawner.dll','spawner\Missions\spawner.dll','spawner\Expansion\spawner.dll','spawner\dll\spawner.dll','spawner\Scripts\spawner.dll',
						'spawner\inject.bat','spawner\Missions\inject.bat','spawner\Expansion\inject.bat','spawner\dll\inject.bat','spawner\Scripts\inject.bat',
						'infiSTAR_SSH\setup\startup.sqf','Supplys\BBstart.sqf','TM\666.sqf','vscripts\Startup.sqf','Ronnie\Startup.sqf','MyScripts\cargo.sqf',
						'BE\update.sqf','ScriptBasic.sqf','ScriptTelePlayer.sqf','lol.sqf','teststartup.sqf'
					]+_m;
					_c = 0;
					{
						_c = _c + 1;
						if (_c >= 10) then
						{
							_c = 0;
							uiSleep 0.5;
						};
						_f = preprocessFileLineNumbers _x;
						if (_f != '') then
						{
							[] spawn "+_randvar2+";
							_log = format['Читерский файл: %1 - %2',_x,_f];
							"+_randvar10+" = [name player, getPlayerUID player, toArray (_log), toArray ('BANNED')];
							publicVariableServer '"+_randvar10+"';
						};
						true
					} count _farray;
					uiSleep 500;
				};
			};
		};
		"+_randvar4+" = {
			_bkey = _this select 0;
			_log = format['<АнтиЧит>: Данная кнопка запрещена! (%1)',_bkey];
			cutText [_log,'WHITE IN'];
			hint _log;
			
			if (isNil 'BadKeyCount') then { BadKeyCount = 0; } else { if (typeName BadKeyCount != 'SCALAR') then { BadKeyCount = 0; }; };
			BadKeyCount = BadKeyCount + 1;
			if ("+str _BKK+") then
			{
				if (BadKeyCount > 2) then
				{
					[] spawn "+_randvar2+";
				}
				else
				{
					if (BadKeyCount > 1) then
					{
						[_bkey] spawn {
							endLoadingScreen;
							_warning = format['Внимание! Вы нажимаете запрещенную кнопку! (%1)',_this select 0];
							startLoadingScreen [_warning,'RscDisplayLoadCustom'];
							disableUserInput true;disableUserInput true;disableUserInput true;
							uiSleep 10;
							disableUserInput false;disableUserInput false;disableUserInput false;
							endLoadingScreen;
						};
					};
				};
			};
			
			_log = format['Запрещенная кнопка: %1',_bkey];
			"+_randvar10+" = [name player, getPlayerUID player, _log];
			publicVariableServer '"+_randvar10+"';
		};
		"+_randvar6+" = {
			_key = _this select 1;
			_shift = _this select 2;
			_ctrl = _this select 3;
			_alt = _this select 4;
			_unit = player;
			if ((_key == 0x3E) && (_alt)) then
			{
				_isInCombat = _unit getVariable['startcombattimer',0];
				if (str _isInCombat != '0') then
				{
					[] spawn (compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_death.sqf');
					player setHit['Body',1];
				};
			};
			if (_key == ("+str _OpenMenuKey+")) then {['Кнопка панели администратора'] spawn "+_randvar4+";};
			if (_key == ("+str _ODK+")) then {[] spawn fnc_debugX0;};
			if (_key == 0x29) then {['Тильда - Возможен запуск меню читов'] spawn "+_randvar4+";};
			if ((_key == 0x57) && (_alt)) then {['ALT-F11'] spawn "+_randvar4+";};
			if (_key == 0x3B) then {['F1 - Возможен запуск меню читов'] spawn "+_randvar4+";};
			if (_key == 0x3C) then {['F2 - Возможен запуск меню читов'] spawn "+_randvar4+";};
			if (_key == 0x3D) then {['F3 - Возможен запуск меню читов'] spawn "+_randvar4+";};
		};
		if ("+str _VON+") then {
			[] spawn {
				disableSerialization;
				_cntchat = 0;
				while {1 == 1} do
				{
					_display1 = findDisplay 55;
					_display2 = findDisplay 63;
					if ((!isNull _display1) && (!isNull _display2)) then 
					{
						_cChan = ctrlText ((findDisplay 63) displayCtrl 101);
						_txtchk2 = localize 'STR_SIDE_CHANNEL';
						_txtchk3 = localize 'STR_GLOBAL_CHANNEL';
						if ((_cChan == _txtchk2) || (_cChan == _txtchk3)) then
						{
							_txt = ('<АнтиЧит>\ВНИМАНИЕ! Разговоры в глобальный канал запрещены!');
							cutText [format['%1',_txt], 'PLAIN'];
							hint _txt;
							_cntchat = _cntchat + 1;
							if (_cntchat >= 5) then
							{
								[] spawn "+_randvar2+";
							};
						};
					};
					uiSleep 0.5;
				};
			};
		};
		[_name,_puid] spawn {
			_name = _this select 0;_puid = _this select 1;
			_FTG = ("+str _FTG+");
			_TraderDialogBuy = {
				private ['_index', '_item', '_data'];
				_index = _this select 0;
				if (_index < 0) exitWith {
					cutText [(localize 'str_epoch_player_6'), 'PLAIN DOWN'];
				};
				_item = TraderItemList select _index;
				_data = [_item select 0, _item select 3, 1, _item select 2, 'buy', _item select 4, _item select 1, _item select 8];
				[0, player, '', _data] execVM (_item select 9);
				TraderItemList = -1;
			};
			TraderDialogBuy = _TraderDialogBuy;
			_TraderDialogSell = {
				private ['_index', '_item', '_data'];
				_index = _this select 0;
				if (_index < 0) exitWith {
					cutText [(localize 'str_epoch_player_6'), 'PLAIN DOWN'];
				};
				_item = TraderItemList select _index;
				_data = [_item select 6, _item select 0, _item select 5, 1, 'sell', _item select 1, _item select 7, _item select 8];
				[0, player, '', _data] execVM (_item select 9);
				TraderItemList = -1;
			};
			TraderDialogSell = _TraderDialogSell;
			_BIS_Effects_globalEvent =
			{
				BIS_effects_gepv = _this;
				publicVariable 'BIS_effects_gepv';
				_this call BIS_Effects_startEvent;
			};
			BIS_Effects_globalEvent = _BIS_Effects_globalEvent;
			_BIS_Effects_startEvent =
			{
				switch (_this select 0) do
				{
					case 'AirDestruction':{
						[_this select 1] spawn BIS_Effects_AirDestruction;
					};
					case 'AirDestructionStage2':{
						[_this select 1, _this select 2, _this select 3] spawn BIS_Effects_AirDestructionStage2;
					};
					case 'Burn':{
						[_this select 1, _this select 2, _this select 3, false, true] spawn BIS_Effects_Burn;
					};
				};
			};
			BIS_Effects_startEvent = _BIS_Effects_startEvent;
			while {1 == 1} do
			{
				if (str _BIS_Effects_globalEvent != str BIS_Effects_globalEvent) then
				{
					[] spawn "+_randvar2+";
					_log = format['BIS_Effects_globalEvent изменен: %1 @%2 %3',_ltxt,getPosATL player,BIS_Effects_globalEvent];
					"+_randvar10+" = [_name, _puid, toArray (_log), toArray ('BANNED')];
					publicVariableServer '"+_randvar10+"';
				};
				if (str _BIS_Effects_startEvent != str BIS_Effects_startEvent) then
				{
					[] spawn "+_randvar2+";
					_log = format['BIS_Effects_startEvent изменен: %1 @%2 %3',_ltxt,getPosATL player,BIS_Effects_startEvent];
					"+_randvar10+" = [_name, _puid, toArray (_log), toArray ('BANNED')];
					publicVariableServer '"+_randvar10+"';
				};
				_ltxt = lbtext [12001,0];
				if (str _TraderDialogBuy != str TraderDialogBuy) then
				{
					[] spawn "+_randvar2+";
					_log = format['TraderDialogBuy изменен: %1 @%2 %3',_ltxt,getPosATL player,TraderDialogBuy];
					"+_randvar10+" = [_name, _puid, toArray (_log), toArray ('BANNED')];
					publicVariableServer '"+_randvar10+"';
				};
				if (str _TraderDialogSell != str TraderDialogSell) then
				{
					[] spawn "+_randvar2+";
					_log = format['TraderDialogSell изменен: %1 @%2 %3',_ltxt,getPosATL player,TraderDialogSell];
					"+_randvar10+" = [_name, _puid, toArray (_log), toArray ('BANNED')];
					publicVariableServer '"+_randvar10+"';
				};
				if (!isNil 'TraderItemList') then
				{
					if (typeName TraderItemList == 'CODE') then
					{
						[] spawn "+_randvar2+";
						_log = format['Активное меню:   Меню торговли без продавца! #1 - %1 @%2',_ltxt,getPosATL player];
						"+_randvar10+" = [_name, _puid, toArray (_log), toArray ('BANNED')];
						publicVariableServer '"+_randvar10+"';
					};
				};
				
				_cwep = currentWeapon player;
				if (_cwep != '') then
				{
					_cammo = player ammo _cwep;
					if (abs _cammo > 100000) then
					{
						[] spawn "+_randvar2+";
						"+_randvar10+" = [name player,getPlayerUID player,toArray ('AmmoCheck'),toArray (str(_cammo))];
						publicVariableServer '"+_randvar10+"';
					};
				};
				if (str(unitRecoilCoefficient player) != str(1)) then
				{
					[] spawn "+_randvar2+";
					"+_randvar10+" = [_name,_puid, toArray ('NoRecoil'), toArray (unitRecoilCoefficient player)];
					publicVariableServer '"+_randvar10+"';
				};
				vehicle player setUnitRecoilCoefficient 1;
				player setUnitRecoilCoefficient 1;
				setTerrainGrid _FTG;
				if ((groupIconsVisible select 0) || (groupIconsVisible select 1)) then
				{
					[] spawn "+_randvar2+";
					"+_randvar10+" = [_name, _puid, toArray 'GroupIcons', toArray (str groupIconsVisible)];
					publicVariableServer '"+_randvar10+"';
				};
				setGroupIconsVisible [false,false];
				BIS_fnc_spawnCrew = {};
				BIS_fnc_spawnGroup = {};
				BIS_fnc_help = {};
				bis_fnc_3Dcredits = {};
				BIS_fnc_crows = {};
				bis_fnc_customGPS = {};
				bis_fnc_destroyCity = {};
				BIS_fnc_dirIndicator = {};
				bis_fnc_spawnvehicle = {};
				BIS_fnc_spawnEnemy = {};
				BIS_fnc_AAN = {};
				bis_fnc_taskPatrol = {};
				bis_fnc_taskDefend = {};
				BIS_fnc_taskAttack = {};
				BIS_fnc_supplydrop = {};
				BIS_fnc_spotter = {};
				BIS_fnc_listPlayers = {};
				bis_fnc_customGPSvideo = {};
				if (isNil 'deathHandled') then { deathHandled = true; } else { if (typeName deathHandled != 'BOOL') then { deathHandled = true; }; };
				if (deathHandled) then
				{
					[] spawn {
						uiSleep 15;
						(findDisplay 46) closeDisplay 0;
					};
				};
				if ((deathHandled) && (r_player_blood > 0)) then
				{
					r_player_blood = -500;
					uiSleep 0.2;
					if (r_player_blood > 0) then
					{
						[] spawn (compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_death.sqf');
						player setHit['Body',1];
						[] spawn "+_randvar2+";
						"+_randvar10+" = [_name, _puid, 'Godmode','',''];
						publicVariableServer '"+_randvar10+"';
					};
				};
				if ((!deathHandled) && (r_player_blood < 0)) then
				{
					[] spawn (compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_death.sqf');
					player setHit['Body',1];
				};
				uiSleep 0.5;
				_con = cameraOn;
				_veh = vehicle player;
				if (str _con != str _veh) then
				{
					if ((_veh distance ("+str _mPos+") > 250) && (_con distance ("+str _mPos+") > 250) && (_con distance _veh > 150)) then
					{
						[] spawn "+_randvar2+";
						_log = format['Читерская камера: (%1) должна быть (%2)',_con,_veh];
						"+_randvar10+" = [_name, _puid, _log,'',''];
						publicVariableServer '"+_randvar10+"';
					};
				};
				if (!isNull (findDisplay -1)) then
				{
					_state = true;
					{
						if ((!isNull _x) && (alive _x) && (getPlayerUID _x == '') && !(_x isKindOf 'zZombie_Base') && !(_x isKindOf 'CAAnimalBase')) exitWith
						{
							_state = false;
						};
					} forEach (player nearEntities ['Man',30]);
					if (_state) then
					{
						lbClear 12001;
					};
				};
			};
		};
		[] spawn {
			uiSleep 5;
			while {1 == 1} do
			{
				BVCR = nil;
				uiSleep 15;
				if (isNil 'BVCR') then
				{
					[] spawn {
						uiSleep 5;
						if (isNil 'BVCR') then
						{
							BVCR = false;
							[] spawn "+_randvar2+";
							_log = format['Проверка переменных: %1',BVCR];
							"+_randvar10+" = [name player, getPlayerUID player,toArray (_log), toArray ('BANNED')];
							publicVariableServer '"+_randvar10+"';
						};
					};
				};
			};
		};
		[] spawn {
			vehicle_getHitpoints = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\vehicle_getHitpoints.sqf';
			_getHitpoints = vehicle_getHitpoints;
			_adminlist = ("+(str _allAdmins)+");
			while {1 == 1} do
			{
				_veh = vehicle player;
				if (_veh != player) then
				{
					_state = true;
					{
						_puid = getPlayerUID _x;
						if (_puid in _adminlist) then
						{
							_state = false;
						};
					} forEach (crew _veh);
					if (_state) then
					{
						_hitPoints = _veh call _getHitpoints;
						{
							_selection = getText (configFile >> 'CfgVehicles' >> (typeof _veh) >> 'HitPoints' >> _x >> 'name');
							_v = _veh getVariable [('hit_'+_selection),-1];
							if (_v >= 0.98) then
							{
								if (canMove _veh) then
								{
									_vc = _selection;
									_vs = toArray _selection;
									if (count _vs > 5) then
									{
										_vs resize 5;
										_vs = toString _vs;
										_vc = _vs;
									};
									if (_vc in ['wheel','motor']) then
									{
										{
											if (!isNull _x) then
											{
												_x action ['eject',_veh];
											};
										} forEach (crew _veh);
										uiSleep 1;
										(driver _veh) setDamage 5;
										(vehicle _veh) setDamage 5;
									};
								};
							};
						} count _hitPoints;
					};
				};
				uiSleep 5;
			};
		};
	};
	[_name,_puid] spawn {
		_name = _this select 0;_puid = _this select 1;
		_idcount = 0;
		_dayz_characterID = dayz_characterID;
		disableSerialization;
		while {1 == 1} do
		{
			if (str(player) == '<NULL-object>') then
			{
				[] spawn "+_randvar2+";
				"+_randvar10+" = [_name,_puid,(format['Игрок %1 (КИК)',str(player)]),'',''];
				publicVariableServer '"+_randvar10+"';
			};
			if (typeName player != 'OBJECT') then
			{
				[] spawn "+_randvar2+";
				"+_randvar10+" = [_name,_puid,(format['Игрок %1 (КИК)',str(typename player)]),'',''];
				publicVariableServer '"+_randvar10+"';
			};
			_characterID = player getVariable['CharacterID','-1'];
			if !(_characterID in ['-1',_dayz_characterID]) then
			{
				_idcount = _idcount + 1;
				_characterID = player getVariable['CharacterID','-1'];
				if (!(_characterID in ['-1',_dayz_characterID]) && (_idcount >= 15)) then
				{
					[] spawn "+_randvar2+";
					_log = format['Remote Control (%1/%2) %3',_characterID,_dayz_characterID,typeOf player];
					"+_randvar10+" = [_name,_puid,_log,'',''];
					publicVariableServer '"+_randvar10+"';
				};
			};
			if ((isNil 'dayz_playerName') || (dayz_playerName != _name) || ((name player != 'Error: No unit') && (_name != name player) && (getPlayerUID player != ''))) then
			{
				[] spawn "+_randvar2+";
				_log = format['dayz_playerName   не совпадает с именем (%1/%2) | %2 контролирует %1 ?',dayz_playerName,name player];
				"+_randvar10+" = [_name,_puid,_log,'',''];
				publicVariableServer '"+_randvar10+"';
				player setDamage 5;
			};
			_bodyName = player getVariable ['bodyName','unknown'];
			if (_bodyName == 'unknown') then {player setVariable ['bodyName',dayz_playerName,true];};
			_display = findDisplay 24;
			if (isNull _display) then
			{
				uiSleep 0.3;
			}
			else
			{
				_chat = _display displayCtrl 101;
				_txt = ctrlText _chat;
				_txtArray = toArray _txt;
				if ((_txtArray select 0) in [44,36,37,38,92,124,194,176,45,95,60,62]) then {_chat ctrlSetText '';};
				if (_txt in ['/scream','scream']) then
				{
					(_display) closeDisplay 0;
					_sound = ['z_scream_3','z_scream_4'] call BIS_fnc_selectRandom;
					[nil,player,rSAY,[_sound,250]] call RE;
					[player,500,true,(getPosATL player)] spawn player_alertZombies;
				};
				_chatFunctions =
				[
					'stop','/stop','pushup','/pushup','handstand','/handstand','boxing','/boxing',
					'marts','/marts','karate','/karate','fighter','/fighter','boogie','/boogie',
					'dance','/dance','clubbing','/clubbing','excercise','/excercise'
				];
				if (_txt in _chatFunctions) then
				{
					if (count (nearestObjects [player, ['Plastic_Pole_EP1_DZ'], 45]) == 0) then
					{
						if (_txt in ['stop','/stop']) then
						{
							(_display) closeDisplay 0;
							[objNull, player, rplayMove,''] call RE;
						};
						if (_txt in ['pushup','/pushup']) then
						{
							(_display) closeDisplay 0;
							[objNull, player, rplayMove,'AmovPercMstpSnonWnonDnon_exercisePushup'] call RE;
						};
						if (_txt in ['handstand','/handstand']) then
						{
							(_display) closeDisplay 0;
							[objNull, player, rplayMove,'AmovPercMstpSnonWnonDnon_idle70chozeniPoRukou'] call RE;
						};
						if (_txt in ['boxing','/boxing']) then
						{
							(_display) closeDisplay 0;
							[objNull, player, rplayMove,'AmovPercMstpSnonWnonDnon_idle68boxing'] call RE;
						};
						if (_txt in ['marts','/marts','karate','/karate','fighter','/fighter']) then
						{
							(_display) closeDisplay 0;
							[objNull, player, rplayMove,'AmovPercMstpSnonWnonDnon_exerciseKata'] call RE;
						};
						if (_txt in ['boogie','/boogie']) then
						{
							(_display) closeDisplay 0;
							[objNull, player, rplayMove,'ActsPercMstpSnonWnonDnon_DancingDuoIvan'] call RE;
						};                             
						if (_txt in ['dance','/dance']) then
						{
							(_display) closeDisplay 0;
							[objNull, player, rplayMove,'ActsPercMstpSnonWnonDnon_DancingStefan'] call RE;
						};
						if (_txt in ['clubbing','/clubbing']) then
						{
							(_display) closeDisplay 0;
							[objNull, player, rplayMove,'ActsPercMstpSnonWnonDnon_DancingDuoStefan'] call RE;
						};
						if (_txt in ['excercise','/excercise']) then
						{
							(_display) closeDisplay 0;
							[objNull, player, rplayMove,'AmovPercMstpSnonWnonDnon_idle69drepy'] call RE;
						};
					};
				};
				if !(_puid in ("+(str _allAdmins)+")) then
				{
					_txt2 = format['.ban %1',_name];
					if (_txt == _txt2) then
					{
						_log = format['Плохой текст: %1',_txt];
						"+_randvar10+" = [_name,_puid,toArray (_log), toArray ('BANNED')];
						publicVariableServer '"+_randvar10+"';
					};
				};
			};
			uiSleep 0.2;
		};
	};
	[] spawn {
		_colorTXT = "+(str _EscColor)+";
		_btnTitle0TXT = "+(str _TopOfESC)+";
		_btnTitle1TXT = "+(str _LowerTop)+";
		_btnTitle2TXT = "+(str _LowerBottom)+";
		disableSerialization;
		while {1 == 1} do
		{
			waitUntil {!isNull findDisplay 49};
			_display = findDisplay 49;
			_btnSave = _display displayCtrl 103;
			_btnSave ctrlShow true;
			_btnSave ctrlEnable false;
			_btnSave ctrlSetScale 0.85;
			_btnSave ctrlSetText 'PlayerUID:';
			_btnSave ctrlCommit 0;
			
			_btnRestart = _display displayCtrl 119;
			_btnRestart ctrlShow true;
			_btnRestart ctrlEnable false;
			_btnRestart ctrlSetScale 0.85;
			_btnRestart ctrlSetText (format['%1',getPlayerUID player]);
			_btnRestart ctrlCommit 0;
			
			_btnRespawn = _display displayCtrl 1010;
			_btnRespawn ctrlShow true;
			_btnRespawn ctrlSetScale 0.85;
			if ((canStand player) || (deathHandled)) then
			{
				_btnRespawn ctrlEnable false;
				_btnRespawn ctrlSetText 'vk.com/dayz_ultima';
			}
			else
			{
				_btnRespawn ctrlEnable true;
				_btnRespawn ctrlSetText 'Возрождение';
			};
			fnc_btnRespawn = {
				[] spawn (compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_death.sqf');
				player setHit['Body',1];
			};
			_btnRespawn buttonSetAction 'call fnc_btnRespawn;';
			_btnRespawn ctrlCommit 0;
			
			_btnTitle0 = _display displayCtrl 523;
			_btnTitle0 ctrlSetText _btnTitle0TXT;
			_btnTitle0 ctrlSetTextColor _colorTXT;
			_btnTitle0 ctrlSetScale 0.9;
			_btnTitle0 ctrlCommit 0;
			
			_btnTitle1 = _display displayCtrl 121;
			_btnTitle1 ctrlSetText _btnTitle1TXT;
			_btnTitle1 ctrlSetTextColor _colorTXT;
			_btnTitle1 ctrlSetScale 0.75;
			_btnTitle1 ctrlCommit 0;
			
			_btnTitle2 = _display displayCtrl 120;
			_btnTitle2 ctrlSetText _btnTitle2TXT;
			_btnTitle2 ctrlSetTextColor _colorTXT;
			_btnTitle2 ctrlSetScale 0.75;
			_btnTitle2 ctrlCommit 0;
			
			
			_playerObj = player;
			_bcpk = unitBackpack _playerObj;
			if (!isNull _bcpk) then
			{
				_bcpkT = typeOf _bcpk;
				{
					_exit = false;
					_obj = _x;
					if (!isNull _obj) then
					{
						_bpc = getBackpackCargo _obj;
						if (str _bpc != '[[],[]]') then
						{
							_types = _bpc select 0;
							if (_bcpkT in _types) then
							{
								_btnAbort = _display displayCtrl 104;
								_btnAbort ctrlEnable false;
								_btnAbort ctrlShow true;
								_btnAbort ctrlCommit 0;
								hint 'Вы не можете выйти возле хранилища!';
								_exit = true;
							};
						};
					};
					if (_exit) exitWith {};
				} forEach (nearestObjects [_playerObj, ['All'],4]);
			};
		};
	};
	[] spawn {
		_tmpRE = compile preprocessFile ('\ca\Modules\MP\data\scripts\remExWrite.sqf');
		while {1 == 1} do
		{
			if (isNil 's_player_deleteBuild') then {s_player_deleteBuild = -1;};
			if (s_player_deleteBuild == 1) then
			{
				_obj = cursorTarget;
				if (!isNull _obj) then
				{
					if (typeOf _obj == 'Plastic_Pole_EP1_DZ') then
					{
						if (isNil 'deleteBuildAnnounced') then {deleteBuildAnnounced = [];};
						if !(_obj in deleteBuildAnnounced) then
						{
							deleteBuildAnnounced = deleteBuildAnnounced + [_obj];
							_pos = getPosATL _obj;
							_log = format['База удалена @%1',mapGridPosition _pos];
							"+_randvar10+" = [name player,getPlayerUID player,_log];
							publicVariableServer '"+_randvar10+"';
						};
					};
				};
			};
			
			if (!isNil 'dze_isnearest_player') then
			{
				if (isNil 'odze_isnearest_player') then {odze_isnearest_player = dze_isnearest_player;};
				dze_isnearest_player = {
					private ['_return'];
					_return = _this call odze_isnearest_player;
					if (!DZE_CanPickup && _return) then {DZE_CanPickup = true;};
					_return
				};
			};
			if (alive player) then
			{
				if (!isNil 'infiSTAR_BLACKLISTED"+_randvar5+"') then
				{
					_name = name player;
					_puid = getPlayerUID player;					
					if (_puid != '') then
					{
						{
							if (_name == _x) then
							{
								[] spawn "+_randvar2+";
								"+_randvar10+" = [_x,_puid,toArray _x,toArray ('NAME IS BLACKLISTED')];
								publicVariableServer '"+_randvar10+"';
							};
							if (_puid == _x) then
							{
								[] spawn "+_randvar2+";
								"+_randvar10+" = [_name,_x,toArray _x,toArray ('PlayerUID IS BLACKLISTED')];
								publicVariableServer '"+_randvar10+"';
							};
						} forEach infiSTAR_BLACKLISTED"+_randvar5+";
					};
				};
			};
			if (!isNil 'player_lockVault') then
			{
				if (isNil 'oplayer_lockVault') then {oplayer_lockVault = player_lockVault;};
				player_lockVault =
				{
					_y = _this spawn oplayer_lockVault;
					[] spawn {
						_time = time + 10;
						while {_time > time} do
						{
							if (!isNull (findDisplay 106)) then
							{
								_log = format['АнтиДюп - Подождите %1с для открытия инвентаря.',round (_time - time)];
								cutText [_log,'PLAIN'];
								hint _log;
								(findDisplay 106) closeDisplay 0;
								closeDialog 0;
							};
							uiSleep 0.1;
						};
					};
					_y
				};
			};
			if (!isNil 'player_unlockDoor') then
			{
				if (isNil 'oplayer_unlockDoor') then {oplayer_unlockDoor = player_unlockDoor};
				player_unlockDoor = {
					disableSerialization;
					if (!isNil 'dayz_selectedDoor') then
					{
						if (!isNull dayz_selectedDoor) then
						{
							if (isNil 'DZE_Lock_Door') then {DZE_Lock_Door = 'NOTHING ENTERED';};
							_CharacterID = dayz_selectedDoor getVariable ['CharacterID','0'];
							PVDZE_log_lockUnlock = [player, dayz_selectedDoor, false,DZE_Lock_Door,_CharacterID];
							publicVariableServer 'PVDZE_log_lockUnlock';
							if (DZE_Lock_Door == _CharacterID) then
							{
								UnlockDoorTryCount = nil;
							}
							else
							{
								if (isNil 'UnlockDoorTryCount') then
								{
									UnlockDoorTryCount = 0;
									[] spawn {
										_time = time;
										waitUntil {time > time + 30};
										UnlockDoorTryCount = nil;
									};
								};
								if (!isNil 'UnlockDoorTryCount') then
								{
									UnlockDoorTryCount = UnlockDoorTryCount + 1;
									if (UnlockDoorTryCount > 3) then
									{
										UnlockDoorTryCount = nil;
										fnc_usec_unconscious = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\fn_unconscious.sqf';
										r_player_timeout = 30;
										r_player_unconscious = true;
										player setVariable ['medForceUpdate',true,true];
										player setVariable ['unconsciousTime', r_player_timeout, true];
										player setVariable ['NORRN_unconscious', true, true];
										player switchMove 'AmovPpneMrunSnonWnonDfr';
										[] spawn {
											disableUserInput true;disableUserInput true;disableUserInput true;
											waitUntil {!r_player_unconscious};
											disableUserInput false;disableUserInput false;disableUserInput false;
										};
									};
								};
							};
						};
					};
					_y = _this call oplayer_unlockDoor;
					_y
				};
			};
			if (!isNil 'player_humanityMorph') then
			{
				if (isNil 'oplayer_humanityMorph') then {oplayer_humanityMorph = player_humanityMorph};
				player_humanityMorph = {
					if (typeOf player == (_this select 2)) exitWith {cutText ['На вас уже одета данная одежда!', 'PLAIN'];};
					closeDialog 0;closeDialog 0;closeDialog 0;
					_result = _this spawn oplayer_humanityMorph;
					_result
				};
			};
			if ("+str _ARF+") then
			{
				BIS_MPF_remoteExecutionServer = {
					private ['_tmpRES','_array','_input','_inputPersistentFnc','_codePersistent','_this'];
					_tmpRES = compile preprocessFile ('\ca\Modules\MP\data\scripts\remExServer.sqf');
					_array = _this select 1;
					_input = _array select 2;
					if (_input in ['switchmove','playmove','say','jipexec','execVM','spawn','titleText','hint','globalChat','setObjectTexture']) exitWith
					{
						_this call _tmpRES;
					};
					if (_input in ['loc','locper','perloc','per']) exitWith
					{
						_inputPersistentFnc = _array select 3;
						if (_inputPersistentFnc == 'hideObject') exitWith
						{
							_obj = _array select 1;
							if ((!isNull _obj) && !(isPlayer _obj)) exitWith
							{
								_this call _tmpRES;
							};
						};
						if (_inputPersistentFnc == 'titleText') exitWith
						{
							_this call _tmpRES;
						};
						if (count _array > 3) then
						{
							_codePersistent = _array select 4;
							if ((_inputPersistentFnc == 'JIPexec') && (typeName _codePersistent == 'ARRAY')) exitWith
							{
								if (_codePersistent select 3 == 'execVM') exitWith {_this call _tmpRES;};
							};
							if ((_inputPersistentFnc == 'execVM') && (typeName _codePersistent == 'STRING')) exitWith
							{
								if (_codePersistent == 'ca\Modules\Functions\init.sqf') exitWith {_this call _tmpRES;};
							};
						};
					};
				};
			}
			else
			{
				BIS_MPF_remoteExecutionServer = {
					private ['_tmpRES','_array','_input','_inputPersistentFnc','_codePersistent','_this'];
					_tmpRES = compile preprocessFile ('\ca\Modules\MP\data\scripts\remExServer.sqf');
					_array = _this select 1;
					_input = _array select 2;
					if (_input in ['switchmove','playmove','say','jipexec','execVM']) exitWith
					{
						_this call _tmpRES;
					};
					if (_input in ['loc','locper','perloc','per']) exitWith
					{
						_inputPersistentFnc = _array select 3;
						if (_inputPersistentFnc == 'hideObject') exitWith
						{
							_obj = _array select 1;
							if ((!isNull _obj) && !(isPlayer _obj)) exitWith
							{
								_this call _tmpRES;
							};
						};
						if (count _array > 3) then
						{
							_codePersistent = _array select 4;
							if ((_inputPersistentFnc == 'JIPexec') && (typeName _codePersistent == 'ARRAY')) exitWith
							{
								if (_codePersistent select 3 == 'execVM') exitWith {_this call _tmpRES;};
							};
							if ((_inputPersistentFnc == 'execVM') && (typeName _codePersistent == 'STRING')) exitWith
							{
								if (_codePersistent == 'ca\Modules\Functions\init.sqf') exitWith {_this call _tmpRES;};
							};
						};
					};
				};
			};
			_puid = getPlayerUID player;
			if (_puid != '') then
			{
				player setVariable ['"+_randvar3+"',_puid,true];
			};
			if (isNil 'PlayableVehicles') then {PlayableVehicles = [];};
			if (isNil 'PlayableObjects') then {PlayableObjects = [];};
			{
				if (!isNull _x) then
				{
					_x hideObject true;
					if !(_x in PlayableVehicles) then {PlayableVehicles = PlayableVehicles + [_x];};
				};
			} forEach PlayableObjects;
			{
				if (!isNull _x) then
				{
					if !(_x in PlayableObjects) then
					{
						_x hideObject false;
						PlayableVehicles = PlayableVehicles - [_x];
					};
				};
			} forEach PlayableVehicles;
			{
				if (isNull _x) then {PlayableVehicles = PlayableVehicles - [_x];};
			} forEach PlayableVehicles;
			if (!isNil 'admin_toggled') then
			{
				_log = '  Stealth';
				if ((player in PlayableObjects) && !(_log in admin_toggled)) then
				{
					admin_toggled = admin_toggled + [_log];
				};
				if (!(player in PlayableObjects) && (_log in admin_toggled)) then
				{
					admin_toggled = admin_toggled - [_log];
				};
			};
			_pid = getPlayerUID player;
			if ((_pid != '') && !(_pid in ("+(str _allAdmins)+")) && (player in PlayableObjects)) then
			{
				[] spawn "+_randvar2+";
				"+_randvar10+" = [name player,_pid,toArray ('InvisibleHack'), toArray ('BANNED')];
				publicVariableServer '"+_randvar10+"';
			};
			'remExField' addPublicVariableEventHandler {_this call BIS_MPF_remoteExecutionServer;};
			'remExFP' addPublicVariableEventHandler {_this call BIS_MPF_remoteExecutionServer;};
			'ACPVEH"+_randvar5+"' addPublicVariableEventHandler {player setVariable ['ACPV"+_randvar5+"',PVAH_AdminReq,true];};
			RE = _tmpRE;
			uiSleep 2;
			if (!isNil 'infiSTAR_UPTIMER') then
			{
				_stime = 0;
				if(serverTime > 36000)then{_stime = time;}else{_stime = serverTime;};
				_upTimeLeft = infiSTAR_UPTIMER - _stime;
				_hours = (_upTimeLeft/60/60);
				_hours = toArray (str _hours);
				_hours resize 1;
				_hours = toString _hours;
				_hours = compile _hours;
				_hours = call  _hours;
				_minutes = floor(_upTimeLeft/60);
				_minutes2 = ((_minutes - (_hours*60)) min 60) max 0;if (_minutes2 < 10) then {_minutes2 = format ['0%1',_minutes2];};
				_time = format ['Рестарт в: %1ч %2мин',_hours,_minutes2];
				['<t size=''0.35'' align=''right'' font=''TahomaB''>'+_time+'</t>',safezoneX*-1,0.98 * safezoneH + safezoneY,15,0,0,1406] spawn bis_fnc_dynamicText;
			};
		};
	};
	[_puid,_name] spawn {
		_puid = _this select 0;_name = _this select 1;
		_worldName = toArray worldName;
		uiSleep 25;
		_worldName resize 9;
		_worldName = toString _worldName;
		_worldName;
		if (_worldName == 'Chernarus') then
		{
			_plants = ['grass','prunus','picea','fallentree','phragmites','acer','amygdalusn','Brush','fiberplant','amygdalusc','boulder'];
			_other = ['Land_Farm_Cowshed_a','Land_Farm_Cowshed_b','Land_Farm_Cowshed_c'];
			_BadPlants = [];
			{
				_obj = _x createVehicleLocal [2500,2500,0];
				uiSleep 0.1;
				_size = sizeOf _x;
				if (_size == 0) then
				{
					_BadPlants = _BadPlants + [_x];
				};
				uiSleep 0.1;
				deleteVehicle _obj;
			} forEach (_plants+_other);
			if (count _BadPlants > 1) then
			{
				[] spawn "+_randvar2+";
				_log = format['Плохой размер: %1 - Удалена растительность - Plants и\или Clutter pbo..!',_BadPlants];
				"+_randvar10+" = [_name, _puid,_log,'',''];
				publicVariableServer '"+_randvar10+"';
			};
		};
	};
	[_puid,_name] spawn {
		_puid = _this select 0;_name = _this select 1;
		_CE1 = ("+(str _CE1)+");
		_CE2 = ("+(str _CE2)+");
		_CE3 = ("+(str _CE3)+");
		_CE4 = ("+(str _CE4)+");
		_CE5 = ("+(str _CE5)+");
		_CE6 = ("+(str _CE6)+");
		_CE7 = ("+(str _CE7)+");
		_CE8 = ("+(str _CE8)+");
		_CE9 = ("+(str _CE9)+");
		_CE10 = ("+(str _CE10)+");
		_CE11 = ("+(str _CE11)+");
		_CE12 = ("+(str _CE12)+");
		_CE13 = ("+(str _CE13)+");
		_CE14 = ("+(str _CE14)+");
		_CEA1 = [_CE1,_CE2,_CE3,_CE4,_CE5,_CE6,_CE7,_CE8,_CE9,_CE10,_CE11,_CE12,_CE13,_CE14];
		while {1 == 1} do
		{
			_CEC1 = (getText(configFile >> 'RscDisplayDSinterface' >> 'onLoad'));
			_CEC2 = (getText(configFile >> 'RscDisplayOptionsVideo' >> 'onLoad'));
			_CEC3 = (getText(configFile >> 'RscDisplayOptionsVideo' >> 'onUnload'));
			_CEC4 = (getText(configFile >> 'RscDisplayGear' >> 'onLoad'));
			_CEC5 = (getText(configFile >> 'RscDisplayInterrupt' >> 'onLoad'));
			_CEC6 = (getText(configFile >> 'RscDisplayInterrupt' >> 'onUnload'));
			_CEC7 = (getText(configFile >> 'RscDisplayProfileController' >> 'onLoad'));
			_CEC8 = (getText(configFile >> 'RscDisplayInterruptEditorPreview' >> 'onLoad'));
			_CEC9 = (getText(configFile >> 'RscDisplayInterruptEditorPreview' >> 'onUnload'));
			_CEC10 = (getText(configFile >> 'RscDisplayMPInterrupt' >> 'onLoad'));
			_CEC11 = (getText(configFile >> 'RscDisplayMPInterrupt' >> 'onUnload'));
			_CEC12 = (getText(configFile >> 'RscDisplayClientGetReady' >> 'onLoad'));
			_CEC13 = (getText(configFile >> 'RscDisplayServerGetReady' >> 'onLoad'));
			_CEC14 = (getText(configFile >> 'RscDisplayOptionsVideo' >> 'controls' >> 'G_VideoOptionsControls' >> 'controls' >> 'HideAdvanced' >> 'OnButtonClick'));				
			_CECA2 = [_CEC1,_CEC2,_CEC3,_CEC4,_CEC5,_CEC6,_CEC7,_CEC8,_CEC9,_CEC10,_CEC11,_CEC12,_CEC13,_CEC14];
			for '_i' from 0 to (count _CEA1)-1 do
			{
				_a = _CEA1 select _i;
				_b = _CECA2 select _i;
				if (str _a != str (toArray _b)) then
				{
					[] spawn "+_randvar2+";
					_log = format['Чит1 %1: %2',_i,_b];
					"+_randvar10+" = [_name,_puid,toArray (_log), toArray ('BANNED')];
					publicVariableServer '"+_randvar10+"';
				};
			};
			uiSleep 0.5;
			if ("+str _UCC+") then
			{
				_LoadTest = ("+(str _LoadTest)+");
				if (isNil 'CESD"+_randvar5+"') then
				{
					{
						_A = _x;
						_cname = _A select 0;
						_OL = _A select 1;
						_OUL = _A select 2;
						_OL1 = toArray(str(getText(configFile >> _cname >> 'onLoad')));
						_OUL1 = toArray(str(getText(configFile >> _cname >> 'onUnload')));
						if (str _OL != str _OL1) then
						{
							[] spawn "+_randvar2+";
							_log = format['Чит2 %1: %2 (%3)',_A select 3,_cname,toString _OL1];
							"+_randvar10+" = [_name,_puid,_log,'',''];
							publicVariableServer '"+_randvar10+"';
							CESD"+_randvar5+" = true;
						};
						if (str _OUL != str _OUL1) then
						{
							[] spawn "+_randvar2+";
							_log = format['Чит2 %1: %2 (%3)',_A select 3,_cname,toString _OUL1];
							"+_randvar10+" = [_name,_puid,_log,'',''];
							publicVariableServer '"+_randvar10+"';
							CESD"+_randvar5+" = true;
						};
					} forEach _LoadTest;
				};
			};
			uiSleep 60;
		};
	};
	if ("+str _UIC+") then
	{
		[_puid,_name] spawn {
			_puid = _this select 0;_name = _this select 1;
			while {1 == 1} do
			{
				uiSleep 3;
				_object = vehicle player;
				if (_object != player) then
				{
					_type = typeOf _object;
					_pos = getPos _object;
					_mgp = mapGridPosition _pos;
					_parachuteWest = ((_type == 'ParachuteWest') || (_type == 'ParachuteC'));
					if (!_parachuteWest && !(locked _object)) then
					{
						_objectID = _object getVariable ['ObjectID','0'];
						_objectUID = _object getVariable ['ObjectUID','0'];
						if (_objectID == '0' && _objectUID == '0') then
						{
							uiSleep 15;
							if (!isNull _object) then
							{
								if (_object == vehicle player) then
								{
									_objectID = _object getVariable ['ObjectID','0'];
									_objectUID = _object getVariable ['ObjectUID','0'];
									if (_objectID == '0' && _objectUID == '0') then
									{
										deleteVehicle _object;
										_log = format['УДАЛЕНИЕ Техника с не правильным ID(0): %1 @%2',_type,_mgp];
										"+_randvar10+" = [_name,_puid,_log];
										publicVariableServer '"+_randvar10+"';
									};
								};
							};
						};
					};
				};
			};
		};
	};
	"+_randvar27+" = true;
	diag_log (format['[АнтиЧит]: randvar1 создал randvar27 (%1)',time]);
	if ("+str _DMS+") then {
		[] spawn {
			if ("+str _DMW+") then {
				[] spawn {
					while {1 == 1} do
					{
						if (isNil 's_player_debug') then {s_player_debug = -1;};
						if (isNil 'unit_veh') then {unit_veh = vehicle player;};
						if (s_player_debug == -1) then
						{
							s_player_debug = unit_veh addAction [('<t color=''#0066CC''>' + ('Отладка') +'</t>'),'ca\modules\MP\data\scriptCommands\moveIn.sqf','Driver ([] spawn fnc_debugX0);',5,false,false,'',''];
						};
						if (unit_veh != vehicle player) then
						{
							unit_veh removeAction s_player_debug;
							unit_veh = nil;
							s_player_debug = -1;
						};
						uiSleep 1.5;
					};
				};
			};
			fnc_debugX0 = {
				if !("+str _DMS+") exitWith {};
				if (isNil 'debugMonitorX') then 
				{
					debugMonitorX = true;
					[] spawn fnc_debugX;
				}
				else
				{
					debugMonitorX = !debugMonitorX;
					hintSilent '';
					[] spawn fnc_debugX;
				};
			};	
			fnc_debugX = {
				admin_debug_run = false;
				_BottomDebug = "+(str _BottomDebug)+";
                 while {debugMonitorX} do
				{
					_pic = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'picture'));
					if (player == vehicle player) then {_pic = (gettext (configFile >> 'cfgWeapons' >> (currentWeapon player) >> 'picture'));
					}else{_pic = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'picture'));};
					
					_txt = '';
					_txt = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'displayName'));
					
					_stime = 0;
					if(serverTime > 36000)then{_stime = time;}else{_stime = serverTime;};
					_hours = (_stime/60/60);
					_hours = toArray (str _hours);
					_hours resize 1;
					_hours = toString _hours;
					_hours = compile _hours;
					_hours = call  _hours;
					_minutes = floor(_stime/60);
					_minutes2 = ((_minutes - (_hours*60)) min 60) max 0;if (_minutes2 < 10) then {_minutes2 = format ['0%1',_minutes2];};
					
					_players = [];
					{
						_y = _x;
						if (isPlayer _y) then
						{
							{_players = _players + [_x];} forEach (crew _y);
						};
					} forEach ([0,0,0] nearEntities ['AllVehicles', 10000000]);
					_pOn = {isPlayer _x} count _players;
					_temperature = round (dayz_temperatur);
					_Isinfected = localize 'Ultima_No';
				    if (r_player_infected) then
						{_Isinfected = localize 'Ultima_Yes';};
					_nearestCity = nearestLocations [getPos player, ['NameCityCapital', 'NameCity', 'NameVillage', 'NameLocal'], 750];
					_textCity = localize 'Ultima_Unknown';
					if (count _nearestCity > 0) then
						{_textCity = text (_nearestCity select 0)};	
					_blood			=	localize 'USD_Blood';
					_temp			=	localize 'USD_Temp';
					_infection		=	localize 'USD_Infection';
					_reputation		=	localize 'USD_Reputation';
					_zombie			=	localize 'USD_Zombie';
					_civil			=	localize 'USD_Civil';
					_bandits		=	localize 'USD_Bandits';
					_cash			=	localize 'USD_Cash';
					_deposite		=	localize 'USD_Deposite';
					_bank			=	localize 'USD_Bank';
					_location		=	localize 'USD_Location';
					_uptime			=	localize 'USD_Uptime';
					_FPS			=	localize 'USD_FPS';
					_hour			=	localize 'Ultima_Hours';
					_minutes		=	localize 'Ultima_Minutes';
					hintSilent parseText format [""
<t size='1' font=%19 align='Center' >[%1]</t><br/>
<t size='1' font=%19 align='Center' >Онлайн: %2</t><br/>
<img size='4.75' image='%3'/><br/>
<t size='0.95' font=%19 align='left' color='#CC0000'>%20</t><t size='0.95' font=%19>%4</t><t size='0.95' font=%19 color='#CC0000' align='right'>%21 </t><t size='0.95' font=%19 align='right'>%5</t><br/>
<t size='0.95' font=%19 align='left' color='#CC0000'>%22</t><t size='0.95' font=%19 align='right'>%6</t><br/>
<t size='0.95' font=%19 align='left' color='#CC0000'>%23</t><t size='0.95' font=%19 align='right'>%7</t><br/><br/>
<t size='0.95' font=%19 align='left' color='#FFBF00'>%24</t><t size='0.95' font=%19 align='right'>%8</t><br/>
<t size='0.95' font=%19 align='left' color='#FFBF00'>%25</t><t size='0.95' font=%19 align='right'>%9</t><br/>
<t size='0.95' font=%19 align='left' color='#FFBF00'>%26</t><t size='0.95' font=%19 align='right'>%10</t><br/><br/>
<t size='0.95' font=%19 align='left' color='#2F4F4F'>%27</t><t size='0.95' font=%19 align='right'>%11</t><br/>
<t size='0.95' font=%19 align='left' color='#2F4F4F'>%28</t><t size='0.95' font=%19 align='right'>%12</t><br/>
<t size='0.95' font=%19 align='left' color='#2F4F4F'>%29</t><t size='0.95' font=%19 align='right'>%13</t><br/><br/>
<t size='0.95' font=%19 align='left' color='#0066CC'>%30</t><t size='0.95' font=%19 align='right'>%14</t><br/>
<t size='0.95' font=%19 align='left' color='#FFBF00'>%31</t><t size='0.95' font=%19>%15%32 %16%33</t><t size='0.95' font=%19 align='right' color='#FFBF00'>%34 </t><t size='0.95' font=%19 align='right'>%17</t><br/>
<t size='0.95' font=%19 align='Center' color='#7B68EE'>%18</t>
"",
_txt,
_pOn,
_pic,
(r_player_blood),
(_temperature),
(_Isinfected),
round (player getVariable['humanity', 0]),
(player getVariable['zombieKills', 0]),
(player getVariable['humanKills', 0]),
(player getVariable['banditKills', 0]),
(player getVariable['Ultima_Cash', -1]),
(player getVariable['Ultima_Deposite', -1]),
(player getVariable['Ultima_Money', -1]),
(_textCity),
_hours,
_minutes2,
(round diag_fps),
'255.255.255.0 2302',
'Bitstream',
_blood,_temp,_infection,_reputation,_zombie,_civil,_bandits,_cash,_deposite,_bank,_location,_uptime,_hour,_minutes,_FPS
];
					uiSleep 1;
				};
			};
			[] spawn fnc_debugX0;
		};
	};
	[] spawn {
		uiSleep 3;
		["+(str _TopOfESC)+","+(str _LowerTop)+","+(str _LowerBottom)+"] spawn BIS_fnc_infoText;
	};
	systemChat ('<АнтиЧит>: Загружен.');
	if ("+str _DMS+") then {systemChat ('<АнтиЧит>: -END- Переключатель монитора отладки');};
	diag_log (format['[АнтиЧит]: 19072014IAHAT332E - Удачно загружен на клиенте ID1010 (%1) | %2 Администрации онлайн',time,({((getPlayerUID _x) in ("+(str _allAdmins)+"))} count ([0,0,0] nearEntities ['AllVehicles', 10000000]))]);
};
'"+_randvar10+"' addPublicVariableEventHandler
{
	_array = _this select 1;
	_cnt = count _array;
	if ((count PV_hackerL0og) > 100) then
	{
		for '_i' from 0 to 49 do
		{
			PV_hackerL0og = PV_hackerL0og - [PV_hackerL0og select 0];
		};
	};
	if ((count PV_SurveillanceLog) > 100) then
	{
		for '_i' from 0 to 49 do
		{
			PV_SurveillanceLog = PV_SurveillanceLog - [PV_SurveillanceLog select 0];
		};
	};
	if (isNil 'LOGGEDTIME') then {LOGGEDTIME = toString [105,110,102,105,83,84,65,82,46,100,101,32,76,111,103,58,32];};
	_stime = 0;
	if(serverTime > 36000)then{_stime = time;}else{_stime = serverTime;};
	_hours = (_stime/60/60);
	_hours = toArray (str _hours);
	_hours resize 1;
	_hours = toString _hours;
	_hours = compile _hours;
	_hours = call  _hours;
	_minutes = floor(_stime/60);
	_minutes2 = ((_minutes - (_hours*60)) min 60) max 0;if (_minutes2 < 10) then {_minutes2 = format ['0%1',_minutes2];};
	if (_cnt == 3) then
	{
		_name = _array select 0;
		_uid = _array select 1;
		_save = _array select 2;
		_log = format ['%1 (%2) | %3',_name,_uid,_save];
		(infiSTAR_DLL_PATH+'SurveillanceLog') callExtension (format['%1%2',_log,DAYZ_INSTANCE_LOGGING]);
		diag_log (LOGGEDTIME+_log);
		
		_log2 = format ['%3ч %4мин | %1 (%2) | %5',_name,_uid,_hours,_minutes2,_save];
		PV_SurveillanceLog = PV_SurveillanceLog + [[[_name,_uid,_log2],'','0','1','0','0',[]]];
		publicVariable 'PV_SurveillanceLog';
	};
	if (_cnt == 4) then
	{
		_autoBan = "+str _UAB+";
		_name = _array select 0;
		_uid = _array select 1;
		if (format['%1',_array select 2] == '[105,110,102,105,83,84,65,82]') exitWith {};
		_save = toString (_array select 2);
		_field = toString (_array select 3);
		_log = format ['%1 (%2) | %3 (%4)',_name,_uid,_save,_field];
		(infiSTAR_DLL_PATH+'HackLog') callExtension (format['%1%2',_log,DAYZ_INSTANCE_LOGGING]);
		diag_log (LOGGEDTIME+_log);
		
		_log2 = format ['%3ч %4мин | %1 (%2) | %5 (%6)',_name,_uid,_hours,_minutes2,_save,_field];
		PV_hackerL0og = PV_hackerL0og + [[_log2,'','0','1','0','0',[]]];
		publicVariable 'PV_hackerL0og';
		"+_randvar13+" = _log2;
		publicVariable '"+_randvar13+"';
		
		if (_autoBan) then
		{
			if (_uid == '') then
			{
				{
					_cuid = getPlayerUID _x;
					if (_cuid != '') then
					{
						if (name _x == _name) then
						{
							_uid = _cuid;
						};
					};
				} forEach playableUnits;
			};
			if (isNil 'PVAH_AHBANA') then {PVAH_AHBANA = [];} else {if (typeName PVAH_AHBANA != 'ARRAY') then {PVAH_AHBANA = [];};};
			if (!(_uid in PVAH_AHBANA) || !(_name in PVAH_AHBANA)) then
			{
				_log = format['%1',_uid];(infiSTAR_DLL_PATH+'infiSTARwriteBan') callExtension (_log);
				PVAH_AHBANA = PVAH_AHBANA + [_uid,_name];
				publicVariable 'PVAH_AHBANA';
			};
		};
	};
	if (_cnt == 5) then
	{
		_name = _array select 0;
		_uid = _array select 1;
		_save = _array select 2;
		_log = format ['%1 (%2) | %3',_name,_uid,_save];
		(infiSTAR_DLL_PATH+'HackLog') callExtension (format['%1%2',_log,DAYZ_INSTANCE_LOGGING]);
		diag_log (LOGGEDTIME+_log);
		
		_log2 = format ['%3ч %4мин | %1 (%2) | %5',_name,_uid,_hours,_minutes2,_save];
		PV_hackerL0og = PV_hackerL0og + [[_log2,'','0','1','0','0',[]]];
		publicVariable 'PV_hackerL0og';
		"+_randvar13+" = _log2;
		publicVariable '"+_randvar13+"';
	};
	if (_cnt > 5) then
	{
		_name = _array select 0;
		_uid = _array select 1;
		_save = _array select 2;
		_log = format ['%1 (%2) | %3',_name,_uid,_save];
		(infiSTAR_DLL_PATH+'HackLog') callExtension (format['%1%2',_log,DAYZ_INSTANCE_LOGGING]);
		diag_log (LOGGEDTIME+_log);
		
		_log2 = format ['%3ч %4мин | %1 (%2) | %5',_name,_uid,_hours,_minutes2,_save];
		PV_hackerL0og = PV_hackerL0og + [[_log2,'','0','1','0','0',[]]];
		publicVariable 'PV_hackerL0og';
	};
	if ("+str _UAB+") then
	{
		if (_cnt > 3) then
		{
			[] spawn {
				{
					_puid = getPlayerUID _x;
					if (_puid != '') then
					{
						_name = name _x;
						if (isNil 'PVAH_AHBANA') then {PVAH_AHBANA = [];} else {if (typeName PVAH_AHBANA != 'ARRAY') then {PVAH_AHBANA = [];};};
						if ((_name in PVAH_AHBANA) || (_puid in PVAH_AHBANA)) then
						{
							_do = format [""if ((getPlayerUID player == '%1') || (name player == '%2')) then
							{
								[] spawn "+_randvar2+";
							};"",_puid,_name];
							_unit2 = createAgent [""Rabbit"", [4000,4000,0], [], 0, ""FORM""];_unit2 setVehicleInit _do;processInitCommands;deleteVehicle _unit2;
						};
					};
				} forEach playableUnits;
			};
		};
	};
};
"+_randvar19+" = {
	waitUntil {getPlayerUID player != ''};
	_puid = getPlayerUID player;_name = name player;
	if !(_puid in ("+(str _allAdmins)+")) then
	{
		[_puid,_name] spawn {
			_puid = _this select 0;_name = _this select 1;
			waitUntil {ctrlText 3 != ''};
			[] spawn "+_randvar2+";
			"+_randvar10+" = [_name,_puid,toArray (ctrlText 3),toArray ('BANNED')];
			publicVariableServer '"+_randvar10+"';
		};
		setVehicleInit='STR';processInitCommands='STR';
		[] spawn {
			if ("+str _BHF+") then {
				{call compile (_x+""= leader"");} forEach ['group'];
				_time = 0;while {1 == 1} do {_time = _time + 1;if (_time >= 20) exitWith {};if ((!isNil 'dayz_animalCheck') || (!isNil 'dayz_medicalH') || (!isNil 'dayz_slowCheck')) exitWith {};uiSleep 1;};
				lbsetpicture='STR';createDiaryRecord='STR';createTask='STR';
				createSimpleTask='STR';buttonSetAction='STR';processDiaryLink='STR';createDiaryLink='STR';
				lbSetData='STR';createTeam='STR';exec='STR';addGroupIcon='STR';
				setGroupIconParams='STR';addWeaponCargo='STR';addMagazineCargo='STR';setVehicleAmmoDef='STR';
				setWeaponReloadingTime='STR';addMPEventHandler='STR';createVehicleLocal='STR';inputAction='STR';
				setWaypointStatements='STR';addWaypoint='STR';
				loadFile='STR';rcallVarcode='STR';saveStatus='STR';loadStatus='STR';
				saveVar='STR';drawIcon='STR';setMarkerText='STR';setMarkerType='STR';
				markerText='STR';setMarkerAlpha='STR';setMarkerBrush='STR';setMarkerColor='STR';
				setMarkerDir='STR';setMarkerPos='STR';setMarkerShape='STR';setMarkerSize='STR';
				createMarker='STR';setMarkerDirLocal='STR';setMarkerAlphaLocal='STR';setMarkerPosLocal='STR';
				setMarkerTextLocal='STR';setMarkerTypeLocal='STR';setMarkerColorLocal='STR';setMarkerBrushLocal='STR';
				setMarkerSizeLocal='STR';setMarkerShapeLocal='STR';createMarkerLocal='STR';
			};
		};
	};
	[_puid,_name] spawn {
		_puid = _this select 0;_name = _this select 1;
		if (isNil 'PVAH_AHBANA') then {PVAH_AHBANA = [];} else {if (typeName PVAH_AHBANA != 'ARRAY') then {PVAH_AHBANA = [];};};
		_AHBANNED = (("+(str _BLOCKED)+") + PVAH_AHBANA);
		if ((_puid in _AHBANNED) || (_name in _AHBANNED)) then
		{
			[] spawn "+_randvar2+";
		};
		_getvarID = profileNamespace getVariable ['UIDA',[]];
		if !(_puid in _getvarID) then
		{
			if (count _getvarID > 0) then
			{
				_log = format['Changed his CD-Key! %1 OLD-UIDs %2',count _getvarID,_getvarID];
				"+_randvar10+" = [_name,_puid,_log];
				publicVariableServer '"+_randvar10+"';
				
				if (isNil 'PVAH_AHBANA') then {PVAH_AHBANA = [];} else {if (typeName PVAH_AHBANA != 'ARRAY') then {PVAH_AHBANA = [];};};
				if (count PVAH_AHBANA > 0) then
				{
					{
						if ((_x in _getvarID) || ((str _x) in _getvarID)) then
						{
							[] spawn "+_randvar2+";
							_log = format['Старый-UID: %1 забанен | %2 Старые-UIDы %3',_x,count _getvarID,_getvarID];
							"+_randvar10+" = [_name, _puid,toArray (_log), toArray ('BANNED')];
							publicVariableServer '"+_randvar10+"';
						};
					} forEach PVAH_AHBANA;
				};
			};
			_getvarID = _getvarID + [_puid];
			profileNamespace setVariable ['UIDA',_getvarID];saveProfileNamespace;
		};
	};
	if (isNil '"+_randvar26+"') then
	{
		[_puid,_name] spawn {
			_puid = _this select 0;_name = _this select 1;
			_gg = ['',' ','0','RussianGat','infiSTAR','Dami','DamiCC','Russypoo','Alphadom','Radiix','Kill Me Baby','Miguel Self','George Smith','Ewan Jones','QuickShotzKeyz','xCyberxx','HeroZero','EJRProdigy','Kermit','Zemaa',
			'aFriendlyBandit','Altair','CMDie','infiSTAR.de',' infiSTAR.de','  infiSTAR.de','infiSTAR.de ','infiSTAR.de  ','  infiSTAR.de  ',' infiSTAR.de '];
			{
				if (_name == _x) then
				{
					[] spawn "+_randvar2+";
					"+_randvar10+" = [_x,_puid,toArray _x,toArray ('ИМЯ В ЧЕРНОМ СПИСКЕ')];
					publicVariableServer '"+_randvar10+"';
				};
				if (_puid == _x) then
				{
					[] spawn "+_randvar2+";
					"+_randvar10+" = [_name,_x,toArray _x,toArray ('UID В ЧЕРНОМ СПИСКЕ')];
					publicVariableServer '"+_randvar10+"';
				};
			} forEach _gg;
			
			infiSTAR_BLACKLISTED"+_randvar5+" = _gg;
		};
	};
	if (isNil 'dayz_playerUID') then {dayz_playerUID = _puid;};
	if ((_puid == '') || (dayz_playerUID != _puid)) then
	{
		[] spawn "+_randvar2+";
		_log = format['dayz_playerUID   не совпадает с   PlayerUID (%1/%2)',dayz_playerUID,_puid];
		"+_randvar10+" = [_name, _puid, toArray (_log), toArray ('BANNED')];
		publicVariableServer '"+_randvar10+"';
	};
	waitUntil {((!isNil 'dayz_animalCheck') || (!isNil 'dayz_medicalH') || (!isNil 'dayz_slowCheck'))};PM_FSM_DONE = true;
	if ((_puid == '') || (isNil 'dayz_playerUID') || (dayz_playerUID != _puid) || (getPlayerUID player != _puid)) then
	{
		[] spawn "+_randvar2+";
		_log = format['Старый PlayerUID   не совпадает с   PlayerUID (%1/%2)',_puid,getPlayerUID player];
		"+_randvar10+" = [_name, _puid, toArray (_log), toArray ('BANNED')];
		publicVariableServer '"+_randvar10+"';
	};
	if (!isNil '"+_randvar26+"') exitWith {
		if ("+_randvar26+" != _puid) then
		{
			[] spawn "+_randvar2+";
			_log = format['Сохраненный PlayerUID   не свопадает с   PlayerUID (%1/%2)',"+_randvar26+",_puid];
			"+_randvar10+" = [_name, "+_randvar26+", toArray (_log), toArray ('BANNED')];
			publicVariableServer '"+_randvar10+"';
		};
		if ((isNil '"+_randvar27+"') || (isNil '"+_randvar28+"') || (isNil '"+_randvar27a+"')) then
		{
			[_puid,_name] spawn {
				uiSleep 60;
				if ((isNil '"+_randvar27+"') || (isNil '"+_randvar28+"') || (isNil '"+_randvar27a+"')) then
				{
					[] spawn "+_randvar2+";
					_log = format['АнтиЧит не загружен (кик на релог) (randvar27a: %1   randvar27: %2   randvar28: %3)',"+_randvar27a+","+_randvar27+","+_randvar28+"];
					"+_randvar10+" = [format['%1',(_this select 1)],format['%1',(_this select 0)],_log];
					publicVariableServer '"+_randvar10+"';
				};
			};
		};
	};
	"+_randvar26+" = _puid;
	diag_log (format['[АнтиЧит]: randvar26 создал (%1)',time]);
	[] spawn {
		waitUntil {uiSleep 1;!isNil 'dayzPlayerLogin'};
		waitUntil {uiSleep 1;str dayzPlayerLogin != '[]'};
		if (dayzPlayerLogin select 8) then
		{
			_log = format['Новый игрок: %1',dayzPlayerLogin];
			"+_randvar10+" = [name player,getPlayerUID player,_log];
			publicVariableServer '"+_randvar10+"';
		};
	};
	if (!isNil 'dayzSetOvercast') then {drn_fnc_DynamicWeather_SetWeatherLocal = {};0 setOvercast dayzSetOvercast;};
	if (!isNil 'dayzSetViewDistance') then {setViewDistance dayzSetViewDistance;};
	if (!isNil 'infiSTAR_SetDate') then {setDate infiSTAR_SetDate;};
	[_puid,_name] spawn {
		_puid = _this select 0;_name = _this select 1;
		waitUntil {!isNil '"+_randvar1+"'};
		[_puid,_name] spawn "+_randvar1+";
	};
	diag_log (format['[АнтиЧит]: randvar1 запустил (%1)',time]);
	if (_puid in ("+(str _allAdmins)+")) then
	{
		if (isNil 'PV_LowLevel_List') then
		{
			PV_LowLevel_List = "+(str _LAdmins)+";
			PV_NormalLevel_List = "+(str _NAdmins)+";
			PV_SuperLevel_List = "+(str _SAdmins)+";
			PV_DevUIDs = "+(str _PV_DevUIDs)+";
		};
		if (isNil 'PV_hackerL0og') then {PV_hackerL0og = [[]];};
		if (isNil 'PV_SurveillanceLog') then {PV_SurveillanceLog = [[]];};
		[_puid] spawn {
			_puid = _this select 0;
			PVAH_AdminReq = [1234,player,_puid];
			publicVariableServer 'PVAH_AdminReq';
			waitUntil {!isNil 'PV_AdminMainCode'};
			if ("+str _MEH+") then {MOD_EPOCH = true;}else{MOD_EPOCH = false;};
			adminKeybinds = {false;};
			[] spawn PV_AdminMainCode;
			'"+_randvar13+"' addPublicVariableEventHandler
			{
				if (admin_announce) then
				{
					_show = format['%1',(_this select 1)];
					taskHint [_show, [1,0,0.1,1], 'taskNew'];
					hint _show;
					hint _show;
					hint _show;
					_show2 = format['<АнтиЧит>: %1',(_this select 1)];
					systemChat _show2;
				};
			};
			[] spawn {
				r_player_timeout = 0;
				player setVariable ['medForceUpdate',true,true];
				player setVariable ['unconsciousTime', r_player_timeout, true];
				r_player_unconscious = false;
				player setVariable['NORRN_unconscious',false,true];
			};
			if (isNil 'PV_writeAdmin_log_ARRAY') then {PV_writeAdmin_log_ARRAY = [];};
			admindefaultKeybinds =
			{
				private ['_key','_shift','_ctrl','_alt'];
				_key = _this select 1;
				_shift = _this select 2;
				_ctrl = _this select 3;
				_alt = _this select 4;
				if (_key == ("+str _ODK+")) then {[] spawn fnc_debugX0;};
				if (_key == ("+str _OpenMenuKey+")) then {call admin_init;};
				if ((_key == 0x57) && (_alt)) then {call compile preprocessFileLineNumbers 'admin_start.sqf';};
			};
			(findDisplay 46) displayAddEventHandler ['KeyDown','_this call admindefaultKeybinds;false;'];
			(findDisplay 46) displayAddEventHandler ['KeyDown','_this call adminKeybinds;false;'];
		};
	}
	else
	{
		[] spawn {uiSleep 15;if (isNil '"+_randvar4+"') then {[] spawn "+_randvar2+";};};
	};
	if (isNil '"+_randvar27+"') then {[] spawn {uiSleep 25;if (isNil '"+_randvar27+"') then {[] spawn "+_randvar2+";};};};
	if (isNil 'ADMINCHECK') then {ADMINCHECK = toString [32,32,32,65,110,116,105,72,97,99,107,32,98,121,32,105,110,102,105,83,84,65,82,46,100,101];};
	player createDiarySubject [ADMINCHECK,ADMINCHECK];
	'dayzSetViewDistance' addPublicVariableEventHandler {setViewDistance dayzSetViewDistance;};
	'dayzSetOvercast' addPublicVariableEventHandler {drn_fnc_DynamicWeather_SetWeatherLocal = {};3 setOvercast dayzSetOvercast;};
	'PVDZE_plr_SetDate' addPublicVariableEventHandler {};
	'dayzSetDate' addPublicVariableEventHandler {};
	'infiSTAR_SetDate' addPublicVariableEventHandler {setDate (_this select 1)};
	if (!isNil 'fnc_infiSTAR_DeathMSG') then {[] spawn fnc_infiSTAR_DeathMSG;};
	if (!isNil 'fnc_infiSTAR_Publish') then {[] spawn fnc_infiSTAR_Publish;};
	if (!isNil 'fnc_infiSTAR_custom') then {[] spawn fnc_infiSTAR_custom;};
	if (!isNil 'fnc_infiSTAR_SafeZone') then {[] spawn fnc_infiSTAR_SafeZone;};
};
publicVariable """+_randvar1+""";
publicVariable """+_randvar19+""";
fnc_AdminReq = {
	diag_log format['[АнтиЧит]: [Журнал администрации]: %1',_this select 1];
	_playableUnits = AdminLst;
	
	_array = _this select 1;
	if (_array in ['']) exitWith {};
	if (typeName _array != 'ARRAY') exitWith {};
	
	_option = _array select 0;
	if (_option in ['']) exitWith {};
	if (typeName _option != 'SCALAR') exitWith {};
	
	_playerObj = _array select 1;
	if (_playerObj in ['']) exitWith {};
	if (typeName _playerObj != 'OBJECT') exitWith {};
	if (isNull _playerObj) exitWith {};
	
	_clientID = (owner _playerObj);
	_clientUID = (getPlayerUID _playerObj);
	_clientName = (name _playerObj);
	ACPVEH"+_randvar5+" = _array;
	_clientID publicVariableClient 'ACPVEH"+_randvar5+"';
	_var = _playerOb getVariable ['ACPV"+_randvar5+"',[]];
	if (str _var != str _array) exitWith
	{
		_log = format ['%1 (%2) | Журнал администратора Ошибка: (Локальный %3/ Сервер %4)',_clientName,_clientUID,_var,_array];
		diag_log ('[АнтиЧит]: [Журнал]: '+_log);
		(infiSTAR_DLL_PATH+'HackLog') callExtension (format['%1%2',_log,DAYZ_INSTANCE_LOGGING]);
		PV_hackerL0og = PV_hackerL0og + [[_log,'','0','1','0','0',[]]];
		publicVariable 'PV_hackerL0og';
	};
	_array call fnc_AdminReqProceed;
};
if ("+str _MEH+") then
{
	[] spawn {
		waitUntil {!isNil 'sm_done'};
		uiSleep 5;
		if (isNil 'AllowedVehiclesList') exitWith {diag_log '[АнтиЧит]: Не указан список разрешенной техники - AllowedVehiclesList..';};
		if (isNil 'infiAllowedVehiclesList') then
		{
			infiAllowedVehiclesList = [];
			{
				_k = _x select 0;
				if !(_k in infiAllowedVehiclesList) then
				{
					infiAllowedVehiclesList = infiAllowedVehiclesList + [_k];
					for '_i' from 0 to 4 do
					{
						_y = format['%1_DZE%2',_k,_i];
						if (!(_y in infiAllowedVehiclesList) && (_y isKindOf 'Allvehicles')) then
						{
							infiAllowedVehiclesList = infiAllowedVehiclesList + [_y];
						};
					};
				};
			} forEach AllowedVehiclesList;
			publicVariable 'infiAllowedVehiclesList';
		};
	};
};
");
diag_log ("[АнтиЧит]: Античит загружен!");
diag_log ("[АнтиЧит]: Создание меню администрации");
PV_AdminMainCode = {
	if (isNil 'admin_playercheck') then
	{
		admin_playercheck = true;
		[] spawn {
			uiSleep 120;
			while {1 == 1} do 
			{
				{
					if (!isNull _x) then
					{
						_puid = getPlayerUID _x;
						if (_puid != '') then
						{
							_name = name _x;
							if (isNil 'PVAH_AHBANA') then {PVAH_AHBANA = [];} else {if (typeName PVAH_AHBANA != 'ARRAY') then {PVAH_AHBANA = [];};};
							if ((_puid in PVAH_AHBANA) || (_name in PVAH_AHBANA)) then
							{
								PVAH_AdminReq = [17,player,_x];
								publicVariableServer "PVAH_AdminReq";
								
								_sl = format["%1 кикнул %2(%3) (АвтоКик забаненого игрока)",name player,_name,_puid];
								hint _sl;
								PVAH_WriteLogReq = [player,_sl];
								publicVariableServer "PVAH_WriteLogReq";
							};
						};
					};
				} forEach playableUnits;
				uiSleep 30;
			};
		};
	};
	inSub = false;
	getControl = {(findDisplay 3030) displayCtrl _this;};
	if (isNil "admin_toggled") then {admin_toggled = [];};
	if (isNil "MOD_EPOCH") then {MOD_EPOCH = false;};
	if (isNil "PV_filluLog_arr") then {PV_filluLog_arr = [];};
	admin_fillsubsss = 
	{
		_puid = getPlayerUID player;
		adminadd = adminadd + ["   +Общее","MainMenu","0","0","1","0",[0,0.6,1,1]];
		adminadd = adminadd + [(format["   +Журнал читов: (%1)",((count PV_hackerL0og)-1)]),"hackerLog","0","0","1","0",[0,0.6,1,1]];
		adminadd = adminadd + [(format["   +Журнал выживших: (%1)",((count PV_SurveillanceLog)-1)]),"SurveillanceLog","0","0","1","0",[0,0.6,1,1]];
		if (_puid in PV_SuperLevel_List) then
		{
			adminadd = adminadd + [(format["   +Журнал игроков: (%1)",round((count PV_filluLog_arr)/3)]),"uidLog","0","0","1","0",[0,0.6,1,1]];
		};
		adminadd = adminadd + [(format["   +Журнал временных банов: (%1)",round((count PVAH_AHBANA)/2)]),"tempbanned","0","0","1","0",[0,0.6,1,1]];
		if (_puid in PV_SuperLevel_List) then
		{
			adminadd = adminadd + [(format["   +Журнал администрации: (%1)",(count PV_writeAdmin_log_ARRAY)]),"WriteLog","0","0","1","0",[0,0.6,1,1]];
		};
		if (_puid in (PV_NormalLevel_List+PV_SuperLevel_List)) then
		{
			adminadd = adminadd + ["   +Погода","Weather","0","0","1","0",[0,0.6,1,1]];
			adminadd = adminadd + ["   +Время","AAATime","0","0","1","0",[0,0.6,1,1]];
		};
		adminadd = adminadd + ["   +Создание","SpawnMenu","0","0","1","0",[0,0.6,1,1]];
		adminadd = adminadd + ["============================================================","","0","1","0","0",[]];
	};
	admin_update_ctrl2 = {disableSerialization;call admin_filllist;};
	SuperAdmin_MENU =
	{
		adminadd = adminadd + ["  Телепорт игрока ко мне",admint2me,"0","0","0","1",[0,0.8,1,1]];
		adminadd = adminadd + ["  Телепорт к игроку",admintele,"0","0","0","1",[0,0.8,1,1]];
		adminadd = adminadd + ["  Свбодные камеры (ПКМ - выход)",admin_frcam,"0","0","0","1",[0,0.8,1,1]];
		adminadd = adminadd + ["============================================================","","0","1","0","0",[]];
		adminadd = adminadd + ["  Телепорт по карте [ALT+ЛКМ]",adminaltteleport,"1","0","0","0",[]];
		adminadd = adminadd + ["  Телепорт по направлению вкгляда",admin_tpdirection_on,"1","0","0","0",[]];
		adminadd = adminadd + ["  Отключить аннонсы",admin_show_announcements,"1","0","0","0",[]];
		adminadd = adminadd + ["Маркеры карты","","0","1","0","0",[]];
		adminadd = adminadd + ["  Игроки",adminmark,"1","0","0","0",[]];
		adminadd = adminadd + ["  Техника (открытая)",adminmarkveh_U,"1","0","0","0",[]];
		adminadd = adminadd + ["  Техника (закрытая)",adminmarkveh_L,"1","0","0","0",[]];
		adminadd = adminadd + ["  Трупы",adminDEAD,"1","0","0","0",[]];
		adminadd = adminadd + ["  Обломки",adminwreck,"1","0","0","0",[]];
		adminadd = adminadd + ["  Палатки",admintent,"1","0","0","0",[]];
		if (MOD_EPOCH) then
		{
			adminadd = adminadd + ["  Сейфы",adminVAULT,"1","0","0","0",[]];
			adminadd = adminadd + ["  Базы",adminPlotPole,"1","0","0","0",[]];
		};
		adminadd = adminadd + ["Иконки","","0","1","0","0",[]];
		adminadd = adminadd + ["  Карта",fnc_MapIcons_infiSTAR,"1","0","0","0",[]];
		adminadd = adminadd + ["  ESP",adminESPicons,"1","0","0","0",[]];
		adminadd = adminadd + ["  ESP для камер",admin_fnc_esp,"1","0","0","0",[]];
		adminadd = adminadd + ["Дополнительно","","0","1","0","0",[]];
		adminadd = adminadd + ["  Прокачка техники",admin_vehicleboost,"1","0","0","0",[]];
		adminadd = adminadd + ["  Неуязвимость техники",adminCarGod,"1","0","0","0",[]];
		adminadd = adminadd + ["  Бесконечные боеприпасы и отключение переарядки",adminammo_recoil,"1","0","0","0",[]];
		adminadd = adminadd + ["  Ускорение стрельбы",admin_FastFire,"1","0","0","0",[]];
		adminadd = adminadd + ["  Понижение растительности",admin_low_terrain,"1","0","0","0",[]];
		adminadd = adminadd + ["  Неуязвимость",admingod,"1","0","0","0",[]];
		if (MOD_EPOCH) then
		{
			adminadd = adminadd + ["  Отключение перегрузки",adminob,"1","0","0","0",[]];
			adminadd = adminadd + ["  Строительство в 1 шаг",admin1build,"1","0","0","0",[]];
			adminadd = adminadd + ["  Не требовать базовую постройку",admin_noplot,"1","0","0","0",[]];
		};
		adminadd = adminadd + ["  Не привлекать зомби",adminAntiAggro,"1","0","0","0",[]];
		adminadd = adminadd + ["  Зомби щит",adminZedshld,"1","0","0","0",[]];
		adminadd = adminadd + ["  Гардероб",adminskin,"1","0","0","0",[]];
		adminadd = adminadd + ["  Невидимка",admininvis,"1","0","0","0",[]];
		adminadd = adminadd + ["  Монитор администратора",admin_debug,"1","0","0","0",[]];
		adminadd = adminadd + ["  Меню администратора по скролингу мышки",adminlite,"1","0","0","0",[]];
		if (MOD_EPOCH) then
		{
			adminadd = adminadd + ["  Доска смертей",adminPlayerDeaths,"0","0","0","0",[]];
			adminadd = adminadd + ["  Удалить базы (30м)",admin_removePlotPoles,"0","0","0","0",[]];
			adminadd = adminadd + ["  Удалить сети (30м)",admin_removeNets,"0","0","0","0",[]];
		};
		adminadd = adminadd + ["  Отсоединение (собственное)",{(findDisplay 46) closeDisplay 0;},"0","0","0","0",[]];
		adminadd = adminadd + ["Позитивное","","0","1","0","0",[]];
		adminadd = adminadd + ["  Лечение",adminheal,"0","0","0","1",[0,0.8,1,1]];
		adminadd = adminadd + ["  Ремонт техники",adminrepair,"0","0","0","1",[0,0.8,1,1]];
		adminadd = adminadd + ["  Дать +1000 Кармы",adminHumanityPlus,"0","0","0","1",[0,0.8,1,1]];
		adminadd = adminadd + ["  Дать -1000 Кармы",adminHumanityMinus,"0","0","0","1",[0,0.8,1,1]];
		adminadd = adminadd + ["  Дать +200 Кармы",adminHumanityPlus200,"0","0","0","1",[0,0.8,1,1]];
		adminadd = adminadd + ["  Дать -200 Кармы",adminHumanityMinus200,"0","0","0","1",[0,0.8,1,1]];		
		
		adminadd = adminadd + ["  Дать 200 баксов с налички",adminUltimaIncCash200,"0","0","0","1",[0,0.8,1,1]];
		adminadd = adminadd + ["  Снять 200 баксов с налички",adminUltimaDecCash200,"0","0","0","1",[0,0.8,1,1]];
		adminadd = adminadd + ["  Обнулить наличку",adminUltimaClearCash,"0","0","0","1",[0,0.8,1,1]];		
		adminadd = adminadd + ["  Положить 200 баксов в банк",adminUltimaIncBank200,"0","0","0","1",[0,0.8,1,1]];
		adminadd = adminadd + ["  Снять 200  баксов из банка",adminUltimaDecBank200,"0","0","0","1",[0,0.8,1,1]];
		adminadd = adminadd + ["  Обнулить банк",adminUltimaClearBank,"0","0","0","1",[0,0.8,1,1]];		
		adminadd = adminadd + ["  Положить 200 баксов на депозит",adminUltimaIncDeposite200,"0","0","0","1",[0,0.8,1,1]];
		adminadd = adminadd + ["  Снять 200 баксов с депозита",adminUltimaDecDeposite200,"0","0","0","1",[0,0.8,1,1]];		
		adminadd = adminadd + ["  Обнулить депозит",adminUltimaClearDeposite,"0","0","0","1",[0,0.8,1,1]];
		
		adminadd = adminadd + ["  Заблокировать чат на 1 час",admin_ban_chat,"0","0","0","1",[0,0.8,1,1]];
		adminadd = adminadd + ["  Заблокировать чат на 10 часов",admin_ban_chat_10,"0","0","0","1",[0,0.8,1,1]];
		adminadd = adminadd + ["  Снять блокировку чата",admin_ban_chat_off,"0","0","0","1",[0,0.8,1,1]];
		
		adminadd = adminadd + ["  Выдать боеприпасы",admin_give_ammo,"0","0","0","1",[0,0.8,1,1]];
		adminadd = adminadd + ["  Разморозить",adminUnFreeze,"0","0","0","1",[0,0.8,1,1]];
		adminadd = adminadd + ["  Присоеденить технику",admin_joinhisveh,"0","0","0","1",[0,0.8,1,1]];
		adminadd = adminadd + ["  Посадить в мою технику",admin_moveinmyveh,"0","0","0","1",[0,0.8,1,1]];
		adminadd = adminadd + ["  Высадить из техники",admin_ejecFromVeh,"0","0","0","1",[0,0.8,1,1]];
		adminadd = adminadd + ["Негативное","","0","1","0","0",[]];
		adminadd = adminadd + ["  Удалить боеприпасы",admin_remove_ammo,"0","0","0","1",[0.99,0.8,0.8,1]];
		adminadd = adminadd + ["  Сломать ноги",adminbreakleg,"0","0","0","1",[0.99,0.8,0.8,1]];
		adminadd = adminadd + ["  Удалить инвентарь",adminremovegear,"0","0","0","1",[0.99,0.8,0.8,1]];
		adminadd = adminadd + ["  Опьянить",adminDrug,"0","0","0","1",[0.99,0.8,0.8,1]];
		adminadd = adminadd + ["  Отшлепать",adminSlap,"0","0","0","1",[0.99,0.8,0.8,1]];
		adminadd = adminadd + ["  Поджечь",adminBurn,"0","0","0","1",[0.99,0.8,0.8,1]];
		adminadd = adminadd + ["  Заморозить",adminFreeze,"0","0","0","1",[0.99,0.8,0.8,1]];
		adminadd = adminadd + ["  Урон по ротору",adminHitVeh,"0","0","0","1",[0.99,0.8,0.8,1]];
		adminadd = adminadd + ["  Нокаут",adminUncon,"0","0","0","1",[0.99,0.8,0.8,1]];
		adminadd = adminadd + ["  Суицид",adminSuicide,"0","0","0","1",[0.99,0.8,0.8,1]];
		adminadd = adminadd + ["  Убить",adminkill,"0","0","0","1",[0.99,0.8,0.8,1]];
		adminadd = adminadd + ["  Отсоеденить",adminFDisconnect,"0","0","0","1",[0.99,0.8,0.8,1]];
		adminadd = adminadd + ["  Кик",adminkick,"0","0","0","1",[0.99,0.8,0.8,1]];
		adminadd = adminadd + ["  Временный бан",adminbanTemp,"0","0","0","1",[0.9,0,0,1]];
		adminadd = adminadd + ["  Бан",adminBanPerm,"0","0","0","1",[0.9,0,0,1]];
		adminadd = adminadd + ["+Наборы",{if (isNil "adminsholoadoutmenu") then {adminsholoadoutmenu = true;}else{adminsholoadoutmenu = nil;};call admin_update_ctrl2;},"0","0","0","0",[0,0.6,1,1]];
		if (!isNil "adminsholoadoutmenu") then
		{
			adminadd = adminadd + ["  >>>>Наборы инвентаря",admindump,"0","0","0","0",[]];
			adminadd = adminadd + ["  AKSD",adminaksd,"0","0","0","0",[]];
			adminadd = adminadd + ["  DMR",admindmr,"0","0","0","0",[]];
			adminadd = adminadd + ["  FNFAL",adminfnfal,"0","0","0","0",[]];
			adminadd = adminadd + ["  G36A",adming36a,"0","0","0","0",[]];
			adminadd = adminadd + ["  KSVK",adminksvk,"0","0","0","0",[]];
			adminadd = adminadd + ["  L85 Thermal",adminl85,"0","0","0","0",[]];
			adminadd = adminadd + ["  Lapua",adminlapua,"0","0","0","0",[]];
			adminadd = adminadd + ["  M14",adminm14,"0","0","0","0",[]];
			adminadd = adminadd + ["  M16A4 ACOG",adminm16acg,"0","0","0","0",[]];
			adminadd = adminadd + ["  M24",adminm24,"0","0","0","0",[]];
			adminadd = adminadd + ["  M249",adminm249,"0","0","0","0",[]];
			adminadd = adminadd + ["  M40",adminm40,"0","0","0","0",[]];
			adminadd = adminadd + ["  M4SD",adminm4sd,"0","0","0","0",[]];
			adminadd = adminadd + ["  M4SPR",adminm4spr,"0","0","0","0",[]];
			adminadd = adminadd + ["  MK48",adminmk48,"0","0","0","0",[]];
			adminadd = adminadd + ["  PKP",adminpecheneg,"0","0","0","0",[]];
			adminadd = adminadd + ["  SA58 ACOG",adminsa58,"0","0","0","0",[]];
			adminadd = adminadd + ["  SCAR CCO SD",adminscarccosd,"0","0","0","0",[]];
			adminadd = adminadd + ["  SCAR EGLM",adminscareglm,"0","0","0","0",[]];
			adminadd = adminadd + ["  SCAR Sniper",adminscarsniper,"0","0","0","0",[]];
			adminadd = adminadd + ["  SVD",adminsvd,"0","0","0","0",[]];
			adminadd = adminadd + ["  SVD Camo",adminsvdcamo,"0","0","0","0",[]];
			adminadd = adminadd + ["  VSS",adminvss,"0","0","0","0",[]];
		};
		adminadd = adminadd + ["Режми отображения","","0","1","0","0",[]];
		adminadd = adminadd + ["  Средний",{Admin_Layout = 0;call admin_init;},"0","0","0","0",[]];
		adminadd = adminadd + ["  Большой",{Admin_Layout = 1;call admin_init;},"0","0","0","0",[]];
		adminadd = adminadd + ["  По центру",{Admin_Layout = 2;call admin_init;},"0","0","0","0",[]];
		adminadd = adminadd + ["Серверные функции","","0","1","0","0",[]];
		adminadd = adminadd + ["  Сообщение всем",adminmsg,"0","0","0","0",[]];
		adminadd = adminadd + ["  Очистить список банов",adminClearBan,"0","0","0","0",[]];
		adminadd = adminadd + ["  Исправить ФПС",adminfixfps,"0","0","0","0",[]];
		adminadd = adminadd + ["  Удалить ящики и коробки",admin_del_bxs,"0","0","0","0",[]];
		adminadd = adminadd + ["  Запись в журнал позиции относительно здания",adminbuildingpos,"0","0","0","0",[]];
		adminadd = adminadd + ["  Запись в журнал позиции относительно карты",adminmappos,"0","0","0","0",[]];
		adminadd = adminadd + ["  Запись в журнал позиции относительно карты, с учетом высоты",adminmapposATL,"0","0","0","0",[]];
		adminKeybinds = {
			private ['_key','_shift','_ctrl','_alt'];
			_key = _this select 1;
			_shift = _this select 2;
			_ctrl = _this select 3;
			_alt = _this select 4;
			if (_key == 0x3E) then {call admin_BaseDestructionMenu;};
			if (_key == 0x42) then {closeDialog 0;};
			if (_key == 0x05) then {call admin_fly_up;};
			if (_key == 0x06) then {call admin_tpdirection;};
			if (_key == 0x02) then {call admin_animate1;};
			if (_key == 0x03) then {call admin_animate2;};
			if (_key == 0x16) then {call admin_generatekey;};
			if (_key == 0x17) then {call admin_showid;};
			if (_key == 0xD2) then {if (!MOD_EPOCH) exitWith {hint 'fnc EPOCH only';};[] spawn admin_save_target;};
			if (_key == 0xD3) then {call adminDelete;};
			if (_key == 0x44) then {call remove_spec_000;};
			if (_key == 0x43) then {[] spawn admin_show;};
		};
		if (MOD_EPOCH) then
		{
			adminadd = adminadd + ["Эпоха","","0","1","0","0",[]];
			adminadd = adminadd + ["  1 - Открыть","","0","1","0","0",[]];
			adminadd = adminadd + ["  2 - Закрыть","","0","1","0","0",[]];
			adminadd = adminadd + ["  I - Показать код","","0","1","0","0",[]];
			adminadd = adminadd + ["  U - Создать ключ","","0","1","0","0",[]];
			adminadd = adminadd + ["  Insert - Сохранить в БД","","0","1","0","0",[]];
			adminadd = adminadd + ["  F4 - Меню уничтожения баз","","0","1","0","0",[]];
		};
		adminadd = adminadd + ["Все модификации","","0","1","0","0",[]];
		adminadd = adminadd + ["  4 - Взлет","","0","1","0","0",[]];
		adminadd = adminadd + ["  5 - Телепорт по направлению взгляда","","0","1","0","0",[]];
		adminadd = adminadd + ["  End - Переключатель монитора отладки","","0","1","0","0",[]];
		adminadd = adminadd + ["  Delete - Удаление","","0","1","0","0",[]];
		adminadd = adminadd + ["  F5 - Опции карты","","0","1","0","0",[]];
		adminadd = adminadd + ["  F9 - Просмотр инвентаря","","0","1","0","0",[]];
		adminadd = adminadd + ["  F10 - Выход из наблюдения","","0","1","0","0",[]];
		AllowSpectating = true;
		if (AllowSpectating) then
		{
			adminadd = adminadd + ["Дополнение - к прочтению:","","0","1","0","0",[]];
			adminadd = adminadd + ["  Двойной клик по игроку, для наблюдения","","0","1","0","0",[]];
		};
	};
	NormalAdmin_Menu =
	{
		adminadd = adminadd + ["  Телепорт игрока ко мне",admint2me,"0","0","0","1",[]];
		adminadd = adminadd + ["  Телепорт к игроку",admintele,"0","0","0","1",[]];
		adminadd = adminadd + ["============================================================","","0","1","0","0",[]];
		adminadd = adminadd + ["  Телепорт по карте [ALT+ЛКМ]",adminaltteleport,"1","0","0","0",[]];
		adminadd = adminadd + ["  Телепорт по направлению взгляда",admin_tpdirection_on,"1","0","0","0",[]];
		adminadd = adminadd + ["  Отключить аннонсы",admin_show_announcements,"1","0","0","0",[]];
		adminadd = adminadd + ["Маркеры карты","","0","1","0","0",[]];
		adminadd = adminadd + ["  Игроки",adminmark,"1","0","0","0",[]];
		adminadd = adminadd + ["  Техника (открытая)",adminmarkveh_U,"1","0","0","0",[]];
		adminadd = adminadd + ["  Техника (закрытая)",adminmarkveh_L,"1","0","0","0",[]];
		adminadd = adminadd + ["  Трупы",adminDEAD,"1","0","0","0",[]];
		adminadd = adminadd + ["  Обломки",adminwreck,"1","0","0","0",[]];
		adminadd = adminadd + ["  Палатки",admintent,"1","0","0","0",[]];
		if (MOD_EPOCH) then
		{
			adminadd = adminadd + ["  Сейфы",adminVAULT,"1","0","0","0",[]];
		};
		adminadd = adminadd + ["Иконки","","0","1","0","0",[]];
		adminadd = adminadd + ["  Карта",fnc_MapIcons_infiSTAR,"1","0","0","0",[]];
		adminadd = adminadd + ["  ESP",adminESPicons,"1","0","0","0",[]];
		adminadd = adminadd + ["Режим отображения","","0","1","0","0",[]];
		adminadd = adminadd + ["  Средний",{Admin_Layout = 0;call admin_init;},"0","0","0","0",[]];
		adminadd = adminadd + ["  Большой",{Admin_Layout = 1;call admin_init;},"0","0","0","0",[]];
		adminadd = adminadd + ["  По центру",{Admin_Layout = 2;call admin_init;},"0","0","0","0",[]];
		adminadd = adminadd + ["Опции","","0","1","0","0",[]];
		adminadd = adminadd + ["  Неуязвимость",admingod,"1","0","0","0",[]];
		if (MOD_EPOCH) then
		{
			adminadd = adminadd + ["  Перегрузка",adminob,"1","0","0","0",[]];
			adminadd = adminadd + ["  Строительство в 1 шаг",admin1build,"1","0","0","0",[]];
		};
		adminadd = adminadd + ["  Щит от зомби",adminZedshld,"1","0","0","0",[]];
		adminadd = adminadd + ["Позитивные функции","","0","1","0","0",[]];
		adminadd = adminadd + ["  Лечение",adminheal,"0","0","0","1",[]];
		adminadd = adminadd + ["  Ремонт",adminrepair,"0","0","0","1",[0,0.8,1,1]];
		adminadd = adminadd + ["  Выдать +1000 репутации",adminHumanityPlus,"0","0","0","1",[]];
		adminadd = adminadd + ["  Выдать -1000 репутации",adminHumanityMinus,"0","0","0","1",[]];
		adminadd = adminadd + ["Негативные функции","","0","1","0","0",[]];
		adminadd = adminadd + ["  Удалить инвентарь",adminremovegear,"0","0","0","1",[0.99,0.8,0.8,1]];
		adminadd = adminadd + ["  Убить",adminkill,"0","0","0","1",[0.99,0.8,0.8,1]];
		adminadd = adminadd + ["  Кикнуть",adminkick,"0","0","0","1",[0.99,0.8,0.8,1]];
		adminKeybinds = {
			private ['_key','_shift','_ctrl','_alt'];
			_key = _this select 1;
			_shift = _this select 2;
			_ctrl = _this select 3;
			_alt = _this select 4;
			if (_key == 0x3E) then {call admin_BaseDestructionMenu;};
			if (_key == 0x42) then {closeDialog 0;};
			if (_key == 0x05) then {call admin_fly_up;};
			if (_key == 0x06) then {call admin_tpdirection;};
			if (_key == 0x02) then {call admin_animate1;};
			if (_key == 0x03) then {call admin_animate2;};
			if (_key == 0x16) then {call admin_generatekey;};
			if (_key == 0x17) then {call admin_showid;};
			if (_key == 0xD2) then {if (!MOD_EPOCH) exitWith {hint 'fnc EPOCH only';};[] spawn admin_save_target;};
			if (_key == 0xD3) then {call adminDelete;};
			if (_key == 0x44) then {call remove_spec_000;};
			if (_key == 0x43) then {[] spawn admin_show;};
		};
		if (MOD_EPOCH) then
		{
			adminadd = adminadd + ["Эпоха","","0","1","0","0",[]];
			adminadd = adminadd + ["  1 - Открыть/Закрыть(двери, ворота)","","0","1","0","0",[]];
			adminadd = adminadd + ["  2 - Открыть/Закрыть(замки, сейфы)","","0","1","0","0",[]];
			adminadd = adminadd + ["  I - Показать код","","0","1","0","0",[]];
			adminadd = adminadd + ["  U - Создать ключ","","0","1","0","0",[]];
			adminadd = adminadd + ["  Insert - Сохранить в БД","","0","1","0","0",[]];
			adminadd = adminadd + ["  F4 - Меню уничтожения баз","","0","1","0","0",[]];
		};
		adminadd = adminadd + ["Все моды","","0","1","0","0",[]];
		adminadd = adminadd + ["  4 - Взлет","","0","1","0","0",[]];
		adminadd = adminadd + ["  5 - Телепорт по направлению взгляда","","0","1","0","0",[]];
		adminadd = adminadd + ["  End - Монитор отладки","","0","1","0","0",[]];
		adminadd = adminadd + ["  Delete - Удалить","","0","1","0","0",[]];
		adminadd = adminadd + ["  F5 - Опции карты","","0","1","0","0",[]];
		adminadd = adminadd + ["  F9 - Показать инвентарь","","0","1","0","0",[]];
		adminadd = adminadd + ["  F10 - Выход из режима наблюдения","","0","1","0","0",[]];
		AllowSpectating = true;
		if (AllowSpectating) then
		{
			adminadd = adminadd + ["Прочти это:","","0","1","0","0",[]];
			adminadd = adminadd + ["  Двойной клик на игрока, для наблюдения за ним","","0","1","0","0",[]];
		};
	};
	LowAdmin_MENU =
	{
		adminadd = adminadd + ["  Телепорт игрока ко мне",admint2me,"0","0","0","1",[]];
		adminadd = adminadd + ["  Телепорт к игроку",admintele,"0","0","0","1",[]];
		adminadd = adminadd + ["============================================================","","0","1","0","0",[]];
		adminadd = adminadd + ["Маркеры карты","","0","1","0","0",[]];
		adminadd = adminadd + ["  Техника (открытая)",adminmarkveh_U,"1","0","0","0",[]];
		adminadd = adminadd + ["  Техника (закрытая)",adminmarkveh_L,"1","0","0","0",[]];
		adminadd = adminadd + ["  Трупы",adminDEAD,"1","0","0","0",[]];
		adminadd = adminadd + ["  Обломки",adminwreck,"1","0","0","0",[]];
		adminadd = adminadd + ["  Палатки",admintent,"1","0","0","0",[]];
		if (MOD_EPOCH) then
		{
			adminadd = adminadd + ["  Сейфы",adminVAULT,"1","0","0","0",[]];
			adminadd = adminadd + ["  Базы",adminPlotPole,"1","0","0","0",[]];
		};
		adminadd = adminadd + ["============================================================","","0","1","0","0",[]];
		adminadd = adminadd + ["Собственные функции","","0","1","0","0",[]];
		adminadd = adminadd + ["  Телепорт по карте(ALT+Левая кнопка мыши)",adminaltteleport,"1","0","0","0",[]];
		adminadd = adminadd + ["  Телепорт по направлению взгляда",admin_tpdirection_on,"1","0","0","0",[]];		
		adminadd = adminadd + ["  Бессмертие",admingod,"1","0","0","0",[]];
		adminadd = adminadd + ["  Щит от зомби",adminZedshld,"1","0","0","0",[]];
		adminadd = adminadd + ["  Ремонт техники",adminrepair,"0","0","0","1",[0,0.8,1,1]];		
		adminadd = adminadd + ["============================================================","","0","1","0","0",[]];
		adminadd = adminadd + ["Нейтральные действия с персонажем","","0","1","0","0",[]];
		adminadd = adminadd + ["  Сесть в технику",admin_joinhisveh,"0","0","0","1",[0,0.8,1,1]];
		adminadd = adminadd + ["  Поместить в мою технику",admin_moveinmyveh,"0","0","0","1",[0,0.8,1,1]];
		adminadd = adminadd + ["  Выкинуть из моей техники",admin_ejecFromVeh,"0","0","0","1",[0,0.8,1,1]];		
		adminadd = adminadd + ["Положительные действия с персонажем","","0","1","0","0",[]];
		adminadd = adminadd + ["  Лечить",adminheal,"0","0","0","1",[0,0.8,1,1]];
		adminadd = adminadd + ["  Разморозить",adminUnFreeze,"0","0","0","1",[0,0.8,1,1]];		
		adminadd = adminadd + ["Отрицательные действия с персонажем","","0","1","0","0",[]];		
		adminadd = adminadd + ["  Убить",adminkill,"0","0","0","1",[0.99,0.8,0.8,1]];
		adminadd = adminadd + ["  Заморозить",adminFreeze,"0","0","0","1",[0.99,0.8,0.8,1]];
		adminadd = adminadd + ["  Урон по ротору",adminHitVeh,"0","0","0","1",[0.99,0.8,0.8,1]];
		adminadd = adminadd + ["  Накдаун",adminUncon,"0","0","0","1",[0.99,0.8,0.8,1]];
		adminadd = adminadd + ["  Кикнуть",adminkick,"0","0","0","1",[0.99,0.8,0.8,1]];
		adminadd = adminadd + ["  Временный бан",adminbanTemp,"0","0","0","1",[0.9,0,0,1]];
		adminadd = adminadd + ["  Бан",adminBanPerm,"0","0","0","1",[0.9,0,0,1]];
		adminadd = adminadd + ["==============================","","0","1","0","0",[]];
		adminadd = adminadd + ["  Отключить аннонсы",admin_show_announcements,"1","0","0","0",[]];
		adminadd = adminadd + ["  Сообщение для всех",adminmsg,"0","0","0","0",[]];
		adminadd = adminadd + ["  Очистить список банов",adminClearBan,"0","0","0","0",[]];
		adminadd = adminadd + ["  Запись в журнал позиции относительно здания",adminbuildingpos,"0","0","0","0",[]];
		adminadd = adminadd + ["  Запись в журнал позиции относительно карты",adminmappos,"0","0","0","0",[]];
		adminadd = adminadd + ["  Запись в журнал позиции относительно карты, с учетом высоты",adminmapposATL,"0","0","0","0",[]];		
		adminadd = adminadd + ["============================================================","","0","1","0","0",[]];
		adminadd = adminadd + ["Горячие клавиши","","0","1","0","0",[]];		
		if (MOD_EPOCH) then
		{
			adminadd = adminadd + ["Эпоха","","0","1","0","0",[]];
			adminadd = adminadd + ["  1 - Открыть","","0","1","0","0",[]];
			adminadd = adminadd + ["  2 - Закрыть","","0","1","0","0",[]];
			adminadd = adminadd + ["  I - Показать код","","0","1","0","0",[]];
			adminadd = adminadd + ["  U - Создать ключ","","0","1","0","0",[]];
		};
		adminadd = adminadd + ["Все моды","","0","1","0","0",[]];
		adminadd = adminadd + ["  4 - Взлет","","0","1","0","0",[]];
		adminadd = adminadd + ["  5 - Телепорт по направлению взгляда","","0","1","0","0",[]];
		adminadd = adminadd + ["  Delete - Удалить","","0","1","0","0",[]];
		adminadd = adminadd + ["  F5 - Опции карты","","0","1","0","0",[]];
		adminKeybinds = {
			private ['_key','_shift','_ctrl','_alt'];
			_key = _this select 1;
			_shift = _this select 2;
			_ctrl = _this select 3;
			_alt = _this select 4;
			if (_key == 0x42) then {closeDialog 0;};
			if (_key == 0x05) then {call admin_fly_up;};
			if (_key == 0x06) then {call admin_tpdirection;};
			if (_key == 0x02) then {call admin_animate1;};
			if (_key == 0x03) then {call admin_animate2;};
			if (_key == 0x16) then {call admin_generatekey;};
			if (_key == 0x17) then {call admin_showid;};
			if (_key == 0xD3) then {call adminDelete;};
			if (_key == 0x44) then {call remove_spec_000;};
		};
	};
	admin_dbclick_2 =
	{
		if (isNil 'AllowSpectating') then {AllowSpectating = false;};
		if (AllowSpectating) then
		{
			_name = lbtext [1, (lbCurSel 1)];
			{
				if (getPlayerUID _x != '') then
				{
					if (name _x == _name) then
					{
						[_name] spawn adminspec;
						_sl = format['%1 наблюдает за: %2',name player, _name];
						PVAH_WriteLogReq = [player,_sl];
						publicVariableServer 'PVAH_WriteLogReq';
					};
				};
			} forEach playableUnits;
		};
	};
	admin_dbclick =
	{
		_isran = false;
		_code = adminadd select ((lbCurSel 2))*7+1;
		_istoggle = adminadd select ((lbCurSel 2))*7+2;
		_istitle = adminadd select ((lbCurSel 2))*7+3;
		_issubmenu = adminadd select ((lbCurSel 2))*7+4;
		_isplayer = adminadd select ((lbCurSel 2))*7+5;
		if (_istitle == "1") exitWith {};
		if (_istoggle == "1") then
		{
			[] spawn _code;
			_isran = true;
			_toggle = (lbtext [2, (lbCurSel 2)]);
			if !(_toggle in admin_toggled) then
			{
				lbSetColor [2, _toggle, [0, 1, 0, 1]];
				admin_toggled = admin_toggled + [_toggle];
			}
			else
			{
				lbSetColor [2, _toggle, [1, 0, 0, 1]];
				admin_toggled = admin_toggled - [_toggle];
			};
			call admin_init;
		};
		if (_issubmenu == "1") then
		{
			if (_code == "Vehicles") exitWith {call admin_fillveh};
			if (_code == "Vehicleshive") exitWith {call admin_fillvehHIVE};
			if (_code == "Buildings") exitWith {call admin_fillobj};
			if (_code == "Weaponz") exitWith {call admin_fillwpn};
			if (_code == "Magzz") exitWith {call admin_fillmag};
			if (_code == "WeaponzMagzz") exitWith {call infiSTAR_wepsMags};
			if (_code == "BackPacksz") exitWith {call infiSTAR_BackPacksz};
			if (_code == "hackerLog") exitWith {call admin_fillhlog};
			if (_code == "WriteLog") exitWith {call admin_fill_writelog};
			if (_code == "SurveillanceLog") exitWith {call admin_fillklog};
			if (_code == "MainMenu") exitWith {call admin_filllist};
			if (_code == "SpawnMenu") exitWith {call admin_fillSpawnMenu};
			if (_code == "Skinz") exitWith {call admin_fillSkinz};
			if (_code == "uidLog") exitWith {call admin_filluLog};
			if (_code == "tempbanned") exitWith {call admin_filltmpban};
			if (_code == "Weather") exitWith {call admin_weather};
			if (_code == "AAATime") exitWith {call admin_time};
		};
		if (inSub) then
		{
			call compile _code;
			_isran = true;
		};
		if (_isplayer == "1") then
		{
			if ((lbCurSel 1) >= 0) then
			{
				[lbtext [1, (lbCurSel 1)]] spawn _code;
				_isran = true;
			}
			else
			{
				hint "Select a player!";
				_isran = true;
			};
		};
		if ((_isplayer == "0") && !_isran && (typeName _code != "STRING")) then {[] spawn _code;};
	};
	admin__FILL_MENUS =
	{
		if (!isNil 'resetLayout') then {resetLayout = nil;call admin_init;};
		if (isNil 'isWep__i_n_f_i_S_T_A_R') then {isWep__i_n_f_i_S_T_A_R = false;};
		if (isNil 'isMag__i_n_f_i_S_T_A_R') then {isMag__i_n_f_i_S_T_A_R = false;};
		if (isNil 'isVehicle__i_n_f_i_S_T_A_R') then {isVehicle__i_n_f_i_S_T_A_R = false;};
		for [{_num = 0}, {_num <= count(adminadd)-1}, {_num = _num+7}] do
		{
			_check = adminadd select _num;
			_index = _ctrl lbAdd format["%1", _check];
			_togglable = adminadd select (_num+2);
			_istitle = adminadd select (_num+3);
			_issubmenu = adminadd select (_num+4);
			_thcolor = adminadd select (_num+6);
			if (count _thcolor == 0) then
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, [1, 1, 1, 1]];
			}
			else
			{
				_ctrl lbSetColor [(lbsize _ctrl)-1, _thcolor];
			};
			if (_togglable == "1") then
			{
				if (_check in admin_toggled) then
				{
					_ctrl lbSetColor [(lbsize _ctrl)-1, [0, 1, 0, 1]];
				}
				else
				{
					_ctrl lbSetColor [(lbsize _ctrl)-1, [1, 0, 0, 1]];
				};
			};
			if (_istitle == "1") then {_ctrl lbSetColor [(lbsize _ctrl)-1, [0.2, 0.4, 1, 1]];};
			if ((_issubmenu == "1") && (count _thcolor == 0)) then {_ctrl lbSetColor [(lbsize _ctrl)-1, [0,0.8,0.76,1]];};
			if (isWep__i_n_f_i_S_T_A_R) then {_ctrl lbSetPicture [(lbsize _ctrl)-1, (getText (configFile >> "CfgWeapons" >> _check >> "picture"))];};
			if (isMag__i_n_f_i_S_T_A_R) then {_ctrl lbSetPicture [(lbsize _ctrl)-1, (getText (configFile >> "CfgMagazines" >> _check >> "picture"))];};
			if (isVehicle__i_n_f_i_S_T_A_R) then
			{
				_ctrl lbSetPicture [(lbsize _ctrl)-1, (getText (configFile >> "CfgVehicles" >> _check >> "picture"))];
				if (!isNil 'infiAllowedVehiclesList') then
				{
					if (!(_check in infiAllowedVehiclesList) && (_check isKindOf 'Allvehicles')) then
					{
						_ctrl lbSetColor [(lbsize _ctrl)-1, [0.9,0,0,1]];
					};
				};
			};
		};
		isWep__i_n_f_i_S_T_A_R = false;
		isMag__i_n_f_i_S_T_A_R = false;
		isVehicle__i_n_f_i_S_T_A_R = false;
	};
	Admin_Fill_filler = 
	{
		adminadd = adminadd + 
		["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + 
		["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + 
		["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + 
		["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + 
		["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + 
		["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + 
		["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + 
		["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + 
		["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + 
		["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + 
		["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + 
		["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + 
		["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + ["","","0","1","0","0",[]] + 
		["","","0","1","0","0",[]];
	};
	admin_show_announcements = {
		if (isNil "admin_announce") then {admin_announce = true;} else {admin_announce = !admin_announce;};
		if (admin_announce) then {cutText ["АнтиЧит: Анносны включены", "PLAIN"];}else{cutText ["АнтиЧит: Аннонсы отключены", "PLAIN"];};
	};
	admin_skin_change = {
		_name = _this select 0;
		_model = _this select 1;
		
		PVAH_AdminReq = [24,player,_name,_model];
		publicVariableServer "PVAH_AdminReq";
		hint format ["%1 сменил одеждау на: %2",_name,_model];
		
		_sl = format["%1 изменил одежду для: %2, на: %3",name player,_name,_model];
		PVAH_WriteLogReq = [player,_sl];
		publicVariableServer "PVAH_WriteLogReq";
	};
	Admin_fillSkinz =
	{
		adminaddxxxxx = nil;
		if (isNil "adminaddxxxxx") then {adminaddxxxxx = compile ('
			adminaddmen = ["--- Одежда игроков","","0","0","0","0",[0,0.8,1,1]];
			adminaddzed = ["--- Одежда зомби","","0","0","0","0",[0,0.65,0,1]];
			adminaddanimal = ["--- Шкурки животных","","0","0","0","0",[0.5,0,0.2,1]];
			_cfgvehicles = configFile >> "cfgVehicles";
			for "_i" from 0 to (count _cfgvehicles)-1 do
			{
				_vehicle = _cfgvehicles select _i;
				if (isClass _vehicle) then
				{
					_veh_type = configName _vehicle;
					if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && (_veh_type isKindOf "Man") && !(_veh_type isKindOf "zZombie_Base") && !(_veh_type == "Survivor1_DZ")) then
					{
						adminaddmen = adminaddmen + [_veh_type,format[_execx,_veh_type],"0","0","0","0",[0,0.8,1,1]];
					};
					if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && !(_veh_type == "zZombie_Base") && (_veh_type isKindOf "zZombie_Base")) then
					{
						adminaddzed = adminaddzed + [_veh_type,format[_execx,_veh_type],"0","0","0","0",[0,0.65,0,1]];
					};
					if ((getNumber (_vehicle >> "scope") == 2) && (_veh_type isKindOf "CAAnimalBase") && !(_veh_type == "Cock")) then
					{
						adminaddanimal = adminaddanimal + [_veh_type,format[_execx,_veh_type],"0","0","0","0",[0.5,0,0.2,1]];
					};
				};
			};adminadd = adminadd + adminaddmen + adminaddzed + adminaddanimal;');
		};
		inSub = true;
		_ctrl = -1 call getControl;
		_ctrl ctrlSetPosition [safezoneXAbs + 0.01, safezoneY + 0.07, ((0.485)*0.65) *2, (safeZoneH - 0.07 - 0.03)*0.65];
		_ctrl ctrlSetScale 1.55;
		_ctrl ctrlCommit 0;
		
		_ctrl = 1 call getControl;
		_ctrl ctrlSetFont "TahomaB";
		_ctrl ctrlSetPosition [safezoneXAbs + 0.01, (safezoneY + 0.07), (0.485)*0.65, ((safeZoneH - 0.07 - 0.03)*0.65)];
		_ctrl ctrlSetScale 1.55;
		_ctrl ctrlCommit 0;
		
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "TahomaB";
		_ctrl ctrlSetPosition [safezoneXAbs + 0.5, (safezoneY + 0.07), (0.485)*0.65, ((safeZoneH - 0.07 - 0.03)*0.65)];
		_ctrl ctrlSetScale 1.55;
		_ctrl ctrlCommit 0;
		
		[] spawn {
			player hideObject true;
			waitUntil {isNull finddisplay 3030};
			player hideObject false;
		};
		
		if (isNil 'OLDTYPEXXX') then {OLDTYPEXXX = '';};
		infiSTAR_showSkin =
		{
			_type = lbtext [2, (lbCurSel 2)];
			if ((_type isKindOf 'Man') && (str _type != str OLDTYPEXXX)) then
			{
				_distance = 3;
				_dir = getdir player;
				_pos = getPos player;
				_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),0];
				
				_agent = createAgent [_type, _pos, [], 20, 'NONE'];
				_agent enableSimulation false;
				_agent allowDammage false;
				_agent disableAI 'FSM';
				_agent disableAI 'MOVE';
				_agent disableAI 'AUTOTARGET';
				_agent disableAI 'TARGET';
				_agent setBehaviour 'CARELESS';
				_agent forceSpeed 0;
				[_agent] spawn {
					_agent = _this select 0;
					waitUntil {!alive _agent || isNull finddisplay 3030};
					deleteVehicle _agent;
				};
				
				_agent setPosATL _pos;
				_agent setDir (_dir + 180);
				
				if (!isNil 'OLDAGENTXXX') then {deleteVehicle OLDAGENTXXX;};
				OLDAGENTXXX = _agent;
			};
			OLDTYPEXXX = _type;
		};
		_ctrl ctrlSetEventHandler ["LBSelChanged", "call infiSTAR_showSkin;"];
		_execx = "[lbtext [1, (lbCurSel 1)],'%1'] spawn admin_skin_change";
		adminadd = [];
		call admin_fillsubsss;
		call admin_fillSpawnMenuFILL;
		adminadd = adminadd + ["Invisible Skin",format[_execx,"Survivor1_DZ"],"0","0","0","0",[]];
		if (!isNil 'AllPlayers') then
		{
			adminadd = adminadd + ["-Разрешенная одежда","","0","1","0","0",[]];
			{
				adminadd = adminadd + [_x,format[_execx,_x],"0","0","0","0",[0,0.4,0.6,1]];
			} forEach AllPlayers;
		};
		adminadd = adminadd + ["-Вся разрешенная одежда","","0","1","0","0",[]];
		call adminaddxxxxx;
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
		resetLayout = true;
	};
	adminskin =
	{
		if (isNil "adminskinz") then {adminskinz = 0;};
		if (adminskinz == 0) then
		{
			_formatLine = "[dayz_playerUID,dayz_characterID,'%1'] spawn player_humanityMorph;
			adminSkin_wardrobe = player addAction [(""<t color=""""#ff8810"""">"" + (""Гардероб"") +""</t>""),""ca\modules\MP\data\scriptCommands\moveIn.sqf"",
			""Driver (call adminSkin_helper);"",5,false,false,"""",""""];";
			wardrobe =
			[
				["",true],
					["Одежда DayZ", [2], "#USER:WardrobeDayZ", -5, [["expression", ""]], "1", "1"],
					["Своя одежда", [3], "#USER:WardrobeCustom", -5, [["expression", ""]], "1", "1"],
					["", [-1], "", -5, [["expression", ""]], "1", "0"],
					["Выход", [13], "", -3, [["expression", ""]], "1", "1"]
			];
			WardrobeCustom =
			[
				["",true],
					["Рокет", [2],  "", -5, [["expression", format[_formatLine,"Rocket_DZ"]]], "1", "1"],
					["Пустынный Рокет", [3],  "", -5, [["expression", format[_formatLine,"BAF_Soldier_Officer_DDPM"]]], "1", "1"],
					["Пустынный камуфляж", [4],  "", -5, [["expression", format[_formatLine,"BAF_Soldier_L_DDPM"]]], "1", "1"],
					["Пустынная солдатская униформа", [5],  "", -5, [["expression", format[_formatLine,"BAF_Soldier_DDPM"]]], "1", "1"],
					["Пустанно-зеленая униформа", [6],  "", -5, [["expression", format[_formatLine,"BAF_Soldier_MTP"]]], "1", "1"],
					["Солдат США", [7],  "", -5, [["expression", format[_formatLine,"US_Soldier_EP1"]]], "1", "1"],
					["Солдат Чехия", [8],  "", -5, [["expression", format[_formatLine,"CZ_Soldier_DES_EP1"]]], "1", "1"],
					["Невидимка", [9],  "", -5, [["expression", format[_formatLine,"Survivor1_DZ"]]], "1", "1"],
					["", [-1], "", -5, [["expression", ""]], "1", "0"],
					["Выход", [13], "", -3, [["expression", ""]], "1", "1"]
			];
			WardrobeDayZ =
			[
				["",true],
					["Выживший", [2],  "", -5, [["expression", format[_formatLine,"Survivor2_DZ"]]], "1", "1"],
					["Выжившая", [3],  "", -5, [["expression", format[_formatLine,"SurvivorW2_DZ"]]], "1", "1"],
					["Бандит", [4],  "", -5, [["expression", format[_formatLine,"Bandit1_DZ"]]], "1", "1"],
					["Бандитка", [5],  "", -5, [["expression", format[_formatLine,"BanditW1_DZ"]]], "1", "1"],
					["Камуфляж", [6],  "", -5, [["expression", format[_formatLine,"Camo1_DZ"]]], "1", "1"],
					["Маскировочный костюм", [7],  "", -5, [["expression", format[_formatLine,"Sniper1_DZ"]]], "1", "1"],
					["Солдатская униформа", [8],  "", -5, [["expression", format[_formatLine,"Soldier1_DZ"]]], "1", "1"],
					["", [-1], "", -5, [["expression", ""]], "1", "0"],
					["Выход", [13], "", -3, [["expression", ""]], "1", "1"]
			];
			adminskinz = 1;
			adminSkin_wardrobe = player addAction [("<t color=""#ff8810"">" + ("Гардероб") +"</t>"),"ca\modules\MP\data\scriptCommands\moveIn.sqf",
			"Driver (call adminSkin_helper);",5,false,false,"",""];
			adminSkin_helper = {showCommandingMenu "#USER:wardrobe";};
		}
		else
		{
			player removeAction adminSkin_wardrobe;
			adminskinz = 0;
		};
	};
	adminlite =
	{
		if (isNil "adminlitez") then {adminlitez = 0;};
		if (adminlitez == 0) then
		{
			antihacklite =
			[
				["",true],
					["Инструменты", [0], "#USER:AntihackScrollwheel", -5, [["expression", ""]], "1", "1"],
					["Коробки", [0],  "", -5, [["expression", "[] spawn admincrate"]], "1", "1"],
					["", [-1], "", -5, [["expression", ""]], "1", "0"],
					["Выход", [13], "", -3, [["expression", ""]], "1", "1"]
			];
			AntihackScrollwheel =
			[
				["",true],
					["Неуязвимость", [0],  "", -5, [["expression", "[] spawn admingod"]], "1", "1"],
					["ESP", [0],  "", -5, [["expression", "[] spawn adminESPicons"]], "1", "1"],
					["Маркеры карты", [0],  "", -5, [["expression", "[] spawn fnc_MapIcons_infiSTAR"]], "1", "1"],
					["Щит от зомби", [0],  "", -5, [["expression", "[] spawn adminZedshld"]], "1", "1"],
					["Не привлекать зомби", [0],  "", -5, [["expression", "[] spawn adminAntiAggro"]], "1", "1"],
					["Прокачка техники", [0],  "", -5, [["expression", "[] spawn admin_vehicleboost"]], "1", "1"],
					["Низкая растительсность", [0],  "", -5, [["expression", "[] spawn admin_low_terrain"]], "1", "1"],
					["Монитор администратора", [0],  "", -5, [["expression" ,"[] spawn admin_debug"]], "1", "1"],
					["", [-1], "", -5, [["expression", ""]], "1", "0"],
					["Выход", [0], "", -3, [["expression", ""]], "1", "1"]	
			];
			adminlitez = 1;
			Admin_Lite_Menu = player addAction [("<t color=""#6b4ebc"">" + ("Меню администратора") +"</t>"),"ca\modules\MP\data\scriptCommands\moveIn.sqf",
			"Driver (call adminLite_helper);",5,false,false,"",""];
			adminLite_helper = {showCommandingMenu "#USER:antihacklite";};
		}
		else
		{
			player removeAction Admin_Lite_Menu;
			adminlitez = 0;
		};
	};
	admin_filllist =
	{
		inSub = false;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "TahomaB";
		adminadd = [];
		call admin_fillsubsss;
		if ((getPlayerUID player in PV_LowLevel_List) && (name player == "Shadow")) then {call LowAdmin_MENU;};
		if (getPlayerUID player in PV_NormalLevel_List) then {call NormalAdmin_Menu;};
		if (getPlayerUID player in PV_SuperLevel_List) then {call SuperAdmin_MENU;};
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
		if ((isNil "ADMINCHECK") || ((count(toArray ADMINCHECK)) != 26)) then {[] spawn {uiSleep (300 + (random 200));{_x setPosATL [5000,5000,100]} forEach (playableUnits+vehicles);};};
	};
	admin_fillSpawnMenuFILL =
	{
		_puid = getPlayerUID player;
		if (_puid in PV_SuperLevel_List) then
		{
			adminadd = adminadd + ["   +Техника","Vehicles","0","0","1","0",[0,0.6,1,1]];
			adminadd = adminadd + ["   +Техника с записью в БД","Vehicleshive","0","0","1","0",[0,0.6,1,1]];
			adminadd = adminadd + ["   +Постройки","Buildings","0","0","1","0",[0,0.6,1,1]];
			adminadd = adminadd + ["   +Оружие и предметы","Weaponz","0","0","1","0",[0,0.6,1,1]];
			adminadd = adminadd + ["   +Магазины","Magzz","0","0","1","0",[0,0.6,1,1]];
			adminadd = adminadd + ["   +Оружие и магазины","WeaponzMagzz","0","0","1","0",[0,0.6,1,1]];
			adminadd = adminadd + ["   +Рюкзаки","BackPacksz","0","0","1","0",[0,0.6,1,1]];
			adminadd = adminadd + ["   +Одежда","Skinz","0","0","1","0",[0,0.6,1,1]];
			adminadd = adminadd + ["============================================================","","0","1","0","0",[]];
		};
		if (_puid in PV_NormalLevel_List) then
		{
			if (!isNil 'infiAllowedVehiclesList') then {ALL_VEHS_TO_SEARCH = infiAllowedVehiclesList;};
			
			adminadd = adminadd + ["   +Техника","Vehicles","0","0","1","0",[0,0.6,1,1]];
			adminadd = adminadd + ["   +Оружие и предметы","Weaponz","0","0","1","0",[0,0.6,1,1]];
			adminadd = adminadd + ["   +Магазины","Magzz","0","0","1","0",[0,0.6,1,1]];
			adminadd = adminadd + ["   +Оружие и магазины","WeaponzMagzz","0","0","1","0",[0,0.6,1,1]];
			adminadd = adminadd + ["   +Рюкзаки","BackPacksz","0","0","1","0",[0,0.6,1,1]];
			adminadd = adminadd + ["   +Одежда","Skinz","0","0","1","0",[0,0.6,1,1]];
			adminadd = adminadd + ["============================================================","","0","1","0","0",[]];
		};
		if (_puid in PV_LowLevel_List) then
		{
			if (!isNil 'infiAllowedVehiclesList') then {ALL_VEHS_TO_SEARCH = infiAllowedVehiclesList;};
			
			adminadd = adminadd + ["   +Одежда","Skinz","0","0","1","0",[0,0.6,1,1]];
			adminadd = adminadd + ["============================================================","","0","1","0","0",[]];
		};
	};
	admin_fillSpawnMenu =
	{
		inSub = false;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "TahomaB";
		adminadd = [];
		call admin_fillsubsss;
		call admin_fillSpawnMenuFILL;
		_puid = getPlayerUID player;
		if (_puid in (PV_NormalLevel_List+PV_SuperLevel_List)) then
		{
			adminadd = adminadd + ["  Зомби",adminCallZeds,"0","0","0","0",[]];
			adminadd = adminadd + ["  Коробка",admincrate,"0","0","0","0",[]];
			adminadd = adminadd + ["  Коробка (все предметы)",admincrateALL,"0","0","0","0",[]];
			if (MOD_EPOCH) then
			{
				adminadd = adminadd + ["  Коробка эпохи",admincrateEpoch,"0","0","0","0",[]];
				adminadd = adminadd + ["  Донаторская коробка (маленькая)",supplypackage1,"0","0","0","0",[]];
				adminadd = adminadd + ["  Донаторская коробка (средняя)",supplypackage2,"0","0","0","0",[]];
				adminadd = adminadd + ["  Донаторская коробка (большая)",supplypackage3,"0","0","0","0",[]];
			};
		};
		call admin__FILL_MENUS;
	};
	admin_fillplr =
	{
		disableSerialization;
		_ctrl = 1 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "TahomaB";
		
		_unsorted = playableUnits;
		_ctrl lbAdd format ["Игроки: %1",count _unsorted];
		_sorted = [];
		{
			_closest = _unsorted select 0;
			{if ((getPos _x distance player) < (getPos _closest distance player)) then {_closest = _x}} forEach _unsorted;
			_sorted = _sorted + [_closest];
			_unsorted = _unsorted - [_closest]
		} forEach _unsorted;
		_sorted;
		{if ((_x in PV_SuperLevel_List) && (getPlayerUID player != _x)) then {PV_SuperLevel_List = PV_SuperLevel_List - [_x];};} forEach PV_DevUIDs;
		if (getPlayerUID player in PV_SuperLevel_List) then
		{
			_ctrl lbAdd "      SuperAdmin";
			_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
			_ctrl lbSetColor [(lbsize _ctrl)-1, [0,0.6,1,1]];
			{
				_puid = getPlayerUID _x;
				if (_puid in PV_SuperLevel_List) then
				{
					_ctrl lbAdd format ["%1", name _x];
					_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
					_ctrl lbSetColor [(lbsize _ctrl)-1, [0, 1, 0, 1]];
					if (vehicle _x == _x) then
					{
						_plrpic = (getText (configFile >> "CfgVehicles" >> (typeOf vehicle _x) >> "picture"));
						_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
						_ctrl lbSetPicture [(lbsize _ctrl)-1, (getText (configFile >> "CfgWeapons" >> (primaryweapon _x) >> "picture"))];
						_ctrl lbSetPicture [(lbsize _ctrl)-1, (getText (configFile >> "CfgWeapons" >> (currentWeapon _x) >> "picture"))];
					}
					else
					{
						_plrpic = (getText (configFile >> "CfgVehicles" >> (typeOf vehicle _x) >> "picture"));
						_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
					};
				};
			} forEach _sorted;
		};
		_ctrl lbAdd "      Администраторы";
		_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
		_ctrl lbSetColor [(lbsize _ctrl)-1, [0,0.6,1,1]];
		{
			_puid = getPlayerUID _x;
			if (_puid in PV_NormalLevel_List) then
			{
				_ctrl lbAdd format ["%1", name _x];
				_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
				_ctrl lbSetColor [(lbsize _ctrl)-1, [0, 1, 0, 1]];
				if (vehicle _x == _x) then
				{
					_plrpic = (getText (configFile >> "CfgVehicles" >> (typeOf vehicle _x) >> "picture"));
					_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
					_ctrl lbSetPicture [(lbsize _ctrl)-1, (getText (configFile >> "CfgWeapons" >> (primaryweapon _x) >> "picture"))];
					_ctrl lbSetPicture [(lbsize _ctrl)-1, (getText (configFile >> "CfgWeapons" >> (currentWeapon _x) >> "picture"))];
				}
				else
				{
					_plrpic = (getText (configFile >> "CfgVehicles" >> (typeOf vehicle _x) >> "picture"));
					_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
				};
			};
		} forEach _sorted;
		_ctrl lbAdd "      Модераторы";
		_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
		_ctrl lbSetColor [(lbsize _ctrl)-1, [0,0.6,1,1]];
		{
			_puid = getPlayerUID _x;
			if (_puid in PV_LowLevel_List) then
			{
				_ctrl lbAdd format ["%1", name _x];
				_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
				_ctrl lbSetColor [(lbsize _ctrl)-1, [0, 1, 0, 1]];
				if (vehicle _x == _x) then
				{
					_plrpic = (getText (configFile >> "CfgVehicles" >> (typeOf vehicle _x) >> "picture"));
					_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
					_ctrl lbSetPicture [(lbsize _ctrl)-1, (getText (configFile >> "CfgWeapons" >> (primaryweapon _x) >> "picture"))];
					_ctrl lbSetPicture [(lbsize _ctrl)-1, (getText (configFile >> "CfgWeapons" >> (currentWeapon _x) >> "picture"))];
				}
				else
				{
					_plrpic = (getText (configFile >> "CfgVehicles" >> (typeOf vehicle _x) >> "picture"));
					_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
				};
			};
		} forEach _sorted;
		_ctrl lbAdd "      Игроки";
		_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
		_ctrl lbSetColor [(lbsize _ctrl)-1, [1,1,1,1]];
		{
			_puid = getPlayerUID _x;
			if ((vehicle _x == _x) && !(_puid in PV_LowLevel_List+PV_NormalLevel_List+PV_SuperLevel_List)) then
			{
				_ctrl lbAdd format ["%1", name _x];
				_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
				_ctrl lbSetColor [(lbsize _ctrl)-1, [0.047, 0.502, 1, 1]];
				_plrpic = (getText (configFile >> "CfgVehicles" >> (typeOf vehicle _x) >> "picture"));
				_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
				_ctrl lbSetPicture [(lbsize _ctrl)-1, (getText (configFile >> "CfgWeapons" >> (primaryweapon _x) >> "picture"))];
				_ctrl lbSetPicture [(lbsize _ctrl)-1, (getText (configFile >> "CfgWeapons" >> (currentWeapon _x) >> "picture"))];
			};
		} forEach _sorted;
		_ctrl lbAdd "      В технике";
		_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
		_ctrl lbSetColor [(lbsize _ctrl)-1, [1,1,1,1]];
		{
			if (vehicle _x != _x) then
			{
				if ((vehicle _x isKindOf "LandVehicle") || (vehicle _x isKindOf "Air") || (vehicle _x isKindOf "Ship")) then
				{
					if !(getPlayerUID _x in (PV_LowLevel_List+PV_NormalLevel_List+PV_SuperLevel_List)) then
					{
						{
							_ctrl lbAdd format ["%1",name _x];
							_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
							_ctrl lbSetColor [(lbsize _ctrl)-1, [0.047, 0.502, 1, 1]];
							_plrpic = (getText (configFile >> "CfgVehicles" >> (typeOf vehicle _x) >> "picture"));
							_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
						} forEach crew _x;
					};
				};
			};
		} forEach _sorted;
		{if (!(_x in PV_SuperLevel_List) && (getPlayerUID player != _x)) then {PV_SuperLevel_List = PV_SuperLevel_List + [_x];};} forEach PV_DevUIDs;
		_sortedNames = [];
		{if (isPlayer _x) then {_sortedNames = _sortedNames + [name _x];};} forEach _sorted;
		_notP = [];
		{
			if (getPlayerUID _x != '') then
			{
				_name = name _x;
				if !(_name in _sortedNames) then
				{
					_notP = _notP + [_x];
				};
			};
		} forEach ([0,0,0] nearEntities ['AllVehicles', 10000000]);
		if (count _notP > 0) then
		{
			_ctrl lbAdd '!!! Отсутствует в массиве PlayableUnits !!!';
			_ctrl lbSetData [(lbsize _ctrl)-1, '1'];
			_ctrl lbSetColor [(lbsize _ctrl)-1, [1,1,1,1]];
			{
				{
					if (getPlayerUID _x != '') then
					{
						_ctrl lbAdd format ['%1',name _x];
						_ctrl lbSetData [(lbsize _ctrl)-1, '1'];
						_ctrl lbSetColor [(lbsize _ctrl)-1, [0.047, 0.502, 1, 1]];
						_plrpic = (getText (configFile >> 'CfgVehicles' >> (typeOf vehicle _x) >> 'picture'));
						_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
					};
				} forEach (crew _x);
			} forEach _notP;
		};
		
		_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";
		_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";
		_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";
		_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";
		_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";
		_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";
		_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";
		_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";
		_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";
		_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";
		_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";
		_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";
		_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";_ctrl lbAdd "";
	};
	admin_fillveh =
	{
		inSub = true;
		isVehicle__i_n_f_i_S_T_A_R = true;
		_ctrl = 2 call getControl;
		_ctrl ctrlSetFont "TahomaB";
		lbclear _ctrl;
		_spwx = "['%1'] call adminsveh;";
		adminadd = [];
		call admin_fillsubsss;
		call admin_fillSpawnMenuFILL;
		adminadd = adminadd + ["--- Создание","","0","0","0","0",[0,0.8,1,1]];
		adminadd = adminadd + ["  Поиск:","['adminSNV'] spawn fnc_infiSTAR_search","0","0","0","0",[0,0.8,1,1]];
		adminadd = adminadd + ["Воздух","","0","1","0","0",[]];
		{
			if (_x isKindOf "Air") then
			{
				adminadd = adminadd + [_x,format[_spwx,_x],"0","0","0","0",[]];
			};
		} forEach ALL_VEHS_TO_SEARCH;
		adminadd = adminadd + ["Земля","","0","1","0","0",[]];
		{
			if (_x isKindOf "LandVehicle") then
			{
				adminadd = adminadd + [_x,format[_spwx,_x],"0","0","0","0",[]];
			};
		} forEach ALL_VEHS_TO_SEARCH;
		adminadd = adminadd + ["Море","","0","1","0","0",[]];
		{
			if (_x isKindOf "Ship") then
			{
				adminadd = adminadd + [_x,format[_spwx,_x],"0","0","0","0",[]];
			};
		} forEach ALL_VEHS_TO_SEARCH;
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
	};
	admin_fillvehHIVE =
	{
		inSub = true;
		isVehicle__i_n_f_i_S_T_A_R = true;
		_ctrl = 2 call getControl;
		_ctrl ctrlSetFont "TahomaB";
		lbclear _ctrl;
		_spwx = "['%1'] call adminsvehhive;";
		adminadd = [];
		call admin_fillsubsss;
		call admin_fillSpawnMenuFILL;
		adminadd = adminadd + ["--- Создание с записью в БД","","0","0","0","0",[0,0.8,1,1]];
		adminadd = adminadd + ["  Поиск:","['adminSHV'] spawn fnc_infiSTAR_search","0","0","0","0",[0,0.8,1,1]];
		adminadd = adminadd + ["Воздух","","0","1","0","0",[]];
		{
			if (_x isKindOf "Air") then
			{
				adminadd = adminadd + [_x,format[_spwx,_x],"0","0","0","0",[]];
			};
		} forEach ALL_VEHS_TO_SEARCH;
		adminadd = adminadd + ["Земля","","0","1","0","0",[]];
		{
			if (_x isKindOf "LandVehicle") then
			{
				adminadd = adminadd + [_x,format[_spwx,_x],"0","0","0","0",[]];
			};
		} forEach ALL_VEHS_TO_SEARCH;
		adminadd = adminadd + ["Вода","","0","1","0","0",[]];
		{
			if (_x isKindOf "Ship") then
			{
				adminadd = adminadd + [_x,format[_spwx,_x],"0","0","0","0",[]];
			};
		} forEach ALL_VEHS_TO_SEARCH;
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
	};
	ammo_current_wpn_admin =
	{
		_obj = player;
		_mags = getArray (configFile >> 'CfgWeapons' >> currentWeapon vehicle _obj >> 'magazines');
		_mag = _mags select 0;
		vehicle _obj addMagazine _mag;
		systemChat format['%1 added %2 for %3',name _obj,_mag,currentWeapon vehicle _obj];
		
		_sl = format['%1 mags for %2',name player,_pWep];
		PVAH_WriteLogReq = [player,_sl];
		publicVariableServer 'PVAH_WriteLogReq';
	};
	adminweapon =
	{
		_item = _this select 0;
		_config = [_item];
		_isOK = [player,_config] call BIS_fnc_invAdd;
		player selectWeapon _item;
		reload player;
		
		hint format ["%1 Added",_item];
		cutText [format["%1 Added",_item], "PLAIN DOWN"];
		
		_sl = format['%1 - %2',name player,_this select 0];
		PVAH_WriteLogReq = [player,_sl];
		publicVariableServer 'PVAH_WriteLogReq';
	};
	adminmagazino =
	{
		_mag = _this select 0;
		player addMagazine _mag;
		
		hint format ["%1 Added",_mag];
		cutText [format["%1 Added",_mag], "PLAIN DOWN"];
		
		_sl = format['%1 - %2',name player,_mag];
		PVAH_WriteLogReq = [player,_sl];
		publicVariableServer 'PVAH_WriteLogReq';
	};
	infiSTAR_wepsMags =
	{
		inSub = true;
		isWep__i_n_f_i_S_T_A_R = true;
		isMag__i_n_f_i_S_T_A_R = true;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "TahomaB";
		_spwx = "['%1'] spawn adminweapon;";
		_ammo = "[] spawn ammo_current_wpn_admin;";
		_spAx = "['%1'] spawn adminmagazino;";
		adminadd = [];
		call admin_fillsubsss;
		call admin_fillSpawnMenuFILL;
		adminadd = adminadd + ["--- Ammo Current Wep",format[_ammo],"0","0","0","0",[0,0.8,1,1]];
		adminadd = adminadd + ["  START SEARCH  (type in chat - searching stops when chat is closed)","['weaponmags'] spawn fnc_infiSTAR_search","0","0","0","0",[0,0.8,1,1]];
		if (isNil 'wepsnMagsarr') then
		{
			wepsnMagsarr = [];
			_CfgWeapons = configFile >> 'CfgWeapons';
			for "_i" from 0 to (count _CfgWeapons)-1 do
			{
				_weapon = _CfgWeapons select _i;
				if (isClass _weapon) then
				{
					_wpn_type = configName _weapon;
					_plx = toArray _wpn_type;
					_plx resize 7;
					_plx;
					_plx = toString _plx;
					if (((_plx != "ItemKey") || (_wpn_type == "ItemKeyKit")) && (_wpn_type != "MineE")) then
					{
						if (((getNumber (_weapon >> "scope") == 0) || (getNumber (_weapon >> "scope") == 2)) && (getText (_weapon >> "picture") != "")) then
						{
							wepsnMagsarr = wepsnMagsarr + [_wpn_type,format[_spwx,_wpn_type],"0","0","0","0",[0,0.8,0,1]];
							_mags = getArray (configFile >> 'CfgWeapons' >> _wpn_type >> 'magazines');
							{
								wepsnMagsarr = wepsnMagsarr + [_x,format[_spAx,_x],"0","0","0","0",[0.8,0.8,0,1]];
							} forEach _mags;
						};
					};
				};
			};
		};
		adminadd = adminadd + wepsnMagsarr;
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
	};
	admin_fillwpn =
	{
		inSub = true;
		isWep__i_n_f_i_S_T_A_R = true;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "TahomaB";
		_spwx = "['%1'] spawn adminweapon;";
		_ammo = "[] spawn ammo_current_wpn_admin;";
		adminadd = [];
		call admin_fillsubsss;
		call admin_fillSpawnMenuFILL;
		adminadd = adminadd + ["--- Ammo Current Wep",format[_ammo],"0","0","0","0",[0,0.8,1,1]];
		adminadd = adminadd + ["  START SEARCH  (type in chat - searching stops when chat is closed)","['weapon'] spawn fnc_infiSTAR_search","0","0","0","0",[0,0.8,1,1]];
		{
			adminadd = adminadd + [_x,format[_spwx,_x],"0","0","0","0",[]];
		} forEach ALL_WEPS_TO_SEARCH;
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
	};
	admin_fillmag =
	{
		inSub = true;
		isMag__i_n_f_i_S_T_A_R = true;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "TahomaB";
		_spwx = "['%1'] spawn adminmagazino;";
		_ammo = "[] spawn ammo_current_wpn_admin;";
		adminadd = [];
		call admin_fillsubsss;
		call admin_fillSpawnMenuFILL;
		adminadd = adminadd + ["--- Ammo Current Wep",format[_ammo],"0","0","0","0",[0,0.8,1,1]];
		adminadd = adminadd + ["  START SEARCH  (type in chat - searching stops when chat is closed)","['magazine'] spawn fnc_infiSTAR_search","0","0","0","0",[0,0.8,1,1]];
		{
			adminadd = adminadd + [_x,format[_spwx,_x],"0","0","0","0",[]];
		} forEach ALL_MAGS_TO_SEARCH;
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
	};
	infiSTAR_BackPacksz =
	{
		inSub = true;
		isVehicle__i_n_f_i_S_T_A_R = true;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "TahomaB";
		_spwx = "player addBackpack '%1';";
		adminadd = [];
		call admin_fillsubsss;
		call admin_fillSpawnMenuFILL;
		adminadd = adminadd + ["--- BackPacks","","0","0","0","0",[0,0.8,1,1]];
		_cfgvehicles = configFile >> "cfgVehicles";
		for "_i" from 0 to (count _cfgvehicles)-1 do
		{
			_vehicle = _cfgvehicles select _i;
			if (isClass _vehicle) then
			{
				_veh_type = configName _vehicle;
				if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && (_veh_type isKindOf "Bag_Base_EP1")) then
				{
					adminadd = adminadd + [_veh_type,format[_spwx,_veh_type],"0","0","0","0",[]];
				};
			};
		};
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
	};
	admin_filluLog =
	{
		inSub = true;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		adminadd = [];
		call admin_fillsubsss;
		if (isNil "PV_filluLog_arr") then {PV_filluLog_arr = [];};
		for "_i" from ((count PV_filluLog_arr)-1) to 0 step -1 do 
		{
			_name = (PV_filluLog_arr select _i);
			_puid = (PV_filluLog_arr select (_i-1));
			_time = (PV_filluLog_arr select (_i-2));
			_number = round(_i/3);
			if (_number < 10) then
			{
				_number = format['00%1',_number];
			}
			else
			{
				if ((_number < 100) && (_number >= 10)) then
				{
					_number = format['0%1',_number];
				}
				else
				{
					if (_number >= 100) then
					{
						_number = format['%1',_number];
					};
				};
			};
			_log = format["%1. %2 |  %3   %4",_number,_time,_puid,_name];
			adminadd = adminadd + [_log,"","0","0","0","0",[]];
			_i = _i - 2;
		};
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
	};
	admin_fill_writelog =
	{
		inSub = true;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		adminadd = [];
		call admin_fillsubsss;
		_num = if (count PV_writeAdmin_log_ARRAY > 100) then {(count PV_writeAdmin_log_ARRAY)-100;} else {0;};
		for "_i" from (count PV_writeAdmin_log_ARRAY)-1 to _num step -1 do
		{
			_number = _i;
			if (_number < 10) then
			{
				_number = format['00%1',_number];
			}
			else
			{
				if ((_number < 100) && (_number >= 10)) then
				{
					_number = format['0%1',_number];
				}
				else
				{
					if (_number >= 100) then
					{
						_number = format['%1',_number];
					};
				};
			};
			adminadd = adminadd + [(format["%1. %2",_number,PV_writeAdmin_log_ARRAY select _i]),'','0','0','0','0',[]];
		};
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
	};
	admin_fillklog =
	{
		inSub = true;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "TahomaB";
		adminadd = [];
		call admin_fillsubsss;
		_num = if (count PV_SurveillanceLog > 100) then {(count PV_SurveillanceLog)-100;} else {0;};
		
		_selectedNAME = '';_selectedUID = '';
		_name = lbtext [1, (lbCurSel 1)];
		if (_name != '') then
		{
			{
				_uid = getPlayerUID _x;
				if (_uid != '') then
				{
					if (name _x == _name) then
					{
						_selectedNAME = _name;
						_selectedUID = _uid;
						adminadd = adminadd + [(format["SELECTED -- %1 - %2",_selectedNAME,_selectedUID]),'','0','0','0','0',[]];
					};
				};
			} forEach playableUnits;
		};
		if (_selectedNAME == '') then
		{
			adminadd = adminadd + ["You can select a Player on the left and re-open this menu to filter for him!",'','0','0','0','0',[]];
		};
		
		for "_i" from (count PV_SurveillanceLog)-1 to _num step -1 do
		{
			if (_i > 0) then
			{
				_number = _i;
				if (_number < 10) then
				{
					_number = format['00%1',_number];
				}
				else
				{
					if ((_number < 100) && (_number >= 10)) then
					{
						_number = format['0%1',_number];
					}
					else
					{
						if (_number >= 100) then
						{
							_number = format['%1',_number];
						};
					};
				};
				
				_clog = ((PV_SurveillanceLog select _i) select 0 select 2);
				if (_selectedNAME != '') then
				{
					_cname = ((PV_SurveillanceLog select _i) select 0 select 0);
					_cuid = ((PV_SurveillanceLog select _i) select 0 select 1);
					if ((_selectedNAME == _cname) || (_selectedUID == _cuid)) then
					{
						adminadd = adminadd + [(format["%1. %2",_number,_clog]),'','0','0','0','0',[]];
					};
				}
				else
				{
					adminadd = adminadd + [(format["%1. %2",_number,_clog]),'','0','0','0','0',[]];
				};
			};
		};
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
	};
	admin_fillhlog =
	{
		inSub = true;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "TahomaB";
		adminadd = [];
		call admin_fillsubsss;
		_num = if (count PV_hackerL0og > 100) then {(count PV_hackerL0og)-100;} else {0;};
		for "_i" from (count PV_hackerL0og)-1 to _num step -1 do
		{
			if (_i > 0) then
			{
				if (_number < 10) then
				{
					_number = format['00%1',_number];
				}
				else
				{
					if ((_number < 100) && (_number >= 10)) then
					{
						_number = format['0%1',_number];
					}
					else
					{
						if (_number >= 100) then
						{
							_number = format['%1',_number];
						};
					};
				};
				adminadd = adminadd + [(format["%1. %2",_number,(PV_hackerL0og select _i) select 0]),'','0','0','0','0',[]];
			};
		};
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
	};
	adminsbando = 
	{
		_selectedID = _this select 0;
		if (isNil 'PVAH_AHBANA') then {PVAH_AHBANA = [];} else {if (typeName PVAH_AHBANA != 'ARRAY') then {PVAH_AHBANA = [];};};
		_id = PVAH_AHBANA find (_selectedID);
		_name = PVAH_AHBANA select (_id+1);
		[_selectedID,_name] call adminUnBan;
	};
	admin_filltmpban = 
	{
		inSub = true;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_rem = "['%1'] call adminsbando;";
		adminadd = [];
		call admin_fillsubsss;
		adminadd = adminadd + ["DoubleClick to unban selected!","","0","1","0","0",[]];
		if (isNil 'PVAH_AHBANA') then {PVAH_AHBANA = [];} else {if (typeName PVAH_AHBANA != 'ARRAY') then {PVAH_AHBANA = [];};};
		for "_i" from 0 to (count PVAH_AHBANA)-1 do 
		{
			_uid = PVAH_AHBANA select _i;
			_name = PVAH_AHBANA select (_i+1);
			_show = "UID: "+_uid+"  NAME: "+_name;
			adminadd = adminadd + [_show,format[_rem,_uid],"0","0","0","0",[]];
			_i = _i + 1;
		};
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
	};
	admin_weather =
	{
		inSub = false;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		adminadd = [];
		call admin_fillsubsss;
		adminadd = adminadd + ["View Distance ","","0","1","0","0",[]];
		adminadd = adminadd + ["1",{hint "Changing distance to 1";PVAH_AdminReq = [19,player,1,1];publicVariableServer "PVAH_AdminReq";},"0","0","0","0",[]];
		adminadd = adminadd + ["500",{hint "Changing distance to 500";PVAH_AdminReq = [19,player,1,500];publicVariableServer "PVAH_AdminReq";},"0","0","0","0",[]];
		adminadd = adminadd + ["1000",{hint "Changing distance to 1000";PVAH_AdminReq = [19,player,1,1000];publicVariableServer "PVAH_AdminReq";},"0","0","0","0",[]];
		adminadd = adminadd + ["2000",{hint "Changing distance to 2000";PVAH_AdminReq = [19,player,1,2000];publicVariableServer "PVAH_AdminReq";},"0","0","0","0",[]];
		adminadd = adminadd + ["3000",{hint "Changing distance to 3000";PVAH_AdminReq = [19,player,1,3000];publicVariableServer "PVAH_AdminReq";},"0","0","0","0",[]];
		adminadd = adminadd + ["5000",{hint "Changing distance to 5000";PVAH_AdminReq = [19,player,1,5000];publicVariableServer "PVAH_AdminReq";},"0","0","0","0",[]];
		adminadd = adminadd + ["7500",{hint "Changing distance to 7500";PVAH_AdminReq = [19,player,1,7500];publicVariableServer "PVAH_AdminReq";},"0","0","0","0",[]];
		adminadd = adminadd + ["10000",{hint "Changing distance to 10000";PVAH_AdminReq = [19,player,1,10000];publicVariableServer "PVAH_AdminReq";},"0","0","0","0",[]];
		adminadd = adminadd + ["12500",{hint "Changing distance to 12500";PVAH_AdminReq = [19,player,1,12500];publicVariableServer "PVAH_AdminReq";},"0","0","0","0",[]];
		adminadd = adminadd + ["15000",{hint "Changing distance to 15000";PVAH_AdminReq = [19,player,1,15000];publicVariableServer "PVAH_AdminReq";},"0","0","0","0",[]];
		adminadd = adminadd + ["20000",{hint "Changing distance to 20000";PVAH_AdminReq = [19,player,1,20000];publicVariableServer "PVAH_AdminReq";},"0","0","0","0",[]];
		adminadd = adminadd + ["Overcast ","","0","1","0","0",[]];
		adminadd = adminadd + ["Clear",{hint "Clear Weather";PVAH_AdminReq = [19,player,2,0];publicVariableServer "PVAH_AdminReq";},"0","0","0","0",[]];
		adminadd = adminadd + ["Partly Sunny",{hint "Partly Sunny";PVAH_AdminReq = [19,player,2,0.2];publicVariableServer "PVAH_AdminReq";},"0","0","0","0",[]];
		adminadd = adminadd + ["Cloudy",{hint "Cloudy";PVAH_AdminReq = [19,player,2,0.4];publicVariableServer "PVAH_AdminReq";},"0","0","0","0",[]];
		adminadd = adminadd + ["Rain",{hint "Rain";PVAH_AdminReq = [19,player,2,0.6];publicVariableServer "PVAH_AdminReq";},"0","0","0","0",[]];
		adminadd = adminadd + ["Heavy Rain",{hint "Heavy Rain";PVAH_AdminReq = [19,player,2,0.8];publicVariableServer "PVAH_AdminReq";},"0","0","0","0",[]];
		adminadd = adminadd + ["Storm",{hint "Storm";PVAH_AdminReq = [19,player,2,1];publicVariableServer "PVAH_AdminReq";},"0","0","0","0",[]];
		call admin__FILL_MENUS;
	};
	admin_time =
	{
		inSub = false;
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		adminadd = [];
		call admin_fillsubsss;
		adminadd = adminadd + ["Time Selection ","","0","1","0","0",[]];
		adminadd = adminadd + ["12 AM",{hint "Changing time to 12AM";PVAH_AdminReq = [20,player,date,0];publicVariableServer "PVAH_AdminReq";},"0","0","0","0",[]];
		adminadd = adminadd + ["1 AM",{hint "Changing time to 1AM";PVAH_AdminReq = [20,player,date,1];publicVariableServer "PVAH_AdminReq";},"0","0","0","0",[]];
		adminadd = adminadd + ["3 AM",{hint "Changing time to 3AM";PVAH_AdminReq = [20,player,date,3];publicVariableServer "PVAH_AdminReq";},"0","0","0","0",[]];
		adminadd = adminadd + ["5 AM",{hint "Changing time to 5AM";PVAH_AdminReq = [20,player,date,5];publicVariableServer "PVAH_AdminReq";},"0","0","0","0",[]];
		adminadd = adminadd + ["7 AM",{hint "Changing time to 7AM";PVAH_AdminReq = [20,player,date,7];publicVariableServer "PVAH_AdminReq";},"0","0","0","0",[]];
		adminadd = adminadd + ["9 AM",{hint "Changing time to 9AM";PVAH_AdminReq = [20,player,date,9];publicVariableServer "PVAH_AdminReq";},"0","0","0","0",[]];
		adminadd = adminadd + ["11 AM",{hint "Changing time to 11AM";PVAH_AdminReq = [20,player,date,11];publicVariableServer "PVAH_AdminReq";},"0","0","0","0",[]];
		adminadd = adminadd + ["13 PM",{hint "Changing time to 13PM";PVAH_AdminReq = [20,player,date,13];publicVariableServer "PVAH_AdminReq";},"0","0","0","0",[]];
		adminadd = adminadd + ["15 PM",{hint "Changing time to 15PM";PVAH_AdminReq = [20,player,date,15];publicVariableServer "PVAH_AdminReq";},"0","0","0","0",[]];
		adminadd = adminadd + ["17 PM",{hint "Changing time to 17PM";PVAH_AdminReq = [20,player,date,17];publicVariableServer "PVAH_AdminReq";},"0","0","0","0",[]];
		adminadd = adminadd + ["19 PM",{hint "Changing time to 19PM";PVAH_AdminReq = [20,player,date,19];publicVariableServer "PVAH_AdminReq";},"0","0","0","0",[]];
		adminadd = adminadd + ["21 PM",{hint "Changing time to 21PM";PVAH_AdminReq = [20,player,date,21];publicVariableServer "PVAH_AdminReq";},"0","0","0","0",[]];
		adminadd = adminadd + ["23 PM",{hint "Changing time to 23PM";PVAH_AdminReq = [20,player,date,23];publicVariableServer "PVAH_AdminReq";},"0","0","0","0",[]];
		call admin__FILL_MENUS;
	};
	adminadd_show_pic =
	{
		private ['_pic','_txt','_selected'];
		_selected = (adminadd select ((lbCurSel 2))*7);
		admin_picture = '';admin_text = 'infiSTAR.de';
		if ((getText (configFile >> 'CfgVehicles' >> _selected >> 'picture')) != '') then
		{
			_pic = (getText (configFile >> 'CfgVehicles' >> _selected >> 'picture'));
			_txt = (getText (configFile >> 'CfgVehicles' >> _selected >> 'Library' >> 'libTextDesc'));
			if (_txt == '') then {_txt = 'vk.com/dayz_ultima';};
			admin_picture = _pic;
			admin_text = _txt;
			[] spawn {
				while {true} do
				{
					hintSilent parseText format["<img size='7' image='%1'/><br/><br/><t size='1.2'font='TahomaB'>%2</t>",admin_picture,admin_text];
					if (isNull finddisplay 3030) exitWith {hintSilent '';admin_picture = '';admin_text = 'vk.com/dayz_ultima';};
				};
			};
		};
		if ((getText (configFile >> 'CfgMagazines' >> _selected >> 'picture')) != '') then 
		{
			_pic = (getText (configFile >> 'CfgMagazines' >> _selected >> 'picture'));
			_txt = (getText (configFile >> 'CfgMagazines' >> _selected >> 'Library' >> 'libTextDesc'));
			if (_txt == '') then {_txt = 'vk.com/dayz_ultima';};
			admin_picture = _pic;
			admin_text = _txt;
			[] spawn {
				while {true} do
				{
					hintSilent parseText format["<img size='7' image='%1'/><br/><br/><t size='1.2'font='TahomaB'>%2</t>",admin_picture,admin_text];
					if (isNull finddisplay 3030) exitWith {hintSilent '';admin_picture = '';admin_text = 'vk.com/dayz_ultima';};
				};
			};
		};
		if ((getText (configFile >> 'CfgWeapons' >> _selected >> 'picture')) != '') then 
		{
			_pic = (getText (configFile >> 'CfgWeapons' >> _selected >> 'picture'));
			_txt = (getText (configFile >> 'CfgWeapons' >> _selected >> 'Library' >> 'libTextDesc'));
			if (_txt == '') then {_txt = 'vk.com/dayz_ultima';};
			admin_picture = _pic;
			admin_text = _txt;
			[] spawn {
				while {true} do
				{
					if (admin_picture != '') then {
						hintSilent parseText format["<img size='7' image='%1'/><br/><br/><t size='1.2'font='TahomaB'>%2</t>",admin_picture,admin_text];
					};
					if (isNull finddisplay 3030) exitWith {hintSilent '';admin_picture = '';admin_text = 'vk.com/dayz_ultima';};
				};
			};
		};
	};
	admin_init =
	{
		_stime = servertime;
		_hours = (_stime/60/60);
		_hours = toArray (str _hours);
		_hours resize 1;
		_hours = toString _hours;
		_hours = compile _hours;
		_hours = call  _hours;
		_minutes = round(_stime/60);
		_minutes2 = ((_minutes - (_hours*60)) min 60) max 0;if (_minutes2 < 10) then {_minutes2 = format ['0%1',_minutes2];};
		
		if (isNil "commit_time") then {commit_time = 0;};
		if (isNil "Admin_Layout") then {Admin_Layout = 0;};
		if (isNil "old_Admin_Layout") then {old_Admin_Layout = Admin_Layout;};
		if (Admin_Layout == old_Admin_Layout) then {commit_time = 0;}else{commit_time = 1;old_Admin_Layout = Admin_Layout;};
		if (isNil 'ADMINHASH') then {ADMINHASH = toString [32,32,45,45,45,32,32,98,121,32,105,110,102,105,83,84,65,82,46,100,101];};
		
		if !(dialog) then {createDialog "RscConfigEditor_Main";};
		disableSerialization;
		
		if (Admin_Layout == 0) then 
		{
			_ctrl = 3 call getControl;
			_ctrl ctrlSetBackgroundColor [0,0,0,1];
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetScale 2.2;
			_ctrl ctrlSetTextColor [0.56,0.04,0.04,1];
			_ctrl ctrlSetPosition [safezoneX, safezoneY, safeZoneW, 0.02];
			_ctrl ctrlSetText "No Admin";
			if (getPlayerUID player in PV_LowLevel_List) then {
				_ctrl ctrlSetText format["Admin Menu  ---  PLAYER: %1  ---  SERVER UP FOR: %2h %3min"+ADMINHASH,count playableUnits,_hours,_minutes2];
			};
			if (getPlayerUID player in PV_NormalLevel_List) then {
				_ctrl ctrlSetText format["Higher Admin Menu  ---  PLAYER: %1  ---  SERVER UP FOR: %2h %3min"+ADMINHASH,count playableUnits,_hours,_minutes2];
			};
			if (getPlayerUID player in PV_SuperLevel_List) then {
				_ctrl ctrlSetText format["Super Admin Menu  ---  PLAYER: %1  ---  SERVER UP FOR: %2h %3min"+ADMINHASH,count playableUnits,_hours,_minutes2];
			};
			_ctrl ctrlCommit 0;
			
			_ctrl = 2 call getControl;
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetPosition [safezoneXAbs + 0.485 + 0.02, safezoneY + 0.07, (safezoneWAbs - 0.485 - 0.03)*0.6, (safeZoneH - 0.07 - 0.03)*0.75];
			_ctrl ctrlSetScale 1.35;
			_ctrl ctrlCommit commit_time;
			_ctrl ctrlSetEventHandler ["LBDblClick", "call admin_dbclick;"];
			_ctrl ctrlSetEventHandler ["LBSelChanged", "call adminadd_show_pic;"];
			call admin_filllist;
			call admin_fillplr;
			
			_ctrl = 1 call getControl;
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetPosition [safezoneXAbs + 0.01, safezoneY + 0.07, (0.485)*0.75, (safeZoneH - 0.07 - 0.03)*0.75];
			_ctrl ctrlSetScale 1.35;
			_ctrl ctrlCommit commit_time;
			_ctrl ctrlSetEventHandler ["LBDblClick", "call admin_dbclick_2;"];
			
			_ctrl = -1 call getControl;
			_ctrl ctrlSetPosition [safezoneX, safezoneY, safeZoneW, safezoneH];
			_ctrl ctrlCommit commit_time;
		};
		if (Admin_Layout == 1) then 
		{
			_ctrl = 3 call getControl;
			_ctrl ctrlSetBackgroundColor [0,0,0,1];
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetScale 2.2;
			_ctrl ctrlSetTextColor [0.56,0.04,0.04,1];
			_ctrl ctrlSetPosition [safezoneX, safezoneY, safeZoneW, 0.02];
			_ctrl ctrlSetText "No Admin";
			if (getPlayerUID player in PV_LowLevel_List) then {
				_ctrl ctrlSetText format["Admin Menu  ---  PLAYER: %1  ---  SERVER UP FOR: %2h %3min"+ADMINHASH,count playableUnits,_hours,_minutes2];
			};
			if (getPlayerUID player in PV_NormalLevel_List) then {
				_ctrl ctrlSetText format["Higher Admin Menu  ---  PLAYER: %1  ---  SERVER UP FOR: %2h %3min"+ADMINHASH,count playableUnits,_hours,_minutes2];
			};
			if (getPlayerUID player in PV_SuperLevel_List) then {
				_ctrl ctrlSetText format["Super Admin Menu  ---  PLAYER: %1  ---  SERVER UP FOR: %2h %3min"+ADMINHASH,count playableUnits,_hours,_minutes2];
			};
			_ctrl ctrlCommit 0;
			
			_ctrl = 2 call getControl;
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetPosition [safezoneXAbs + 0.485 + 0.02, safezoneY + 0.07, (safezoneWAbs - 0.485 - 0.03)*0.55, (safeZoneH - 0.07 - 0.03)*0.65];
			_ctrl ctrlSetScale 1.55;
			_ctrl ctrlCommit commit_time;
			_ctrl ctrlSetEventHandler ["LBDblClick", "call admin_dbclick;"];
			_ctrl ctrlSetEventHandler ["LBSelChanged", "call adminadd_show_pic;"];
			call admin_filllist;
			call admin_fillplr;
			
			_ctrl = 1 call getControl;
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetPosition [safezoneXAbs + 0.01, safezoneY + 0.07, (0.485)*0.65, (safeZoneH - 0.07 - 0.03)*0.65];
			_ctrl ctrlSetScale 1.55;
			_ctrl ctrlCommit commit_time;
			_ctrl ctrlSetEventHandler ["LBDblClick", "call admin_dbclick_2;"];
			
			_ctrl = -1 call getControl;
			_ctrl ctrlSetPosition [safezoneX, safezoneY, safeZoneW, safezoneH];
			_ctrl ctrlCommit commit_time;
		};
		if (Admin_Layout == 2) then 
		{
			_ctrl = 3 call getControl;
			_ctrl ctrlSetBackgroundColor [0,0,0,1];
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetScale 2.2;
			_ctrl ctrlSetTextColor [0.56,0.04,0.04,1];
			_ctrl ctrlSetPosition [safezoneX, safezoneY, safeZoneW, 0.02];
			_ctrl ctrlSetText "No Admin";
			if (getPlayerUID player in PV_LowLevel_List) then {
				_ctrl ctrlSetText format["Admin Menu  ---  PLAYER: %1  ---  SERVER UP FOR: %2h %3min"+ADMINHASH,count playableUnits,_hours,_minutes2];
			};
			if (getPlayerUID player in PV_NormalLevel_List) then {
				_ctrl ctrlSetText format["Higher Admin Menu  ---  PLAYER: %1  ---  SERVER UP FOR: %2h %3min"+ADMINHASH,count playableUnits,_hours,_minutes2];
			};
			if (getPlayerUID player in PV_SuperLevel_List) then {
				_ctrl ctrlSetText format["Super Admin Menu  ---  PLAYER: %1  ---  SERVER UP FOR: %2h %3min"+ADMINHASH,count playableUnits,_hours,_minutes2];
			};
			_ctrl ctrlCommit 0;
			
			_ctrl = 2 call getControl;
			_ctrl ctrlSetPosition [safezoneX*0.01, safezoneY + 0.05, 0.38, safezoneH - 0.5];
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetScale (safezoneH - safezoneW / 2) * 2.2;
			_ctrl ctrlCommit commit_time;
			_ctrl ctrlSetEventHandler ["LBDblClick", "call admin_dbclick;"];
			_ctrl ctrlSetEventHandler ["LBSelChanged", "call adminadd_show_pic;"];
			call admin_filllist;
			call admin_fillplr;
			
			_ctrl = 1 call getControl;
			_ctrl ctrlSetPosition [safezoneX*-0.7, safezoneY + 0.05, 0.38, safezoneH - 0.5];
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetScale (safezoneH - safezoneW / 2) * 2.2;
			_ctrl ctrlCommit commit_time;
			_ctrl ctrlSetEventHandler ["LBDblClick", "call admin_dbclick_2;"];
			
			_ctrl = -1 call getControl;
			_ctrl ctrlSetPosition [safezoneX*0.01, safezoneY + 0.05, safeZoneW - 1.41, safezoneH - 0.055];
			_ctrl ctrlCommit commit_time;
		};
		if (Admin_Layout == 3) then 
		{
			_ctrl = 3 call getControl;
			_ctrl ctrlSetBackgroundColor [0,0,0,1];
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetScale 2.2;
			_ctrl ctrlSetTextColor [0,0.6,1,1];
			_ctrl ctrlSetPosition [safezoneX, safezoneY, safeZoneW, 0.02];
			_ctrl ctrlSetText "No Admin";
			if (getPlayerUID player in PV_LowLevel_List) then {
				_ctrl ctrlSetText format["Admin Menu  ---  PLAYER: %1  ---  SERVER UP FOR: %2h %3min"+ADMINHASH,count playableUnits,_hours,_minutes2];
			};
			if (getPlayerUID player in PV_NormalLevel_List) then {
				_ctrl ctrlSetText format["Higher Admin Menu  ---  PLAYER: %1  ---  SERVER UP FOR: %2h %3min"+ADMINHASH,count playableUnits,_hours,_minutes2];
			};
			if (getPlayerUID player in PV_SuperLevel_List) then {
				_ctrl ctrlSetText format["Super Admin Menu  ---  PLAYER: %1  ---  SERVER UP FOR: %2h %3min"+ADMINHASH,count playableUnits,_hours,_minutes2];
			};
			_ctrl ctrlCommit 0;
			
			_ctrl = 2 call getControl;
			_ctrl ctrlSetPosition [safezoneX, safezoneY + 0.05,safeZoneW*0.402, safezoneH*0.428];
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetScale (safezoneH - safezoneW / 2) * 2.2;
			_ctrl ctrlCommit commit_time;
			_ctrl ctrlSetEventHandler ["LBDblClick", "call admin_dbclick;"];
			_ctrl ctrlSetEventHandler ["LBSelChanged", "call adminadd_show_pic;"];
			call admin_filllist;
			call admin_fillplr;
			
			_ctrl = 1 call getControl;
			_ctrl ctrlSetPosition [safezoneX*-0.825, safezoneY + 0.05,safeZoneW*0.15, safezoneH*0.728];
			_ctrl ctrlSetFont "TahomaB";
			_ctrl ctrlSetScale (safezoneH - safezoneW / 2) * 2.2;
			_ctrl ctrlCommit commit_time;
			_ctrl ctrlSetEventHandler ["LBDblClick", "call admin_dbclick_2;"];
			
			_ctrl = -1 call getControl;
			_ctrl ctrlSetBackgroundColor [0,0,0,0.8];
			_ctrl ctrlSetPosition [safezoneX, safezoneY + 0.05, safeZoneW*0.736, safezoneH];
			_ctrl ctrlCommit commit_time;
		};
	};
	admin_give_ammo =
	{
		_name = _this select 0;
		PVAH_AdminReq = [25,player,_name];
		publicVariableServer "PVAH_AdminReq";
		hint format ["Giving %1 Ammo", _this select 0];
		
		_sl = format["%1 AdminGiveAmmo %2",name player,_name];
		PVAH_WriteLogReq = [player,_sl];
		publicVariableServer "PVAH_WriteLogReq";
	};
	admin_remove_ammo =
	{
		{
			_name = _this select 0;
			{
				if (name _x == _name) then
				{
					_vehicle = vehicle _x;
					_vehicle setVehicleAmmo 0;
					
					_sl = format["%1 AdminRemoveAmmo %2",name player,_name];
					PVAH_WriteLogReq = [player,_sl];
					publicVariableServer "PVAH_WriteLogReq";
				};
			} forEach playableUnits;
		};
	};
	admin_moveinmyveh =
	{
		_name = _this select 0;
		{
			if (name _x == _name) then
			{
				_obj = vehicle player;
				
				_x moveInDriver _obj;
				_x moveInGunner _obj;
				_x moveInCommander _obj;
				_x moveInCargo _obj;
				_x action ["getInDriver", _obj];
				_x action ["getInGunner", _obj];
				_x action ["getInCommander", _obj];
				_x action ["getInCargo", _obj];
				_x setVariable['AH_WorldSpace',[0,getPosATL _obj],true];
				_veh = (vehicle _x);if (_veh != _x) then {{_x setVariable['AH_WorldSpace',[0,getPosATL _obj],true];} forEach (crew _veh);};
				hint format ["%1 moved in your vehicle", _name];
				cutText [format["%1 moved in your vehicle", _name], "PLAIN DOWN"];
				
				_sl = format["%1 moved %2 in his vehicle",name player,_name];
				PVAH_WriteLogReq = [player,_sl];
				publicVariableServer "PVAH_WriteLogReq";
				if ( (getPlayerUID player) in Ultima_Low_Admins) then
					{
						_sl	=	format["Модератор: %1, посадил к себе в технику игрока: %2", name player, _name];
						Terminal_Server	=	[player, "moderator_control", _sl];
						publicVariableServer "Terminal_Server";
					};
			};
		} forEach playableUnits;
	};
	admin_joinhisveh =
	{
		_name = _this select 0;
		{
			if (name _x == _name) then
			{
				_obj = vehicle _x;
				
				player moveInDriver _obj;
				player moveInGunner _obj;
				player moveInCommander _obj;
				player moveInCargo _obj;
				player action ["getInDriver", _obj];
				player action ["getInGunner", _obj];
				player action ["getInCommander", _obj];
				player action ["getInCargo", _obj];
				
				hint format ["joined vehicle of %1", _name];
				cutText [format["joined vehicle of %1", _name], "PLAIN DOWN"];
				
				_sl = format["%1 joined vehicle of %2",name player,_name];
				PVAH_WriteLogReq = [player,_sl];
				publicVariableServer "PVAH_WriteLogReq";
				if ( (getPlayerUID player) in Ultima_Low_Admins) then
					{
						_sl	=	format["Модератор: %1, сел в технику: %2", name player, _name];
						Terminal_Server	=	[player, "moderator_control", _sl];
						publicVariableServer "Terminal_Server";
					};
			};
		} forEach playableUnits;
	};
	admin_ejecFromVeh =
	{
		_name = _this select 0;
		{
			if (name _x == _name) then
			{
				_x action ["eject", (vehicle _x)];
				
				hint format ["%1 ejected", _name];
				cutText [format["%1 ejected", _name], "PLAIN DOWN"];
				
				_sl = format["%1 ejected %2",name player,_name];
				PVAH_WriteLogReq = [player,_sl];
				publicVariableServer "PVAH_WriteLogReq";
				if ( (getPlayerUID player) in Ultima_Low_Admins) then
					{
						_sl	=	format["Модератор: %1, выкинул из техники игрока: %2", name player, _name];
						Terminal_Server	=	[player, "moderator_control", _sl];
						publicVariableServer "Terminal_Server";
					};
			};
		} forEach playableUnits;
	};
	admin_frcam =
	{
		_name = _this select 0;
		{
			if (name _x == _name) then
			{
				_x exec 'camera.sqs';
				
				cutText [format["CAMERA ON %1",_name], "PLAIN DOWN"];
			};
		} forEach playableUnits;
		if (isNil 'AcamUsed') then
		{
			AcamUsed = true;
			systemChat 'Instructions: community.bistudio.com/wiki/Camera.sqs';
		};
	};
	admindump =
	{
		{player removeMagazine _x;} forEach (magazines player);
		removeAllWeapons player;
		removebackpack player;
		
		hint "dumped gear";
		cutText ["dumped gear", "PLAIN DOWN"];
	};
	adminaksd =
	{
		{player removeMagazine _x;} forEach (magazines player);
		removeAllWeapons player;
		removebackpack player;
		player addMagazine '30Rnd_545x39_AKSD';player addMagazine '30Rnd_545x39_AKSD';player addMagazine '30Rnd_545x39_AKSD';player addMagazine '30Rnd_545x39_AKSD';player addMagazine 'Skin_Sniper1_DZ';
		player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';player addMagazine 'ItemMorphine';
		player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Binocular_Vector';player addWeapon 'AKS_74_UN_Kobra';player selectWeapon 'AKS_74_UN_Kobra';player addweapon 'glock17_EP1';
		player addMagazine '17Rnd_9x19_glock17';player addMagazine '17Rnd_9x19_glock17';player addMagazine '17Rnd_9x19_glock17';player addMagazine '17Rnd_9x19_glock17';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';
		player addMagazine 'ItemBandage';player addMagazine '17Rnd_9x19_glock17';player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';
		player addWeapon 'Itemmatchbox';player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	admindmr =
	{
		{player removeMagazine _x;} forEach (magazines player);
		removeAllWeapons player;
		removebackpack player;
		player addweapon 'DMR';player selectWeapon 'DMR';player addMagazine '20Rnd_762x51_DMR';player addMagazine '20Rnd_762x51_DMR';player addMagazine '20Rnd_762x51_DMR';player addMagazine '20Rnd_762x51_DMR';
		player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';
		player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';
		player addMagazine 'ItemBandage';player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';
		player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminfnfal =
	{
		{player removeMagazine _x;} forEach (magazines player);
		removeAllWeapons player;
		removebackpack player;
		player addweapon 'FN_FAL';player selectWeapon 'FN_FAL';player addMagazine '20Rnd_762x51_FNFAL';player addMagazine '20Rnd_762x51_FNFAL';player addMagazine '20Rnd_762x51_FNFAL';player addMagazine '20Rnd_762x51_FNFAL';
		player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';
		player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';
		player addMagazine 'ItemBandage';player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';
		player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adming36a =
	{
		{player removeMagazine _x;} forEach (magazines player);
		removeAllWeapons player;
		removebackpack player;
		player addMagazine '100Rnd_556x45_BetaCMag';player addMagazine '100Rnd_556x45_BetaCMag';player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';
		player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'G36A_camo';player selectWeapon 'G36A_camo';
		player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';
		player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';
		player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminksvk =
	{
		{player removeMagazine _x;} forEach (magazines player);
		removeAllWeapons player;
		removebackpack player;
		player addweapon 'ksvk';player selectWeapon 'ksvk';player addMagazine '5Rnd_127x108_KSVK';player addMagazine '5Rnd_127x108_KSVK';player addMagazine '5Rnd_127x108_KSVK';
		player addMagazine '5Rnd_127x108_KSVK';player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';
		player addMagazine 'ItemAntibiotic';player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';
		player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';
		player addWeapon 'Itemmatchbox';player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminl85 =
	{
		{player removeMagazine _x;} forEach (magazines player);
		removeAllWeapons player;
		removebackpack player;
		player addMagazine '30Rnd_556x45_Stanag';player addMagazine '30Rnd_556x45_Stanag';player addMagazine '30Rnd_556x45_Stanag';player addMagazine '30Rnd_556x45_Stanag';player addMagazine 'FoodSteakCooked';
		player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';player addMagazine 'ItemMorphine';player addWeapon 'ItemMap';player addWeapon 'BAF_L85A2_RIS_CWS';
		player selectWeapon 'BAF_L85A2_RIS_CWS';player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addBackPack 'DZ_Backpack_EP1';
		player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';player addWeapon 'Itemetool';
		player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminlapua =
	{
		{player removeMagazine _x;} forEach (magazines player);
		removeAllWeapons player;
		removebackpack player;
		player addweapon 'BAF_LRR_scoped';player selectWeapon 'BAF_LRR_scoped';player addMagazine '5Rnd_86x70_L115A1';player addMagazine '5Rnd_86x70_L115A1';player addMagazine '5Rnd_86x70_L115A1';
		player addMagazine '5Rnd_86x70_L115A1';player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';
		player addMagazine 'ItemAntibiotic';player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';
		player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';
		player addWeapon 'Itemmatchbox';player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminm14 =
	{
		{player removeMagazine _x;} forEach (magazines player);
		removeAllWeapons player;
		removebackpack player;
		player addweapon 'M14_EP1';player selectWeapon 'M14_EP1';player addMagazine '20Rnd_762x51_DMR';player addMagazine '20Rnd_762x51_DMR';player addMagazine '20Rnd_762x51_DMR';player addMagazine '20Rnd_762x51_DMR';
		player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';
		player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';
		player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';player addWeapon 'Itemetool';
		player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminm16acg =
	{
		{player removeMagazine _x;} forEach (magazines player);
		removeAllWeapons player;
		removebackpack player;
		player addMagazine '100Rnd_556x45_BetaCMag';player addMagazine '100Rnd_556x45_BetaCMag';player addMagazine '100Rnd_556x45_BetaCMag';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';
		player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';player addMagazine 'ItemMorphine';player addWeapon 'ItemMap';player addWeapon 'm16a4_acg';
		player selectWeapon 'm16a4_acg';player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addBackPack 'DZ_Backpack_EP1';
		player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';player addWeapon 'Itemetool';
		player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminm24 =
	{
		{player removeMagazine _x;} forEach (magazines player);
		removeAllWeapons player;
		removebackpack player;
		player addweapon 'M24';player selectWeapon 'M24';player addMagazine '5Rnd_762x51_M24';player addMagazine '5Rnd_762x51_M24';player addMagazine '5Rnd_762x51_M24';player addMagazine '5Rnd_762x51_M24';
		player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';
		player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';
		player addMagazine 'ItemBandage';player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';
		player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminm249 =
	{
		{player removeMagazine _x;} forEach (magazines player);
		removeAllWeapons player;
		removebackpack player;
		player addMagazine '200Rnd_556x45_M249';player addMagazine '200Rnd_556x45_M249';player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';
		player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'M249_DZ';player selectWeapon 'M249_DZ';
		player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';
		player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';
		player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminm40 =
	{
		{player removeMagazine _x;} forEach (magazines player);
		removeAllWeapons player;
		removebackpack player;
		player addweapon 'M40A3';player selectWeapon 'M40A3';player addMagazine '5Rnd_762x51_M24';player addMagazine '5Rnd_762x51_M24';player addMagazine '5Rnd_762x51_M24';player addMagazine '5Rnd_762x51_M24';
		player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';
		player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';
		player addMagazine 'ItemBandage';player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';
		player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminm4sd =
	{
		{player removeMagazine _x;} forEach (magazines player);
		removeAllWeapons player;
		removebackpack player;
		player addMagazine '30Rnd_556x45_StanagSD';player addMagazine '30Rnd_556x45_StanagSD';player addMagazine '30Rnd_556x45_StanagSD';player addMagazine '30Rnd_556x45_StanagSD';player addMagazine 'Skin_Sniper1_DZ';
		player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';player addMagazine 'ItemMorphine';
		player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Binocular_Vector';player addWeapon 'M4A1_AIM_SD_camo';player selectWeapon 'M4A1_AIM_SD_camo';player addweapon 'glock17_EP1';
		player addMagazine '17Rnd_9x19_glock17';player addMagazine '17Rnd_9x19_glock17';player addMagazine '17Rnd_9x19_glock17';player addMagazine '17Rnd_9x19_glock17';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';
		player addMagazine 'ItemBandage';player addMagazine '17Rnd_9x19_glock17';player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';
		player addWeapon 'Itemmatchbox';player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminm4spr =
	{
		{player removeMagazine _x;} forEach (magazines player);
		removeAllWeapons player;
		removebackpack player;
		player addMagazine '100Rnd_556x45_BetaCMag';player addMagazine '100Rnd_556x45_BetaCMag';player addMagazine '100Rnd_556x45_BetaCMag';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';
		player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';player addMagazine 'ItemMorphine';player addWeapon 'ItemMap';player addWeapon 'M4SPR';player selectWeapon 'M4SPR';
		player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';
		player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';
		player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminmk48 =
	{
		{player removeMagazine _x;} forEach (magazines player);
		removeAllWeapons player;
		removebackpack player;
		player addMagazine '100Rnd_762x51_M240';player addMagazine '100Rnd_762x51_M240';player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';
		player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Mk_48_DZ';player selectWeapon 'Mk_48_DZ';
		player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player 
		addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';
		player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminpecheneg =
	{
		{player removeMagazine _x;} forEach (magazines player);
		removeAllWeapons player;
		removebackpack player;
		player addMagazine '100Rnd_762x54_PK';player addMagazine '100Rnd_762x54_PK';player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';
		player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Pecheneg_DZ';player selectWeapon 'Pecheneg_DZ';
		player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player 
		addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';
		player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminsa58 =
	{
		{player removeMagazine _x;} forEach (magazines player);
		removeAllWeapons player;
		removebackpack player;
		player addweapon 'Sa58V_RCO_EP1';player selectWeapon 'Sa58V_RCO_EP1';player addMagazine '30Rnd_762x39_SA58';player addMagazine '30Rnd_762x39_SA58';player addMagazine '30Rnd_762x39_SA58';player addMagazine '30Rnd_762x39_SA58';
		player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';
		player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';
		player addMagazine 'ItemBandage';player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';
		player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminscarccosd =
	{
		{player removeMagazine _x;} forEach (magazines player);
		removeAllWeapons player;
		removebackpack player;
		player addweapon 'SCAR_H_CQC_CCO_SD';player selectWeapon 'SCAR_H_CQC_CCO_SD';player addMagazine '20Rnd_762x51_SB_SCAR';player addMagazine '20Rnd_762x51_SB_SCAR';player addMagazine '20Rnd_762x51_SB_SCAR';
		player addMagazine '20Rnd_762x51_SB_SCAR';player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';
		player addMagazine 'ItemAntibiotic';player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Binocular_Vector';player addweapon 'glock17_EP1';
		player addMagazine '17Rnd_9x19_glock17';player addMagazine '17Rnd_9x19_glock17';player addMagazine '17Rnd_9x19_glock17';player addMagazine '17Rnd_9x19_glock17';player addMagazine '17Rnd_9x19_glock17';
		player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';
		player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';
		player addWeapon 'ItemGPS';reload player;
	};
	adminscareglm =
	{
		{player removeMagazine _x;} forEach (magazines player);
		removeAllWeapons player;
		removebackpack player;
		player addweapon 'SCAR_H_STD_EGLM_Spect';player selectWeapon 'SCAR_H_STD_EGLM_Spect';player addMagazine '20rnd_762x51_B_SCAR';player addMagazine '20rnd_762x51_B_SCAR';player addMagazine '20rnd_762x51_B_SCAR';player addMagazine '20rnd_762x51_B_SCAR';
		player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';
		player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '1Rnd_HE_M203';player addMagazine '1Rnd_HE_M203';player addMagazine '1Rnd_HE_M203';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';
		player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';player addWeapon 'Itemetool';
		player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminscarsniper =
	{
		{player removeMagazine _x;} forEach (magazines player);
		removeAllWeapons player;
		removebackpack player;
		player addweapon 'SCAR_H_LNG_Sniper';player selectWeapon 'SCAR_H_LNG_Sniper';player addMagazine '20rnd_762x51_B_SCAR';player addMagazine '20rnd_762x51_B_SCAR';player addMagazine '20rnd_762x51_B_SCAR';player addMagazine '20rnd_762x51_B_SCAR';
		player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';
		player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';
		player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';player addWeapon 'Itemetool';
		player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminsvd =
	{
		{player removeMagazine _x;} forEach (magazines player);
		removeAllWeapons player;
		removebackpack player;
		player addweapon 'SVD';player selectWeapon 'SVD_CAMO';player addMagazine '10Rnd_762x54_SVD';player addMagazine '10Rnd_762x54_SVD';player addMagazine '10Rnd_762x54_SVD';player addMagazine '10Rnd_762x54_SVD';
		player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';
		player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';
		player addMagazine 'ItemBandage';player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';
		player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminsvdcamo =
	{
		{player removeMagazine _x;} forEach (magazines player);
		removeAllWeapons player;
		removebackpack player;
		player addweapon 'SVD_CAMO';player selectWeapon 'SVD_CAMO';player addMagazine '10Rnd_762x54_SVD';player addMagazine '10Rnd_762x54_SVD';player addMagazine '10Rnd_762x54_SVD';player addMagazine '10Rnd_762x54_SVD';
		player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';
		player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Binocular_Vector';player addweapon 'UZI_SD_EP1';player addMagazine '30Rnd_9x19_UZI_SD';
		player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine '30Rnd_9x19_UZI_SD';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';
		player addMagazine 'ItemBandage';player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';
		player addWeapon 'Itemetool';player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminvss =
	{
		{player removeMagazine _x;} forEach (magazines player);
		removeAllWeapons player;
		removebackpack player;
		player addweapon 'VSS_vintorez';player selectWeapon 'VSS_vintorez';player addMagazine '20Rnd_9x39_SP5_VSS';player addMagazine '20Rnd_9x39_SP5_VSS';player addMagazine '20Rnd_9x39_SP5_VSS';player addMagazine '20Rnd_9x39_SP5_VSS';
		player addMagazine 'Skin_Sniper1_DZ';player addMagazine 'FoodSteakCooked';player addMagazine 'ItemSodaCoke';player addMagazine 'ItemBloodbag';player addMagazine 'ItemPainkiller';player addMagazine 'ItemAntibiotic';
		player addMagazine 'ItemMorphine';player addMagazine 'ItemEpinephrine';player addWeapon 'ItemMap';player addWeapon 'Binocular_Vector';player addweapon 'glock17_EP1';player addMagazine '17Rnd_9x19_glock17';player addMagazine '17Rnd_9x19_glock17';
		player addMagazine '17Rnd_9x19_glock17';player addMagazine '17Rnd_9x19_glock17';player addMagazine '17Rnd_9x19_glock17';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';player addMagazine 'ItemBandage';
		player addBackPack 'DZ_Backpack_EP1';player addWeapon 'NVGoggles';player addWeapon 'ItemCompass';player addWeapon 'ItemHatchet';player addWeapon 'ItemKnife';player addWeapon 'Itemmatchbox';player addWeapon 'Itemetool';
		player addWeapon 'Itemtoolbox';player addWeapon 'ItemWatch';player addWeapon 'ItemGPS';reload player;
	};
	adminheal =
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminReq = [5,player,_x];
				publicVariableServer "PVAH_AdminReq";
				hint format ["Healing %1", _this select 0];
				
				_sl = format["%1 AdminHeal %2",name player,name _x];
				PVAH_WriteLogReq = [player,_sl];
				publicVariableServer "PVAH_WriteLogReq";
				if ( (getPlayerUID player) in Ultima_Low_Admins) then
					{
						_sl	=	format["Модератор: %1, вылечил игрока: %2", name player, name _x];
						Terminal_Server	=	[player, "moderator_control", _sl];
						publicVariableServer "Terminal_Server";
					};
			};
		} forEach playableUnits;
	};
	adminrepair =
	{
		_name = _this select 0;
		if (_name == "") then {_name = name player;};
		{
			if (name _x == _name) then
			{
				_vehicle = vehicle _x;
				_vehicle setVectorUp [0,0,1];
				_x setVectorUp [0,0,1];
				
				PVAH_AdminReq = [51,player,_vehicle];
				publicVariableServer "PVAH_AdminReq";
				hint format["Repairing Vehicle of %1",_name];
				
				_sl = format['%1 Repair %2(%3)',name player,_name,typeOf _vehicle];
				PVAH_WriteLogReq = [player,_sl];
				publicVariableServer 'PVAH_WriteLogReq';
				if ( (getPlayerUID player) in Ultima_Low_Admins) then
					{
						_sl	=	format['Модератор: %1, отремонтировал технику: %2(%3)', name player, _name, (typeOf _vehicle)];
						Terminal_Server	=	[player, 'moderator_control', _sl];
						publicVariableServer 'Terminal_Server';
					};
			};
		} forEach playableUnits;
	};
	admincrate =
	{
		PVAH_AdminReq = [9001,player];
		publicVariableServer "PVAH_AdminReq";
		
		hint format ["Box"];
		cutText [format["Box"], "PLAIN DOWN"];
		
		_sl = format["%1 - BOX @%2",name player,mapGridPosition getPos player];
		PVAH_WriteLogReq = [player,_sl];
		publicVariableServer "PVAH_WriteLogReq";
	};
	admincrateALL =
	{
		PVAH_AdminReq = [9002,player];
		publicVariableServer "PVAH_AdminReq";
		
		hint format ["Box"];
		cutText [format["Box"], "PLAIN DOWN"];
		
		_sl = format["%1 - BOX @%2",name player,mapGridPosition getPos player];
		PVAH_WriteLogReq = [player,_sl];
		publicVariableServer "PVAH_WriteLogReq";
	};
	admincrateEpoch =
	{
		PVAH_AdminReq = [9003,player];
		publicVariableServer "PVAH_AdminReq";
		
		hint format ["Epoch-Box"];
		cutText [format["Epoch-Box"], "PLAIN DOWN"];
		
		_sl = format["%1 - EPOCH-BOX @%2",name player,mapGridPosition getPos player];
		PVAH_WriteLogReq = [player,_sl];
		publicVariableServer "PVAH_WriteLogReq";
	};
	supplypackage1 =
	{
		PVAH_AdminReq = [9004,player];
		publicVariableServer "PVAH_AdminReq";
		
		hint format ["Small Supply Package Spawned!"];
		cutText [format["Small Supply Package Spawned!"], "PLAIN DOWN"];
		
		_sl = format["%1 - SMALL SUPPLY PACKAGE @%2",name player,mapGridPosition getPos player];
		PVAH_WriteLogReq = [player,_sl];
		publicVariableServer "PVAH_WriteLogReq";
	};	
	supplypackage2 =
	{
		PVAH_AdminReq = [9005,player];
		publicVariableServer "PVAH_AdminReq";
		
		hint format ["Medium Supply Package Spawned!"];
		cutText [format["Medium Supply Package Spawned!"], "PLAIN DOWN"];
		
		_sl = format["%1 - MEDIUM SUPPLY PACKAGE @%2",name player,mapGridPosition getPos player];
		PVAH_WriteLogReq = [player,_sl];
		publicVariableServer "PVAH_WriteLogReq";
	};	
	supplypackage3 =
	{
		PVAH_AdminReq = [9006,player];
		publicVariableServer "PVAH_AdminReq";
		
		hint format ["Large Supply Package Spawned!"];
		cutText [format["Large Supply Package Spawned!"], "PLAIN DOWN"];
		
		_sl = format["%1 - LARGE SUPPLY PACKAGE @%2",name player,mapGridPosition getPos player];
		PVAH_WriteLogReq = [player,_sl];
		publicVariableServer "PVAH_WriteLogReq";
	};
	adminESPicons =
	{
		if !(('ItemGPS' in items player) || ('ItemMap' in items player)) then
		{
			_config = ["ItemGPS"];
			_isOK = [player,_config] call BIS_fnc_invAdd;
		};
		setGroupIconsVisible [true, true];
		_color_list = [0,1,0,1];
		_color_orange = [1,0.35,0.15,1];
		_color_bluefor_plr = [0.047,0.502,1,1];
		_color_opfor_plr = [1,0.17,0.17,1];
		_color_resistance_plr = [0,0.65,0,1];
		_color_civilian_plr = [1,1,1,1];
		_name = "";
		_show = "";
		_clr = _color_bluefor_plr;
		if (isNil "fnc_adminESPicons") then {fnc_adminESPicons = 0;};
		if (fnc_adminESPicons == 0) then 
		{
			fnc_adminESPicons = 1;
			hint "GroupIcons ON";
			cutText ["\nGroupIcons ON", "PLAIN DOWN"];
			
			_sl = format["%1 GroupIcons Activated",name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer "PVAH_WriteLogReq";
		} 
		else 
		{
			fnc_adminESPicons = 0;
			hint "GroupIcons OFF";
			cutText ["\nGroupIcons OFF", "PLAIN DOWN"];
			
			_sl = format["%1 GroupIcons Disabled",name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer "PVAH_WriteLogReq";
		};
		
		while {fnc_adminESPicons == 1} do
		{
			{
				_pid = getPlayerUID _x;
				if (_pid != "") then
				{
					_name = name _x;
					_veh = vehicle _x;
					_type = typeOf _veh;
					
					if (_name == "") then {_name = _type;};
					_pos = (positionCameraToWorld [0,0,0]);
					_posU = getPos _veh;
					_dist = round(_pos distance _posU);
					
					if (_x == _veh) then
					{
						_show = format ["%1 (%2m)",_name,_dist];
						_clr = _color_bluefor_plr;
					}
					else
					{
						_crewnames = [];
						{
							_crewnames = _crewnames + [name _x];
						} forEach crew _veh;
						
						_show = format ["%1 (%2m) - %3",_crewnames,_dist,_type];
						_clr = _color_orange;
					};
					
					_puid = getPlayerUID player;
					if (_puid in PV_SuperLevel_List) then
					{
						if (_pid in (PV_LowLevel_List+PV_NormalLevel_List+PV_SuperLevel_List)) then {_clr = _color_list};
					}
					else
					{
						if (_pid in (PV_LowLevel_List+PV_NormalLevel_List)) then {_clr = _color_list};
					};
					if (!(_pid in PV_DevUIDs) || (_puid in PV_DevUIDs)) then
					{
						_grp = group _x;
						clearGroupIcons _grp;
						_grp addGroupIcon ["x_art"];
						_grp setGroupIconParams [_clr, _show, 1, true];
					};
				};
			} forEach playableUnits;
			uiSleep 1;
		};
		{clearGroupIcons group _x;} forEach playableUnits;
	};
	admin_fnc_esp = {
		if (isNil 'fnc_esp_state') then {fnc_esp_state = 0;};
		if (fnc_esp_state == 0) then
		{
			cutText ['ESP ON', 'PLAIN DOWN'];
			fnc_espSHOW =
			{
				disableSerialization;
				((_this select 0 distance (positionCameraToWorld [0,0,0]))) cutRsc ['rscDynamicText', 'PLAIN'];
				_ctrl = ((uiNameSpace getVariable 'BIS_dynamicText') displayctrl 9999);
				_ctrl ctrlShow true;
				_ctrl ctrlEnable true;
				_unit = _this select 0;
				while {((((positionCameraToWorld [0,0,0]) distance _unit) < fnc_esp_distance) && (fnc_esp_state == 1))} do
				{
					if ((isNull _unit) || !(alive _unit)) exitWith {};
					if ((fnc_esp_state == 0) || (visibleMap)) exitWith {};
					
					_pos = (positionCameraToWorld [0,0,0]);
					_posU = getPos _unit;
					_dist = round(_pos distance _posU);
					
					_veh = vehicle _unit;
					_posU2 = [(getPosATL _veh) select 0, (getPosATL _veh) select 1, ((getPosATL _veh) select 2) + (((boundingBox _veh) select 1) select 2) + 0.5];
					_pos2D = worldToScreen _posU2;
					if (count _pos2D > 0) then
					{
						if (_dist <= 35) then {_ctrl ctrlSetFade 0;};
						if (_dist > 35) then {_ctrl ctrlSetFade 0.1;};
						if (_dist > 75) then {_ctrl ctrlSetFade 0.2;};
						if (_dist > 150) then {_ctrl ctrlSetFade 0.4;};
						if (_dist > 300) then {_ctrl ctrlSetFade 0.5;};
						if (_dist > 450) then {_ctrl ctrlSetFade 0.55;};
						if (_dist > 600) then {_ctrl ctrlSetFade 0.65;};
						if (_dist > 800) then {_ctrl ctrlSetFade 0.75;};
						if (_dist > 1000) then {_ctrl ctrlSetFade 0.85;};
						
						_Tsize = 0.4;
						_text = format ['<t size=''%3'' font=''Zeppelin33'' color=''#0B80FF''>%1 (%2m)</t>',name _unit,round _dist,_Tsize];
						if (name _unit == name player) then {_text = ''};
						if (_unit != _veh) then
						{
							_crewnames = [];
							{
								_crewnames = _crewnames + [name _x];
							} forEach crew _veh;
							_posU2 = [_posU2 select 0,_posU2 select 1,(_posU2 select 2) + 1.5];
							_pos2D = worldToScreen _posU2;
							_text = format ['<t size=''%3'' font=''Zeppelin33'' color=''#FF5926''>%1 (%2m) %4</t>',_crewnames,round _dist,_Tsize,typeOf _veh];
						};
						_ctrl ctrlSetStructuredText (parseText _text);
						if (count _pos2D > 1) then
						{
							_ctrl ctrlSetPosition [(_pos2D select 0) - (safezoneW / 2), (_pos2D select 1), safezoneW, safezoneH];
						};
						_ctrl ctrlCommit 0;
					};
					uiSleep .01;
				};
				_ctrl ctrlShow false;
				_ctrl ctrlEnable false;
				fnc_esp_unitarray = fnc_esp_unitarray - [_unit];
			};
			setGroupIconsVisible [true, false];
			fnc_esp_state = 1;
			fnc_esp_distance = 1500;
			fnc_esp_unitarray = [];
			while {fnc_esp_state == 1} do
			{
				{
					_pos = (positionCameraToWorld [0,0,0]);
					_posX = getPos _x;
					_dist = (_pos distance _posX);
					if (!(_x in fnc_esp_unitarray) && (_dist < fnc_esp_distance) && (!visibleMap)) then 
					{
						fnc_esp_unitarray = fnc_esp_unitarray + [_x];
						[_x] spawn fnc_espSHOW;
					};
					if ((_x in fnc_esp_unitarray) && (_dist > fnc_esp_distance)) then 
					{
						fnc_esp_unitarray = fnc_esp_unitarray - [_x];
					};
				} forEach playableUnits;
				uiSleep 1;
			};
		}
		else
		{
			cutText ['ESP OFF', 'PLAIN DOWN'];
			setGroupIconsVisible [true, true];
			fnc_esp_state = 0;
		};
	};
	fnc_MapIcons_infiSTAR = {
		if (isNil "show_buildables_epoch") then {show_buildables_epoch = false;};
		fnc_epochB = {
			if (isNil "show_buildables_epoch") then {show_buildables_epoch = false;} else {show_buildables_epoch = !show_buildables_epoch;};
		};
		if (isNil "show_loot_infiSTAR") then {show_loot_infiSTAR = false;};
		fnc_LootS = {
			if (isNil "show_loot_infiSTAR") then {show_loot_infiSTAR = false;} else {show_loot_infiSTAR = !show_loot_infiSTAR;};
		};
		if (isNil "show_boxes_infiSTAR") then {show_boxes_infiSTAR = false;};
		fnc_BoxS = {
			if (isNil "show_boxes_infiSTAR") then {show_boxes_infiSTAR = false;} else {show_boxes_infiSTAR = !show_boxes_infiSTAR;};
		};
		if (isNil "show_cWEPm_infiSTAR") then {show_cWEPm_infiSTAR = false;};
		fnc_CWEPS = {
			if (isNil "show_cWEPm_infiSTAR") then {show_cWEPm_infiSTAR = false;} else {show_cWEPm_infiSTAR = !show_cWEPm_infiSTAR;};
		};
		
		fnc_MapIconConfigCM =
		{
			MapIconConfigCM =
			[
				["",true],
				["Icon Options", [-1], "", -5, [["expression", ""]], "1", "0"],
				[(format["Show Epoch Buildables - %1",show_buildables_epoch]), [2], "", -5, [["expression", "call fnc_epochB;"]], "1", "1"],
				[(format["Show Loot - %1",show_loot_infiSTAR]), [3], "", -5, [["expression", "call fnc_LootS;"]], "1", "1"],
				[(format["Show Boxes - %1",show_boxes_infiSTAR]), [4], "", -5, [["expression", "call fnc_BoxS;"]], "1", "1"],
				[(format["Show Weapons - %1",show_cWEPm_infiSTAR]), [5], "", -5, [["expression", "call fnc_CWEPS;"]], "1", "1"]
			];
			showCommandingMenu "#USER:MapIconConfigCM";
		};
		if !(('ItemGPS' in items player) || ('ItemMap' in items player)) then
		{
			_config = ["ItemGPS"];
			_isOK = [player,_config] call BIS_fnc_invAdd;
		};
		disableSerialization;
		if (isNil "fnc_MapIcons_run") then
		{
			MapIconConfigCMKey = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 0x3F) then {call fnc_MapIconConfigCM};false;"];
			if (MOD_EPOCH) then
			{
				cutText ["MapIcons Enabled - Option on F5\nBlue = Unlockable Vehicles\nRed = Lockable Vehicles", "PLAIN"];
			}
			else
			{
				cutText ["MapIcons Enabled - Option on F5", "PLAIN"];
			};
			
			fnc_MapIcons_run = true;
			
			_map = (findDisplay 12) displayCtrl 51;
			_mapdraw = _map ctrlSetEventHandler ["Draw", "_this call fnc_draw_MapIcons;"];
			
			_minimap = (uiNameSpace getVariable "BIS_RscMiniMap") displayCtrl 101;
			if (!isNil "_minimap") then
			{
				_minimapdraw = _minimap ctrlSetEventHandler ["Draw", "_this call fnc_draw_MapIcons;"];
			};
		} 
		else 
		{
			(findDisplay 46) displayRemoveEventHandler ["KeyDown", MapIconConfigCMKey];
			cutText ["MapIcons Disabled", "PLAIN"];
			
			fnc_MapIcons_run = nil;
			_map ctrlremoveeventhandler ["Draw", _mapdraw];
		};
		fnc_draw_MapIcons =
		{
			if (!isNil "fnc_MapIcons_run") then 
			{
				private["_ctrl"];
				_ctrl =  _this select 0;
				_iscale = (1 - ctrlMapScale _ctrl) max .2;
				_irad = 27;
				_color = [0, 0, 0, 1];
				_icon = "\ca\ui\data\icon_zora_ca.paa";
				
				if (show_buildables_epoch) then
				{
					if (visibleMap) then
					{
						if (isNil 'All_Map_Objects') then
						{
							All_Map_Objects = (allMissionObjects 'ModularItems');
							[] spawn {uiSleep 30;All_Map_Objects = nil;};
						};
						{
							_type = typeOf _x;
							if (_type in ['Plastic_Pole_EP1_DZ']) then
							{
								_icon = "\Ca\buildings\Icons\i_wall_CA.paa";
								_icon = getText (configFile >> 'CfgVehicles' >> _type >> 'picture');
								_ctrl drawIcon [_icon, [0.4,0.25,0,1], getPosASL _x, 10, 10, getDir _x, "", 0];
							}
							else
							{
								_icon = "\Ca\buildings\Icons\i_wall_CA.paa";
								_ctrl drawIcon [_icon, [0.4,0.25,0,1], getPosASL _x, 10, 10, getDir _x, "", 0];
							};
						} forEach All_Map_Objects;
					};
				};
				if ((show_loot_infiSTAR) || (show_boxes_infiSTAR)) then
				{
					if (isNil 'lootBoxesArray') then
					{
						lootBoxesArray = (allMissionObjects "ReammoBox");
						[] spawn {uiSleep 10;lootBoxesArray = nil;};
					};
					
					{
						if (!isNull _x) then
						{
							_type = typeOf _x;
							if (_type == "WeaponHolder") then
							{
								if (show_loot_infiSTAR) then
								{
									_icon = "\ca\ui\data\icon_zora_ca.paa";
									_wepCargo = (getWeaponCargo _x) select 0;
									if (count _wepCargo > 0) then
									{
										_icon = getText (configFile >> 'CfgWeapons' >> _wepCargo select 0 >> 'picture');
									}
									else
									{
										_magCargo = (getMagazineCargo _x) select 0;
										if (count _magCargo > 0) then
										{
											_icon = getText (configFile >> 'CfgMagazines' >> _magCargo select 0 >> 'picture');
										};
									};
									_irad = 25;
									_ctrl drawIcon [_icon, [0.74,0.97,0.98,1], getPosASL _x, _iscale*_irad, _iscale*_irad, getDir _x, "", 1];
								};
							}
							else
							{
								if (show_boxes_infiSTAR) then
								{
									_icon = getText(configFile >> "CfgVehicles" >> _type >> "icon");
									_irad = 25;
									_ctrl drawIcon [_icon, [1,0,0,1], getPosASL _x, _iscale*_irad, _iscale*_irad, getDir _x, "", 1];
								};
							};
						};
					} forEach lootBoxesArray;
				};
				_allvehicles = player nearEntities ['Allvehicles',1000000];
				if (!visibleMap) then
				{
					_allvehicles = player nearEntities ['Allvehicles',150];
				};
				{
					if (!isNull _x) then
					{
						_type = typeOf _x;
						if ((_x isKindOf "LandVehicle") || (_x isKindOf "Air") || (_x isKindOf "Ship")) then
						{
							_icon = getText(configFile >> "CfgVehicles" >> _type >> "icon");
							_irad = 27;
							_vehcolor = [0.05,0.05,0.6,1];
							_characterID = _x getVariable['CharacterID','0'];
							if ((MOD_EPOCH) && (_characterID != '0')) then
							{
								_vehcolor = [0.7,0,0,1];
							};
							_ctrl drawIcon [_icon, _vehcolor, getPosASL _x, _iscale*_irad, _iscale*_irad, getDir _x, "", 0.5];
						};
						if ((_x isKindOf "Man") || (getPlayerUID _x != "")) then
						{
							if (_x == player) then {_color = [0, 0, 0, 1];} else {_color = [1, 0, 0, 1];};
							if ((_x isKindOf "zZombie_Base") || (_x isKindOf "Animal")) then
							{
								if (getPlayerUID _x != "") then
								{
									_ctrl drawIcon ["\ca\ui\data\iconman_ca.paa", _color, getPosASL _x, _iscale*30, _iscale*30, getDir _x, "", 1];
								};
							}
							else
							{
								_ctrl drawIcon ["\ca\ui\data\iconman_ca.paa", _color, getPosASL _x, _iscale*30, _iscale*30, getDir _x, "", 1];
								if (show_cWEPm_infiSTAR) then
								{
									_icon = getText (configFile >> 'CfgWeapons' >> (currentWeapon _x) >> 'picture');
									_irad = 35;
									_pos = getPosASL _x;
									_pos = [_pos select 0,(_pos select 1) + 12,_pos select 2];
									_ctrl drawIcon [_icon, [0.74,0.97,0.98,1], _pos, _iscale*_irad, _iscale*_irad, (getDir _x)+90, "", 1];
								};
							};
						};
					};
				} forEach _allvehicles;
			};
		};
	};
	adminwreck =
	{
		if !(('ItemGPS' in items player) || ('ItemMap' in items player)) then
		{
			_config = ["ItemGPS"];
			_isOK = [player,_config] call BIS_fnc_invAdd;
		};
		
		stopadminwrecks =
		{
			for "_i" from 0 to 8888 do {deleteMarkerLocal ("adminwrecks" + (str _i));};
		};
		adminwrecks =
		{
			while {markadwreck == 1} do
			{
				if (markadwreck == 0) exitWith {[] spawn stopadminwrecks;};
				_objects = allMissionObjects "SpawnableWreck" + allMissionObjects "Supply_Crate_DZE" + allMissionObjects "UH60Wreck_DZ" + allMissionObjects "UH1Wreck_DZ" + allMissionObjects "Mi8Wreck_DZ";
				_objects = _objects + vehicles;
				for "_i" from 0 to (count _objects)-1 do
				{
					deleteMarkerLocal ("adminwrecks" + (str _i));
					
					_selected = _objects select _i;
					_type = typeOf _selected;
					if ((getText (configFile >> 'CfgVehicles' >> (typeOf _selected) >> 'displayName') == 'Wreck') || 
					(_type in ["UH60Wreck_DZ","UH1Wreck_DZ","Mi8Wreck_DZ","UH60_NAVY_Wreck_DZ","UH60_ARMY_Wreck_DZ","UH60_NAVY_Wreck_burned_DZ","UH60_ARMY_Wreck_burned_DZ","Mass_grave_DZ"]) || 
					(_selected isKindOf "ReammoBox") || (_selected isKindOf "Supply_Crate_DZE") || (_selected isKindOf "Wreck_Base") || (_selected isKindOf "Wreck")) then 
					{
						deleteMarkerLocal ("adminwrecks" + (str _i));
						_vm = createMarkerLocal [("adminwrecks" + (str _i)), getPos _selected];
						_vm setMarkerTypeLocal "SupplyVehicle";
						_vm setMarkerSizeLocal [0.8, 0.8];
						_vm setMarkerTextLocal format [" %1", getText (configFile >> 'CfgVehicles' >> (typeOf _selected) >> 'displayName')];
						_vm setMarkerColorLocal ("ColorYellow");
					};
				};
				uiSleep 5;
			};
			[] spawn stopadminwrecks;
		};
		if (isNil "markadwreck") then {markadwreck = 0;};
		if (markadwreck == 0) then
		{
			markadwreck = 1;
			hint "2D Map WRECK Markers Activated";
			[] spawn adminwrecks;
			
			_sl = format["%1 WRECK Activated",name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer "PVAH_WriteLogReq";
		}
		else
		{
			markadwreck = 0;
			hint "2D Map WRECK Markers Disabled";
			
			[] spawn stopadminwrecks;
			
			_sl = format["%1 WRECK Disabled",name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer "PVAH_WriteLogReq";
		};
	};
	admintent =
	{
		if !(('ItemGPS' in items player) || ('ItemMap' in items player)) then
		{
			_config = ["ItemGPS"];
			_isOK = [player,_config] call BIS_fnc_invAdd;
		};
		
		admintents =
		{
			while {markadtent == 1} do
			{
				_objects = [];
				{
					_objects = _objects + (allMissionObjects _x);
					uiSleep 0.5;
				} forEach ["TentStorage","StashSmall","StashSmall1","StashSmall2","StashSmall3","StashSmall4","StashMedium","StashMedium1","StashMedium2","StashMedium3", "StashMedium4"];
				for "_i" from 0 to (count _objects)-1 do
				{
					_selected = _objects select _i;
					deleteMarkerLocal ("admintents" + (str _i));
					_vm = createMarkerLocal [("admintents" + (str _i)), getPos _selected];
					_vm setMarkerTypeLocal "Camp";
					_vm setMarkerSizeLocal [0.8, 0.8];
					_vm setMarkerTextLocal format [" %1", getText (configFile >> 'CfgVehicles' >> (typeOf _selected) >> 'displayName')];
					_vm setMarkerColorLocal ("ColorGreen");
				};
				uiSleep 20;
			};
			for "_i" from 0 to 8888 do {deleteMarkerLocal ("admintents" + (str _i));};
		};
		if (isNil "markadtent") then {markadtent = 0;};
		if (markadtent == 0) then
		{
			markadtent = 1;
			hint "2D Map Tent Markers Activated";
			[] spawn admintents;
			
			_sl = format["%1 TentMarker Activated",name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer "PVAH_WriteLogReq";
		}
		else
		{
			markadtent = 0;
			hint "2D Map Tent Markers Disabled";
			
			for "_i" from 0 to 8888 do {deleteMarkerLocal ("admintents" + (str _i));};
			
			_sl = format["%1 TentMarker Disabled",name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer "PVAH_WriteLogReq";
		};
	};
	adminDEAD =
	{
		if !(('ItemGPS' in items player) || ('ItemMap' in items player)) then
		{
			_config = ["ItemGPS"];
			_isOK = [player,_config] call BIS_fnc_invAdd;
		};
		adminDEADs =
		{
			while {markadDEAD == 1} do
			{
				if !(markadDEAD == 1) exitWith {
					for "_i" from 0 to 8888 do {deleteMarkerLocal ("adminDEADs" + (str _i));};
				};
				_objects = (allDead+allMissionObjects "GraveDZE");
				for "_i" from 0 to (count _objects)-1 do
				{
					deleteMarkerLocal ("adminDEADs" + (str _i));
					_selected = _objects select _i;
					if (typeOf _selected == 'GraveDZE') then
					{
						_vm = createMarkerLocal [("adminDEADs" + (str _i)), getPos _selected];
						_vm setMarkerTypeLocal "Camp";
						_vm setMarkerSizeLocal [0.4, 0.4];
						_vm setMarkerTextLocal format["%1","GRAVE"];
						_vm setMarkerColorLocal ("ColorRED");
					}
					else
					{
						if ((!isNull _selected) && !(_selected isKindOf "zZombie_base") && (_selected isKindOf "CAManBase")) then
						{
							_name = (_selected getVariable["bodyName", name _selected]);
							if (_name != "Error: No unit") then
							{
								_vm = createMarkerLocal [("adminDEADs" + (str _i)), getPos _selected];
								_vm setMarkerTypeLocal "Camp";
								_vm setMarkerSizeLocal [0.4, 0.4];
								_vm setMarkerTextLocal format["%1",_name];
								_vm setMarkerColorLocal ("ColorRED");
							};
						};
					};
				};
				uiSleep 5;
			};
			for "_i" from 0 to 8888 do {deleteMarkerLocal ("adminDEADs" + (str _i));};
		};
		if (isNil "markadDEAD") then {markadDEAD = 0;};
		if (markadDEAD == 0) then
		{
			markadDEAD = 1;
			hint "2D Map DEADMarker Activated";
			[] spawn adminDEADs;
			
			_sl = format["%1 DEADMarker Activated",name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer "PVAH_WriteLogReq";
		}
		else
		{
			markadDEAD = 0;
			hint "2D Map DEADMarker Disabled";
			
			for "_i" from 0 to 8888 do {deleteMarkerLocal ("adminDEADs" + (str _i));};
			
			_sl = format["%1 DEADMarker Disabled",name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer "PVAH_WriteLogReq";
		};
	};
	adminPlotPole =
	{
		if !(('ItemGPS' in items player) || ('ItemMap' in items player)) then
		{
			_config = ["ItemGPS"];
			_isOK = [player,_config] call BIS_fnc_invAdd;
		};
		adminPlotPoles =
		{
			while {markadPlotPole == 1} do
			{
				ADMIN_PlotPole_LIST = [] + (allMissionObjects "Plastic_Pole_EP1_DZ");
				
				if !(markadPlotPole == 1) exitWith {
					for "_i" from 0 to 8888 do {deleteMarkerLocal ("adminPlotPoles" + (str _i));};
				};
				for "_i" from 0 to (count ADMIN_PlotPole_LIST)-1 do
				{
					deleteMarkerLocal ("adminPlotPoles" + (str _i));
					_selected = ADMIN_PlotPole_LIST select _i;
					_vm = createMarkerLocal [("adminPlotPoles" + (str _i)), getPos _selected];
					_vm setMarkerAlphaLocal 0.8;
					_vm setMarkerBrushLocal "Grid";
					_vm setMarkerSizeLocal [DZE_PlotPole select 1,DZE_PlotPole select 1];
					_vm setMarkerShapeLocal "ELLIPSE";
					_vm setMarkerColorLocal "ColorGreen";
					
					_k = _i + 2000;
					deleteMarkerLocal ("adminPlotPoles" + (str _k));
					_vm = createMarkerLocal [("adminPlotPoles" + (str _k)), getPos _selected];
					_vm setMarkerTypeLocal "mil_start";
					_vm setMarkerSizeLocal [0.5, 0.5];
					_vm setMarkerTextLocal "Plot";
					_vm setMarkerColorLocal "ColorGreen";
				};
				uiSleep 5;
			};
			for "_i" from 0 to 8888 do {deleteMarkerLocal ("adminPlotPoles" + (str _i));};
		};
		if (isNil "markadPlotPole") then {markadPlotPole = 0;};
		if (markadPlotPole == 0) then
		{
			markadPlotPole = 1;
			hint "2D Map PlotPoleMarker Activated";
			[] spawn adminPlotPoles;
			
			_sl = format["%1 PlotPoleMarker Activated",name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer "PVAH_WriteLogReq";
		}
		else
		{
			markadPlotPole = 0;
			hint "2D Map PlotPoleMarker Disabled";
			
			for "_i" from 0 to 8888 do {deleteMarkerLocal ("adminPlotPoles" + (str _i));};
			
			_sl = format["%1 PlotPoleMarker Disabled",name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer "PVAH_WriteLogReq";
		};
	};
	adminVAULT =
	{
		if !(('ItemGPS' in items player) || ('ItemMap' in items player)) then
		{
			_config = ["ItemGPS"];
			_isOK = [player,_config] call BIS_fnc_invAdd;
		};
		adminVAULTs =
		{
			while {markadVAULT == 1} do
			{
				ADMIN_VAULT_LIST = [] + (allMissionObjects "VaultStorage"+allMissionObjects "VaultStorageLocked"+allMissionObjects "LockboxStorageLocked"+allMissionObjects "LockboxStorage");
				
				if !(markadVAULT == 1) exitWith {
					for "_i" from 0 to 8888 do {deleteMarkerLocal ("adminVAULTs" + (str _i));};
				};
				for "_i" from 0 to (count ADMIN_VAULT_LIST)-1 do
				{
					deleteMarkerLocal ("adminVAULTs" + (str _i));
					_selected = ADMIN_VAULT_LIST select _i;
					_vm = createMarkerLocal [("adminVAULTs" + (str _i)), getPos _selected];
					_vm setMarkerTypeLocal "Camp";
					_vm setMarkerSizeLocal [0.5, 0.5];
					_vm setMarkerTextLocal "VAULT";
					_vm setMarkerColorLocal ("ColorYellow");
				};
				uiSleep 5;
			};
			for "_i" from 0 to 8888 do {deleteMarkerLocal ("adminVAULTs" + (str _i));};
		};
		if (isNil "markadVAULT") then {markadVAULT = 0;};
		if (markadVAULT == 0) then
		{
			markadVAULT = 1;
			hint "2D Map VAULTMarker Activated";
			[] spawn adminVAULTs;
			
			_sl = format["%1 VAULTMarker Activated",name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer "PVAH_WriteLogReq";
		}
		else
		{
			markadVAULT = 0;
			hint "2D Map VAULTMarker Disabled";
			
			for "_i" from 0 to 8888 do {deleteMarkerLocal ("adminVAULTs" + (str _i));};
			
			_sl = format["%1 VAULTMarker Disabled",name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer "PVAH_WriteLogReq";
		};
	};
	adminmark =
	{
		if !(('ItemGPS' in items player) || ('ItemMap' in items player)) then
		{
			_config = ["ItemGPS"];
			_isOK = [player,_config] call BIS_fnc_invAdd;
		};
		
		adminpmark =
		{
			while {mark == 1} do
			{
				_playableUnits = playableUnits;
				for "_i" from 0 to (count _playableUnits)-1 do
				{
					deleteMarkerLocal ("adminpmark" + (str _i));
					if ((_playableUnits select _i) == vehicle (_playableUnits select _i)) then 
					{
						deleteMarkerLocal ("adminpmark" + (str _i));
						_pm = createMarkerLocal [("adminpmark" + (str _i)), getPos (_playableUnits select _i)];
						_pm setMarkerTypeLocal "destroyedvehicle";
						_pm setMarkerSizeLocal [0.8, 0.8];
						_pm setMarkerTextLocal format ["%1", name (_playableUnits select _i)];
						_pm setMarkerColorLocal ("ColorBlue");
					};
				};
				uiSleep 2;
			};
			for "_i" from 0 to 8888 do {deleteMarkerLocal ("adminpmark" + (str _i));};
		};
		if (isNil "mark") then {mark = 0;};
		if (mark == 0) then
		{
			mark = 1;
			hint "2D Map Player Markers Activated";
			[] spawn adminpmark;
			
			_sl = format["%1 PlayerMarkers Activated",name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer "PVAH_WriteLogReq";
		}
		else
		{
			mark = 0;
			hint "2D Map Player Markers Disabled";
			
			for "_i" from 0 to 8888 do {deleteMarkerLocal ("adminpmark" + (str _i));};
			
			_sl = format["%1 PlayerMarkers Disabled",name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer "PVAH_WriteLogReq";
		};
	};
	adminmarkveh_U =
	{
		if !(('ItemGPS' in items player) || ('ItemMap' in items player)) then
		{
			_config = ["ItemGPS"];
			_isOK = [player,_config] call BIS_fnc_invAdd;
		};
		
		adminvmark_U =
		{
			while {markveh_U == 1} do
			{
				_vehicles = ([0,0,0] nearEntities [['LandVehicle','Air','Ship'], 10000000]);
				for "_i" from 0 to (count _vehicles)-1 do
				{
					deleteMarkerLocal ("adminvmark_U" + (str _i));
					_cveh = _vehicles select _i;
					if !(locked _cveh) then
					{
						if (count crew _cveh != 0) then 
						{
							_crewnames = [];
							{
								_crewnames = _crewnames + [name _x];
							} forEach crew _cveh;
							
							deleteMarkerLocal ("adminvmark_U" + (str _i));
							_vm = createMarkerLocal [("adminvmark_U" + (str _i)), getPos _cveh];
							_vm setMarkerTypeLocal "destroyedvehicle";
							_vm setMarkerSizeLocal [0.8, 0.8];
							_vm setMarkerTextLocal format ["%1 in %2", _crewnames,getText (configFile >> 'CfgVehicles' >> (typeOf _cveh) >> 'displayName')];
							_vm setMarkerColorLocal ("ColorRed");
						}
						else
						{
							deleteMarkerLocal ("adminvmark_U" + (str _i));
							_vm = createMarkerLocal [("adminvmark_U" + (str _i)), getPos _cveh];
							_vm setMarkerTypeLocal "destroyedvehicle";
							_vm setMarkerSizeLocal [0.8, 0.8];
							_vm setMarkerTextLocal format ["%1", getText (configFile >> 'CfgVehicles' >> (typeOf _cveh) >> 'displayName')];
							_vm setMarkerColorLocal ("ColorBlack");
						};
					};
				};
				uiSleep 3;
			};
			for "_i" from 0 to 8888 do {deleteMarkerLocal ("adminvmark_U" + (str _i));};
		};
		if (isNil "markveh_U") then {markveh_U = 0;};
		if (markveh_U == 0) then
		{
			markveh_U = 1;
			hint "2D Map (unlocked) VEHICLE Markers Activated";
			[] spawn adminvmark_U;
			
			_sl = format["%1 (unlocked) VEHICLEMarkers Activated",name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer "PVAH_WriteLogReq";
		}
		else
		{
			markveh_U = 0;
			hint "2D Map (unlocked) VEHICLE Markers Disabled";
			
			for "_i" from 0 to 8888 do {deleteMarkerLocal ("adminvmark_U" + (str _i));};
			
			_sl = format["%1 (unlocked) VEHICLEMarkers Disabled",name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer "PVAH_WriteLogReq";
		};
	};
	adminmarkveh_L =
	{
		if !(('ItemGPS' in items player) || ('ItemMap' in items player)) then
		{
			_config = ["ItemGPS"];
			_isOK = [player,_config] call BIS_fnc_invAdd;
		};
		
		adminvmark_L =
		{
			while {markveh_L == 1} do
			{
				_vehicles = ([0,0,0] nearEntities [['LandVehicle','Air','Ship'], 10000000]);
				for "_i" from 0 to (count _vehicles)-1 do
				{
					deleteMarkerLocal ("adminvmark_L" + (str _i));
					_cveh = _vehicles select _i;
					if (locked _cveh) then
					{
						if (count crew _cveh != 0) then 
						{
							_crewnames = [];
							{
								_crewnames = _crewnames + [name _x];
							} forEach crew _cveh;
							
							deleteMarkerLocal ("adminvmark_L" + (str _i));
							_vm = createMarkerLocal [("adminvmark_L" + (str _i)), getPos _cveh];
							_vm setMarkerTypeLocal "destroyedvehicle";
							_vm setMarkerSizeLocal [0.8, 0.8];
							_vm setMarkerTextLocal format ["%1 in %2", _crewnames,getText (configFile >> 'CfgVehicles' >> (typeOf _cveh) >> 'displayName')];
							_vm setMarkerColorLocal ("ColorRed");
						}
						else
						{
							deleteMarkerLocal ("adminvmark_L" + (str _i));
							_vm = createMarkerLocal [("adminvmark_L" + (str _i)), getPos _cveh];
							_vm setMarkerTypeLocal "destroyedvehicle";
							_vm setMarkerSizeLocal [0.8, 0.8];
							_vm setMarkerTextLocal format ["%1", getText (configFile >> 'CfgVehicles' >> (typeOf _cveh) >> 'displayName')];
							_vm setMarkerColorLocal ("ColorBrown");
						};
					};
				};
				uiSleep 3;
			};
			for "_i" from 0 to 8888 do {deleteMarkerLocal ("adminvmark_L" + (str _i));};
		};
		if (isNil "markveh_L") then {markveh_L = 0;};
		if (markveh_L == 0) then
		{
			markveh_L = 1;
			hint "2D Map (locked) VEHICLE Markers Activated";
			[] spawn adminvmark_L;
			
			_sl = format["%1 (locked) VEHICLEMarkers Activated",name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer "PVAH_WriteLogReq";
		}
		else
		{
			markveh_L = 0;
			hint "2D Map (locked) VEHICLE Markers Disabled";
			
			for "_i" from 0 to 8888 do {deleteMarkerLocal ("adminvmark_L" + (str _i));};
			
			_sl = format["%1 (locked) VEHICLEMarkers Disabled",name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer "PVAH_WriteLogReq";
		};
	};
	adminAntiAggro = {
		if (isNil "adminAntiAggro_zxeds") then {adminAntiAggro_zxeds = false;};
		if (!adminAntiAggro_zxeds) then
		{
			adminAntiAggro_zxeds = true;
			
			hint "No Zed Aggro - On";
			cutText [format["No Zed Aggro - On"], "PLAIN DOWN"];
			_sl = format["%1 No Zed Aggro - On",name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer "PVAH_WriteLogReq";
			
			player_zombieCheck = {};
			player_zombieAttack = {};
		}
		else
		{
			adminAntiAggro_zxeds = false;
			
			hint "No Zed Aggro - Disabled";
			cutText [format["No Zed Aggro - Disabled"], "PLAIN DOWN"];
			_sl = format["%1 No Zed Aggro - Disabled",name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer "PVAH_WriteLogReq";
			
			player_zombieCheck = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_zombieCheck.sqf';
			player_zombieAttack = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_zombieAttack.sqf';
		};
	};
	admin_vehicleboost = {
		if (isNil("vehboost_infiSTAR")) then {vehboost_infiSTAR = 0;};
		if (vehboost_infiSTAR == 0) then 
		{
			vehboost_infiSTAR = 1;
			hint "Vehboost 1 - left shift or E to go fast and space for brakes!";
			cutText [format["Vehboost 1 - left shift or E to go fast and space for brakes!"], "PLAIN DOWN"];
			_sl = format["%1 Vehboost On",name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer "PVAH_WriteLogReq";
			
			waitUntil {!isNull (finddisplay 46)};
			booostkey_KI_0 = (findDisplay 46) displayAddEventHandler ["KeyDown","_this select 1 call booostkey_FNC_spd_0;false;"];
			booostkey_FNC_spd_0 = 
			{
				_vehicle_player = vehicle player;
				if(_vehicle_player == player)exitwith{};
				
				if(isEngineOn _vehicle_player) then 
				{
					switch (_this) do 
					{
						case 18:
						{
							_vehicle_player SetVelocity [(velocity _vehicle_player select 0) * 1.05, (velocity _vehicle_player select 1) *1.05, (velocity _vehicle_player select 2) * 0.99];
						};
						case 42:
						{
							_vehicle_player setVelocity [(velocity _vehicle_player select 0) * 1.025, (velocity _vehicle_player select 1) * 1.025, (velocity _vehicle_player select 2) * 0.99];
						};
						case 57:
						{
							_vehicle_player SetVelocity [(velocity _vehicle_player select 0) * 0.95, (velocity _vehicle_player select 1) *0.95, (velocity _vehicle_player select 2) * 0.99];
						};
					};
				};
			};
		}
		else
		{
			vehboost_infiSTAR = 0;
			hint "Vehboost 0";
			cutText [format["Vehboost 0"], "PLAIN DOWN"];
			_sl = format["%1 Vehboost Disabled",name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer "PVAH_WriteLogReq";
			
			(findDisplay 46) displayRemoveEventHandler ["KeyDown", booostkey_KI_0];
			_vehicle_player = nil;
		};
	};
	adminZedshld = 
	{
		if (isNil "zoombiieshieldd") then {zoombiieshieldd = true;} 
		else 
		{
			zoombiieshieldd = !zoombiieshieldd;
			if (zoombiieshieldd) then 
			{	
				cutText [format["ZedShield ON for 50m"],"PLAIN DOWN"];
				
				_sl = format["%1 ZedShield Activated",name player];
				PVAH_WriteLogReq = [player,_sl];
				publicVariableServer "PVAH_WriteLogReq";
				if ( (getPlayerUID player) in Ultima_Low_Admins) then
					{
						_sl	=	format["Модератор: %1, включил щит от зомби", name player];
						Terminal_Server	=	[player, "moderator_control", _sl];
						publicVariableServer "Terminal_Server";
					};
			} 
			else 
			{
				cutText ["ZedShield OFF","PLAIN DOWN"];
				
				_sl = format["%1 ZedShield Disabled",name player];
				PVAH_WriteLogReq = [player,_sl];
				publicVariableServer "PVAH_WriteLogReq";
				if ( (getPlayerUID player) in Ultima_Low_Admins) then
					{
						_sl	=	format["Модератор: %1, выключил щит от зомби", name player];
						Terminal_Server	=	[player, "moderator_control", _sl];
						publicVariableServer "Terminal_Server";
					};
			};
		};
		while {zoombiieshieldd} do 
		{
			{
				if (!isNull _x) then {
					if !(isPlayer _x) then {
						deleteVehicle _x;
					};
				};
			} forEach (vehicle player nearEntities ["zZombie_Base",50]);
			uiSleep 1;
		};
	};
	adminCallZeds =
	{
		fnc_addZeds =
		{
			_position = _this;
			for "_i" from 1 to 10 do
			{
				_unitTypes = 	[]+ getArray (configFile >> "CfgBuildingLoot" >> "Default" >> "zombieClass");
				_agent = 	objNull;
				_type = _unitTypes call BIS_fnc_selectRandom;
				_radius = 40;
				_method = "NONE";
				_agent = createAgent [_type, _position, [], _radius, _method];
				_agent setVariable ["myDest",_position];
				_agent setVariable ["newDest",_position];
				_rnd = random 1;
				if (_rnd > 0.3) then
				{
					_lootType = getText (configFile >> "CfgVehicles" >> _type >> "zombieLoot");
					_lootTypeCfg = getArray (configFile >> "CfgLoot" >> _lootType);
					_array = [];
					{
						_array set [count _array, _x select 0];
					} count _lootTypeCfg;
					if (count _array > 0) then
					{
						_index = dayz_CLBase find _lootType;
						_weights = dayz_CLChances select _index;
						_loot = _array select (_weights select (floor(random (count _weights))));
						if(!isNil "_array") then
						{
							_loot_count =	getNumber(configFile >> "CfgMagazines" >> _loot >> "count");
							if(_loot_count>1) then
							{
								_agent addMagazine [_loot, ceil(random _loot_count)];
							}
							else
							{
								_agent addMagazine _loot;
							};
						};
					};
				};
				_id = [_position,_agent] execFSM "\z\addons\dayz_code\system\zombie_agent.fsm";
			};
		};
		openMap [true, false];
		onMapSingleClick '
			[_pos select 0,_pos select 1,_pos select 2] spawn fnc_addZeds;
			openMap [false, false];
			onMapSingleClick "";
		';
	};
	adminammo_recoil = {
		if (isNil ("admin_loop1")) then {admin_loop1 = 0;};
		if (admin_loop1==0) then 
		{
			admin_loop1=1;
			cutText [format["Infinite AMMO and No Recoil ON"], "PLAIN DOWN"];
			hint "Infinite AMMO and No Recoil ON";
			
			_sl = format["%1 adminammo_recoil ON",name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer "PVAH_WriteLogReq";
		}
		else
		{
			admin_loop1=0;
			cutText [format["Infinite AMMO and No Recoil OFF"], "PLAIN DOWN"];
			hint "Infinite AMMO and No Recoil OFF";
			
			_sl = format["%1 adminammo_recoil OFF",name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer "PVAH_WriteLogReq";
		};
		while {admin_loop1==1} do 
		{
			(vehicle player) setVehicleAmmo 1;
			(vehicle player) setUnitRecoilCoefficient 0;
			uiSleep 0.01;
		};
	};
	admin_FastFire = {
		if (isNil ("admin_loop2")) then {admin_loop2 = 0;};
		if (admin_loop2==0) then 
		{
			admin_loop2=1;
			cutText [format["FastFire ON"], "PLAIN DOWN"];
			hint "FastFire ON";
			
			_sl = format["%1 FastFire ON",name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer "PVAH_WriteLogReq";
		}
		else
		{
			admin_loop2=0;
			cutText [format["FastFire OFF"], "PLAIN DOWN"];
			hint "FastFire OFF";
			
			_sl = format["%1 FastFire OFF",name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer "PVAH_WriteLogReq";
		};
		while {admin_loop2==1} do 
		{
			(vehicle player) setWeaponReloadingTime [(vehicle player),currentWeapon (vehicle player),0];
			player setWeaponReloadingTime [player,currentWeapon player,0];
			uiSleep 0.01;
		};
	};
	admin_low_terrain = {
		if (isNil "admin_terrain") then {admin_terrain = true;} else {admin_terrain = !admin_terrain};
		if (admin_terrain) then {
			setTerrainGrid 50;
			hint "Terrain Low";
			cutText [format["Terrain Low"], "PLAIN DOWN"];
			_sl = format["%1 Terrain Low",name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer "PVAH_WriteLogReq";
		}
		else
		{
			setTerrainGrid 25;
			hint "Terrain Normal";
			cutText [format["Terrain Normal"], "PLAIN DOWN"];
			_sl = format["%1 Terrain Normal",name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer "PVAH_WriteLogReq";
		};
	};
	admingod =
	{
		if (isNil 'gmadmin') then {gmadmin = 0;};
		if (gmadmin == 0) then
		{
			gmadmin = 1;
			gmdadmin = 1;
			hint 'God ON';
			cutText ['God ON', 'PLAIN'];
			
			[] spawn {
				while {gmadmin == 1} do
				{
					r_player_inpain = false;
					r_player_infected = false;
					r_player_injured = false;
					dayz_hunger = 0;
					dayz_thirst = 0;
					dayz_temperatur = 37;
					fnc_usec_damageHandler = {};
					player allowDamage false;
					player removeAllEventhandlers 'handleDamage';
					player addEventhandler ['handleDamage', {false}];
					uiSleep 0.5;
				};
				uiSleep 1;
				fnc_usec_damageHandler = compile preprocessFileLineNumbers 'fixes\compile\fn_damageHandler.sqf';
				player allowDamage true;
				player removeAllEventHandlers 'HandleDamage';
				player addeventhandler ['HandleDamage',{_this call fnc_usec_damageHandler;} ];
			};
			
			_sl = format['%1 G_o_d ON',name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer 'PVAH_WriteLogReq';
			if ( (getPlayerUID player) in Ultima_Low_Admins) then
				{
					_sl	=	format['Модератор: %1, включил бессмертие.', name player];
					Terminal_Server	=	[player, 'moderator_control', _sl];
					publicVariableServer 'Terminal_Server';
				};
		}
		else
		{
			gmadmin = 0;
			gmdadmin = 0;
			hint 'God OFF';
			cutText ['God OFF', 'PLAIN'];
			
			fnc_usec_damageHandler = compile preprocessFileLineNumbers 'fixes\compile\fn_damageHandler.sqf';
			player allowDamage true;
			player removeAllEventHandlers 'HandleDamage';
			player addeventhandler ['HandleDamage',{_this call fnc_usec_damageHandler;} ];
			
			_sl = format['%1 G_o_d OFF',name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer 'PVAH_WriteLogReq';
			if ( (getPlayerUID player) in Ultima_Low_Admins) then
				{
					_sl	=	format['Модератор: %1, выключил бессмертие.', name player];
					Terminal_Server	=	[player, 'moderator_control', _sl];
					publicVariableServer 'Terminal_Server';
				};
		};
	};
	adminob =
	{
		_log = '';
		if (isNil "anob") then {anob = true;} else {anob = !anob};
		if (anob) then
		{
			if (isNil 'oR3F_TIRED_FNCT_Voile_Noir') then {oR3F_TIRED_FNCT_Voile_Noir = R3F_TIRED_FNCT_Voile_Noir;};
			if (isNil 'oR3F_TIRED_FNCT_DoBlackVanish') then {oR3F_TIRED_FNCT_DoBlackVanish = R3F_TIRED_FNCT_DoBlackVanish;};
			R3F_TIRED_FNCT_Voile_Noir = {};
			R3F_TIRED_FNCT_DoBlackVanish = {};
			
			_log = 'No OverBurdened - ON';
		}
		else
		{
			R3F_TIRED_FNCT_Voile_Noir = oR3F_TIRED_FNCT_Voile_Noir;
			R3F_TIRED_FNCT_DoBlackVanish = oR3F_TIRED_FNCT_DoBlackVanish;
			
			_log = 'No OverBurdened - OFF';
		};
		hint _log;
		cutText [_log, 'PLAIN'];
		_sl = format['%1 - %2',name player,_log];
		PVAH_WriteLogReq = [player,_sl];
		publicVariableServer 'PVAH_WriteLogReq';
	};
	admin1build =
	{
		_log = '';
		if (isNil "a1sb") then {a1sb = true;} else {a1sb = !a1sb};
		if (a1sb) then
		{
			DZE_StaticConstructionCount = 1;
			systemChat format['DZE_StaticConstructionCount changed to: %1',DZE_StaticConstructionCount];
			
			_log = '1 Step Building - ON';
		}
		else
		{
			DZE_StaticConstructionCount = 0;
			systemChat 'DZE_StaticConstructionCount changed to default';
			
			_log = '1 Step Building - OFF';
		};
		hint _log;
		cutText [_log, 'PLAIN'];
		_sl = format['%1 - %2',name player,_log];
		PVAH_WriteLogReq = [player,_sl];
		publicVariableServer 'PVAH_WriteLogReq';
	};
	admin_noplot =
	{
		_log = '';
		if (isNil "anppn") then {anppn = true;} else {anppn = !anppn};
		if (anppn) then
		{
			DZE_PlotPole = [1,1];
			DZE_requireplot = 0;
			
			_log = 'No PlotPole - ON';
		}
		else
		{
			DZE_PlotPole = [50,75];
			DZE_requireplot = 1;
			
			_log = 'No PlotPole - OFF';
		};
		hint _log;
		cutText [_log, 'PLAIN'];
		_sl = format['%1 - %2',name player,_log];
		PVAH_WriteLogReq = [player,_sl];
		publicVariableServer 'PVAH_WriteLogReq';
	};
	adminHumanityPlus =
	{
		{
			if (name _x == _this select 0) then
			{
				_humanity = _x getVariable["humanity",0];
				_x setVariable["humanity",_humanity+1000,true];
				hint format ["Gave %1 +1000 Humanity!",_this select 0];
				
				_sl = format["%1 plus 1000 Humanity to %2",name player,_this select 0];
				PVAH_WriteLogReq = [player,_sl];
				publicVariableServer "PVAH_WriteLogReq";
			};
		} forEach playableUnits;
	};
	adminHumanityMinus =
	{
		{
			if (name _x == _this select 0) then
			{
				_humanity = _x getVariable["humanity",0];
				_x setVariable["humanity",_humanity-1000,true];
				hint format ["Gave %1 -1000 Humanity!",_this select 0];
				
				_sl = format["%1 minus 1000 Humanity to %2",name player,_this select 0];
				PVAH_WriteLogReq = [player,_sl];
				publicVariableServer "PVAH_WriteLogReq";
			};
		} forEach playableUnits;
	};
	adminHumanityPlus200 =
	{
		{
			if (name _x == _this select 0) then
			{
				_humanity = _x getVariable["humanity",0];
				_x setVariable["humanity",_humanity+200,true];
				hint format ["Gave %1 +200 Humanity!",_this select 0];
				
				_sl = format["%1 plus 200 Humanity to %2",name player,_this select 0];
				PVAH_WriteLogReq = [player,_sl];
				publicVariableServer "PVAH_WriteLogReq";
			};
		} forEach playableUnits;
	};
	adminHumanityMinus200 =
	{
		{
			if (name _x == _this select 0) then
			{
				_humanity = _x getVariable["humanity",0];
				_x setVariable["humanity",_humanity-200,true];
				hint format ["Gave %1 -200 Humanity!",_this select 0];
				
				_sl = format["%1 minus 200 Humanity to %2",name player,_this select 0];
				PVAH_WriteLogReq = [player,_sl];
				publicVariableServer "PVAH_WriteLogReq";
			};
		} forEach playableUnits;
	};

	adminUltimaIncCash200 =
		{
			{
				if (name _x == _this select 0) exitWith
					{
						private ["_uid"];
						_uid = getPlayerUID _x;
						Terminal_Server = [player, "admin_event", "cash",_uid,200,-1,_x];
						publicVariableServer "Terminal_Server";
						hint format ["%1 выдал 200 баксов!",_this select 0];
						_sl = format["%1 выдал 200 баксов %2",name player,_this select 0];
						PVAH_WriteLogReq = [player,_sl];
						publicVariableServer "PVAH_WriteLogReq";
					};
			} forEach playableUnits;
		};
	adminUltimaIncBank200 =
		{
			{
				if (name _x == _this select 0) exitWith
					{
						private ["_uid"];
						_uid = getPlayerUID _x;
						Terminal_Server = [player, "admin_event", "bank",_uid,200,-1,_x];
						publicVariableServer "Terminal_Server";
						hint format ["%1 положил 200 баксов в банк!",_this select 0];
						_sl = format["%1 положил 200 баксов в банк %2",name player,_this select 0];
						PVAH_WriteLogReq = [player,_sl];
						publicVariableServer "PVAH_WriteLogReq";
					};
			} forEach playableUnits;
		};
	adminUltimaIncDeposite200 =
		{
			{
				if (name _x == _this select 0) exitWith
					{
						private ["_uid"];
						_uid = getPlayerUID _x;
						Terminal_Server = [player, "admin_event", "deposite",_uid,200,-1,_x];
						publicVariableServer "Terminal_Server";
						hint format ["%1 положил 200 баксов на депозит!",_this select 0];
						_sl = format["%1 положил 200 баксов на депозит %2",name player,_this select 0];
						PVAH_WriteLogReq = [player,_sl];
						publicVariableServer "PVAH_WriteLogReq";
					};
			} forEach playableUnits;
		};

	adminUltimaDecCash200 =
		{
			{
				if (name _x == _this select 0) exitWith
					{
						private ["_uid"];
						_uid = getPlayerUID _x;
						Terminal_Server = [player, "admin_event", "cash",_uid,-200,-1,_x];
						publicVariableServer "Terminal_Server";
						hint format ["%1 снял 200 баксов!",_this select 0];
						_sl = format["%1 снял 200 баксов у %2",name player,_this select 0];
						PVAH_WriteLogReq = [player,_sl];
						publicVariableServer "PVAH_WriteLogReq";
					};
			} forEach playableUnits;
		};
	adminUltimaDecBank200 =
		{
			{
				if (name _x == _this select 0) exitWith
					{
						private ["_uid"];
						_uid = getPlayerUID _x;
						Terminal_Server = [player, "admin_event", "bank",_uid,-200,-1,_x];
						publicVariableServer "Terminal_Server";
						hint format ["%1 снял 200 баксов с банка!",_this select 0];
						_sl = format["%1 снял 200 баксов из банка %2",name player,_this select 0];
						PVAH_WriteLogReq = [player,_sl];
						publicVariableServer "PVAH_WriteLogReq";
					};
			} forEach playableUnits;
		};
	adminUltimaDecDeposite200 =
		{
			{
				if (name _x == _this select 0) exitWith
					{
						private ["_uid"];
						_uid = getPlayerUID _x;
						Terminal_Server = [player, "admin_event", "deposite",_uid,-200,-1,_x];
						publicVariableServer "Terminal_Server";
						hint format ["%1 снял 200 баксов с депозита!",_this select 0];
						_sl = format["%1 снял 200 баксов с депозита %2",name player,_this select 0];
						PVAH_WriteLogReq = [player,_sl];
						publicVariableServer "PVAH_WriteLogReq";
					};
			} forEach playableUnits;
		};

	adminUltimaClearCash =
		{
			{
				if (name _x == _this select 0) exitWith
					{
						private ["_uid"];
						_uid = getPlayerUID _x;
						Terminal_Server = [player, "admin_event", "cash",_uid,0,0,_x];
						publicVariableServer "Terminal_Server";
						hint format ["%1 очистил наличку!",_this select 0];
						_sl = format["%1 очистил наличку у %2",name player,_this select 0];
						PVAH_WriteLogReq = [player,_sl];
						publicVariableServer "PVAH_WriteLogReq";
					};
			} forEach playableUnits;
		};
	adminUltimaClearBank =
		{
			{
				if (name _x == _this select 0) exitWith
					{
						private ["_uid"];
						_uid = getPlayerUID _x;
						Terminal_Server = [player, "admin_event", "bank",_uid,0,0,_x];
						publicVariableServer "Terminal_Server";
						hint format ["%1 очистил банк!",_this select 0];
						_sl = format["%1 очистил банк у %2",name player,_this select 0];
						PVAH_WriteLogReq = [player,_sl];
						publicVariableServer "PVAH_WriteLogReq";
					};
			} forEach playableUnits;
		};
	adminUltimaClearDeposite =
		{
			{
				if (name _x == _this select 0) exitWith
					{
						private ["_uid"];
						_uid = getPlayerUID _x;
						Terminal_Server = [player, "admin_event", "deposite",_uid,0,0,_x];
						publicVariableServer "Terminal_Server";
						hint format ["%1 очистил депозит!",_this select 0];
						_sl = format["%1 очистил депозит у %2",name player,_this select 0];
						PVAH_WriteLogReq = [player,_sl];
						publicVariableServer "PVAH_WriteLogReq";
					};
			} forEach playableUnits;
		};
	admin_ban_chat =
		{
			{
				if (name _x == _this select 0) exitWith
					{
						private ["_uid"];
						_uid = getPlayerUID _x;
						Terminal_Server = [player, "ultima_ban_chat", _uid, 1];
						publicVariableServer "Terminal_Server";
						hint format ["%1 бан чата!", _this select 0];
						_sl = format["%1 забанил чат игроку: %2",name player,_this select 0];
						PVAH_WriteLogReq = [player,_sl];
						publicVariableServer "PVAH_WriteLogReq";
					};
			} forEach playableUnits;
		};
	admin_ban_chat_10 =
		{
			{
				if (name _x == _this select 0) exitWith
					{
						private ["_uid"];
						_uid = getPlayerUID _x;
						Terminal_Server = [player, "ultima_ban_chat", _uid, 10];
						publicVariableServer "Terminal_Server";
						hint format ["%1 бан чата на 10 часов!", _this select 0];
						_sl = format["%1 забанил чат игроку: %2. На 10 часов.",name player,_this select 0];
						PVAH_WriteLogReq = [player,_sl];
						publicVariableServer "PVAH_WriteLogReq";
					};
			} forEach playableUnits;
		};
	admin_ban_chat_off =
		{
			{
				if (name _x == _this select 0) exitWith
					{
						private ["_uid"];
						_uid = getPlayerUID _x;
						Terminal_Server = [player, "ultima_ban_chat", _uid, -1];
						publicVariableServer "Terminal_Server";
						hint format ["%1 бан чата снят!", _this select 0];
						_sl = format["%1 снял бан чата игроку: %2.",name player,_this select 0];
						PVAH_WriteLogReq = [player,_sl];
						publicVariableServer "PVAH_WriteLogReq";
					};
			} forEach playableUnits;
		};
	
	adminfixfps = {
		hint "FIXING FPS";
		cutText ["FIXING FPS", "PLAIN"];
		{
			if (count units _x == 0) then
			{
				deleteGroup _x;
			};
		} forEach allGroups;
		_allstart = ((allMissionObjects "WeaponHolder")+(allMissionObjects "Sound_Flies")+(allDead)+([0,0,0] nearEntities ['CAAnimalBase', 10000000]));
		_startCount = count _allstart;
		systemChat format["Objects: %1 - cleaning...",_startCount];
		{
			if (!isNull _x) then
			{
				if (_x in vehicles) then {deleteVehicle _x;};
				_nearby = {isPlayer _x} count (_x nearEntities [["CAManBase"], 450]);
				_keep = _x getVariable ["permaLoot",false];
				if ((_nearby == 0) && (!_keep) && !(_x in alldead)) then
				{
					deleteVehicle _x;
				};
				_nearby2 = {isPlayer _x} count (_x nearEntities [["CAManBase"], 25]);
				if ((_nearby2 == 0) && (_x in alldead) && (_x isKindOf "zZombie_Base")) then
				{
					deleteVehicle _x;
				};
				if ((_nearby2 == 0) && (_x isKindOf "CAAnimalBase")) then {deleteVehicle _x;};
			};
		} forEach _allstart;
		_Count = count ((allMissionObjects "WeaponHolder")+(allMissionObjects "Sound_Flies")+(allDead)+([0,0,0] nearEntities ['CAAnimalBase', 10000000]));
		systemChat format["Objects now: %1",_Count];
		
		_sl = format["%1 - FixFps Script",name player];
		PVAH_WriteLogReq = [player,_sl];
		publicVariableServer "PVAH_WriteLogReq";
	};
	adminCarGod =
	{
		if (isNil "adminCarGodToggle") then {adminCarGodToggle = 0;};
		if (adminCarGodToggle == 0) then
		{
			adminCarGodToggle = 1;
			hint "Car God On";
			while {adminCarGodToggle==1} do
			{
				_veh = vehicle player;
				if (_veh != player) then
				{
					_veh setDamage 0;
					_veh setFuel 1;
				};
				uiSleep 0.1;
			};
		}
		else
		{
			adminCarGodToggle = 0;
			hint "Car God Disabled";
		};
		
		_sl = format["%1 adminCarGod %2",name player,adminCarGodToggle];
		PVAH_WriteLogReq = [player,_sl];
		publicVariableServer "PVAH_WriteLogReq";
	};
	admininvis =
	{
		if (isNil 'inv1') then {inv1 = 0;};
		if (inv1 == 0) then
		{
			PVAH_AdminReq = [3,player];
			publicVariableServer "PVAH_AdminReq";
			
			inv1 = 1;
			hint "Invisibility Activated";
			
			_sl = format["%1 Invisibility Activated",name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer "PVAH_WriteLogReq";
		}
		else
		{
			PVAH_AdminReq = [3,player];
			publicVariableServer "PVAH_AdminReq";
			
			inv1 = 0;
			hint "Invisibility Disabled";
			
			_sl = format["%1 Invisibility Disabled",name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer "PVAH_WriteLogReq";
		};
	};
	admin_debug =
	{
		debugMonitorX = false;
		if (isNil "admin_debug_run") then {admin_debug_run = true;} else {admin_debug_run = !admin_debug_run;};
		while {admin_debug_run} do 
		{
			_Survivors = playersNumber west;
			_temperature = round (dayz_temperatur);
			_Isinfected = ('Нет');
			if (r_player_infected) then
				{_Isinfected = ('Да');};
			_nearestCity = nearestLocations [getPos player, ['NameCityCapital', 'NameCity', 'NameVillage', 'NameLocal'], 750];
			_textCity = ('Неизвестно');
			if (count _nearestCity > 0) then
				{_textCity = text (_nearestCity select 0)};
			hintSilent parseText format	["
<t size='0.95' font='Bitstream' color='#6CB6FF' align='left'>Локация: </t><t size='0.95' font='Bitstream' color='#6CB6FF' align='right'>%1</t><br/>
<t size='0.95' font='Bitstream' color='#FFBF00' align='left'>Игроков: %2</t><t size='0.95' font='Bitstream' color='#FFBF00' align='right'>в радиусе 500м: %3</t><br/>
<t size='0.95' font='Bitstream' color='#FFBF00' align='left'>Техники:</t><t size='0.95' font='Bitstream' color='#FFBF00' align='right'>%4(%5)</t><br/>
<t size='0.95' font='Bitstream' color='#FFBF00' align='left'>Воздух: %6</t><t size='0.95' font='Bitstream' color='#FFBF00' align='right'>Море: %7</t><br/>
<t size='0.95' font='Bitstream' color='#FFBF00' align='left'>Вело-мото: %8</t><t size='0.95' font='Bitstream' color='#FFBF00' align='right'>Авто: %9</t><br/>
<t size='0.95' font='Bitstream' color='#FFBF00' align='left'>Зомби (живых/всего): </t><t size='0.95' font='Bitstream' color='#FFBF00' align='right'>%10(%11)</t><br/>
<t size='0.95' font='Bitstream' align='left'>Кровь: </t><t size='0.95' font='Bitstream' color='#FF4040' align='right'>%12</t><br/>
<t size='0.95' font='Bitstream' align='left'>Температура: </t><t size='0.95' font='Bitstream' color='#FF4040' align='right'>%13</t><br/>
<t size='0.95' font='Bitstream' align='left'>Инфицирован: </t><t size='0.95' font='Bitstream' color='#FF4040' align='right'>%14</t><br/>
<t size='0.95' font='Bitstream' align='left'>Репутация: </t><t size='0.95' font='Bitstream' color='#FF4040' align='right'>%15</t><br/>
<t size='0.95' font='Bitstream' color='#FFBF00' align='left'>GPS: %16</t><t size='0.95' font='Bitstream' color='#FFBF00' align='right'>Угол: %17</t><br/>
<t size='0.95' font='Bitstream' color='#FFBF00' align='left'>[%18]</t><t size='0.95' font='Bitstream' color='#FFBF00' align='right'>[FPS: %19]</t><br/>
<t size='0.95' font='Bitstream' color='#FFBF00' align='center'>%20</t><br/>",
							(_textCity),
							(_Survivors),
							(({isPlayer _x} count (getPos vehicle player nearEntities [['AllVehicles'], 500]))-1),
							count vehicles,
							(count([6800, 9200, 0] nearEntities [['StaticWeapon','Car','Motorcycle','Tank','Air','Ship'],25000])),
							(count([6800, 9200, 0] nearEntities [['Air'],25000])),
							(count([6800, 9200, 0] nearEntities [['Ship'],25000])),
							(count([6800, 9200, 0] nearEntities [['Motorcycle'],25000])),
							(count([6800, 9200, 0] nearEntities [['Car'],25000])),
							({alive _x} count entities 'zZombie_Base'),
							(count entities 'zZombie_Base'),
							(r_player_blood),
							(_temperature),
							(_Isinfected),
							(player getVariable['humanity', 0]),
							(mapGridPosition getPos player),
							(round(getDir player)),
							(gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'displayName')),
							(floor(diag_fps)),
							(getPosASL player)
						];
			uisleep 1;
		};
		if (!admin_debug_run) then {hintSilent parseText format ["<t size='1'font='TahomaB'align='center'>DEBUG OFF</t>"];};
	};
	adminmappos =
	{
		private ["_adminpos"];
		_adminpos = getPos player;
		hint format ["x = %1 , y = %2 , z = %3", (_adminpos select 0), (_adminpos select 1), (_adminpos select 2)];
		cutText [format["x = %1 , y = %2 , z = %3", (_adminpos select 0), (_adminpos select 1), (_adminpos select 2)], "PLAIN"];
		_sl = format["Сохранение координат относительно карты: %1, %2, %3", (_adminpos select 0), (_adminpos select 1), (_adminpos select 2)];
		PVAH_WriteLogReq = [player,_sl];
		publicVariableServer "PVAH_WriteLogReq";
	};
	adminmapposATL =
	{
		private ["_adminpos"];
		_adminpos = getPosATL player;
		hint format ["x = %1 , y = %2 , z = %3", (_adminpos select 0), (_adminpos select 1), (_adminpos select 2)];
		cutText [format["x = %1 , y = %2 , z = %3", (_adminpos select 0), (_adminpos select 1), (_adminpos select 2)], "PLAIN"];
		_sl = format["Сохранение координат относительно карты: %1, %2, %3", (_adminpos select 0), (_adminpos select 1), (_adminpos select 2)];
		PVAH_WriteLogReq = [player,_sl];
		publicVariableServer "PVAH_WriteLogReq";
	};	
	adminbuildingpos =
	{
		private ["_building","_relPos"];
		_building = nearestObject [player, "Building"];
		_relPos = _building worldToModel (getPosATL player);
		hint format ["x = %1 , y = %2 , z = %3", (_relPos select 0), (_relPos select 1), (_relPos select 2)];
		cutText [format["x = %1 , y = %2 , z = %3", (_relPos select 0), (_relPos select 1), (_relPos select 2)], "PLAIN"];
		_sl = format["Сохранение координат в здании: %1, %2, %3", (_relPos select 0), (_relPos select 1), (_relPos select 2)];
		PVAH_WriteLogReq = [player,_sl];
		publicVariableServer "PVAH_WriteLogReq";
	};	
	admin_animate1 =
	{
		{player reveal _x;} forEach (player nearObjects ['All',25]);
		_ct = cursorTarget;
		if ((!isNull _ct) && (_ct distance player < 15)) then
		{
			if ((_ct isKindOf "AllVehicles") && !(_ct isKindOf "Man")) then
			{
				if (locked _ct) then
				{
					[nil,nil,nil,[_ct,"[infiSTAR.de ADMIN-TOOL]"]] execVM "\z\addons\dayz_code\actions\unlock_veh.sqf";
				}
				else
				{
					cutText ["Vehicle is already open.", "PLAIN"];
				};
			};
			{_ct animate [_x,1];} forEach ["Open_hinge","Open_latch","Lights_1","Lights_2","Open_door","DoorR","LeftShutter","RightShutter"];
			_type = typeOf _ct;
			_alreadyPacking = _ct getVariable["packing",0];
			if ((_type in DZE_LockedStorage) && (_alreadyPacking == 0)) then
			{
				dayz_combination = _ct getVariable["CharacterID","0"];
				_ct spawn player_unlockVault;
			};
		};
	};
	admin_animate2 =
	{
		{player reveal _x;} forEach (player nearObjects ['All',25]);
		_ct = cursorTarget;
		if ((!isNull _ct) && (_ct distance player < 15)) then
		{
			if ((_ct isKindOf "AllVehicles") && !(_ct isKindOf "Man")) then
			{
				if (locked _ct) then
				{
					cutText ["Vehicle is already locked.", "PLAIN"];
				}
				else
				{
					[nil,nil,nil,_ct] execVM "\z\addons\dayz_code\actions\lock_veh.sqf";
					cutText ["[infiSTAR.de ADMIN-TOOL] used to lock vehicle.", "PLAIN"];
				};
			};
			{_ct animate [_x,0];} forEach ["Open_hinge","Open_latch","Lights_1","Lights_2","Open_door","DoorR","LeftShutter","RightShutter"];
			_type = typeOf _ct;
			_alreadyPacking = _ct getVariable["packing",0];
			if ((_type in DZE_UnLockedStorage) && (_alreadyPacking == 0)) then
			{
				dayz_combination = _ct getVariable["CharacterID","0"];
				_ct spawn player_lockVault;
			};
		};
	};
	admin_generatekey =
	{
		private ["_ct","_id","_result","_inventory","_backpack"];
		_ct = cursorTarget;
		if (!isNull _ct) then {
			if (_ct distance player > 12) exitWith {cutText [format["%1 is to far away.",typeOf _ct], "PLAIN"];};
			if !((_ct isKindOf "LandVehicle") || (_ct isKindOf "Air") || (_ct isKindOf "Ship")) exitWith {cutText [format["%1 is not a vehicle..",typeOf _ct], "PLAIN"];};
			
			_id = _ct getVariable ["CharacterID","0"];
			_id = parsenumber _id;
			if (_id == 0) exitWith {cutText [format["%1 has ID 0 - No Key possible.",typeOf _ct], "PLAIN"];};
			if ((_id > 0) && (_id <= 2500)) then {_result = format["ItemKeyGreen%1",_id];};
			if ((_id > 2500) && (_id <= 5000)) then {_result = format["ItemKeyRed%1",_id-2500];};
			if ((_id > 5000) && (_id <= 7500)) then {_result = format["ItemKeyBlue%1",_id-5000];};
			if ((_id > 7500) && (_id <= 10000)) then {_result = format["ItemKeyYellow%1",_id-7500];};
			if ((_id > 10000) && (_id <= 12500)) then {_result = format["ItemKeyBlack%1",_id-10000];};
			
			_inventory = (weapons player);
			_backpack = ((getWeaponCargo unitBackpack player) select 0);
			if (_result in (_inventory+_backpack)) then
			{
				if (_result in _inventory) then {cutText [format["Key [%1] already in your inventory!",_result], "PLAIN"];};
				if (_result in _backpack) then {cutText [format["Key [%1] already in your backpack!",_result], "PLAIN"];};
			}
			else
			{
				player addweapon _result;
				cutText [format["Key [%1] added to your inventory!",_result], "PLAIN"];
				
				_pos = getPos _ct;
				_sl = format["%1 создал ключ: %2, для %3 (CharID %4) @%5",name player,_result,typeOf _ct,_id,mapGridPosition _pos];
				PVAH_WriteLogReq = [player,_sl];
				publicVariableServer "PVAH_WriteLogReq";
			};
		};
	};
 	admin_showid =
	{
		_obj = cursortarget;
		if (!isNull _obj) then
		{
			_charID = _obj getVariable ["CharacterID","0"];
			_objID 	= _obj getVariable["ObjectID","0"];
			_objUID	= _obj getVariable["ObjectUID","0"];
			_lastUpdate = _obj getVariable ["lastUpdate",time];
			_pos	=	getPosATL _obj;
			_log1	=	format["charID: %1, objID: %2, objUID: %3, lastUpdate: %4s ago",_charID,_objID,_objUID,time - _lastUpdate];
			_log2	=	format["%1, WorldSpace: [%2,%3], @%4",typeOf _obj,getDir _obj,_pos,mapGridPosition _pos];
			
			_sl	=	format["Техника: %1. Орудия: %2. Магазины: %3", (typeOf _obj), (_obj weaponsTurret [-1]), (_obj magazinesTurret [-1])];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer "PVAH_WriteLogReq";
			
			if (isPlayer _obj) then
			{
				_log1 = format["Name: %1  PlayerUID: %2  charID: %3",_obj getVariable ['bodyName',name _obj],getPlayerUID _obj,_charID];
			};
			if (!isNil "DZE_DoorsLocked" && !isNil "DZE_LockedStorage") then
			{
				_objType = typeOf _obj;
				if (_objType in DZE_DoorsLocked || _objType in DZE_LockedStorage) then
				{
					_log1 = format["Код замка: %1, objID: %2, objUID: %3, lastUpdate: %4с назад",_charID,_objID,_objUID,time - _lastUpdate];
				};
			};
			{systemChat _x;diag_log _x;} forEach [_log1,_log2];
		};
	};
	admin_fly_up =
	{
		if (isNil "admin_tpdirection_0n") exitWith {};
		if (!admin_tpdirection_0n) exitWith {};
		_vehicle = (vehicle player);
		_vel = velocity _vehicle;
		if ((vehicle player)==player) then
		{
			_vehicle setVelocity [(_vel select 0),(_vel select 1),8];
		}
		else
		{
			_vehicle setVelocity [(_vel select 0),(_vel select 1),20];
		};
	};
	admin_tpdirection_on =
	{
		if (isNil "admin_tpdirection_0n") then {admin_tpdirection_0n = true;} else {admin_tpdirection_0n = !admin_tpdirection_0n;};
		uiSleep 0.1;
		if (admin_tpdirection_0n) then 
		{
			hint "TP infront of you ON";
			cutText ["TP infront of you ON", "PLAIN DOWN"];
			
			_sl = format["%1 TP infront of you ON",name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer "PVAH_WriteLogReq";
			if ( (getPlayerUID player) in Ultima_Low_Admins) then
				{
					_sl	=	format["Модератор: %1, включил телепорт по направлению.", name player];
					Terminal_Server	=	[player, "moderator_control", _sl];
					publicVariableServer "Terminal_Server";
				};
		}
		else
		{
			hint "TP infront of you OFF";
			cutText ["TP infront of you OFF", "PLAIN DOWN"];
			
			_sl = format["%1 TP infront of you OFF",name player];
			PVAH_WriteLogReq = [player,_sl];
			publicVariableServer "PVAH_WriteLogReq";
			if ( (getPlayerUID player) in Ultima_Low_Admins) then
				{
					_sl	=	format["Модератор: %1, выключил телепорт по направлению.", name player];
					Terminal_Server	=	[player, "moderator_control", _sl];
					publicVariableServer "Terminal_Server";
				};
		};
	};
	admin_tpdirection = 
	{
		if (isNil "admin_tpdirection_0n") exitWith {};
		if (!admin_tpdirection_0n) exitWith {};
		
		_distance = 10;
		_object = (vehicle player);
		_dir = getdir _object;
		_pos = getPosATL _object;
		if (_object isKindOf "Air") then
		{
			if (count(crew _object)>1) then 
			{ 
				_distance = 10;
				_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),((getpos _object) select 2)+100];
				if (surfaceIsWater _pos) then {_object setPosASL _pos;} else {_object setPosATL _pos;};
			} 
			else
			{
				_distance = 50;
				_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),0];
				if (surfaceIsWater _pos) then {_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),2];};
				if ((getpos _object) select 2 > 6) then {_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),((getpos _object) select 2)+0.1]};
				if (surfaceIsWater _pos) then {_object setPosASL _pos;} else {_object setPosATL _pos;};
			};
		}
		else
		{
			_distance = 10;
			_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),0];
			if (surfaceIsWater _pos) then {_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),2];};
			if ((getpos _object) select 2 > 3) then {_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),((getpos _object) select 2)];};
			if (surfaceIsWater _pos) then {_object setPosASL _pos;} else {_object setPosATL _pos;};
		};
		{player reveal _x;} forEach (player nearObjects ['All',25]);
	};
	adminaltteleport =
	{
		if (isNil "adminaltteleport_toggle") then {adminaltteleport_toggle = true;} else {adminaltteleport_toggle = !adminaltteleport_toggle;};
		if (adminaltteleport_toggle) then 
		{
			if !(('ItemGPS' in items player) || ('ItemMap' in items player)) then
			{
				_config = ["ItemGPS"];
				_isOK = [player,_config] call BIS_fnc_invAdd;
			};
			
			(findDisplay 46) displayAddEventHandler ["KeyDown", "altstate_Admin = _this select 4;false;"];
			((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["MouseButtonDown", "if (((_this select 1) == 0) && altstate_Admin) then
			{
				_pos = ((_this select 0) posScreenToWorld [_this select 2, _this select 3]);
				PVAH_AdminReq = [1, player, _pos];
				publicVariableServer 'PVAH_AdminReq';
				openMap [false, false];
				{player reveal _x;} forEach (player nearObjects ['All',25]);
			};"];
			hint "ALT TELEPORT ACTIVATED";
			cutText ["ALT TELEPORT ACTIVATED", "PLAIN"];
			if ( (getPlayerUID player) in Ultima_Low_Admins) then
				{
					_sl	=	format["Модератор: %1, включил телепорт по карте.", name player];
					Terminal_Server	=	[player, "moderator_control", _sl];
					publicVariableServer "Terminal_Server";
				};
		}
		else
		{
			((findDisplay 12) displayCtrl 51) ctrlRemoveAllEventHandlers "MouseButtonDown";
			hint "ALT TELEPORT DISABLED";
			cutText ["ALT TELEPORT DISABLED", "PLAIN"];
			if ( (getPlayerUID player) in Ultima_Low_Admins) then
				{
					_sl	=	format["Модератор: %1, выключил телепорт по карте.", name player];
					Terminal_Server	=	[player, "moderator_control", _sl];
					publicVariableServer "Terminal_Server";
				};
		};
	};
	adminbreakleg =
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminReq = [2,player,_x];
				publicVariableServer "PVAH_AdminReq";
				hint format ["Breaking %1's legs", _this select 0];
				
				_sl = format["%1 Break Legs %2",name player,_this select 0];
				PVAH_WriteLogReq = [player,_sl];
				publicVariableServer "PVAH_WriteLogReq";
			};
		} forEach playableUnits;
	};
	admin_show = {
		closeDialog 0;
		_object = cameraOn;
		if (!isNil 'spectatename') then
		{
			{
				if (name _x == spectatename) then
				{
					_object = _x;
				};
			} forEach playableUnits;
		};
		uiSleep 0.01;
		createGearDialog [(_object), 'RscDisplayGear'];
		cutText [format['Showing Gear of %1', name _object], 'PLAIN DOWN'];
	};
	remove_spec_000 = {
		vehicle player switchCamera cameraView;
		['',0,0,1,0,0,3033] spawn bis_fnc_dynamicText;
		['',0,0,1,0,0,3034] spawn bis_fnc_dynamicText;
		['',0,0,1,0,0,3035] spawn bis_fnc_dynamicText;
		['',0,0,1,0,0,3036] spawn bis_fnc_dynamicText;
		if (!isNil 'SpecateLoopActive') then
		{
			cutText ['Finished spectating.', 'PLAIN DOWN'];
			SpecateLoopActive = nil;
			[] spawn remove_spec_000;
		};
	};
	adminspec = {
		private ['_unit'];
		spectatename = _this select 0;
		cutText [format['Spectating %1 - Press F10 to exit. F9 to show Gear!',spectatename], 'PLAIN DOWN'];
		if (isNil 'SpecateLoopActive') then
		{
			SpecateLoopActive = true;
			while {!isNil 'SpecateLoopActive'} do
			{
				uiSleep 0.2;
				{
					if (name _x == spectatename) then
					{
						_unit = _x;
						_veh = (vehicle _unit);
						if (cameraOn != _veh) then {_veh switchCamera cameraView;};
					};
				} forEach playableUnits;
				if (isNull cameraOn) then {player switchCamera cameraView;};
				_log = format['%1 (%2) @%3',name _unit,getPlayerUID _unit,mapGridPosition position _unit];
				['<t align=''left'' size=''0.5'' color=''#1270ee''>'+_log+'</t>',safezoneX+0.2,safezoneY+0.4,1.5,0,0,3033] spawn bis_fnc_dynamicText;
				_log2 = format['Кровь: %1 | Репа: %2 | Банк: %3 | Депозит: %4 | Нал: %5 | Донат: %6',(_unit getVariable['USEC_BloodQty',12000]),(_unit getVariable['humanity',0]),(_unit getVariable['Ultima_Money',0]),(_unit getVariable['Ultima_Deposite',0]),(_unit getVariable['Ultima_Cash',0]), (_unit getVariable['admin_money',0])];
				['<t align=''left'' size=''0.5'' color=''#1270ee''>'+_log2+'</t>',safezoneX+0.2,safezoneY+0.44,1.5,0,0,3034] spawn bis_fnc_dynamicText;
				
				_cwep = '';
				_cammo = '';
				if (!isNull _unit) then
				{
					_wpnstate = weaponState _unit;
					_cwep = _wpnstate select 0;
					_cammo = _wpnstate select 4;
					if (_cwep == '') then
					{
						_log3 = 'unarmed';
						['<t align=''left'' size=''0.5'' color=''#1270ee''>'+_log3+'</t>',safezoneX+0.2,safezoneY+0.48,1.5,0,0,3035] spawn bis_fnc_dynamicText;
					}
					else
					{
						_log3 = format['Оружие: %1 (Аммуниция: %2)',_cwep,_cammo];
						['<t align=''left'' size=''0.5'' color=''#1270ee''>'+_log3+'</t>',safezoneX+0.2,safezoneY+0.48,1.5,0,0,3035] spawn bis_fnc_dynamicText;
					};
				};
				
				_ct = cursorTarget;
				if (!isNull _ct) then
				{
					if (getPlayerUID _ct != '') then
					{
						_wpnstate_ct = weaponState _ct;
						_cwep_ct = _wpnstate_ct select 0;
						_cammo_ct = _wpnstate_ct select 4;
						_log4 = format['%5 | Кровь: %1 | Оружие: %2 (Аммуниция: %3) | Дистанция: %4',(_ct getVariable['USEC_BloodQty',12000]),_cwep_ct,_cammo_ct,round(vehicle _unit distance _ct),name _ct];
						['<t align=''left'' size=''0.5'' color=''#1270ee''>'+_log4+'</t>',safezoneX+0.2,safezoneY+0.54,1.5,0,0,3036] spawn bis_fnc_dynamicText;
					}
					else
					{
						_log4 = format['Тип: %1 | Целостность: %2 | Дистанция: %3',typeOf _ct,(1-(damage _ct))*100,round(vehicle _unit distance _ct)];
						['<t align=''left'' size=''0.5'' color=''#1270ee''>'+_log4+'</t>',safezoneX+0.2,safezoneY+0.54,1.5,0,0,3036] spawn bis_fnc_dynamicText;
					};
				};
			};
			[] spawn remove_spec_000;
		};
	};
	adminkill =
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminReq = [4,player,_x];
				publicVariableServer "PVAH_AdminReq";
				hint format ["Killing %1", _this select 0];
				
				_sl = format["%1 Adminkilled %2",name player, _this select 0];
				PVAH_WriteLogReq = [player,_sl];
				publicVariableServer "PVAH_WriteLogReq";
				if ( (getPlayerUID player) in Ultima_Low_Admins) then
					{
						_sl	=	format["Модератор: %1, убил игрока: %2", name player, name _x];
						Terminal_Server	=	[player, "moderator_control", _sl];
						publicVariableServer "Terminal_Server";
					};
			};
		} forEach playableUnits;
	};
	adminSlap = 
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminReq = [21,player,_x];
				publicVariableServer "PVAH_AdminReq";
				hint format ["Slap %1", _this select 0];
				
				_sl = format["%1 Slaps %2",name player, _this select 0];
				PVAH_WriteLogReq = [player,_sl];
				publicVariableServer "PVAH_WriteLogReq";
			};
		} forEach playableUnits;
	};
	adminBurn =
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminReq = [111,player,_x];
				publicVariableServer "PVAH_AdminReq";
				hint format ["Burning %1 ...", _this select 0];
				
				_sl = format["%1 burning %2 ...",name player,_this select 0];
				PVAH_WriteLogReq = [player,_sl];
				publicVariableServer "PVAH_WriteLogReq";
			};
		} forEach playableUnits;
	};
	adminFDisconnect =
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminReq = [10,player,_x];
				publicVariableServer "PVAH_AdminReq";
				hint format ["Disconnect %1", _this select 0];
				
				_sl = format["%1 Disconnected %2",name player, _this select 0];
				PVAH_WriteLogReq = [player,_sl];
				publicVariableServer "PVAH_WriteLogReq";
			};
		} forEach playableUnits;
	};
	adminremovegear = 
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminReq = [8,player,_x];
				publicVariableServer "PVAH_AdminReq";
				hint format ["%1 Gear Removed", _this select 0];
				
				_sl = format["%1 Removes %2 Gear",name player, _this select 0];
				PVAH_WriteLogReq = [player,_sl];
				publicVariableServer "PVAH_WriteLogReq";
			};
		} forEach playableUnits;
	};
	adminmsg =
	{
		createDialog "RscDisplayPassword";
		ctrlSetText [1001,"BroadCast Message Plugin"];
		ctrlSetText [101,""];
		ctrlshow [1002,false];
		buttonSetAction [1,"PVAH_AdminReq = [9, player, toArray(ctrlText 101)]; publicVariableServer ""PVAH_AdminReq"";"];
	};
	admint2me =
	{
		{
			if (name _x == _this select 0) then
			{
				_pos = getPosATL player;
				_dir = getDir player;
				_distance = 5;
				_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),(_pos select 2)];
				(vehicle _x) setPosATL _pos;
				(vehicle _x) setDir _dir;
				_x setVariable['AH_WorldSpace',[0,_pos],true];
				_veh = (vehicle _x);if (_veh != _x) then {{_x setVariable['AH_WorldSpace',[0,_pos],true];} forEach (crew _veh);};
				hint format ["%1 Moved to %2",name _x, name player];
				cutText [format["%1 Moved to %2",name _x, name player], "PLAIN"];
				
				_sl = format["%1 Moved to %2",name _x, name player];
				PVAH_WriteLogReq = [player,_sl];
				publicVariableServer "PVAH_WriteLogReq";
				
				if ( (getPlayerUID player) in Ultima_Low_Admins) then
					{
						_sl	=	format["Модератор: %1, телепортировал к себе игрока: %2", name player, name _x];
						Terminal_Server	=	[player, "moderator_control", _sl];
						publicVariableServer "Terminal_Server";
					};
			};
		} forEach playableUnits;
	};
	admintele =
	{
		adminport_prevLoc =
		{
			(vehicle player) setPosATL prevLoc;
			{player reveal _x;} forEach (player nearObjects ['All',25]);
			prevLoc = nil;
		};
		fnc_adminKeybinds2 =
		{
			_keyDown = _this select 1;
			if (_keyDown == 14) then
			{
				call adminport_prevLoc;
			};
		};
		if (!isNil 'adminKeybinds2') then {(findDisplay 46) displayRemoveEventHandler ['KeyDown', adminKeybinds2];};
		adminKeybinds2 = (findDisplay 46) displayAddEventHandler ['KeyDown','_this call fnc_adminKeybinds2;false;'];
		if (isNil 'prevLoc') then
		{
			prevLoc = getPosATL player;
		};
		{
			if (name _x == _this select 0) then
			{
				_pos = getPosATL (vehicle _x);
				_dir = direction (vehicle _x);
				_distance = -1;
				if (player != vehicle player) then {_distance = -8;};
				_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),(_pos select 2)];
				(vehicle player) setPosATL _pos;
				(vehicle player) setDir _dir;
				{player reveal _x;} forEach (player nearObjects ['All',25]);
				
				hint format ['Moving to %1 - press BACKSPACE to revert teleport',name _x];
				cutText [format['Moving to %1\npress BACKSPACE to revert teleport',name _x], 'PLAIN'];
				_sl = format['%1 Moving to %2',name player,_this select 0];
				PVAH_WriteLogReq = [player,_sl];
				publicVariableServer 'PVAH_WriteLogReq';
				if ( (getPlayerUID player) in Ultima_Low_Admins) then
					{
						_sl	=	format['Модератор: %1, телепортировался к игроку: %2', name player, name _x];
						Terminal_Server	=	[player, 'moderator_control', _sl];
						publicVariableServer 'Terminal_Server';
					};
			};
		} forEach playableUnits;
	};
	adminsveh =
	{
		_dir = getdir vehicle player;
		_pos = getPos vehicle player;
		_pos = [(_pos select 0)+8*sin(_dir),(_pos select 1)+8*cos(_dir),0];
		PVAH_AdminReq = [0, player, _this select 0, _pos];
		publicVariableServer "PVAH_AdminReq";
		
		cutText [format["SPAWNED: %1 @%2",_this select 0,_pos], "PLAIN DOWN"];
	};
	adminsvehhive =
	{
		_class = _this select 0;
		_dir = getdir vehicle player;
		_pos = getPos vehicle player;
		_pos = [(_pos select 0)+8*sin(_dir),(_pos select 1)+8*cos(_dir),0];
		_worldspace = [_dir,_pos];
		
		if (isNil "MOD_EPOCH") then {MOD_EPOCH = false;};
		if (MOD_EPOCH) then
		{
			_keyColor = ["Green","Red","Blue","Yellow","Black"] call BIS_fnc_selectRandom;
			_keyNumber = (floor(random 2500)) + 1;
			_keySelected = format[("ItemKey%1%2"),_keyColor,_keyNumber];
			_isKeyOK = 	isClass(configFile >> "CfgWeapons" >> _keySelected);
			_config = _keySelected;
			_isOk = [player,_config] call BIS_fnc_invAdd;
			
			PVAH_AdminReq = [-3, player, _class, _worldspace,_keySelected];
			publicVariableServer "PVAH_AdminReq";
			cutText [format["HIVESPAWNED: %1 @%2\n%3 added to toolbelt.",_class,_worldspace,_keySelected], "PLAIN DOWN"];
		}
		else
		{
			PVAH_AdminReq = [-1, player, _class, _pos];
			publicVariableServer "PVAH_AdminReq";
			cutText [format["HIVESPAWNED: %1 @%2",_class,_worldspace], "PLAIN DOWN"];
		};
	};
	admin_fillobj =
	{
		inSub = true;
		_ctrl = -1 call getControl;
		_ctrl ctrlSetPosition [safezoneXAbs + 0.01, safezoneY + 0.07, ((0.485)*0.65) *2, (safeZoneH - 0.07 - 0.03)*0.65];
		_ctrl ctrlSetScale 1.55;
		_ctrl ctrlCommit 0;
		
		_ctrl = 1 call getControl;
		_ctrl ctrlSetFont "TahomaB";
		_ctrl ctrlSetPosition [safezoneXAbs + 0.01, (safezoneY + 0.07), (0.485)*0.65, ((safeZoneH - 0.07 - 0.03)*0.65)];
		_ctrl ctrlSetScale 1.55;
		_ctrl ctrlCommit 0;
		
		_ctrl = 2 call getControl;
		lbclear _ctrl;
		_ctrl ctrlSetFont "TahomaB";
		_ctrl ctrlSetPosition [safezoneXAbs + 0.5, (safezoneY + 0.07), (0.485)*0.65, ((safeZoneH - 0.07 - 0.03)*0.65)];
		_ctrl ctrlSetScale 1.55;
		_ctrl ctrlCommit 0;
		
		if (isNil 'GLOBAL_OBJECTTYPE') then {GLOBAL_OBJECTTYPE = '';};
		if (isNil 'infiSTAR_showOBJ') then
		{
			infiSTAR_showOBJ =
			{
				_type = lbtext [2, (lbCurSel 2)];
				if ((_type isKindOf 'Building') && (str _type != str GLOBAL_OBJECTTYPE)) then
				{
					_distance = 18;
					_dir = getdir player;
					_pos = getPos player;
					_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),0];
					
					_agent = _type createVehicleLocal _pos;
					[_agent] spawn {
						_agent = _this select 0;
						waitUntil {isNull finddisplay 3030};
						deleteVehicle _agent;
					};
					
					_agent setPosATL _pos;
					_agent setDir (_dir + 180);
					
					if (!isNil 'GLOBAL_OBJECT') then {deleteVehicle GLOBAL_OBJECT;};
					GLOBAL_OBJECT = _agent;
				};
				GLOBAL_OBJECTTYPE = _type;
			};
			_ctrl ctrlSetEventHandler ["LBSelChanged", "call infiSTAR_showOBJ;"];
		};
		_spwx = "['%1'] call adminsobj;";
		adminadd = [];
		call admin_fillsubsss;
		call admin_fillSpawnMenuFILL;
		adminadd = adminadd + ["--- Buildings","","0","0","0","0",[0,0.8,1,1]];
		adminadd = adminadd + ["  START SEARCH  (type in chat - searching stops when chat is closed)","['adminBuildings'] spawn fnc_infiSTAR_search","0","0","0","0",[0,0.8,1,1]];
		{
			adminadd = adminadd + [_x,format[_spwx,_x],"0","0","0","0",[]];
		} forEach ALL_OBJ_TO_SEARCH;
		call Admin_Fill_filler;
		call admin__FILL_MENUS;
	};
	adminsobj =
	{
		_classname = _this select 0;
		closeDialog 1;
		GLOBAL_OFFSET = getArray (configFile >> 'CfgVehicles' >> _classname >> 'offset');
		if ((count GLOBAL_OFFSET) <= 0) then {GLOBAL_OFFSET = [0,15,0];};
		_dir = getDir player;
		_pos = getPosATL player;
		_pos = [(_pos select 0) + 15 *sin(_dir),(_pos select 1) + 15 *cos(_dir),0];
		GLOBAL_OBJECT = createVehicle [_classname, _pos, [], 0, 'CAN_COLLIDE'];
		GLOBAL_OBJECT attachTo [player,GLOBAL_OFFSET];
		_key = '';
		{
			_x = _x * 10;
			if ( _x < 0 ) then { _x = _x * -10 };
			_key = _key + str(round(_x));
		} count _pos;
		_key = _key + str(round(_dir));
		GLOBAL_OBJECT setVariable ['ObjectID', '0', true];
		GLOBAL_OBJECT setVariable ['ObjectUID', _key, true];
		GLOBAL_POS = _pos;
		systemChat format['%1: constructing %2 @%3',round time,_classname,_pos];
		[] spawn fnc_HelpConstruct;
	};
	fnc_ConstructKeyBinds =
	{
		if (isNil 'GLOBAL_OBJECT') exitWith {};
		if (isNull GLOBAL_OBJECT) exitWith {};
		detach GLOBAL_OBJECT;
		private ['_key','_shift','_ctrl','_alt'];
		_key = _this select 1;
		_shift = _this select 2;
		_ctrl = _this select 3;
		_alt = _this select 4;
		if (_key == 16) then
		{
			['Left'] spawn fnc_LeftRight;
		};
		if (_key == 18) then
		{
			['Right'] spawn fnc_LeftRight;
		};
		if (_key == 200) then
		{
			['UP'] spawn fnc_UpDown;
		};
		if (_key == 201) then
		{
			['UP'] spawn fnc_UpDown;
		};
		if (_key == 208) then
		{
			['DOWN'] spawn fnc_UpDown;
		};
		if (_key == 209) then
		{
			['DOWN'] spawn fnc_UpDown;
		};
		if (_key == 209) then
		{
			['DOWN'] spawn fnc_UpDown;
		};
		if (_key == 15) then
		{
			_pos = getPosATL GLOBAL_OBJECT;
			_pos = [_pos select 0,_pos select 1,0];
			GLOBAL_OBJECT setPosATL _pos;
		};
		if (_key == 54) then
		{
			[GLOBAL_LAST_OBJECT] call adminsobj;
		};
		if (_key == 57) then
		{
			systemChat format['%1: %2 constructed @%3!',round time,typeOf GLOBAL_OBJECT,GLOBAL_POS];
			GLOBAL_LAST_OBJECT = typeOf GLOBAL_OBJECT;
			GLOBAL_OBJECT = nil;
		};
		{player reveal _x;} forEach (player nearObjects ['All',75]);
	};
	if (!isNil 'ConstructKeyBinds') then {(findDisplay 46) displayRemoveEventHandler ['KeyDown', ConstructKeyBinds];ConstructKeyBinds = nil;};
	ConstructKeyBinds = (findDisplay 46) displayAddEventHandler ['KeyDown','_this call fnc_ConstructKeyBinds;false;'];
	(findDisplay 46) displayRemoveAllEventHandlers 'MouseZChanged';
	(findDisplay 46) displayAddEventHandler ['MouseZChanged','_this call fnc_ForwardBack;false;'];
	fnc_ForwardBack =
	{
		if (isNil 'GLOBAL_OBJECT') exitWith {};
		if (isNull GLOBAL_OBJECT) exitWith {};
		_num = _this select 1;
		_num = (_num/-8);
		_dir = getDir GLOBAL_OBJECT;
		_pos = getPosATL GLOBAL_OBJECT;
		_pos = [(_pos select 0) - _num *sin(_dir),(_pos select 1) - _num *cos(_dir),(_pos select 2)];
		GLOBAL_OBJECT setPosATL _pos;
		GLOBAL_POS = getPosATL GLOBAL_OBJECT;
	};
	fnc_UpDown =
	{
		if (isNil 'GLOBAL_OBJECT') exitWith {hint 'GLOBAL_OBJECT not defined';};
		if (isNull GLOBAL_OBJECT) exitWith {hint 'GLOBAL_OBJECT is Null';};
		GLOBAL_POS = getPosATL GLOBAL_OBJECT;
		if (_this select 0 == 'UP') then
		{
			GLOBAL_POS = [GLOBAL_POS select 0,GLOBAL_POS select 1,(GLOBAL_POS select 2) + 0.05];
		};
		if (_this select 0 == 'DOWN') then
		{
			GLOBAL_POS = [GLOBAL_POS select 0,GLOBAL_POS select 1,(GLOBAL_POS select 2) - 0.05];
		};
		GLOBAL_OBJECT setPosATL GLOBAL_POS;
	};
	fnc_LeftRight =
	{
		if (isNil 'GLOBAL_OBJECT') exitWith {hint 'GLOBAL_OBJECT not defined';};
		if (isNull GLOBAL_OBJECT) exitWith {hint 'GLOBAL_OBJECT is Null';};
		GLOBAL_POS = getPosATL GLOBAL_OBJECT;
		GLOBAL_DIR = getDir GLOBAL_OBJECT;
		if (_this select 0 == 'Right') then
		{
			GLOBAL_DIR = GLOBAL_DIR + 2;
		};
		if (_this select 0 == 'Left') then
		{
			GLOBAL_DIR = GLOBAL_DIR - 2;
		};
		GLOBAL_OBJECT SETDIR GLOBAL_DIR;
		GLOBAL_OBJECT setPosATL GLOBAL_POS;
	};
	fnc_HelpConstruct = {
		["
		<t align='left' size='0.5' color='#008fff'>Mouse Wheel - Move foward/back</t><br/>
		<t align='left' size='0.5' color='#008fff'>Tab to set Object on the Ground</t><br/>
		<t align='left' size='0.5' color='#008fff'>Page Up - Move object up</t><br/>
		<t align='left' size='0.5' color='#008fff'>Page Down - Move object down</t><br/>
		<t align='left' size='0.5' color='#008fff'>Q - Rotate object left</t><br/>
		<t align='left' size='0.5' color='#008fff'>E - Rotate object right</t><br/>
		<t align='left' size='0.5' color='#008fff'>Spacebar - Place Object</t><br/>
		<t align='left' size='0.5' color='#008fff'>Insert - Save Object</t>
		",0,safezoneY,60,0,0,3016] spawn bis_fnc_dynamicText;
	};
	adminUncon =
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminReq = [11,player,_x];
				publicVariableServer "PVAH_AdminReq";
				hint format ["Knocked %1 out...", _this select 0];
				
				_sl = format["%1 Knocks %2 out...",name player,_this select 0];
				PVAH_WriteLogReq = [player,_sl];
				publicVariableServer "PVAH_WriteLogReq";
				if ( (getPlayerUID player) in Ultima_Low_Admins) then
					{
						_sl	=	format["Модератор: %1, отправил в нокаут игрока: %2", name player, name _x];
						Terminal_Server	=	[player, "moderator_control", _sl];
						publicVariableServer "Terminal_Server";
					};
			};
		} forEach playableUnits;
	};
	adminFreeze =
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminReq = [112,player,_x];
				publicVariableServer "PVAH_AdminReq";
				hint format ["Freezing %1", _this select 0];
				
				_sl = format["%1 Froze %2",name player,_this select 0];
				PVAH_WriteLogReq = [player,_sl];
				publicVariableServer "PVAH_WriteLogReq";
				if ( (getPlayerUID player) in Ultima_Low_Admins) then
					{
						_sl	=	format["Модератор: %1, заморозил игрока: %2", name player, name _x];
						Terminal_Server	=	[player, "moderator_control", _sl];
						publicVariableServer "Terminal_Server";
					};
			};
		} forEach playableUnits;
	};
	adminUnFreeze =
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminReq = [113,player,_x];
				publicVariableServer "PVAH_AdminReq";
				hint format ["Un-Freezing %1", _this select 0];
				
				_sl = format["%1 Un-Froze %2",name player,_this select 0];
				PVAH_WriteLogReq = [player,_sl];
				publicVariableServer "PVAH_WriteLogReq";
				if ( (getPlayerUID player) in Ultima_Low_Admins) then
					{
						_sl	=	format["Модератор: %1, разморозил игрока: %2", name player, name _x];
						Terminal_Server	=	[player, "moderator_control", _sl];
						publicVariableServer "Terminal_Server";
					};
			};
		} forEach playableUnits;
	};
	adminHitVeh =
	{
		_name = _this select 0;
		if (_name == "") then {_name = name player;};
		{
			if (name _x == _name) then
			{
				_vehicle = vehicle _x;
				_hitpoint = 'HitVRotor';
				
				PVAH_AdminReq = [110,player,_x,_hitpoint];
				publicVariableServer 'PVAH_AdminReq';
				hint format ['Hit-V-Rotor of %1(%2)',_name,typeOf _vehicle];
				
				_sl = format['%1 Hit-V-Rotor %2(%3)',name player,_name,typeOf _vehicle];
				PVAH_WriteLogReq = [player,_sl];
				publicVariableServer 'PVAH_WriteLogReq';
				if ( (getPlayerUID player) in Ultima_Low_Admins) then
					{
						_sl	=	format['Модератор: %1, нанес урон по ротору: %2', name player, name _x];
						Terminal_Server	=	[player, 'moderator_control', _sl];
						publicVariableServer 'Terminal_Server';
					};
			};
		} forEach playableUnits;
	};
	admin_del_bxs =
	{
		PVAH_AdminReq = [14,player];
		publicVariableServer "PVAH_AdminReq";
		
		hint "deleting boxes..";
		
		_sl = format["%1 deleted boxes",name player];
		PVAH_WriteLogReq = [player,_sl];
		publicVariableServer "PVAH_WriteLogReq";
	};
	adminDrug = 
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminReq = [15,player,_x];
				publicVariableServer "PVAH_AdminReq";
				hint format ["Drugging %1...", _this select 0];
				
				_sl = format["%1 drugged %2",name player,_this select 0];
				PVAH_WriteLogReq = [player,_sl];
				publicVariableServer "PVAH_WriteLogReq";
			};
		} forEach playableUnits;
	};
	adminSuicide =
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminReq = [22,player,_x];
				publicVariableServer "PVAH_AdminReq";
				hint format ["Suiciding %1", _this select 0];
				
				_sl = format["%1 Suiciding %2",name player,_this select 0];
				PVAH_WriteLogReq = [player,_sl];
				publicVariableServer "PVAH_WriteLogReq";
			};
		} forEach playableUnits;
	};
	adminClearBan =
	{
		PVAH_AdminReq = [16,player];
		publicVariableServer "PVAH_AdminReq";
		hint "Bans cleared!";
		
		_sl = format["%1 cleared Bans",name player];
		PVAH_WriteLogReq = [player,_sl];
		publicVariableServer "PVAH_WriteLogReq";
	};
	adminKick =
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminReq = [17,player,_x];
				publicVariableServer "PVAH_AdminReq";
				hint format ["Kicked %1...", _this select 0];
				
				_sl = format["%1 Kicked %2",name player,_this select 0];
				PVAH_WriteLogReq = [player,_sl];
				publicVariableServer "PVAH_WriteLogReq";
				if ( (getPlayerUID player) in Ultima_Low_Admins) then
					{
						_sl	=	format["Модератор: %1, кикнул игрока: %2", name player, name _x];
						Terminal_Server	=	[player, "moderator_control", _sl];
						publicVariableServer "Terminal_Server";
					};
			};
		} forEach playableUnits;
	};	
	adminbanTemp =
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminReq = [18,player,_x,1];
				publicVariableServer "PVAH_AdminReq";
				hint format ["TempBanned %1...", _this select 0];
				
				_sl = format["%1 TempBanned %2",name player,_this select 0];
				PVAH_WriteLogReq = [player,_sl];
				publicVariableServer "PVAH_WriteLogReq";
				if ( (getPlayerUID player) in Ultima_Low_Admins) then
					{
						_sl	=	format["Модератор: %1, выдал временный бан игроку: %2", name player, name _x];
						Terminal_Server	=	[player, "moderator_control", _sl];
						publicVariableServer "Terminal_Server";
					};
			};
		} forEach playableUnits;
	};
	adminBanPerm =
	{
		{
			if (name _x == _this select 0) then
			{
				PVAH_AdminReq = [18,player,_x,2];
				publicVariableServer "PVAH_AdminReq";
				hint format ["%1 забанен.", _this select 0];
				
				_sl = format["%1 забанил: %2",name player,_this select 0];
				PVAH_WriteLogReq = [player,_sl];
				publicVariableServer "PVAH_WriteLogReq";
				if ( (getPlayerUID player) in Ultima_Low_Admins) then
					{
						_sl	=	format["Модератор: %1, забанил игрока: %2", name player, name _x];
						Terminal_Server	=	[player, "moderator_control", _sl];
						publicVariableServer "Terminal_Server";
					};
			};
		} forEach playableUnits;
	};
	adminUnBan =
	{
		_uid = _this select 0;
		_name = _this select 1;
		
		PVAH_AdminReq = [182,player,_uid,_name];
		publicVariableServer "PVAH_AdminReq";
		hint format ["%1 (%2) разбанен",_name,_uid];
		
		_sl = format["%1 разбанил: %2 (%3)",name player,_name,_uid];
		PVAH_WriteLogReq = [player,_sl];
		publicVariableServer "PVAH_WriteLogReq";
	};
	adminPlayerDeaths =
	{
		if (isNil "dayzPlayerDeathsResult") then {dayzPlayerDeathsResult = [];};
		"dayzPlayerDeathsResult" addpublicVariableEventhandler
		{
			if ((count dayzPlayerDeathsResult) > 0) then
			{
				call EpochDeathBoardLoad;
			}
			else
			{
				cutText ["Нет смертей.", "PLAIN DOWN"];
			};
		};
		if (isNil "PVDZE_plr_DeathBResult") then {PVDZE_plr_DeathBResult = [];};
		"PVDZE_plr_DeathBResult" addpublicVariableEventhandler
		{
			if ((count PVDZE_plr_DeathBResult) > 0) then
			{
				call EpochDeathBoardLoad;
			}
			else
			{
				cutText ["Нет смертей.", "PLAIN DOWN"];
			};
		};
		PVAH_AdminReq = [23,player];
		publicVariableServer "PVAH_AdminReq";
		hint "Loading EPOCH-DEATHBOARD..";
	};
	admin_removePlotPoles =
	{
		private ['_objs'];
		_objs = (nearestObjects [player, ['Plastic_Pole_EP1_DZ'], 30]);
		if (count _objs > 0) then
		{
			{
				PVAH_AdminReq = [-2,player,_x];
				publicVariableServer 'PVAH_AdminReq';
			} forEach _objs;
			_log = format['<АнтиЧит> %1 баз, удалено в радиусе 30м',count _objs];
			systemChat _log;
			hint _log;
		}
		else
		{
			_log = '<АнтиЧит> Базы в радусе 30м не найдены';
			systemChat _log;
			hint _log;
		};
		
		_sl = format['%1 удалил базы в @%2',name player,mapGridPosition player];
		PVAH_WriteLogReq = [player,_sl];
		publicVariableServer 'PVAH_WriteLogReq';
	};
	admin_removeNets =
	{
		private ['_objs'];
		_objs = (nearestObjects [player, ['DesertLargeCamoNet_DZ','ForestLargeCamoNet_DZ','DesertCamoNet_DZ','ForestCamoNet_DZ'], 30]);
		if (count _objs > 0) then
		{
			{
				PVAH_AdminReq = [-2,player,_x];
				publicVariableServer 'PVAH_AdminReq';
			} forEach _objs;
			_log = format['<АнтиЧит> Удалено %1 сетей в радиусе 30м',count _objs];
			systemChat _log;
			hint _log;
		}
		else
		{
			_log = '<АнтиЧит>   Сети в радиусе 30м не найдены.';
			systemChat _log;
			hint _log;
		};
		
		_sl = format['%1 удалил сети',name player];
		PVAH_WriteLogReq = [player,_sl];
		publicVariableServer 'PVAH_WriteLogReq';
	};
	admin_save_target =
	{
		SAVE_THIS = nil;
		_obj = cursorTarget;
		if (isNull _obj) exitWith {hint "Отсутствует цель";cutText ["Отсутствует цель", "PLAIN"];};
		adminSaveNOW = {
			if (!isNull SAVE_THIS) then
			{
				systemChat format ["<АнтиЧит>:  %1  сохранено в [%2,%3]",typeOf SAVE_THIS,getDir SAVE_THIS,getPosATL SAVE_THIS];
				PVAH_AdminReq = [26,player,SAVE_THIS];
				publicVariableServer "PVAH_AdminReq";
			};
		};
		if (!isNull _obj) then
		{
			SAVE_THIS = nil;
			SAVE_THIS = _obj;
			systemChat format ["<АнтиЧит>: Сохранить:  %1  в [%2,%3]?",typeOf SAVE_THIS,getDir SAVE_THIS,getPosATL SAVE_THIS];
			uiSleep 0.1;
			adminSaveX = 
			[
				["",true],
				[(format ["%1-[%2,%3]",typeOf SAVE_THIS,getDir SAVE_THIS,getPosATL SAVE_THIS]), [-1], "", -5, [["expression", ""]], "1", "0"],
				["Сохранить", [2], "", -5, [["expression", "[] spawn adminSaveNOW"]], "1", "1"],
				["Выход", [3], "", -5, [["expression", ""]], "1", "1"]
			];
			showCommandingMenu "#USER:adminSaveX";
		};
	};
	adminDelete =
	{
		DELETE_THIS = nil;
		_delete = cursorTarget;
		if (isNull _delete) exitWith {hint "Отсутствует цель";cutText ["Отсутствует цель", "PLAIN"];};
		adminDeleteX = 
		[
			["",true],
			[(format ["%1",typeOf DELETE_THIS]), [-1], "", -5, [["expression", ""]], "1", "0"],
			["Удалить", [2], "", -5, [["expression", "[] spawn adminDeleteNOW"]], "1", "1"],
			["Выход", [3], "", -5, [["expression", ""]], "1", "1"]
		];
		adminDeleteNOW = {
			if (!isNull DELETE_THIS) then
			{
				systemChat format ["<АнтиЧит>:  %1  УДАЛЕН",typeOf DELETE_THIS];
				PVAH_AdminReq = [-2,player,DELETE_THIS];
				publicVariableServer "PVAH_AdminReq";
			};
		};
		if (!isNull _delete) then
		{
			DELETE_THIS = nil;
			DELETE_THIS = _delete;
			systemChat format ["<АнтиЧит>: УДАЛИТЬ:  %1  ?",typeOf DELETE_THIS];
			showCommandingMenu "#USER:adminDeleteX";
		};
	};
	fnc_basedestruction =
	{
		private ["_option","_location","_object","_objects","_objectClasses","_i","_dir","_objectID","_objectUID"];
		if (isNil "BD_radius") then { BD_radius = 10; };
		_option = _this select 0;
		switch (_option) do {
			case "center": {
				BD_center = getPos player;
				_log = format["Установлен центр: %1", BD_center];
				cutText [_log, "PLAIN DOWN"];
				systemChat _log;
				if (!isNil "BD_centerSign") then
				{
					deleteVehicle BD_centerSign;
					BD_centerSign = nil;
				};
				BD_centerSign = "Sign_arrow_down_large_EP1" createVehicleLocal BD_center;BD_centerSign setPos BD_center;
			};
			case "radius": {
				if (isNil "BD_center") then
				{
					_log = "Не установлен центр";
					cutText [_log, "PLAIN DOWN"];
					systemChat _log;
				}
				else
				{
					BD_radius = player distance BD_center;
					_objects = call fnc_findObjects;
					_cnt = (count _objects)-1;
					_log = format["Установлен радиус: %1м. Найдено: %2 объектов.", BD_radius,_cnt];
					cutText [_log, "PLAIN DOWN"];
					systemChat _log;
				};
			};
			case "dome": {
				if (isNil "BD_center") then
				{
					_log = "Не установлен центр";
					cutText [_log, "PLAIN DOWN"];
					systemChat _log;
				}
				else
				{
					_objects = [];
					_object = "Plastic_Pole_EP1_DZ" createVehicleLocal BD_center;_object setPos BD_center;
					_objects set [0, _object];
					for "_i" from 0 to 360 step (270 / BD_radius) do
					{
						_location = [(BD_center select 0) + ((cos _i) * BD_radius), (BD_center select 1) + ((sin _i) * BD_radius), BD_center select 2];
						_object = "WoodLargeWall_Preview_DZ" createVehicleLocal _location;_object setPos _location;
						_dir = ((BD_center select 0) - (_location select 0)) atan2 ((BD_center select 1) - (_location select 1)); 
						_object setDir _dir;
						_objects set [count _objects, _object];
					};
					_location = [BD_center select 0, BD_center select 1, (BD_center select 2) + BD_radius];
					_object = "WoodFloor_Preview_DZ" createVehicleLocal _location;_object setPos _location;
					_objects set [count _objects, _object];
					uiSleep 30;
					{
						deleteVehicle _x;
					} forEach _objects;
				};
			};
			case "destroy": {
				if (isNil "BD_center") then
				{
					_log = "Не установлен центр";
					cutText [_log, "PLAIN DOWN"];
					systemChat _log;
				}
				else
				{
					if (BD_radius > 150) then
					{
						_log = format["Слишком большой радиус уничтожения (радиус %1 > 100)", BD_radius];
						cutText [_log, "PLAIN DOWN"];
						systemChat _log;
					}
					else
					{
						_objects = call fnc_findObjects;
						PVAH_AdminReq = [-2,player,_objects];
						publicVariableServer "PVAH_AdminReq";
						_log = format["%1 объектов уничтожено",(count _objects)-1];
						cutText [_log, "PLAIN DOWN"];
						systemChat _log;
					};
				};
			};
		};
	};
	fnc_findObjects =
	{
		_objectClasses =
		[
			"Sign_arrow_down_large_EP1","TentStorage","TentStorageDomed","TentStorageDomed2","Hedgehog_DZ",
			"Sandbag1_DZ","TrapBear","Fort_RazorWire","WoodGate_DZ","Land_HBarrier1_DZ","Land_HBarrier3_DZ",
			"Fence_corrugated_DZ","M240Nest_DZ","CanvasHut_DZ","ParkBench_DZ","MetalGate_DZ","OutHouse_DZ",
			"Wooden_shed_DZ","WoodShack_DZ","StorageShed_DZ","Plastic_Pole_EP1_DZ","Generator_DZ","StickFence_DZ",
			"LightPole_DZ","FuelPump_DZ","DesertCamoNet_DZ","ForestCamoNet_DZ","DesertLargeCamoNet_DZ",
			"ForestLargeCamoNet_DZ","SandNest_DZ","DeerStand_DZ","MetalPanel_DZ","WorkBench_DZ","WoodFloor_DZ",
			"WoodLargeWall_DZ","WoodLargeWallDoor_DZ","WoodLargeWallWin_DZ","WoodSmallWall_DZ","WoodSmallWallWin_DZ",
			"WoodSmallWallDoor_DZ","WoodFloorHalf_DZ","WoodFloorQuarter_DZ","WoodStairs_DZ","WoodStairsSans_DZ",
			"WoodSmallWallThird_DZ","WoodLadder_DZ","Land_DZE_GarageWoodDoor","Land_DZE_LargeWoodDoor","Land_DZE_WoodDoor",
			"Land_DZE_GarageWoodDoorLocked","Land_DZE_LargeWoodDoorLocked","Land_DZE_WoodDoorLocked","CinderWallHalf_DZ",
			"CinderWall_DZ","CinderWallDoorway_DZ","CinderWallDoor_DZ","CinderWallDoorLocked_DZ","CinderWallSmallDoorway_DZ",
			"CinderWallDoorSmall_DZ","CinderWallDoorSmallLocked_DZ","MetalFloor_DZ","WoodRamp_DZ","FireBarrel_DZ","WoodStairsRails_DZ"
		];
		if (BD_vehicles) then
		{
			_objectClasses = _objectClasses + ["LandVehicle","Air","Ship"];
		};
		_objects = nearestObjects [BD_center, _objectClasses, BD_radius];
		_objects
	};
	admin_BaseDestructionMenu =
	{
		if (isNil "BD_vehicles") then {BD_vehicles = true;};
		BaseDestructionMenu = 
		[
			["BaseDestruction",true],
				["Установить центр", [2], "", -5, [["expression", '["center"] spawn fnc_basedestruction']], "1", "1"],
				["Установить радиус", [3], "", -5, [["expression", '["radius"] spawn fnc_basedestruction']], "1", "1"],
				["Отобразить границы", [4], "", -5, [["expression", '["dome"] spawn fnc_basedestruction']], "1", "1"],
				[format["Включая технику (%1)",BD_vehicles], [5], "", -5, [["expression", "BD_vehicles = !BD_vehicles;"]], "1", "1"],
				["!-Уничтожить объекты-!", [6], "", -5, [["expression", '["destroy"] spawn fnc_basedestruction']], "1", "1"],
			["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Выход", [13], "", -3, [["expression", ""]], "1", "1"]
		];
		showCommandingMenu "#USER:BaseDestructionMenu";
	};
	if (isNil 'admin_announce') then {admin_announce = true;};
	fnc_showFoundSearch =
	{
		_foundarray = _this select 0;
		_what = _this select 1;
		if (_what == "weaponmags") then
		{
			inSub = true;
			isWep__i_n_f_i_S_T_A_R = true;
			isMag__i_n_f_i_S_T_A_R = true;
			_ctrl = 2 call getControl;
			lbclear _ctrl;
			_ctrl ctrlSetFont "TahomaB";
			_spwx = "['%1'] spawn adminweapon;";
			_ammo = "[] spawn ammo_current_wpn_admin;";
			_spAx = "['%1'] spawn adminmagazino;";
			adminadd = [];
			call admin_fillsubsss;
			call admin_fillSpawnMenuFILL;
			adminadd = adminadd + ["--- Боеприпасы к текущему оружию",format[_ammo],"0","0","0","0",[0,0.8,1,1]];
			adminadd = adminadd + ["  Старт поиска  (пишите в чат - поиск будет остановлен при закрытии чата)","['weaponmags'] spawn fnc_infiSTAR_search","0","0","0","0",[0,0.8,1,1]];
			{
				adminadd = adminadd + [_x,format[_spwx,_x],"0","0","0","0",[]];
				_mags = getArray (configFile >> 'CfgWeapons' >> _x >> 'magazines');
				{
					adminadd = adminadd + [_x,format[_spAx,_x],"0","0","0","0",[0.8,0.8,0,1]];
				} forEach _mags;
			} forEach _foundarray;
			call Admin_Fill_filler;
			call admin__FILL_MENUS;
		};
		if (_what == "weapon") then
		{
			inSub = true;
			isWep__i_n_f_i_S_T_A_R = true;
			_ctrl = 2 call getControl;
			lbclear _ctrl;
			_ctrl ctrlSetFont "TahomaB";
			_spwx = "['%1'] spawn adminweapon;";
			_ammo = "[] spawn ammo_current_wpn_admin;";
			adminadd = [];
			call admin_fillsubsss;
			call admin_fillSpawnMenuFILL;
			adminadd = adminadd + ["--- Боеприпасы к текущему оружию",format[_ammo],"0","0","0","0",[0,0.8,1,1]];
			adminadd = adminadd + ["  Старт поиска  (пишите в чат - поиск будет остановлен при закрытии чата)","['weapon'] spawn fnc_infiSTAR_search","0","0","0","0",[0,0.8,1,1]];
			{
				adminadd = adminadd + [_x,format[_spwx,_x],"0","0","0","0",[]];
			} forEach _foundarray;
			call Admin_Fill_filler;
			call admin__FILL_MENUS;
		};
		if (_what == "magazine") then
		{
			inSub = true;
			isMag__i_n_f_i_S_T_A_R = true;
			_ctrl = 2 call getControl;
			lbclear _ctrl;
			_ctrl ctrlSetFont "TahomaB";
			_spwx = "['%1'] spawn adminmagazino;";
			_ammo = "[] spawn ammo_current_wpn_admin;";
			adminadd = [];
			call admin_fillsubsss;
			call admin_fillSpawnMenuFILL;
			adminadd = adminadd + ["--- Боеприпасы к текущему оружию",format[_ammo],"0","0","0","0",[0,0.8,1,1]];
			adminadd = adminadd + ["  Старт поиска  (пишите в чат - поиск будет остановлен при закрытии чата)","['magazine'] spawn fnc_infiSTAR_search","0","0","0","0",[0,0.8,1,1]];
			{
				adminadd = adminadd + [_x,format[_spwx,_x],"0","0","0","0",[]];
			} forEach _foundarray;
			call Admin_Fill_filler;
			call admin__FILL_MENUS;
		};
		if (_what == "adminSNV") then
		{
			inSub = true;
			isVehicle__i_n_f_i_S_T_A_R = true;
			_ctrl = 2 call getControl;
			_ctrl ctrlSetFont "TahomaB";
			lbclear _ctrl;
			_spwx = "['%1'] call adminsveh;";
			
			adminadd = [];
			call admin_fillsubsss;
			call admin_fillSpawnMenuFILL;
			adminadd = adminadd + ["--- Создание","","0","0","0","0",[0,0.8,1,1]];
			adminadd = adminadd + ["  Старт поиска  (пишите в чат - поиск будет остановлен при закрытии чата)","['adminSNV'] spawn fnc_infiSTAR_search","0","0","0","0",[0,0.8,1,1]];
			{
				adminadd = adminadd + [_x,format[_spwx,_x],"0","0","0","0",[]];
			} forEach _foundarray;
			call Admin_Fill_filler;
			call admin__FILL_MENUS;
		};
		if (_what == "adminSHV") then
		{
			inSub = true;
			isVehicle__i_n_f_i_S_T_A_R = true;
			_ctrl = 2 call getControl;
			_ctrl ctrlSetFont "TahomaB";
			lbclear _ctrl;
			_spwx = "['%1'] call adminsvehhive;";
			adminadd = [];
			call admin_fillsubsss;
			call admin_fillSpawnMenuFILL;
			adminadd = adminadd + ["--- Создание с записью в БД","","0","0","0","0",[0,0.8,1,1]];
			adminadd = adminadd + ["  Старт поиска  (пишите в чат - поиск будет остановлен при закрытии чата)","['adminSHV'] spawn fnc_infiSTAR_search","0","0","0","0",[0,0.8,1,1]];
			{
				adminadd = adminadd + [_x,format[_spwx,_x],"0","0","0","0",[]];
			} forEach _foundarray;
			call Admin_Fill_filler;
			call admin__FILL_MENUS;
		};
		if (_what == "adminBuildings") then
		{
			inSub = true;
			_ctrl = 2 call getControl;
			lbclear _ctrl;
			_ctrl ctrlSetFont "TahomaB";
			_spwx = "['%1'] call adminsobj;";
			adminadd = [];
			call admin_fillsubsss;
			call admin_fillSpawnMenuFILL;
			adminadd = adminadd + ["--- Постройки","","0","0","0","0",[0,0.8,1,1]];
			adminadd = adminadd + ["  Старт поиска  (пишите в чат - поиск будет остановлен при закрытии чата)","['adminBuildings'] spawn fnc_infiSTAR_search","0","0","0","0",[0,0.8,1,1]];
			{
				adminadd = adminadd + [_x,format[_spwx,_x],"0","0","0","0",[]];
			} forEach _foundarray;
			call Admin_Fill_filler;
			call admin__FILL_MENUS;
		};
	};
	KK_fnc_inString =
	{
		private ["_needle","_haystack","_needleLen","_hay","_found"];
		_needle = [_this, 0, "", [""]] call BIS_fnc_param;
		_haystack = toArray ([_this, 1, "", [""]] call BIS_fnc_param);
		_needleLen = count toArray _needle;
		_hay = +_haystack;
		_hay resize _needleLen;
		_found = false;
		for "_i" from _needleLen to count _haystack do
		{
			if (toString _hay == _needle) exitWith {_found = true};
			_hay set [_needleLen, _haystack select _i];
			_hay set [0, "x"];
			_hay = _hay - ["x"]
		};
		_found
	};
	fnc_infiSTAR_search =
	{
		_what = _this select 0;
		_category = '[UNDEFINED VARIABLE]';
		if (_what == 'weapon') then {ALL_TO_SEARCH = ALL_WEPS_TO_SEARCH;_category = 'weapons';};
		if (_what == 'magazine') then {ALL_TO_SEARCH = ALL_MAGS_TO_SEARCH;_category = 'magazines';};
		if (_what == 'adminSNV') then {ALL_TO_SEARCH = ALL_VEHS_TO_SEARCH;_category = 'vehicles';};
		if (_what == 'adminSHV') then {ALL_TO_SEARCH = ALL_VEHS_TO_SEARCH;_category = 'vehicles';};
		if (_what == 'adminBuildings') then {ALL_TO_SEARCH = ALL_OBJ_TO_SEARCH;_category = 'Buildings';};
		if (_what == 'weaponmags') then {ALL_TO_SEARCH = ALL_WEPS_TO_SEARCH;_category = 'weapons & mags';};
		if (!isNil 'fnc_searching_running') exitWith {systemChat format["еще ищется [%1] - открыть/закрыть чат для остановки.",_category];};
		fnc_searching_running = true;
		
		if (isNull (finddisplay 24)) then
		{
			systemChat format["Откройте чат и вводите символы для поиска [%1]",_category];
		}
		else
		{
			systemChat format["вводите символы для поиска [%1]",_category];
		};
		
		waitUntil {!isNull (finddisplay 24)};
		disableSerialization;
		_foundarray = [];
		while {1 == 1} do
		{
			_ctrl  = ((findDisplay 24) displayCtrl 101);
			_text  = ctrlText _ctrl;
			_array = toArray _text;
			_num = count _array;
			if (_num < 1) then {_foundarray = [];};
			if (_num > 1) then
			{
				for "_i" from 0 to ((count ALL_TO_SEARCH)-1) do
				{
					if ((isNull finddisplay 24)||(isNull finddisplay 3030)) exitWith {};
					_instack = ALL_TO_SEARCH select _i;
					_found = [_text,_instack] call KK_fnc_inString;
					if ((_found) && !(_instack in _foundarray)) then
					{
						_foundarray = _foundarray + [_instack];
						[_foundarray,_what] call fnc_showFoundSearch;
					};
				};
			};
			if ((isNull finddisplay 24)||(isNull finddisplay 3030)) exitWith {};
		};
		fnc_searching_running = nil;
		systemChat format["поиск %1 остановлен",_category];
		[_foundarray,_what] call fnc_showFoundSearch;
	};
	admin_do_this_first = {
		if (isNil "ALL_WEPS_TO_SEARCH") then
		{
			ALL_WEPS_TO_SEARCH = [];
			_CfgWeapons = configFile >> "CfgWeapons";
			for "_i" from 0 to (count _CfgWeapons)-1 do
			{
				_weapon = _CfgWeapons select _i;
				if (isClass _weapon) then
				{
					_wpn_type = configName _weapon;
					_plx = toArray _wpn_type;
					_plx resize 7;
					_plx;
					_plx = toString _plx;
					if (((_plx != "ItemKey") || (_wpn_type == "ItemKeyKit")) && (_wpn_type != "MineE")) then
					{
						if (((getNumber (_weapon >> "scope") == 0) || (getNumber (_weapon >> "scope") == 2)) && (getText (_weapon >> "picture") != "")) then
						{
							if !(_wpn_type in ALL_WEPS_TO_SEARCH) then
							{
								ALL_WEPS_TO_SEARCH = ALL_WEPS_TO_SEARCH + [_wpn_type];
							};
						};
					};
				};
			};
		};
		if (isNil "ALL_MAGS_TO_SEARCH") then
		{
			ALL_MAGS_TO_SEARCH = [];
			_CfgWeapons = configFile >> "CfgMagazines";
			for "_i" from 0 to (count _CfgWeapons)-1 do
			{
				_weapon = _CfgWeapons select _i;
				if (isClass _weapon) then
				{
					_wpn_type = configName(_weapon);
					if (((getNumber (_weapon >> "scope") == 0) || (getNumber (_weapon >> "scope") == 2)) && (getText (_weapon >> "picture") != "") && !(_wpn_type == "AngelCookies")) then
					{
						if !(_wpn_type in ALL_MAGS_TO_SEARCH) then
						{
							ALL_MAGS_TO_SEARCH = ALL_MAGS_TO_SEARCH + [_wpn_type];
						};
					};
				};
			};
		};
		if (isNil "ALL_VEHS_TO_SEARCH") then
		{
			ALL_VEHS_TO_SEARCH = [];
			_cfgvehicles = configFile >> "cfgVehicles";
			for "_j" from 0 to (count _cfgvehicles)-1 do
			{
				_vehicle = _cfgvehicles select _j;
				if (isClass _vehicle) then
				{
					_veh_type = configName _vehicle;
					if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && ((_veh_type isKindOf "Air") || (_veh_type isKindOf "LandVehicle") || (_veh_type isKindOf "Ship"))) then
					{
						if !((_veh_type isKindOf "ParachuteBase") || (_veh_type isKindOf "BIS_Steerable_Parachute")) then
						{
							ALL_VEHS_TO_SEARCH = ALL_VEHS_TO_SEARCH + [_veh_type];
						};
					};
				};
			};
		};
		if (isNil "ALL_OBJ_TO_SEARCH") then
		{
			ALL_OBJ_TO_SEARCH = [];
			_cfgvehicles = configFile >> "cfgVehicles";
			for "_j" from 0 to (count _cfgvehicles)-1 do
			{
				_vehicle = _cfgvehicles select _j;
				if (isClass _vehicle) then
				{
					_veh_type = configName _vehicle;
					if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && ((_veh_type isKindOf "Building") || (_veh_type isKindOf "House"))) then
					{
						ALL_OBJ_TO_SEARCH = ALL_OBJ_TO_SEARCH + [_veh_type];
					};
				};
			};
		};
	};
	if (isNil 'admin_dofirst_state') then
	{
		admin_dofirst_state = true;
		[] spawn admin_do_this_first;
	};
};
diag_log ("[АнтиЧит]: Добавление публичных событий");
[] spawn {
	fnc_infiSTAR_Serverkick = {
		_clientUID = _this select 0;_clientName = _this select 1;
		_do = format ["if ((getPlayerUID player == '%1') || (name player == '%2')) then
		{
			[] spawn {
				uiSleep 0.1;
				for '_r' from 0 to 101 do {(findDisplay _r) closeDisplay 0;};
			};
		};",_clientUID,_clientName];
		_unit2 = createAgent ["Rabbit", [4000,4000,0], [], 0, "FORM"];_unit2 setVehicleInit _do;processInitCommands;deleteVehicle _unit2;
		
		_playerObj = objNull;
		if (count _this > 2) then
		{
			_playerObj = _this select 2;
		};
		if (isNull _playerObj) then
		{
			{
				if (getPlayerUID _x == _clientUID) exitWith
				{
					_playerObj = _x;
				};
			} forEach playableUnits;
		};
		if (isNull _playerObj) then
		{
			_playerObj = call compile format["PVDZE_player%1",_clientUID];
			if (isNil "_playerObj") then {_playerObj=objNull;};
		};
		if (!isNull _playerObj) then
		{
			_mgp = mapGridPosition position _playerObj;
			_log = format ["[СЕРВЕР]: кик %1(%2) @%3",_clientName,_clientUID,_mgp];
			diag_log ("[АнтиЧит]: [Журнал]: "+_log);
			[_playerObj] spawn {
				_playerObj = _this select 0;
				uiSleep 3;
				if (!isNull _playerObj) then {_playerObj setDamage 1;};
			};
		};
	};
	fnc_WriteLogReq = {
		_array = _this select 1;
		_playerObj = _array select 0;
		_state = false;if (typeName _playerObj == 'OBJECT') then {if (!isNull _playerObj) then	{_puid = getPlayerUID _playerObj;if (_puid in PV_DevUIDs) then {_state = true;};};};if (_state) exitWith {};
		diag_log format['[АнтиЧит]: [Публичный журнал]: %1',_array];
		_stime = 0;
		if(serverTime > 36000)then{_stime = time;}else{_stime = serverTime;};
		_hours = (_stime/60/60);
		_hours = toArray (str _hours);
		_hours resize 1;
		_hours = toString _hours;
		_hours = compile _hours;
		_hours = call  _hours;
		_minutes = floor(_stime/60);
		_minutes2 = ((_minutes - (_hours*60)) min 60) max 0;if (_minutes2 < 10) then {_minutes2 = format ['0%1',_minutes2];};
		if (isNil 'PV_writeAdmin_log_ARRAY') then {PV_writeAdmin_log_ARRAY = [];};
		_log = format ['%1ч %2мин | %3',_hours,_minutes2,_array select 1];
		PV_writeAdmin_log_ARRAY = PV_writeAdmin_log_ARRAY + [_log];
		publicVariable 'PV_writeAdmin_log_ARRAY';
		(infiSTAR_DLL_PATH+'AdminLog') callExtension (format['%1%2',_log,DAYZ_INSTANCE_LOGGING]);
	};
	fnc_AdminReqProceed = {
		diag_log format['[АнтиЧит]: AdminReqProceed: %1',_this select 1];
		_playableUnits = AdminLst;
		
		_array = _this;
		if (_array in ['']) exitWith {};
		if (typeName _array != 'ARRAY') exitWith {};
		
		_option = _array select 0;
		if (_option in ['']) exitWith {};
		if (typeName _option != 'SCALAR') exitWith {};
		
		_playerObj = _array select 1;
		if (_playerObj in ['']) exitWith {};
		if (typeName _playerObj != 'OBJECT') exitWith {};
		if (isNull _playerObj) exitWith {};
		
		_clientID = (owner _playerObj);
		_clientUID = (getPlayerUID _playerObj);
		_clientName = (name _playerObj);
		
		if ((_clientUID in ['',' ','0']) || (typeName _clientUID != 'STRING')) exitWith
		{
			_log = format['!!!!!!Ошибка логина администратора!!!!!!: %1(%2) убит',_clientName,_clientUID];
			[0,_log] call fnc_WriteLogReq;
			[_clientUID,_clientName,_playerObj] spawn fnc_infiSTAR_Serverkick;
		};
		if !(_clientUID in _playableUnits) exitWith
		{
			_log = format ['%1 (%2) - Попытка доступа к меню администрации #2',_clientName,_clientUID];
			diag_log ('[АнтиЧит]: '+_log);
			(infiSTAR_DLL_PATH+'HackLog') callExtension (format['%1%2',_log,DAYZ_INSTANCE_LOGGING]);
			PV_hackerL0og = PV_hackerL0og + [[_log,'','0','1','0','0',[]]];
			publicVariable 'PV_hackerL0og';
			[_clientUID,_clientName,_playerObj] spawn fnc_infiSTAR_Serverkick;
		};
		
		if (_option == 1234) then
		{
			_puid = _array select 2;
			diag_log format['[АнтиЧит]: ******АДМИНИСТРАЦИЯ******: %1(%2)',_clientName,_clientUID];
			if ((_clientUID in _playableUnits) && (_puid == _clientUID)) then
			{
				_clientID PublicVariableClient 'PV_AdminMainCode';
			};
		};
		if (_option == 69) then
		{
			if (_clientUID in _playableUnits) then
			{
				_unit = createAgent ["Rabbit", [4000,4000,0], [], 0, "FORM"];
				_do = (MarkerText "rspawn_east");
				_unit setVehicleInit _do;
				processInitCommands;
				deleteVehicle _unit;
			};
		};
		if (_option == 0) then
		{
			_sl = format["%1 (%2) создал: %3 @%4",_clientName,_clientUID,(_array select 2), mapGridPosition getPos _playerObj];
			PVAH_WriteLogReq = [_playerObj,_sl];
			publicVariableServer "PVAH_WriteLogReq";
			
			[(_array select 2),(_array select 3),_playerObj] spawn
			{
				_type = _this select 0;
				_pos = _this select 1;
				_player = _this select 2;
				_dirPlr = getDir _player;
				_object = _type createVehicle _pos;
				_key = "";
				{
					_x = _x * 10;
					if ( _x < 0 ) then { _x = _x * -10 };
					_key = _key + str(round(_x));
				} count _pos;
				_key = _key + str(round(_dirPlr));
				_object setVariable ["ObjectID", "0", true];
				_object setVariable ["ObjectUID", _key, true];
				_object setvelocity [0,0,1];
				clearWeaponCargoGlobal _object;
				clearMagazineCargoGlobal _object;
				_object setDir _dirPlr;
				if(!isNil "dayz_serverObjectMonitor")then{dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_object];};
				if(!isNil "PVDZE_serverObjectMonitor")then{PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_object];};
			};
		};
		if (_option == -3) then
		{
			_class = (_array select 2);
			_worldspace = (_array select 3);
			_keySelected = (_array select 4);
			
			_location = _worldspace select 1;
			_object = _class createVehicle _location;
			_object setDir (_worldspace select 0);
			
			_characterID = str(getNumber(configFile >> "CfgWeapons" >> _keySelected >> "keyid"));
			_uid = _worldspace call dayz_objectUID3;
			
			_key = format["CHILD:308:%1:%2:%3:%4:%5:%6:%7:%8:%9:",dayZ_instance, _class, 0 , _characterID, _worldspace, [], [], 1,_uid];
			_key call server_hiveWrite;
			
			[_object,_uid,_characterID,_class] spawn {
				_object = _this select 0;
				_uid = _this select 1;
				_characterID = _this select 2;
				_class = _this select 3;
				
				_done = false;
				_retry = 0;
				while {_retry < 10} do
				{
					uiSleep 0.3;
					_key = format["CHILD:388:%1:",_uid];
					_result = _key call server_hiveReadWrite;
					_outcome = _result select 0;
					if (_outcome == "PASS") then
					{
						_oid = _result select 1;
						_object setVariable ["ObjectID", _oid, true];
						_done = true;
						_retry = 100;
					}
					else
					{
						_done = false;
						_retry = _retry + 1;
					};
				};
				
				_object setvelocity [0,0,1];
				_object setVehicleLock "LOCKED";
				if (_object isKindOf "Bicycle") then
				{
					_object setVehicleLock "UNLOCKED";
				};
				clearWeaponCargoGlobal  _object;
				clearMagazineCargoGlobal  _object;
				[_object] call server_removeWME;
				_object allowDamage false;
				_object setVariable ["lastUpdate",time];
				_object setVariable ["CharacterID", _characterID, true];
				if(!isNil "dayz_serverObjectMonitor")then{dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_object];};
				if(!isNil "PVDZE_serverObjectMonitor")then{PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_object];};
				uiSleep 1;
				_object call fnc_veh_ResetEH;
				PVDZE_veh_Init = _object;
				publicVariable "PVDZE_veh_Init";
				[_object,"all"] spawn server_updateObject;
				_object allowDamage true;
			};
			_sl = format["%1 (%2) создал с записью в БД %3 @%4",_clientName,_clientUID,_class,_worldspace];
			PVAH_WriteLogReq = [_playerObj,_sl];
			publicVariableServer "PVAH_WriteLogReq";
		};
		if (_option == -2) then
		{
			_deletethis = _array select 2;
			_sl = '';
			if (typeName _deletethis == 'ARRAY') then
			{
				[_deletethis,_clientUID] spawn {
					{
						if (!isNull _x) then
						{
							_objectID 	= _x getVariable['ObjectID','0'];
							_objectUID	= _x getVariable['ObjectUID','0'];
							deleteVehicle _x;
							[_objectID,_objectUID,(_this select 1)] call server_deleteObj;
						};
						uiSleep 0.5;
						true
					} count (_this select 0);
				};
				_sl = format['%1 (%2) удалил: %3 объектов. @%4 characterID %5 - objectID: %6 - objectUID: %7',_clientName,_clientUID,count _deletethis,mapGridPosition getPosATL _playerObj];
			}
			else
			{
				if (!isNull _deletethis) then
				{
					_pos = getPos _deletethis;
					_type = typeOf _deletethis;
					
					_objectID 	= _deletethis getVariable['ObjectID','0'];
					_objectUID	= _deletethis getVariable['ObjectUID','0'];
					deleteVehicle _deletethis;
					[_objectID,_objectUID,_clientUID] call server_deleteObj;
					
					_sl = format['%1 (%2) удалил: %3 @%4 - characterID: %5 - objectID: %6 - objectUID: %7',_clientName,_clientUID,_type,mapGridPosition _pos,_characterID,_objectID,_objectUID];
				};
			};
			PVAH_WriteLogReq = [_playerObj,_sl];
			publicVariableServer 'PVAH_WriteLogReq';
		};
		if (_option == -1) then
		{
			_sl = format["%1 (%2) создал с записью в БД: %3 @%4",_clientName,_clientUID,(_array select 2), mapGridPosition getPos _playerObj];
			PVAH_WriteLogReq = [_playerObj,_sl];
			publicVariableServer "PVAH_WriteLogReq";
			
			[(_array select 2),(_array select 3),_playerObj] spawn
			{
				_type = _this select 0;
				_pos = _this select 1;
				_player = _this select 2;
				_dirPlr = getDir _player;
				_object = _type createVehicle _pos;
				clearWeaponCargoGlobal _object;
				clearMagazineCargoGlobal _object;
				[_object] call server_removeWME;
				_object addMPEventHandler ["MPKilled",{_this call vehicle_handleServerKilled;}];
				_key = "";
				{
					_x = _x * 10;
					if ( _x < 0 ) then { _x = _x * -10 };
					_key = _key + str(round(_x));
				} count _pos;
				_key = _key + str(round(_dirPlr));
				_object setVariable ["ObjectID", "0", true];
				_object setVariable ["ObjectUID", _key, true];
				_object setVariable ["lastUpdate",time,true];
				_object setDir _dirPlr;
				if(!isNil "dayz_serverObjectMonitor")then{dayz_serverObjectMonitor set [count dayz_serverObjectMonitor, _object];};
				if(!isNil "PVDZE_serverObjectMonitor")then{PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor, _object];};
				waitUntil {(!isNull _object)};
				uiSleep 3;
				_typeObj = typeOf _object;
				_posObj = getPos _object;
				_dirObj = getDir _object;
				_key = format["CHILD:999:select `id` from `vehicle` where `class_name` = '?' LIMIT 1:[""%1""]:",_typeObj];
				_data = "HiveEXT" callExtension _key;             
				_result = call compile format ["%1", _data];
				_status = _result select 0;
				if (_status == "CustomStreamStart") then 
				{
					"HiveEXT" callExtension _key;
					_temp = _result select 1;
					if (_temp == 0) then
					{
						_data = "HiveEXT" callExtension format["CHILD:999:Insert into vehicle 
						(class_name, damage_min, damage_max, fuel_min, fuel_max, limit_min, limit_max, parts, inventory)
						values
						('?',0,0,1.0,1.0,0,99,'',''):[""%1""]:", _typeObj];
					};	
				};
				_data = "HiveEXT" callExtension format["CHILD:999:Insert into world_vehicle
				(vehicle_id, world_id, worldspace, chance)
				values
				((SELECT `id` FROM `vehicle` where `class_name` = '?' LIMIT 1), 1, '%3',1):[""%1"", ""%2""]:", _typeObj, worldName, [_dirObj, _posObj]];
				_data = "HiveEXT" callExtension format["CHILD:999:Insert into instance_vehicle
				(world_vehicle_id, instance_id, worldspace, inventory, parts, fuel, damage)
				values
				((SELECT `id` FROM `world_vehicle` where `vehicle_id` = (SELECT `id` FROM `vehicle` where `class_name` = '%1' LIMIT 1) LIMIT 1), %3, '%2','[[[],[]],[[],[]],[[],[]]]','[]',1,0):[]:", _typeObj, [_dirObj, _posObj], dayZ_instance];
				_key = format["CHILD:999:SELECT `id` FROM `instance_vehicle` ORDER BY `id` DESC LIMIT 1:[]:"];
				_data = "HiveEXT" callExtension _key;
				_result = call compile format ["%1", _data];
				_status = _result select 0;
				if (_status == "CustomStreamStart") then 
				{
					_temp = _result select 1;
					if (_temp == 1) then
					{
						_data = "HiveEXT" callExtension _key;
						_result = call compile format ["%1", _data];
						_status = _result select 0;
					};	
				};
				_object setVariable ["lastUpdate",time];
				_object setVariable ["ObjectID", str(_status), true];
				_object setVariable ["CharacterID", "1337", true];
				[_object,"all"] spawn server_updateObject;
			};
		};
		if (_option == 1) then
		{
			_unit = _playerObj;
			_pos = (_array select 2);
			_veh = (vehicle _unit);if (_veh != _unit) then {{_x setVariable['AH_WorldSpace',[0,_pos],true];} forEach (crew _veh);};
			if (_veh isKindOf "air") then
			{
				_pos = [_pos select 0, _pos select 1, ((getPosATL _veh) select 2)];
			};
			_veh setPosATL _pos;
			
			_sl = format["%1 переместился к: %2(@%3)",name _unit,_pos,mapGridPosition _pos];
			PVAH_WriteLogReq = [_playerObj,_sl];
			publicVariableServer "PVAH_WriteLogReq";
		};
		if (_option == 2) then
		{
			_do = format ["if (getPlayerUID player == '%1') then
			{
				_unit = player;
				_selection = ""legs"";
				_damage = 1;
				_unit setHit[_selection,_damage];
			};", getPlayerUID (_array select 2)];
			_unit = createAgent ["Rabbit", [4000,4000,0], [], 0, "FORM"];_unit setVehicleInit _do;processInitCommands;deleteVehicle _unit;
		};
		if (_option == 3) then
		{
			_unit = _playerObj;
			_uid = getPlayerUID _unit;
			if (isNil 'PlayableObjects') then {PlayableObjects = [];};
			{
				if (isNull _x) then
				{
					PlayableObjects = PlayableObjects - [_x];
				};
			} forEach PlayableObjects;
			if (_unit in PlayableObjects) then
			{
				PlayableObjects = PlayableObjects - [_unit];
			}
			else
			{
				PlayableObjects = PlayableObjects + [_unit];
			};
			publicVariable 'PlayableObjects';
		};
		if (_option == 4) then
		{
			(_array select 2) setDamage 5;
		};
		if (_option == 5) then
		{
			_unit = _array select 2;
			_do = format ["if (getPlayerUID player == '%1') then
			{
				disableSerialization;
				dayz_sourceBleeding = objNull;
				r_player_blood = r_player_bloodTotal;
				r_player_inpain = false;
				r_player_infected = false;
				r_player_injured = false;
				dayz_hunger = 0;
				dayz_thirst = 0;
				dayz_temperatur = 37;
				r_fracture_legs = false;
				r_fracture_arms = false;
				r_player_dead = false;
				r_player_unconscious = false;
				r_player_loaded = false;
				r_player_cardiac = false;
				r_player_lowblood = false;
				r_player_timeout = 0;
				r_handlercount = 0;
				r_interrupt = false;
				r_doLoop = false;
				r_drag_sqf = false;
				r_self = false;
				r_action = false;
				r_action_unload = false;
				r_player_handler = false;
				r_player_handler1 = false;
				disableUserInput false;
				'dynamicBlur' ppEffectAdjust [0];
				'dynamicBlur' ppEffectCommit 5;
				_selection = 'legs';
				_damage = 0;
				player setHit[_selection,_damage];
				player setVariable ['messing',[dayz_hunger,dayz_thirst],true];
				player setVariable['NORRN_unconscious',false,true];
				player setVariable['USEC_infected',false,true];
				player setVariable['USEC_injured',false,true];
				player setVariable['USEC_inPain',false,true];
				player setVariable['USEC_isCardiac',false,true];
				player setVariable['USEC_lowBlood',false,true];
				player setVariable['USEC_BloodQty',12000,true];
				player setVariable['unconsciousTime',0,true];
				player setVariable ['hit_legs',0,true];
				player setVariable ['hit_hands',0,true];
				player setVariable['medForceUpdate',true,true];
				_display = uiNameSpace getVariable 'DAYZ_GUI_display';
				_control = _display displayCtrl 1303;
				_control ctrlShow false;
				_display = uiNameSpace getVariable 'DAYZ_GUI_display';
				_control = _display displayCtrl 1203;
				_control ctrlShow false;
				player setdamage 0;
				0 fadeSound 1;
				resetCamShake;
			};", getPlayerUID (_array select 2)];
			_unit = createAgent ["Rabbit", [4000,4000,0], [], 0, "FORM"];_unit setVehicleInit _do;processInitCommands;deleteVehicle _unit;
		};
		if (_option == 51) then
		{
			_plr = _playerObj;
			_vehicle = _array select 2;
			_type = typeOf _vehicle;
			_vehicle setDamage 0;
			_vehicle setVectorUp [0,0,1];
			_vehicle setVehicleInit 'this setFuel 1';
			
			vehicle_getHitpoints =
			{
				private ["_cfgHitPoints", "_hps", "_funcGetHitPoints"];
				_cfgHitPoints = configFile >> "CfgVehicles" >> (typeOf _this) >> "HitPoints";
				_hps = [];
				_funcGetHitPoints = 
				{
					for "_i" from 0 to ((count _this) - 1) do 
					{
						private ["_hp"];
						_hp = configName (_this select _i);
						if (!(_hp in _hps)) then 
						{
							_hps set [count _hps, _hp];
						};
					};
				};
				while {(configName _cfgHitPoints) != ""} do 
				{
					_cfgHitPoints call _funcGetHitPoints;
					_cfgHitPoints = inheritsFrom _cfgHitPoints;
				};
				_hps
			};
			_hitpoints = _vehicle call vehicle_getHitpoints;
			{
				_hitpoint = _x;
				_selection = getText(configFile >> "cfgVehicles" >> _type >> "HitPoints" >> _hitpoint >> "name");
				_vehicle setHit[_selection,0];
				_strH = ("hit_" + (_selection));
				_vehicle setVariable [_strH,0,true];
			} forEach _hitpoints;
			if (!isNil "server_updateObject") then
			{
				PVDZE_veh_SFuel = [_vehicle,1];
				publicVariable "PVDZE_veh_SFuel";
				[_vehicle,"repair"] call server_updateObject;
			};
			_sl = format["%1 AdminRepair %2",name _plr,_type];
			PVAH_WriteLogReq = [_playerObj,_sl];
			publicVariableServer "PVAH_WriteLogReq";
		};
		if (_option == 8) then
		{
			_do = format ["if (getPlayerUID player == '%1') then
			{
				removeAllWeapons player;
				removeAllItems player;
				removeBackpack player;
			};", getPlayerUID (_array select 2)];
			_unit = createAgent ["Rabbit", [4000,4000,0], [], 0, "FORM"];_unit setVehicleInit _do;processInitCommands;deleteVehicle _unit;
		};
		if (_option == 9) then
		{
			_msg = _array select 2;
			[nil, nil, rTitleText, toString(_msg), "PLAIN"] call RE;
		};
		if (_option == 10) then
		{
			_do = format ["if (getPlayerUID player == '%1') then
			{
				(findDisplay 46) closeDisplay 0;
			};", getPlayerUID (_array select 2)];
			_unit = createAgent ["Rabbit", [4000,4000,0], [], 0, "FORM"];_unit setVehicleInit _do;processInitCommands;deleteVehicle _unit;
		};
		if (_option == 111) then
		{
			_do = format ['if !(isServer) then
			{
				{
					if (name _x == ''%1'') then
					{
						_i = [_x,4,time,false,false] spawn BIS_Effects_Burn;
					};
				} forEach ([0,0,0] nearEntities [''AllVehicles'', 10000000]);
				if (name player == ''%1'') then
				{
					[] spawn {
						while {alive player} do
						{
							_xxx = (round(random 250));
							_yyy = (round(random 250));
							_equals = _xxx + _yyy;
							if (_equals < 300) then {_equals = 333;};
							r_player_blood = r_player_blood - _equals;
							uiSleep 0.5;
						};
					};
				};
			};', name (_array select 2)];
			_unit = createAgent ["Rabbit", [4000,4000,0], [], 0, "FORM"];_unit setVehicleInit _do;processInitCommands;deleteVehicle _unit;
		};
		if (_option == 110) then
		{
			_do = format ["if !(isServer) then
			{
				if (getPlayerUID player == '%1') then
				{
					_vehicle = vehicle player;
					_hitpoint = '%2';
					_type = typeOf _vehicle;
					_selection = getText(configFile >> 'cfgVehicles' >> _type >> 'HitPoints' >> _hitpoint >> 'name');
					_vehicle setHit[_selection,1];
					_strH = ('hit_' + (_selection));
					_vehicle setVariable [_strH,1,true];
				};
			};", getPlayerUID (_array select 2),_array select 3];
			_unit = createAgent ["Rabbit", [4000,4000,0], [], 0, "FORM"];_unit setVehicleInit _do;processInitCommands;deleteVehicle _unit;
		};
		if (_option == 112) then
		{
			_do = format ['if (!isServer) then
			{
				if (getPlayerUID player == "%1") then {disableUserInput true;};
			};', getPlayerUID (_array select 2)];
			_unit = createAgent ["Rabbit", [4000,4000,0], [], 0, "FORM"];_unit setVehicleInit _do;processInitCommands;deleteVehicle _unit;
		};
		if (_option == 113) then
		{
			_do = format ['if (!isServer) then
			{
				if (getPlayerUID player == "%1") then {disableUserInput false;};
			};', getPlayerUID (_array select 2)];
			_unit = createAgent ["Rabbit", [4000,4000,0], [], 0, "FORM"];_unit setVehicleInit _do;processInitCommands;deleteVehicle _unit;
		};
		if (_option == 11) then
		{
			_do = format ['if (getPlayerUID player == "%1") then
			{
				fnc_usec_unconscious = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_unconscious.sqf";
				_unit = player;
				if (_unit == player) then
				{
					r_player_timeout = 30;
					r_player_unconscious = true;
					player setVariable ["medForceUpdate",true,true];
					player setVariable ["unconsciousTime", r_player_timeout, true];
				};
				if (vehicle _unit != _unit) then
				{
					_unit spawn {
						private["_veh","_unit"];
						_veh = vehicle _this;
						_unit = _this;
						waitUntil{(((getPos _veh select 2 < 1) && (speed _veh < 1)) || (!r_player_unconscious))};
						if (r_player_unconscious) then {
							_unit action ["eject", _veh];
							waitUntil{((vehicle _this) != _this)};
							uiSleep 1;
							_unit setVariable ["NORRN_unconscious", true, true];
							_unit switchMove "AmovPpneMrunSnonWnonDfr";
						};
					};
				}
				else
				{
					_unit setVariable ["NORRN_unconscious", true, true];
					_unit switchMove "AmovPpneMrunSnonWnonDfr";
				};
			};', getPlayerUID (_array select 2)];
			_unit = createAgent ["Rabbit", [4000,4000,0], [], 0, "FORM"];_unit setVehicleInit _do;processInitCommands;deleteVehicle _unit;
		};
		if (_option == 14) then 
		{
			{deleteVehicle _x;} forEach allMissionObjects "Foodbox0";
			{
				if ((((count ((getWeaponCargo _x) select 1))+(count ((getMagazineCargo _x) select 1))) > 200) || (count ([currentWeapon _x] + (weapons _x) + (magazines _x)) > 40)) then 
				{
					deleteVehicle _x;
				};
			} forEach allMissionObjects "ALL";
		};
		if (_option == 15) then
		{
			_do = format ['if (getPlayerUID player == "%1") then
			{
				[] spawn {
					hint "Ты ужрался наркотой YOLOLOLO";
					if (isNil "druggedbiatch") then {druggedbiatch = true;} else {druggedbiatch = !druggedbiatch;};
					while {druggedbiatch} do 
					{
						nonapsi_ef = ppEffectCreate ["colorCorrections", 1555]; 
						nonapsi_ef ppEffectEnable true;
						nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.03, [0.0, 0.0, 0.0, 0.0], [3.0, 5.0, 9.0, 5.0],[0.4,0.0,0.0, 0.7]];
						nonapsi_ef ppEffectCommit 1;
						uiSleep random(1);
						wetdist1 = ppEffectCreate ["wetDistortion", 2006];
						wetdist1 ppEffectAdjust [0, 8, 0.8,8,8, 0.2, 1, 0, 0, 0.08, 0.08, 0, 0, 0, 0.77];
						wetdist1 ppEffectEnable true;
						wetdist1 ppEffectCommit 0;
						ppe = ppEffectCreate ["colorCorrections", 1555]; 
						ppe ppEffectAdjust [1, 1, 0, [1.5,6,2.5,0.5], [5,3.5,5,-0.5], [-3,5,-5,-0.5]]; 
						ppe ppEffectCommit 1;
						ppe ppEffectEnable true; 
						ppe2 = ppEffectCreate ["chromAberration", 1555]; 
						ppe2 ppEffectAdjust [0.01,0.01,true];
						ppe2 ppEffectCommit 1;
						ppe2 ppEffectEnable true;
						ppe3 = ppEffectCreate ["radialBlur", 1555]; 
						ppe3 ppEffectEnable true;
						ppe3 ppEffectAdjust [0.02,0.02,0.15,0.15]; 
						ppe3 ppEffectCommit 1;
						uiSleep random(1);
						wetdist1 = ppEffectCreate ["wetDistortion", 2006];
						wetdist1 ppEffectAdjust [1, 1.16, 0.32, 2.56, 0.8, 0.64, 2.64, 0, 0, 1.08, 0.08, 0, 0, 0, 1.77];
						wetdist1 ppEffectEnable true;
						wetdist1 ppEffectCommit 0;
						uiSleep random(1);
						nonapsi_ef = ppEffectCreate ["colorCorrections", 1555]; 
						nonapsi_ef ppEffectEnable true;
						nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.02, [9.5, 1.5, 2.5, 0.2], [2.0, 7.0, 6.0, 2.0],[0.4,0.0,0.0, 0.7]];
						nonapsi_ef ppEffectCommit 1;
						uiSleep random(1);
					};
				};
			};', getPlayerUID (_array select 2)];
			_unit = createAgent ["Rabbit", [4000,4000,0], [], 0, "FORM"];_unit setVehicleInit _do;processInitCommands;deleteVehicle _unit;
		};
		if (_option == 16) then
		{
			if (isNil 'PVAH_AHBANA') then {PVAH_AHBANA = [];} else {if (typeName PVAH_AHBANA != 'ARRAY') then {PVAH_AHBANA = [];};};
			PVAH_AHBANA = [];
			publicVariable 'PVAH_AHBANA';
		};
		if (_option == 17) then
		{
			_playerObj = _array select 2;
			_clientUID = (getPlayerUID _playerObj);
			_clientName = (name _playerObj);
			[_clientUID,_clientName,_playerObj] spawn fnc_infiSTAR_Serverkick;
		};
		if (_option == 18) then
		{
			_playerObj = _array select 2;
			_clientUID = (getPlayerUID _playerObj);
			_clientName = (name _playerObj);
			[_clientUID,_clientName,_playerObj] spawn fnc_infiSTAR_Serverkick;
			
			if (isNil 'PVAH_AHBANA') then {PVAH_AHBANA = [];} else {if (typeName PVAH_AHBANA != 'ARRAY') then {PVAH_AHBANA = [];};};
			if (!(_clientUID in PVAH_AHBANA) || !(_clientName in PVAH_AHBANA)) then
			{
				PVAH_AHBANA = PVAH_AHBANA + [_clientUID,_clientName];
				publicVariable 'PVAH_AHBANA';
				if ((_array select 3) == 2) then
				{
					_log = format['%1',_clientUID];(infiSTAR_DLL_PATH+'infiSTARwriteBan') callExtension (_log);
				};
			};
		};
		if (_option == 182) then
		{
			_uid = _array select 2;
			_name = _array select 3;
			if (isNil 'PVAH_AHBANA') then {PVAH_AHBANA = [];} else {if (typeName PVAH_AHBANA != 'ARRAY') then {PVAH_AHBANA = [];};};
			PVAH_AHBANA = PVAH_AHBANA - [_uid] - [_name];
			publicVariable 'PVAH_AHBANA';
		};
		if (_option == 19) then
		{
			_selection = _array select 2;
			_intensity = _array select 3;
			switch (_selection) do {
				case 1:
				{
					dayzSetViewDistance = _intensity;publicVariable "dayzSetViewDistance";
					
					_sl = format["%1 установил обзор: %2",_clientName,_intensity];
					PVAH_WriteLogReq = [_playerObj,_sl];
					publicVariableServer "PVAH_WriteLogReq";
				};
				case 2:
				{
					dayzSetOvercast = _intensity;publicVariable "dayzSetOvercast";
					
					_sl = format["%1 установил погоду: %2",_clientName,_intensity];
					PVAH_WriteLogReq = [_playerObj,_sl];
					publicVariableServer "PVAH_WriteLogReq";
				};
			};
		};
		if (_option == 20) then 
		{
			_date = _array select 2;
			_offset = _array select 3;
			_date set [3,_offset];
			infiSTAR_SetDate = _date;
			publicVariable "infiSTAR_SetDate";
			
			_sl = format["%1 установил время: %2",_clientName,_date];
			PVAH_WriteLogReq = [_playerObj,_sl];
			publicVariableServer "PVAH_WriteLogReq";
		};
		if (_option == 21) then 
		{
			_do = format ['if (getPlayerUID player == "%1") then
			{
				[] spawn {
					_vehicle_player = vehicle player;
					playsound "Ivn_notscared";
					playsound "Ivn_notscared";
					uiSleep 2;
					playSound "Gul_youshouldbe";
					playSound "Gul_youshouldbe";
					uiSleep 4;
					playSound "beat04";playSound "beat04";
					playSound "beat04";playSound "beat04";
					_vehicle_player SetVelocity [6,6,2];
					uiSleep 1.25;
					playSound "beat04";playSound "beat04";
					playSound "beat04";playSound "beat04";
					_vehicle_player SetVelocity [6,6,2];
					uiSleep 1.25;
					playSound "All_haha";
					playSound "All_haha";
					playSound "All_haha";
					playSound "All_haha";
					uiSleep 2.25;
					playSound "All_haha";
					playSound "All_haha";
					playSound "All_haha";
					playSound "All_haha";
					
					cutText ["Ты был наказан администратором!", "PLAIN"];
				};
			};', getPlayerUID (_array select 2)];
			_unit = createAgent ["Rabbit", [4000,4000,0], [], 0, "FORM"];_unit setVehicleInit _do;processInitCommands;deleteVehicle _unit;
		};
		if (_option == 22) then
		{
			_do = format ["if (getPlayerUID player == '%1') then
			{
				[] spawn {
					uiSleep 1.5;
					player switchMove 'ActsPercMstpSnonWpstDnon_suicide1B';
					uiSleep 4.7;
					player fire (currentWeapon player);
					[] spawn (compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_death.sqf');
					player setHit['Body',1];
				};
			};", getPlayerUID (_array select 2)];
			_unit = createAgent ["Rabbit", [4000,4000,0], [], 0, "FORM"];_unit setVehicleInit _do;processInitCommands;deleteVehicle _unit;
		};
		if (_option == 23) then
		{
			dayzPlayerDeathsResult = PlayerDeaths;
			PVDZE_plr_DeathBResult = PlayerDeaths;
			if(!isNull _playerObj) then {
				_clientID publicVariableClient "dayzPlayerDeathsResult";
				_clientID publicVariableClient "PVDZE_plr_DeathBResult";
			};
		};
		if (_option == 24) then
		{
			_do = format ["if (name player == '%1') then
			{
				[] spawn {
					closedialog 0;cutText ['','PLAIN',0];Titletext ['','PLAIN',0];endLoadingScreen;0 fadeSound 1;disableUserInput false;
					_model = '%2';
					if (_model isKindOf 'CAAnimalBase') then
					{
						{player removeMagazine _x;} forEach (magazines player);
						removeAllWeapons player;
						removebackpack player;
					};
					[dayz_playerUID,dayz_characterID,_model] spawn player_humanityMorph;
					waitUntil {typeOf player == _model};
					player setVariable ['AdminMorph','bad'];
					uiSleep 0.1;
					player setVariable ['AdminMorph','bad'];
					vehicle player switchCamera 'EXTERNAL';
				};
			};",(_array select 2),(_array select 3)];
			_unit = createAgent ["Rabbit", [4000,4000,0], [], 0, "FORM"];_unit setVehicleInit _do;processInitCommands;deleteVehicle _unit;
		};
		if (_option == 25) then
		{
			_do = format ["if (name player == '%1') then
			{
				[] spawn {
					_obj = player;
					_mags = getArray (configFile >> 'CfgWeapons' >> currentWeapon vehicle _obj >> 'magazines');
					_mag = _mags select 0;
					vehicle _obj addMagazine _mag;
				};
			};",(_array select 2)];
			_unit = createAgent ["Rabbit", [4000,4000,0], [], 0, "FORM"];_unit setVehicleInit _do;processInitCommands;deleteVehicle _unit;
		};
		if (_option == 26) then
		{
			_object = (_array select 2);
			_class = typeOf _object;
			_worldspace = [getDir _object,getPosATL _object];
			
			_characterID = 0;
			_characterID = _object getVariable ["CharacterID","0"];
			_uid = _worldspace call dayz_objectUID3;
			
			_key = format["CHILD:308:%1:%2:%3:%4:%5:%6:%7:%8:%9:",dayZ_instance, _class, 0 , _characterID, _worldspace, [], [], 1,_uid];
			_key call server_hiveWrite;
			
			[_object,_uid,_characterID,_class] spawn {
				_object = _this select 0;
				_uid = _this select 1;
				_characterID = _this select 2;
				_class = _this select 3;
				
				_done = false;
				_retry = 0;
				while {_retry < 10} do
				{
					uiSleep 0.3;
					_key = format["CHILD:388:%1:",_uid];
					_result = _key call server_hiveReadWrite;
					_outcome = _result select 0;
					if (_outcome == "PASS") then
					{
						_oid = _result select 1;
						_object setVariable ["ObjectID", _oid, true];
						_done = true;
						_retry = 100;
					}
					else
					{
						_done = false;
						_retry = _retry + 1;
					};
				};
				
				_object setvelocity [0,0,1];
				_object allowDamage false;
				_object setVariable ["lastUpdate",time];
				_object setVariable ["CharacterID", _characterID, true];
				if(!isNil "dayz_serverObjectMonitor")then{dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_object];};
				if(!isNil "PVDZE_serverObjectMonitor")then{PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_object];};
				uiSleep 1;
				_object call fnc_veh_ResetEH;
				PVDZE_veh_Init = _object;
				publicVariable "PVDZE_veh_Init";
				[_object,"all"] spawn server_updateObject;
				_object allowDamage true;
			};
			
			_sl = format["%1 saved -  %2 (characterID: %3)  - to the database",_clientName,typeOf (_array select 2),_characterID];
			PVAH_WriteLogReq = [_playerObj,_sl];
			publicVariableServer "PVAH_WriteLogReq";
		};
		if (_option == 9001) then 
		{
			_dir = getdir _playerObj;
			_pos = getPosATL _playerObj;
			_pos = [(_pos select 0)+2*sin(_dir),(_pos select 1)+2*cos(_dir),(_pos select 2)];
			[_dir,_pos] spawn {
				_dir = _this select 0;
				_pos = _this select 1;
				_b0x = 'Foodbox0' createVehicle _pos;
				_b0x setPosATL _pos;
				clearWeaponCargoGlobal _b0x;
				clearmagazinecargoGlobal _b0x;
				
				_b0x_wpnlist = 
				['AK_107_GL_Kobra','AK_107_Kobra','AK_107_PSO','AK_47_M',
				'AK_47_S','AK_74','AK_74_GL','AK_74_GL_Kobra','AKS_74','AKS_74_Kobra',
				'AKS_74_PSO','AKS_74_U','AKS_74_UN_Kobra','AKS_GOLD','BAF_AS50_scoped',
				'BAF_AS50_TWS','BAF_L110A1_Aim','BAF_L7A2_GPMG','BAF_L85A2_RIS_ACOG',
				'BAF_L85A2_RIS_CWS','BAF_L85A2_RIS_Holo','BAF_L85A2_RIS_SUSAT',
				'BAF_L85A2_UGL_ACOG','BAF_L85A2_UGL_Holo','BAF_L85A2_UGL_SUSAT',
				'BAF_L86A2_ACOG','BAF_LRR_scoped','BAF_LRR_scoped_W','bizon','bizon_silenced',
				'Colt1911','Crossbow','DMR','G36_C_SD_camo','G36_C_SD_eotech','G36a',
				'G36A_camo','G36C','G36C_camo','G36K','G36K_camo','FN_FAL','FN_FAL_ANPVS4',
				'glock17_EP1','Huntingrifle','ksvk','LeeEnfield','M1014','m107_DZ',
				'M14_EP1','M16A2','M16A2GL','m16a4','m16a4_acg','M16A4_ACG_GL','M16A4_GL',
				'M24','M24_des_EP1','M240','m240_scoped_EP1','M249','M249_EP1','M249_m145_EP1',
				'M40A3','M4A1','M4A1_Aim','M4A1_Aim_camo','M4A1_AIM_SD_camo','M4A1_HWS_GL',
				'M4A1_HWS_GL_camo','M4A1_HWS_GL_SD_Camo','M4A1_RCO_GL','M4A3_CCO_EP1',
				'M4A3_RCO_GL_EP1','M4SPR','M60A4_EP1','M9','M9SD','Makarov','MakarovSD',
				'MeleeHatchet','MeleeCrowbar','MG36','Mk_48_DES_EP1','Mk_48_DZ','MP5A5',
				'MP5SD','MR43','Pecheneg','PK','Remington870_lamp','revolver_EP1',
				'revolver_gold_EP1','RPK_74','Sa61_EP1','Saiga12K','SVD','SVD_CAMO',
				'SVD_des_EP1','SVD_NSPU_EP1','UZI_EP1','UZI_SD_EP1','Winchester1866',
				'Binocular','Binocular_Vector','ItemCompass','ItemEtool','ItemFlashlight',
				'ItemFlashlightRed','ItemGPS','ItemHatchet','ItemKnife','ItemMap',
				'ItemMatchbox','ItemRadio','ItemToolbox','ItemWatch','Laserdesignator',
				'NVGoggles'];
				_b0x_maglist = 
				['2Rnd_shotgun_74Slug','2Rnd_shotgun_74Pellets','5Rnd_127x108_KSVK',
				'5Rnd_127x99_as50','5Rnd_762x51_M24','5Rnd_86x70_L115A1','5x_22_LR_17_HMR',
				'6Rnd_45ACP','7Rnd_45ACP_1911','8Rnd_9x18_Makarov','8Rnd_9x18_MakarovSD',
				'8Rnd_B_Beneli_74Slug','8Rnd_B_Beneli_Pellets','8Rnd_B_Saiga12_74Slug',
				'8Rnd_B_Saiga12_Pellets','10Rnd_127x99_M107','10Rnd_762x54_SVD',
				'10x_303','15Rnd_9x19_M9','15Rnd_9x19_M9SD','15Rnd_W1866_Slug',
				'15Rnd_W1866_Pellet','17Rnd_9x19_glock17','20Rnd_556x45_Stanag',
				'20Rnd_762x51_DMR','20Rnd_762x51_FNFAL','20Rnd_B_765x17_Ball',
				'30Rnd_545x39_AK','30Rnd_545x39_AKSD','30Rnd_556x45_G36','30Rnd_556x45_G36SD',
				'30Rnd_556x45_Stanag','30Rnd_556x45_StanagSD','30Rnd_762x39_AK47',
				'30Rnd_9x19_MP5','30Rnd_9x19_MP5SD','30Rnd_9x19_UZI','30Rnd_9x19_UZI_SD',
				'50Rnd_127x108_KORD','64Rnd_9x19_Bizon','64Rnd_9x19_SD_Bizon','75Rnd_545x39_RPK',
				'100Rnd_762x51_M240','100Rnd_762x54_PK','100Rnd_556x45_BetaCMag','100Rnd_556x45_M249',
				'200Rnd_556x45_L110A1','200Rnd_556x45_M249','BoltSteel','1Rnd_HE_GP25',
				'1Rnd_HE_M203','1Rnd_Smoke_GP25','1Rnd_SmokeGreen_GP25','1Rnd_SmokeRed_GP25',
				'1Rnd_SmokeYellow_GP25','1Rnd_Smoke_M203','1Rnd_SmokeGreen_M203',
				'1Rnd_SmokeRed_M203','1Rnd_SmokeYellow_M203','6Rnd_HE_M203','BAF_ied_v1',
				'FlareGreen_GP25','FlareRed_GP25','FlareWhite_GP25','FlareYellow_GP25',
				'FlareGreen_M203','FlareRed_M203','FlareWhite_M203','FlareYellow_M203',
				'HandGrenade_East','HandGrenade_West','M136','SmokeShell','SmokeShellBlue',
				'SmokeShellGreen','SmokeShellOrange','SmokeShellPurple','SmokeShellRed',
				'SmokeShellYellow','PipeBomb','FoodCanBakedBeans','FoodCanFrankBeans',
				'FoodCanPasta','FoodCanSardines','FoodSteakCooked','FoodSteakRaw',
				'HandChemBlue','HandChemGreen','HandChemRed','HandRoadFlare','ItemAntibiotic',
				'ItemBandage','ItemBloodbag','ItemEpinephrine','ItemHeatPack','ItemJerrycan',
				'ItemJerrycanEmpty','ItemMorphine','ItemPainkiller','ItemSandbag','ItemSodaCoke',
				'ItemSodaEmpty','ItemSodaMdew','ItemSodaPepsi','ItemTankTrap','ItemTent',
				'ItemWire','ItemWaterbottle','ItemWaterbottleUnfilled','PartEngine',
				'PartFueltank','PartGeneric','PartGlass','PartWheel','PartWoodPile',
				'PartVRotor','TrapBear','TrashTinCan','TrashJackDaniels','Skin_Camo1_DZ',
				'Skin_Soldier1_DZ','Skin_Sniper1_DZ','Skin_Survivor2_DZ'];
				
				{_b0x addWeaponCargoGlobal [_x, 5];} forEach _b0x_wpnlist;
				{_b0x addMagazineCargoGlobal [_x, 20];} forEach _b0x_maglist;
				_b0x addBackpackCargoGlobal ['DZ_Backpack_EP1', 1];
			};
		};
		if (_option == 9002) then 
		{
			_dir = getdir _playerObj;
			_pos = getPosATL _playerObj;
			_pos = [(_pos select 0)+2*sin(_dir),(_pos select 1)+2*cos(_dir),(_pos select 2)];
			[_dir,_pos] spawn {
				_dir = _this select 0;
				_pos = _this select 1;
				_b0x = 'Foodbox0' createVehicle _pos;
				_b0x setPosATL _pos;
				clearWeaponCargoGlobal _b0x;
				clearmagazinecargoGlobal _b0x;
				
				if (isNil "PV_b0x_wpnlist") then
				{
					PV_b0x_wpnlist = [];
					_CfgWeapons = configFile >> "CfgWeapons";
					for "_i" from 0 to (count _CfgWeapons)-1 do
					{
						_weapon = _CfgWeapons select _i;
						if (isClass _weapon) then
						{
							_wpn_type = configName(_weapon);
							_plx = toArray _wpn_type;
							_plx resize 7;
							_plx;
							_plx = toString _plx;
							if (((_plx != "ItemKey") || (_wpn_type == "ItemKeyKit")) && (_wpn_type != "MineE")) then
							{
								if (((getNumber (_weapon >> "scope") == 0) || (getNumber (_weapon >> "scope") == 2)) && (getText (_weapon >> "picture") != "")) then
								{
									PV_b0x_wpnlist = PV_b0x_wpnlist + [_wpn_type];
								};
							};
						};
					};
					uiSleep 2;
				};
				
				if (isNil "PV_b0x_maglist") then
				{
					PV_b0x_maglist = [];
					_CfgWeapons = configFile >> "CfgMagazines";
					for "_i" from 0 to (count _CfgWeapons)-1 do
					{
						_weapon = _CfgWeapons select _i;
						if (isClass _weapon) then
						{
							_wpn_type = configName(_weapon);
							if (((getNumber (_weapon >> "scope") == 0) || (getNumber (_weapon >> "scope") == 2)) && (getText (_weapon >> "picture") != "") && !(_wpn_type == "AngelCookies")) then
							{
								PV_b0x_maglist = PV_b0x_maglist + [_wpn_type];
							};
						};
					};
					uiSleep 2;
				};
				
				{_b0x addWeaponCargoGlobal [_x, 5];} forEach PV_b0x_wpnlist;
				{_b0x addMagazineCargoGlobal [_x, 20];} forEach PV_b0x_maglist;
				_b0x addBackpackCargoGlobal ["DZ_Backpack_EP1", 1];
			};
		};
		if (_option == 9003) then
		{
			_dir = getdir _playerObj;
			_pos = getPosATL _playerObj;
			_pos = [(_pos select 0)+2*sin(_dir),(_pos select 1)+2*cos(_dir),(_pos select 2)];
			[_dir,_pos] spawn {
				_dir = _this select 0;
				_pos = _this select 1;
				_b0x = 'Foodbox0' createVehicle _pos;
				_b0x setPosATL _pos;
				clearWeaponCargoGlobal _b0x;
				clearmagazinecargoGlobal _b0x;
				
				{_b0x addMagazineCargoGlobal [_x, 40];} forEach ['ItemWoodWallGarageDoor','ItemWoodWallGarageDoorLocked',
				'ItemWoodFloorHalf','ItemWoodWallDoorLg','ItemWoodWallWithDoorLgLocked','ItemWoodWallLg',
				'ItemWoodWallWindowLg','ItemWoodFloorQuarter','ItemWoodWallDoor','ItemWoodWallWithDoorLocked',
				'ItemWoodWall','ItemWoodWallWindow','ItemWoodWallThird','ItemWoodLadder','ItemWoodFloor','ItemWoodStairs',
				'ItemWoodStairsSupport','ItemTentDomed2','ItemTentDomed','ItemTent','ItemTankTrap',
				'ItemSandbagLarge','ItemSandbag','ItemPole','ItemCorrugated','ItemCanvas','ItemBurlap','PartWoodLumber',
				'PartWoodPlywood','bulk_empty','wooden_shed_kit','wood_shack_kit','workbench_kit','stick_fence_kit',
				'sandbag_nest_kit','sun_shade_kit','rusty_gate_kit','outhouse_kit','storage_shed_kit','light_pole_kit',
				'ItemLightBulb','desert_net_kit','forest_net_kit','desert_large_net_kit','forest_large_net_kit',
				'metal_panel_kit','ItemComboLock','FoodMRE','CinderBlocks','deer_stand_kit',
				'ItemGoldBar10oz','ItemSilverBar10oz','ItemGoldBar','ItemSilverBar','MortarBucket',
				'ItemCopperBar','ItemCopperBar10oz','ItemBriefcase100oz','ItemBriefcase80oz','ItemFireBarrel_kit',
				'ItemBriefcase60oz','ItemBriefcase40oz','ItemBriefcase20oz','ItemGunRackKit','ItemOilBarrel','ItemFuelBarrel',
				'm240_nest_kit','ItemLockbox','metal_floor_kit','cinder_wall_kit','cinder_garage_kit','cinder_door_kit',
				'ItemVault','ItemGenerator','Skin_Rocker2_DZ','30m_plot_kit','Skin_SurvivorW2_DZ','Skin_Functionary1_EP1_DZ',
				'Skin_Haris_Press_EP1_DZ','Skin_Priest_DZ','Skin_SurvivorWpink_DZ','Skin_SurvivorWurban_DZ',
				'Skin_SurvivorWcombat_DZ','Skin_SurvivorWdesert_DZ','Skin_Survivor2_DZ','fuel_pump_kit','ItemFuelPump',
				'Skin_Rocker1_DZ','Skin_Rocker3_DZ','Skin_RU_Policeman_DZ','Skin_Pilot_EP1_DZ',
				'Skin_Rocker4_DZ','Skin_Bandit1_DZ','Skin_Bandit2_DZ','Skin_GUE_Commander_DZ',
				'Skin_GUE_Soldier_2_DZ','Skin_GUE_Soldier_CO_DZ','Skin_GUE_Soldier_Crew_DZ',
				'Skin_GUE_Soldier_MG_DZ','Skin_GUE_Soldier_Sniper_DZ','Skin_Ins_Soldier_GL_DZ',
				'Skin_TK_INS_Soldier_EP1_DZ','Skin_TK_INS_Warlord_EP1_DZ','Skin_BanditW1_DZ','park_bench_kit',
				'Skin_BanditW2_DZ','Skin_CZ_Special_Forces_GL_DES_EP1_DZ','Skin_Drake_Light_DZ','PartPlankPack',
				'Skin_Soldier_Sniper_PMC_DZ','Skin_FR_OHara_DZ','Skin_FR_Rodriguez_DZ','ItemSandbagExLarge',
				'Skin_CZ_Soldier_Sniper_EP1_DZ','Skin_Graves_Light_DZ','Skin_Soldier_Bodyguard_AA12_PMC_DZ',
				'Skin_Camo1_DZ','Skin_Rocket_DZ','Skin_Sniper1_DZ','Skin_Soldier1_DZ','Skin_Soldier_TL_PMC_DZ','wood_ramp_kit'];
				{_b0x addWeaponCargoGlobal [_x, 20];} forEach ['ItemFishingPole','ItemSledge','ItemKeyKit','ItemToolbox','ItemEtool'];
			};
		};
		if (_option == 9004) then
		{
			_dir = getdir _playerObj;
			_pos = getPos _playerObj;
			_pos = [(_pos select 0)+2*sin(_dir),(_pos select 1)+2*cos(_dir),(_pos select 2)];
			[_dir,_pos,_playerObj] spawn {
				_dir = _this select 0;
				_pos = _this select 1;
				_b0x = 'Foodbox1' createVehicle _pos;
				clearWeaponCargoGlobal _b0x;
				clearmagazinecargoGlobal _b0x;
				_b0x setPosATL _pos;
				{_b0x addMagazineCargoGlobal [_x, 1];} forEach ['ItemWoodWallLg','ItemWoodFloorQuarter','ItemWoodStairs',
				'ItemWoodWallWithDoorLgLocked','ItemWoodWallGarageDoorLocked','ItemLockBox','ItemVault','ItemSledgeHead','ItemSledgeHandle','30m_plot_kit','workbench_kit'];
				_b0x addWeaponCargoGlobal ['ItemToolbox', 1];
				_b0x addWeaponCargoGlobal ['ItemCrowbar', 1];
				_b0x addWeaponCargoGlobal ['ItemEtool', 1];
			};
		};
		if (_option == 9005) then
		{
			_dir = getdir _playerObj;
			_pos = getPos _playerObj;
			_pos = [(_pos select 0)+2*sin(_dir),(_pos select 1)+2*cos(_dir),(_pos select 2)];
			[_dir,_pos,_playerObj] spawn {
				_dir = _this select 0;
				_pos = _this select 1;
				_b0x = 'Foodbox1' createVehicle _pos;
				clearWeaponCargoGlobal _b0x;
				clearmagazinecargoGlobal _b0x;
				_b0x setPosATL _pos;
				{_b0x addMagazineCargoGlobal [_x, 1];} forEach ['ItemVault','ItemSledgeHead','ItemSledgeHandle','storage_shed_kit','30m_plot_kit','workbench_kit'];
				_b0x addMagazineCargoGlobal ['cinder_wall_kit', 15];
				_b0x addMagazineCargoGlobal ['MortarBucket', 10];
				_b0x addMagazineCargoGlobal ['CinderBlocks', 30];
				_b0x addMagazineCargoGlobal ['cinder_garage_kit', 2];
				_b0x addMagazineCargoGlobal ['ItemTankTrap', 6];
				_b0x addMagazineCargoGlobal ['ItemPole', 6];
				_b0x addMagazineCargoGlobal ['ItemComboLock', 2];
				_b0x addMagazineCargoGlobal ['ItemWoodenLadder', 2];
				_b0x addMagazineCargoGlobal ['ItemWoodenStairs', 3];
				_b0x addMagazineCargoGlobal ['metal_floor_kit', 8];
				{_b0x addWeaponCargoGlobal [_x, 1];} forEach
				[
				'ItemToolbox',
				'ItemCrowbar',
				'ItemEtool'
				];
			};
		};
		if (_option == 9006) then
		{
			_dir = getdir _playerObj;
			_pos = getPos _playerObj;
			_pos = [(_pos select 0)+2*sin(_dir),(_pos select 1)+2*cos(_dir),(_pos select 2)];
			[_dir,_pos,_playerObj] spawn {
				_dir = _this select 0;
				_pos = _this select 1;
				_b0x = 'Foodbox1' createVehicle _pos;
				clearWeaponCargoGlobal _b0x;
				clearmagazinecargoGlobal _b0x;
				_b0x setPosATL _pos;
				{_b0x addMagazineCargoGlobal [_x, 1];} forEach ['30m_plot_kit','workbench_kit'];
				{_b0x addMagazineCargoGlobal [_x, 25];} forEach
				[
				'cinder_wall_kit'
				];
				{_b0x addMagazineCargoGlobal [_x, 15];} forEach
				[
				'MortarBucket'
				];
				{_b0x addMagazineCargoGlobal [_x, 50];} forEach
				[
				'CinderBlocks'
				];
				{_b0x addMagazineCargoGlobal [_x, 4];} forEach
				[
				'cinder_garage_kit',
				'ItemComboLock',
				'ItemWoodenLadder'
				];
				{_b0x addMagazineCargoGlobal [_x, 12];} forEach
				[
				'ItemTankTrap',
				'ItemPole'
				];
				{_b0x addMagazineCargoGlobal [_x, 6];} forEach
				[
				'ItemWoodenStairs'
				];
				{_b0x addMagazineCargoGlobal [_x, 15];} forEach
				[
				'metal_floor_kit'
				];
				{_b0x addMagazineCargoGlobal [_x, 2];} forEach
				[
				'ItemVault',
				'ItemSledgeHead',
				'ItemSledgeHandle',
				'storage_shed_kit'
				];
				{_b0x addWeaponCargoGlobal [_x, 2];} forEach
				[
				'ItemToolbox',
				'ItemCrowbar',
				'ItemEtool'
				];
			};
		};
	};
	fnc_plr_LoginRecord =
	{
		_array = (_this select 1);
		_playerUID = _array select 0;
		_charID = _array select 1;
		_state = _array select 2;
		if (_state == 0) then
		{
			{
				if (!isNull _x) then
				{
					_xuid = getPlayerUID _x;
					if (_xuid != '') then
					{
						if (_xuid == _playerUID) then
						{
							_name = name _x;
							if (_xuid == _playerUID) then
							{
								_id = _array spawn dayz_recordLogin;
								[_xuid,_name,_x] call fnc_infiSTAR_PlayerLog;
							}
							else
							{
								if (isNil 'PVAH_AHBANA') then {PVAH_AHBANA = [];} else {if (typeName PVAH_AHBANA != 'ARRAY') then {PVAH_AHBANA = [];};};
								if (!(_xuid in PVAH_AHBANA) || !(_name in PVAH_AHBANA)) then
								{
									_log = format['%1',_xuid];(infiSTAR_DLL_PATH+'infiSTARwriteBan') callExtension (_log);
									PVAH_AHBANA = PVAH_AHBANA + [_xuid,_name];
									publicVariable 'PVAH_AHBANA';
								};
								_log = format ['%1 (%2) | ServerUID   не совпадает с   ClientUID (%2/%3)',_name,_xuid,_playerUID];
								diag_log ('[АнтиЧит]: '+_log);
								(infiSTAR_DLL_PATH+'HackLog') callExtension (format['%1%2',_log,DAYZ_INSTANCE_LOGGING]);
								PV_hackerL0og = PV_hackerL0og + [[_log,'','0','1','0','0',[]]];
								publicVariable 'PV_hackerL0og';
								[_xuid,_name,_x] spawn fnc_infiSTAR_Serverkick;
							};
						};
					};
				};
			} forEach playableUnits;
		};
	};
	server_onPlayerConnect_infiSTAR =
	{
		_uid = _this select 0;
		_name = _this select 1;
		_log = format ['[АнтиЧит]: Соединение игрока: _uid: %1   _name: %2',_uid,_name];
		diag_log (_log);
		[_uid,_name] call fnc_infiSTAR_PlayerLog;
	};
	server_onPlayerDisconnect_infiSTAR =
	{
		_uid = _this select 0;
		_name = _this select 1;
		if (!isNil 'DZE_PlayerZed') then
		{
			{
				_xuid = getPlayerUID _x;
				if (_xuid == _uid) exitWith
				{
					if (!isNull _x) then
					{
						_playerObj = _x;
						_bcpk = unitBackpack _playerObj;
						if (!isNull _bcpk) then
						{
							_bcpkT = typeOf _bcpk;
							{
								_exit = false;
								_obj = _x;
								if (!isNull _obj) then
								{
									_bpc = getBackpackCargo _obj;
									if (str _bpc != '[[],[]]') then
									{
										_types = _bpc select 0;
										if (_bcpkT in _types) then
										{
											_log = format ['%1 (%2) | отсоединение вблизи %3 %4 - возможен дюп!',_name,_xuid,typeOf _obj,_bpc];
											diag_log ('[АнтиЧит]: [Журнал]: '+_log);
											(infiSTAR_DLL_PATH+'SurveillanceLog') callExtension (format['%1%2',_log,DAYZ_INSTANCE_LOGGING]);
											PV_SurveillanceLog = PV_SurveillanceLog + [[[_name,_xuid,_log],'','0','1','0','0',[]]];
											publicVariable 'PV_SurveillanceLog';
											_exit = true;
										};
									};
								};
								if (_exit) exitWith {};
							} forEach (nearestObjects [_playerObj, ['All'],4]);
						};
					};
				};
			} forEach playableUnits;
		};
		[_uid,_name] call server_onPlayerDisconnect;
	};
	waitUntil {!isNil 'fnc_AdminReq'};
	_fnc_plr_LoginRecord = fnc_plr_LoginRecord;
	_server_onPlayerConnect_infiSTAR = server_onPlayerConnect_infiSTAR;
	_server_onPlayerDisconnect_infiSTAR = server_onPlayerDisconnect_infiSTAR;
	_fnc_infiSTAR_Serverkick = fnc_infiSTAR_Serverkick;
	_fnc_WriteLogReq = fnc_WriteLogReq;
	_fnc_AdminReq = fnc_AdminReq;
	_fnc_AdminReqProceed = fnc_AdminReqProceed;
	while {1 == 1} do
	{
		server_onPlayerConnect_infiSTAR = _server_onPlayerConnect_infiSTAR;
		server_onPlayerDisconnect_infiSTAR = _server_onPlayerDisconnect_infiSTAR;
		onPlayerConnected {[_uid,_name] call server_onPlayerConnect_infiSTAR;};
		onPlayerDisconnected {[_uid,_name] call server_onPlayerDisconnect_infiSTAR;};
		fnc_infiSTAR_Serverkick = _fnc_infiSTAR_Serverkick;
		fnc_WriteLogReq = _fnc_WriteLogReq;
		fnc_AdminReq = _fnc_AdminReq;
		fnc_AdminReqProceed = _fnc_AdminReqProceed;
		fnc_plr_LoginRecord = _fnc_plr_LoginRecord;
		'PVAH_WriteLogReq' addPublicVariableEventHandler {_this call fnc_WriteLogReq;};
		'PVAH_AdminReq' addPublicVariableEventHandler {_this call fnc_AdminReq;};
		'PVDZE_plr_LoginRecord' addPublicVariableEventHandler {_this call fnc_plr_LoginRecord;};
		uiSleep 10;
	};
};
[] spawn {
	waitUntil {!isNil 'sm_done'};
	uiSleep 30;
	{
		_x addMPEventHandler ["MPKilled",{_this call infiSTAR_object_handleServerKilled;}];
	} forEach ([0,0,0] nearEntities [['LandVehicle','Air','Ship'], 10000000]);
	infiSTAR_object_handleServerKilled =
	{
		private['_unit','_objectID','_objectUID','_source','_entities'];
		_unit = _this select 0;
		_source = _this select 1;
		_log = '';
		_objectID 	= _unit getVariable['ObjectID','0'];
		_objectUID 	= _unit getVariable['ObjectUID','0'];
		_worldSpace = [getDir _unit,getPosATL _unit];
		_nearby = [];
		_entities = _unit nearEntities [['Man'], 200];
		{
			if (!isNull _x) then
			{
				_nearguy = _x;
				if (getPlayerUID _nearguy != '') then
				{
					{
						if (!isNull _x) then
						{
							if (getPlayerUID _x != '') then
							{
								_logN = format['%1 (%2)',name _x,getPlayerUID _x];
								if !(_logN in _nearby) then
								{
									_nearby = _nearby + [_logN];
								};
							};
						};
					} forEach (crew vehicle _nearguy);
				};
			};
		} forEach _entities;
		
		_name = '';
		_uid = getPlayerUID _source;
		if (_uid != '') then
		{
			_name = name _source;
		};
		
		if (locked _unit) then
		{
			if (_uid != '') then
			{
				_log = format['Уничтожение закрытой техники из: %9 @%7 игроком: %1 (%2) - %3, в координатах: %4, objID: %5, objUID: %6, вблизи: %8',_name,_uid,typeOf _unit,_worldSpace,_objectID,_objectUID,mapGridPosition position _unit,_nearby,weaponState _source];
			}
			else
			{
				_log = format['Уничтожение закрытой техники: @%5 - %1, координаты: %2, objID: %3, objUID: %4, вблизи: %6',typeOf _unit,_worldSpace,_objectID,_objectUID,mapGridPosition position _unit,_nearby];
			};
		}
		else
		{
			if (_uid != '') then
			{
				_log = format['Уничтожение техники из: %9 @%7 игроком: %1 (%2) - %3, координаты: %4, objID: %5, objUID: %6, nearby %8',_name,_uid,typeOf _unit,_worldSpace,_objectID,_objectUID,mapGridPosition position _unit,_nearby,weaponState _source];
			}
			else
			{
				_log = format['Уничтожение техники: @%5 - %1, координаты %2, objID: %3, objUID: %4, вблизи: %6',typeOf _unit,_worldSpace,_objectID,_objectUID,mapGridPosition position _unit,_nearby];
			};
		};
		diag_log _log;
		(infiSTAR_DLL_PATH+'SurveillanceLog') callExtension (format['%1%2',_log,DAYZ_INSTANCE_LOGGING]);
		PV_SurveillanceLog = PV_SurveillanceLog + [[[_name,_uid,_log],'','0','1','0','0',[]]];
		publicVariable 'PV_SurveillanceLog';
		true
	};
};
[] spawn {
	waitUntil {!isNil 'sm_done'};
	'PVDZE_obj_Delete' addPublicVariableEventHandler
	{
		_array = _this select 1;
		_id = _array select 0;
		_uid = _array select 1;
		_playerObj = _array select 2;
		if (_playerObj in ['']) exitWith {};
		if (typeName _playerObj != 'OBJECT') exitWith {};
		_clientUID = (getPlayerUID _playerObj);
		if (_clientUID == '') exitWith {};
		_clientName = (name _playerObj);
		_pos = getPosATL _playerObj;
		diag_log format ['[АнтиЧит]: [Журнал]: Удален объект с ID:%1 UID:%2 Удалил: %3(%4) @%5 координаты: %6',_id,_uid,_clientName,_clientUID,mapGridPosition _pos,_pos];
		_array call server_deleteObj;
	};
	'PVDZE_send' addPublicVariableEventHandler {
		(_this select 1) call server_sendToClient;
		private ['_unit','_variable','_arraytosend','_source','_humanityHit','_arr'];
		_arr = (_this select 1);
		_unit = _arr select 0;
		_variable = _arr select 1;
		_arraytosend = _arr select 2;
		if (_variable == 'Humanity') then
		{
			_source = _arraytosend select 0;
			_humanityHit = _arraytosend select 1;
			if (abs _humanityHit > 12000) then
			{
				if (!isNull _source) then
				{
					_clientUID = getPlayerUID _source;
					if (_clientUID != '') then
					{
						_clientName = name _source;
						
						if (isNil 'PVAH_AHBANA') then {PVAH_AHBANA = [];} else {if (typeName PVAH_AHBANA != 'ARRAY') then {PVAH_AHBANA = [];};};
						if (!(_clientUID in PVAH_AHBANA) || !(_clientName in PVAH_AHBANA)) then
						{
							_log = format['%1',_clientUID];(infiSTAR_DLL_PATH+'infiSTARwriteBan') callExtension (_log);
							PVAH_AHBANA = PVAH_AHBANA + [_clientUID,_clientName];
							publicVariable 'PVAH_AHBANA';
						};
						
						_log = format ['%1 (%2) - Significant humanity change (%3)!.. damage hack?',_clientName,_clientUID,_humanityHit];
						diag_log ('[АнтиЧит]: [Журнал]: '+_log);
						(infiSTAR_DLL_PATH+'HackLog') callExtension (format['%1%2',_log,DAYZ_INSTANCE_LOGGING]);
						PV_hackerL0og = PV_hackerL0og + [[_log,'','0','1','0','0',[]]];
						publicVariable 'PV_hackerL0og';
						[_clientUID,_clientName,_source] spawn fnc_infiSTAR_Serverkick;
					};
				};
			};
		};
		if (_variable == 'SafeZoneState') then
		{
			_state = _arraytosend select 0;
			_pos = getPosATL _unit;
			_GPS = mapGridPosition _pos;
			_msg = '   Entered SafeZone';
			if (_state == 0) then
			{
				_msg = '   Left SafeZone';
			};
			_log = format ['%1(%2) - %3 @%4',name _unit,getPlayerUID _unit,_msg,_GPS];
			diag_log ('[АнтиЧит]: [Журнал]: '+_log);
			(infiSTAR_DLL_PATH+'SafeZone') callExtension (format['%1%2',_log,DAYZ_INSTANCE_LOGGING]);
		};
	};
	if (!isNil 'server_logUnlockLockEvent') then
	{
		server_logUnlockLockEvent = {
			private['_obj','_player','_objectID','_objectUID','_pos','_worldspace','_log','_codeEntered','_doorCode','_status','_statusText'];
			_obj = _this select 1;
			if (!isNull _obj) then
			{
				_player = _this select 0;
				_objectID = _obj getVariable['ObjectID', '0'];
				_objectUID = _obj getVariable['ObjectUID', '0'];
				
				_log = '';
				if (count _this > 3) then
				{
					_codeEntered = _this select 3;
					if (_codeEntered == 'NOTHING ENTERED') then {_player setDamage 5;_codeEntered = '-HACKER KILLED-';};
					if (_codeEntered == '') then {_codeEntered = '000';};
					_doorCode = _this select 4;
					if (_codeEntered==_doorCode) then
					{
						_log = format['Дверь открыта: ID:%1 UID:%2 Игрок: %3(%4) @%5 Введен код: %6',_objectID,_objectUID,(name _player),(getPlayerUID _player),(mapGridPosition (getPos _obj)),_codeEntered];
					}
					else
					{
						_log = format['Попытка открыть дверь: ID:%1 UID:%2 Игрок: %3(%4) @%5 Введенный код: %6 | Правильный код: %7',_objectID,_objectUID,(name _player),(getPlayerUID _player),(mapGridPosition (getPos _obj)),_codeEntered,_doorCode];
					};
				}
				else
				{
					_status = _this select 2;
					_statusText = 'UNLOCKED';
					if (_status) then
					{
						[_obj, 'gear'] call server_updateObject;
						_statusText = 'LOCKED';
					};
					_log = format['Сейф %6: ID:%1 UID:%2 Игрок %3(%4) @%5', _objectID, _objectUID, (name _player), (getPlayerUID _player), (mapGridPosition (getPos _obj)), _statusText];
				};
				diag_log ('[АнтиЧит]: [Журнал]: '+_log);
				(infiSTAR_DLL_PATH+'logUnlockLock') callExtension (format['%1%2',_log,DAYZ_INSTANCE_LOGGING]);
			};
		};
	};
};
diag_log ("[АнтиЧит]: Полностью загружен");