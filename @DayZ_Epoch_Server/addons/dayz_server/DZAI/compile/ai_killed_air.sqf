private ["_vehicle","_victim","_unitGroup","_parachuted"];
_victim		=	_this select 0;
_unitGroup	=	_this select 1;
_vehicle	=	(vehicle _victim);
if (!(_vehicle isKindOf "ParachuteBase") && {alive _vehicle}) then
	{
		if ((driver _vehicle) == _victim) then
			{
				_unitGroup setVariable ["unitType","aircrashed"];
				_parachuted = [_vehicle] call DZAI_parachuteOut;
				if (_parachuted) then
					{
						_nul = _vehicle spawn
							{
								_this setFuel 0;
								_this setVehicleAmmo 0;
								uiSleep 2.5;
								_this setDamage 1;
							};
						if (DZAI_debugLevel > 0) then
							{diag_log format ["[DZAI]: [�������]: �� %1 ����� %2 ����, �������� ������ ���������.",(typeOf _vehicle),(typeOf _victim)];};
					};
			}
		else
			{0 = [_victim,(_unitGroup getVariable ["weapongrade",1])] spawn DZAI_addLoot;};
	};
true