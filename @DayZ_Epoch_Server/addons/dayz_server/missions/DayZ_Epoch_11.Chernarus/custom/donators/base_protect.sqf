private ["_i", "_pos", "_radius", "_aliving", "_uid"];	
while { true } do
	{
		for "_i" from 0 to (count Ultima_Base_Defense) -1 do
			{
				_radius		=	(((Ultima_Base_Defense	select _i) select 2) select 0);
				_pos		=	(((Ultima_Base_Defense	select _i) select 2) select 1);
				_aliving	=	(((Ultima_Base_Defense	select _i) select 2) select 2);
				{
					if ( (isPlayer _x) && (alive _x) && ((_x distance _pos) < _radius) ) then
						{
							_uid	=	(getPlayerUID _x);
							if ( !(_uid in _aLiving) && !(_uid in Ultima_Admins) ) then
								{_x setVariable ["ultima_base_defense", [_radius, _pos, false], true];}
							else
								{_x setVariable ["ultima_base_defense", [_radius, _pos, true], true];}
						};
				} forEach playableUnits;
			};
		sleep 1;
	};