private ["_i","_uid","_uid_count","_result_array", "_path"];
Terminal_Start	=	true;
_path	=	(Ultima_Server_Scripts_Path + "terminal\");
[] call compile preprocessFileLineNumbers (_path + "configs.sqf");
[] call compile preprocessFileLineNumbers (_path + "functions.sqf");
[] call compile preprocessFileLineNumbers (_path + "PVEH.sqf");
"ultima_ini" callExtension format["0|%1BD.ini|1", Ultima_ini_Files];
Ultima_Date		=	"ultima_ini" callExtension "11";	//	Текущая дата и время
diag_log("[#Ultima]: [Терминал торговли]: DLL Старт передачи данных!");
_uid_count	=	parseNumber("ultima_ini" callExtension format["%1|%2",2,"auction"]);
Terminal_Array	=	[];
Ultima_Cash		=	[];	//	Наличка
Ultima_Deposite	=	[];	//	Депозит - наличка с продажи
for "_i" from 0 to _uid_count do
	{
		_uid			=	"ultima_ini" callExtension format["%1|%2|%3",4,"auction",_i];
		_result_array	=	"ultima_ini" callExtension format["%1|%2|%3",10,"auction",_uid];
		_result_array	=	call compile format ["%1", _result_array];
		Terminal_Array set [count Terminal_Array,_result_array];
	};
diag_log(format["[#Ultima]: [Терминал торговли]: [Аукцион]: Передано записей: %1",_uid_count]);

	
_uid_count	=	parseNumber("ultima_ini" callExtension format["%1|%2",2,"cash"]);
for "_i" from 0 to _uid_count do
	{
		_uid			=	"ultima_ini" callExtension format["%1|%2|%3",4,"cash",_i];
		_result_array	=	"ultima_ini" callExtension format["%1|%2|%3",10,"cash",_uid];
		_result_array	=	call compile format ["%1", _result_array];
		Ultima_Cash set [count Ultima_Cash,_result_array];
	};
diag_log(format["[#Ultima]: [Терминал торговли]: [Наличные]: Передано записей: %1",_uid_count]);

_uid_count	=	parseNumber("ultima_ini" callExtension format["%1|%2",2,"deposite"]);
for "_i" from 0 to _uid_count do
	{
		_uid			=	"ultima_ini" callExtension format["%1|%2|%3",4,"deposite",_i];
		_result_array	=	"ultima_ini" callExtension format["%1|%2|%3",10,"deposite",_uid];
		_result_array	=	call compile format ["%1", _result_array];
		Ultima_Deposite set [count Ultima_Deposite,_result_array];
	};
diag_log(format["[#Ultima]: [Терминал торговли]: [Депозит]: Передано записей: %1",_uid_count]);

diag_log("[#Ultima]: [Терминал торговли]: Запуск сортировки массивов");
Private ["_strArray"];
_strArray	=
	[
		"pistols"
		,"shotguns"
		,"rifles"
		,"machineguns"
		,"sniperrifles"
		,"ammo_pistols"
		,"ammo_shotguns"
		,"ammo_rifles"
		,"ammo_machineguns"
		,"ammo_sniperrifles"
		,"ammo_bombs"
		,"woods"
		,"stones"
		,"materials"
		,"constructions"
		,"bikes"
		,"cars"
		,"jeeps"
		,"cargos"
		,"military_no_weapons"
		,"military_with_weapons"
		,"airships"
		,"helis"
		,"helis_weapons"
		,"ships"
		,"ships_with_weapons"
		,"medicals"
		,"foodother"
		,"tools"
		,"parts"
	];
{
	[_x] call Terminal_ReSort_Array;
	diag_log(format["[#Ultima]: [Терминал торговли]: Завершена сортировка массива: %1",_x]);
} forEach _strArray;
diag_log("[#Ultima]: [Терминал торговли]: Сортировка всех массивов завершена");

Terminal_Start	=	nil;
