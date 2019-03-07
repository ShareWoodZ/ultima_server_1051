diag_log("[#Ultima]: [Создание рудников]: Старт скрипта...");
Private ["_obj", "_pos", "_a_veins", "_a_pos", "_veins_random_count"];
_veins_random_count	=	0;	//	Если не равно нулю, - будут созданы динамические рудники в случайных позициях.
_a_pos	=					//	Если массив не пуст, - будут созданы статические рудники в указанных позициях.
	[
		[6384, 13865, 0]
	];

//	Массив рудников которые можно спавнить динамически
_a_veins	=
	[
		"Iron_Vein_DZE"
		,"Silver_Vein_DZE"
		,"Gold_Vein_DZE"
	];


_pos	=	[6384, 13865, 0];
_obj	=	createVehicle ["Gold_Vein_DZE", _pos, [], 0, "CAN_COLLIDE"];
_obj enableSimulation false;
_obj setDir round(random 360);
_obj setpos _pos;
_obj setVariable ["ObjectID","1",true];
diag_log("[#Ultima]: [Создание рудников]: Создание завершено.");