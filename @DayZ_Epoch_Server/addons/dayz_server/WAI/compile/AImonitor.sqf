if (!isServer) exitWith {};
diag_log "[WAI]: Мониторинг ИИ запущен.";
sleep 120;
while {true} do
	{
		if (ai_clean_dead) then
			{
				{
					_killedat = _x getVariable "killedat";
					if (!isNil "_killedat") then
						{
							if ((time - _killedat) >= cleanup_time) then
								{deleteVehicle _x;};
						};
				} forEach allDead;
			};
		diag_log format ["[WAI]: [Мониторинг ИИ]: %1 активных групп", ai_ground_units];
		diag_log format ["[WAI]: [Мониторинг ИИ]: %1 активных установок", ai_emplacement_units];
		diag_log format ["[WAI]: [Мониторинг ИИ]: %1 активных аэро патрулей (экипажей)", ai_air_units];
		diag_log format ["[WAI]: [Мониторинг ИИ]: %1 активных авто патрулей (экипажей)", ai_vehicle_units];
		sleep 600;
	};