Private ["_baseRadius", "_basePos", "_cost"];
_baseRadius		=	((_this select 3) select 0);
_basePos		=	((_this select 3) select 1);
_cost			=	((_this select 3) select 2);
_admin_money	=	player getVariable ["admin_money", 0];
if ( (_admin_money - _cost) < 0 ) exitWith
	{systemChat "У вас недостаточно монет для оплаты!";};
Terminal_Server	=	[player, "base_defense", [_baseRadius, _basePos]];
publicVariableServer "Terminal_Server";
