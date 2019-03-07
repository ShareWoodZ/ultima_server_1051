private ["_veh","_wveh","_mags","_mtip","_mcount"];
while {alive player} do
	{
		if (vehicle player != player && vehicle player isKindOf "AllVehicles" &&((count (weapons (vehicle player) )) > 0)) then
			{
				_veh	=	vehicle player;
				_wveh	=	weapons _veh;
				_mags	=	magazines _veh;
				_mtip	=	_mags select 0;
				_mcount	=	count _mags;
				if (_mcount > 0) then
					{_veh setVariable ["wveh",[_mtip,_mcount],true];}
				else
					{ _veh setVariable ["wveh",[],true];};
				PVDZE_veh_Update = [_veh, "vup"];
				publicVariableServer "PVDZE_veh_Update";
			};
		sleep 10;
	};