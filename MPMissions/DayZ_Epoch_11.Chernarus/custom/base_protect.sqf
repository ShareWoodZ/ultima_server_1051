Private ["_base", "_defense_timer"];
while {true} do
	{
		_base	=	player getVariable ["ultima_base_defense", [0]];
		if ( (_base select 0) != 0 ) then
			{
				if ( (player distance (_base select 1)) < (_base select 0) ) then
					{
						if (_base select 2) then
							{
								if ( (player getVariable ["base_message", 0]) == 0 ) then
									{
										player setVariable ["base_message", 1];
										taskHint [localize "Ultima_Base_Under_Protection", [0, 1, 0, 1], "taskDone"];
									};
								{
									if (!isNull _x) then
										{
											if !(isPlayer _x) then
												{_x setPos [0, 0, 0];};
										};
								} forEach (player nearEntities ["zZombie_Base", 15]);
							}
						else
							{
								_defense_timer	=	player getVariable ["base_defense_timer", 0];
								if (_defense_timer	==	0) then
									{taskHint [localize "Ultima_Base_15_seconds", [1,0,0.1,1], "taskFailed"];};
								_defense_timer	=	_defense_timer + 1;
								player setVariable ["base_defense_timer", _defense_timer + 1];
								if (_defense_timer > 15) exitWith
									{player setdamage 1;};
							};
					}
				else
					{
						player setVariable ["ultima_base_defense", [0], true];
						player setVariable ["base_defense_timer", 0];
						if ( (_base select 2) && (player getVariable ["base_message", 0]) == 1 ) then
							{
								player setVariable ["base_message", 0];
								taskHint [localize "Ultima_Base_Leave", [1,0,0.1,1], "taskFailed"];
							}
						else
							{
								if (alive player) then
									{taskHint [localize "Ultima_Base_Leave", [0, 1, 0, 1], "taskDone"];};
							};
					};
			};
		uiSleep 1;
	};