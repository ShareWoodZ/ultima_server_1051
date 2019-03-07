[] call compile preprocessFileLineNumbers "custom\donators\donator_configs.sqf";
[] call compile preprocessFileLineNumbers "custom\donators\donator_terminal.sqf";
Defense_Add_Friend	=	compile preprocessFileLineNumbers "custom\donators\defense_add_friend.sqf";
[] execVM "custom\donators\donator_actions.sqf";

donator_open_dialog	=	compile preprocessFileLineNumbers "custom\donators\donator_terminal_dialog.sqf";

disableSerialization;
waituntil {!isnull (finddisplay 46)};
systemChat ("Терминал донаторов: Shift+4");
(findDisplay 46) displayAddEventHandler["KeyUp", "if ( (_this select 1 == 5) && (_this select 2) ) then {[] call donator_open_dialog};"];
diag_log ("[#Ultima]: [Терминал донаторов]: Скрипт инициализирован, и работает.");