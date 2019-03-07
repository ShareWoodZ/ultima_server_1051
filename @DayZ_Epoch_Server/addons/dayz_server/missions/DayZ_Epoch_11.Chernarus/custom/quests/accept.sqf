Private ["_player", "_uid", "_mission", "_end_time", "_double", "_start_time"];
_player			=	(_this select 0);
_mission		=	((_this select 2) select 0);
_end_time		=	((_this select 2) select 1);
_uid			=	getPlayerUID _player;
_double			=	false;
{
	if ( (_uid == (_x select 0)) && (_mission == (_x select 1)) ) exitWith
		{_double = true;};
} forEach Ultima_Quest_Timer;
if (_double) exitWith {};
if (_mission == "Инстанс 1") then
	{
		if !(_player in Ultima_Quest_Instance_Wait) then
			{_double	=	[_player] call Ultima_Quest_Instance_Registration;}
		else
			{_double	=	true;};
	};
if (_double) exitWith {};
_start_time		=	diag_tickTime;
Ultima_Quest_Timer	set [count Ultima_Quest_Timer, [_uid, _mission, _start_time, _end_time]];
[(owner _player), ["message", format["Миссия: %1, принята!", _mission]]] call Terminal_Server_to_Client_Send;