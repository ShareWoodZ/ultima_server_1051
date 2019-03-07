Private ["_disable_timer", "_timer"];
_disable_timer	=	30;	//	Интервал(в секундах) для блокировки меню выхода, после доступа к инвентарю.
_timer			=	0;
disableSerialization;
waituntil {!isnull (finddisplay 46)};
sleep 3;
while {true} do
	{
		if !(isNull (findDisplay 106)) then
			{_timer	=	_disable_timer;};
		if (_timer > 0) then
			{
				_timer	=	_timer - 0.5;
				if !(isnull (finddisplay 49)) then
					{
						findDisplay 106 closeDisplay 1;
						finddisplay 49 closeDisplay 2;
						systemChat(format["[АнтиДюп]: Вы не cможете выйти еще: %1 сек. после доступа к инвентарю", _timer]);
					};
			};
		uiSleep 0.5;
	};