Private ["_uid", "_base", "_baseRadius", "_basePos", "_test"];
_uid		=	(_this select 0);
_test		=	_uid;
_test		=	toArray _test;
if ( (count _test) != 17 ) exitWith
	{systemChat "Не правильный формат ID друга!";};
_base		=	player getVariable ["ultima_base_defense", []];
if ( (count _base) < 1 ) exitWith {};
_baseRadius	=	(_base select 0);
_basePos	=	(_base select 1);
Terminal_Server	=	[player, "base_add_friend", [_baseRadius, _basePos, _uid]];
publicVariableServer "Terminal_Server";