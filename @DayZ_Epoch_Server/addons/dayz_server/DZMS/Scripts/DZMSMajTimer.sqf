private["_varName"];
diag_log format ["[DZMS]: Запуск таймера Мажор-миссий!"];
if ( (count DZMSMajorArray) == 0) exitWith
	{diag_log ("[DZMS]: Отсутствуют миссии в массиве DZMSMajorArray.");};
while {true} do
	{
		_varName	=	DZMSMajorArray select (floor (random (count DZMSMajorArray) ) );
		//	Ждем минимальный интервал до запуска миссии
		sleep DZMSMajorMin;
		//	Ждем еще.(Случайно от 0 до максимального интервала запуска миссии).
		sleep (floor (random DZMSMajorMax));
		DZMSMajDone	=	false;
		[] execVM format ["\z\addons\dayz_server\DZMS\Missions\Major\%1.sqf",_varName];
		diag_log format ["[DZMS]: Старт Мажор миссии: %1.",_varName];
		waitUntil {DZMSMajDone};
	};