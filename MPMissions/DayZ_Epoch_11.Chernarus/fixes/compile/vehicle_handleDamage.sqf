private["_unit","_selection","_strH","_total","_damage","_needUpdate","_ammo","_damageOff"];
//	Кто - 3
//	Чем - 4
_ammo		=	_this select 4;
_damageOff	=	true;
if !(isNil "_ammo") then
	{
		if ( (_ammo == "Hatchet_Swing_Ammo") || (_ammo == "Chainsaw_Swing_Ammo") ) then
			{_damageOff	=	false;};
	};
	
if (!_damageOff) exitWith {_total	=	0};

_unit		=	_this select 0;
_selection	=	_this select 1;	
_total		=	_this select 2;

if (_selection != "") then
	{_strH = "hit_" + _selection;}
else
	{_strH = "totalDmg";};
if (_total >= 0.98) then
	{_total = 1.0;};
if (local _unit) then
	{
		if (_total > 0) then
			{
				_unit setVariable [_strH, _total, true];
				_unit setHit [_selection, _total];
				if (isServer) then
					{[_unit, "damage"] call server_updateObject;}
				else
					{
						PVDZE_veh_Update = [_unit,"damage"];
						publicVariableServer "PVDZE_veh_Update";
					};
			};
	}
else
	{
		PVDZE_send = [_unit,"VehHandleDam",_this];
		publicVariableServer "PVDZE_send";
	};
_total