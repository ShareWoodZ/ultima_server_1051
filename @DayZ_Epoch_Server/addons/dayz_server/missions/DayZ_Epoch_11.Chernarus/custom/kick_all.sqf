Private ["_kick_times", "_kick_time", "_date"];
//	Время в которое надо кикнуть игроков
_kick_times	=	["21:59", "01:59", "05:59", "09:59", "13:59", "17:59"];
_kick_time	=	false;
while {true} do
	{
		_date	=	"ultima_kickall" callExtension "1";
		{
			if (_date == _x) exitWith
				{
					_kick_time	=	true;
					//	IP сервера, Port, RCon пароль
					"ultima_kickall" callExtension "0|109.87.105.231|2302|3805314464";
				};
		} forEach _kick_times;
		if (_kick_time) exitWith {};
		uiSleep 10;
	};