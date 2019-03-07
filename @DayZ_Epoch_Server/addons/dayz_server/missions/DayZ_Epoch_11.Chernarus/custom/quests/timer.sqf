diag_log ("[#Ultima]: [Миссии]: Старт скрипта таймера.");
Private ["_real_time", "_i", "_rec", "_unit", "_uid"];
while {true} do
	{
		_real_time	=	diag_tickTime;
		for "_i" from ( (count Ultima_Quest_Timer) -1 ) to 0 step -1 do
			{
				_rec	=	(Ultima_Quest_Timer select _i);
				_uid	=	(_rec select 0);
				_unit	=	false;
				{
					if ( _uid == (getPlayerUID _x) ) exitWith
						{_unit	=	true;};
				} forEach playableUnits;
				if !(_unit) then
					{
						Ultima_Quest_Timer	set [_i, -1];
						Ultima_Quest_Timer	=	Ultima_Quest_Timer - [-1];
					}
				else
					{
						if ( (_real_time - (_rec select 2)) > (_rec select 3) ) then
							{
								{
									if ( _uid == (getPlayerUID _x) ) exitWith
										{
											[(owner _x), ["error", format["Истекло время выделенное на миссию: %1.", (_rec select 1)]]] call Terminal_Server_to_Client_Send;
											[(owner _x), ["quest_expaired", (_rec select 1)]] call Terminal_Server_to_Client_Send;											
										};
								} forEach playableUnits;
								Ultima_Quest_Timer	set [_i, -1];
								Ultima_Quest_Timer	=	Ultima_Quest_Timer - [-1];
							};
					};
			};
		uiSleep 3;
	};