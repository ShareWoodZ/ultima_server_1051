Private ["_path"];
_path	=	(Ultima_Server_Scripts_Path + "quests\");
Ultima_Quest_Timer	=	[];
Ultima_Quest_Server_Accept			=	compile preprocessFileLineNumbers (_path + "accept.sqf");
Ultima_Quest_Server_Decline_Delete	=	compile preprocessFileLineNumbers (_path + "decline_delete.sqf");
[] execVM (_path + "timer.sqf");
//	Запуск миссии
[] execVM (_path + "missions\init.sqf");	//	Инстанс 1