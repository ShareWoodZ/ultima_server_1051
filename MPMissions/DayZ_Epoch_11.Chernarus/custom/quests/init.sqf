Ultima_Quests_Accepted	=	[];
[] call compile preprocessFileLineNumbers "custom\quests\variables.sqf";
[] call compile preprocessFileLineNumbers "custom\quests\functions.sqf";
sleep 30;
if (Ultima_Quest_Show_Markers) then
	{[] execVM "custom\quests\markers.sqf"};

disableSerialization;
waituntil {!isnull (finddisplay 46)};
systemChat ("Терминал заданий: Shift+5");
(findDisplay 46) displayAddEventHandler["KeyUp", "if ( (_this select 1 == 6) && (_this select 2) ) then {[] call ultima_quest_open_dialog};"];
