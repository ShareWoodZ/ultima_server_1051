diag_log ("[#Ultima]: [Создание предметов]: Старт скрипта...");
//	Инициализация массива крафта
call compile preprocessFileLineNumbers "custom\craft\configs.sqf";
//	Инициализация клиентских функций
call compile preprocessFileLineNumbers "custom\craft\functions.sqf";
disableSerialization;
waituntil {!isnull (finddisplay 46)};
systemChat ("Меню изготовления: Shift+2");
(findDisplay 46) displayAddEventHandler["KeyUp", "if ( (_this select 1 == 3) && (_this select 2) ) then {[] call craft_open_dialog};"];
diag_log ("[[Создание предметов]: Скрипт инициализирован, и работает.");
