#include "spawn_markers\markers_chernarus.sqf"	//Load manual spawn point definitions file.

if ((DZAI_maxHeliPatrols > 0) or {(DZAI_maxLandPatrols > 0)}) then
	{
		"DZAI_centerMarker" setMarkerPos [7652.9634, 7870.8076];
		"DZAI_centerMarker" setMarkerSize [5500, 5500];
	};
waitUntil {sleep 0.1; !isNil "DZAI_classnamesVerified"};

if (DZAI_staticAI) then
	{
		#include "spawn_areas\areas_chernarus.sqf"		//Load spawn area definitions file.

		//Имя маркера, [Минимум ИИ, Максимум ИИ], [маркеры для точек возрождения]
		//(Оставьте массив пустым, для выбора точек возрождения вблизи зданий), 
		//Тип экипировки (опционально, требуется если указано кол-во ИИ групп), коллво групп ИИ (опционально)
		["DZAI_Aero_Krasnostav",[0,4],[],0] call DZAI_static_spawn;
		["DZAI_Aero_Bolota",[0,4],[],0] call DZAI_static_spawn;
		["DZAI_Aero_Bash",[0,4],[],0] call DZAI_static_spawn;
		["DZAI_Rad_Zone",[0,4],[],0] call DZAI_static_spawn;	
	};

#include "custom_markers\cust_markers_chernarus.sqf"
#include "custom_spawns\cust_spawns_chernarus.sqf"

diag_log "[DZAI]: Статические точки возрождения для карты Чернорусь, загружены.";
