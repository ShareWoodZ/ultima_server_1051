private["_varName"];
diag_log format ["[DZMS]: Запуск таймера Минор миссий!"];
if ( (count DZMSMinorArray) == 0) exitWith
	{diag_log ("[DZMS]: Отсутствуют миссии в массиве DZMSMinorArray.");};
while {true} do
	{
		_varName	=	DZMSMinorArray select (floor (random (count DZMSMinorArray) ) );
		//	Ждем минимальный интервал до запуска миссии
		sleep DZMSMinorMin;
		//	Ждем еще.(Случайно от 0 до максимального интервала запуска миссии).
		sleep (floor (random DZMSMinorMax));
		DZMSMinDone	=	false;
		[] execVM format ["\z\addons\dayz_server\DZMS\Missions\Minor\%1.sqf",_varName];
		diag_log format ["[DZMS]: Старт Минор миссии: %1.",_varName];
		waitUntil {DZMSMinDone};
	};