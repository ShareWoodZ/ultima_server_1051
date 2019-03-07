Private ["_player", "_humanity"];
_player		=	(_this select 0);
_humanity	=	_player getVariable ["humanity", 0];
_player setVariable["humanity", _humanity + 100, true];