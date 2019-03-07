private["_modVariant"];
waitUntil{initialized};
sleep 30;
if (!isServer) exitWith { diag_log format ["[DZMS]: <ОШИБКА> DZMS установлен не корректно! DZMS не запущен!"]; };
if (!isnil("DZMSInstalled")) exitWith { diag_log format ["[DZMS]: <ОШИБКА> DZMS установлен дважды или некорректно!"]; };
DZMSInstalled	=	true;
diag_log format ["[DZMS]: Запуск миссий."];
if ( (isnil("DZAI_isActive")) && (isnil("SAR_version")) && (isnil("WAIconfigloaded")) ) then
	{
		diag_log format ["[DZMS]: Искуственный интеллект не найден! Используется DZMS интеллект."];
		createCenter east;
		WEST setFriend [EAST,0];
		EAST setFriend [WEST,0];
		EAST setFriend [CIVILIAN,0];
		CIVILIAN setFriend [EAST,0];
	}
else
	{
		DZMSRelations	=	0;
		if (!isnil("DZAI_isActive")) then
			{
				diag_log format ["[DZMS]: Обнаружено DZAI!"];
				DZMSRelations	=	DZMSRelations + 1;
			};
		if (!isnil("SAR_version")) then
			{
				diag_log format ["[DZMS]: Обнаружено SargeAI!"];
				DZMSRelations	=	DZMSRelations + 1;
			};
		if (!isnil("WAIconfigloaded")) then
			{
				diag_log format ["[DZMS]: Обнаружено WickedAI!"];
				DZMSRelations	=	DZMSRelations + 1;
			};
		if (DZMSRelations > 1) then
			{
				diag_log format ["[DZMS]: Обнаружены множественные ИИ! Возможны конфликты!"];
				diag_log format ["[DZMS]: Во избежании конфликтов, используйте один из ИИ! (DZAI, Sarge, или WAI)"];
			};
		DZMSRelations	=	nil;
	};
call compile preprocessFileLineNumbers "\z\addons\dayz_server\DZMS\DZMSConfig.sqf";
waitUntil {DZMSConfigured};
DZMSConfigured = nil;
call compile preprocessFileLineNumbers "\z\addons\dayz_server\DZMS\ExtConfig\DZMSWeaponCrateList.sqf";
call compile preprocessFileLineNumbers "\z\addons\dayz_server\DZMS\ExtConfig\DZMSAIConfig.sqf";
diag_log format ["[DZMS]: Текущая версия: %1", DZMSVersion];
if (DZMSVersion != "RC1.1") then
	{
		diag_log format ["[DZMS]: Обнаружена старая версия! Пожалуйста обновите DZMS!"];
		diag_log format ["[DZMS]: Старые версии не поддерживаются автором!"];
	};
diag_log format ["[DZMS]: Загружается конфигурация миссии!"];
DZMSWorldName	=	toLower format ["%1", worldName];
diag_log format["[DZMS]: Карта определена как %1. Применяются настройки для карты!", DZMSWorldName];
_modVariant	=	toLower( getText (configFile >> "CfgMods" >> "DayZ" >> "dir"));
if (_modVariant == "@dayz_epoch") then
	{DZMSEpoch = true;}
else
	{DZMSEpoch = false;};
if (DZMSEpoch) then
	{diag_log format ["[DZMS]: Определение версии DayZ: Определено как - Эпоха! Корректировка скриптов!"];};
call compile preprocessFileLineNumbers "\z\addons\dayz_server\DZMS\DZMSFunctions.sqf";
[] ExecVM DZMSMajTimer;
[] ExecVM DZMSMinTimer;
[] ExecVM DZMSMarkerLoop;