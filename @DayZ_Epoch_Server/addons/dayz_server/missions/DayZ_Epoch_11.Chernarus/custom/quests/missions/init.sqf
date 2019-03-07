Private ["_folder"];
_folder	=	(Ultima_Server_Scripts_Path + "quests\missions\"); // Рабочая папка для компиляции.
[] call compile preprocessFileLineNumbers (_folder + "functions.sqf");
Ultima_Quest_Instance_Buildings_Create	=	compile preprocessFileLineNumbers (_folder + "buildings.sqf");
Ultima_Quest_Instance_Bots_Create		=	compile preprocessFileLineNumbers (_folder + "bots.sqf");
Ultima_Quest_Instance_Start				=	false;
Ultima_Quest_Instance_Wait				=	[];	//	Ожидающие очереди
Ultima_Quest_Instance_End				=	[];	//	Чтобы не брали задания повторно
sleep 30;
[] execVM (_folder + "instance.sqf");