if ((getPlayerUID player) in Ultima_Admins) exitWith {};
private ["_maxSeconds", "_seconds"];
_maxSeconds	=	10;
_seconds	=	0;
while {true} do
	{
		waitUntil {(!isNull findDisplay 55) and (!isNull findDisplay 63) and (ctrlText ((findDisplay 63) displayCtrl 101) == localize "STR_CHANNEL_SIDE")};
		cutText ["НЕ ГОВОРИТЕ В ОБЩИЙ КАНАЛ СВЯЗИ!", "PLAIN"];
		systemChat format["При повторном разговоре в общий канал, Вы будете убиты через: %1 сек.", (_maxSeconds - _seconds)];
		if (_seconds >= _maxSeconds) then
			{player setDamage 1;};  
		_seconds	=	_seconds + 1;
		sleep 1;
	};