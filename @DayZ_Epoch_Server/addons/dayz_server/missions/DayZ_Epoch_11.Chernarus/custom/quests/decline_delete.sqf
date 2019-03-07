Private ["_player", "_uid", "_rec", "_i", "_decline"];
_player		=	(_this select 0);
_mission	=	((_this select 2) select 0);;
_decline	=	((_this select 2) select 1);
_uid		=	getPlayerUID _player;
for "_i" from ((count Ultima_Quest_Timer) - 1) to 0 step -1 do
	{
		_rec	=	(Ultima_Quest_Timer select _i);
		if ( (_uid == (_rec select 0)) && (_mission == (_rec select 1)) ) exitWith
			{
				Ultima_Quest_Timer	set [_i, -1];
				Ultima_Quest_Timer	=	Ultima_Quest_Timer - [-1];
			};
	};
if (_decline) then
	{
		Terminal_Client =	["error", format["Миссия: %1, - отменена!", _mission]];
		(owner _player) publicVariableClient "Terminal_Client";
	};