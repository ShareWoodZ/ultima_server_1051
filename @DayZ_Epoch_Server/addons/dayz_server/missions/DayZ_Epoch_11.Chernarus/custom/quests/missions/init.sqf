Private ["_folder"];
_folder	=	(Ultima_Server_Scripts_Path + "quests\missions\"); // ������� ����� ��� ����������.
[] call compile preprocessFileLineNumbers (_folder + "functions.sqf");
Ultima_Quest_Instance_Buildings_Create	=	compile preprocessFileLineNumbers (_folder + "buildings.sqf");
Ultima_Quest_Instance_Bots_Create		=	compile preprocessFileLineNumbers (_folder + "bots.sqf");
Ultima_Quest_Instance_Start				=	false;
Ultima_Quest_Instance_Wait				=	[];	//	��������� �������
Ultima_Quest_Instance_End				=	[];	//	����� �� ����� ������� ��������
sleep 30;
[] execVM (_folder + "instance.sqf");