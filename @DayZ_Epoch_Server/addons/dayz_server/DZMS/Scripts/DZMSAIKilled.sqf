private ["_unit","_player","_humanity","_banditkills"];
_unit	=	_this select 0;
_player	=	_this select 1;
if (isPlayer _player) then 
	{
		if (DZMSMissHumanity) then 
			{
				private ["_humanity"];
				_humanity = _player getVariable ["humanity",0];
				if (_humanity > -1) then
					{_player setVariable ["humanity",(_humanity + DZMSCntHumanity),true];}
				else
					{_player setVariable ["humanity",(_humanity + DZMSCntHumanity*-1),true];};
				if ( (_humanity > 4999) || (_humanity < -4999) ) then
					{
						Terminal_Server	=	[_player, "reward", 1];
						publicVariableServer "Terminal_Server";
					};
			};
		if (DZMSCntBanditKls) then 
			{
				private ["_banditkills"];
				_banditkills = _player getVariable ["banditKills",0];
				_player setVariable ["banditKills",(_banditkills + 1),true];
			};
		{
			if (((position _x) distance (position _unit)) <= 300) then 
				{_x reveal [_player, 4.0];	}
		} forEach allUnits;
	} 
else 
	{
		if (DZMSRunGear) then 
			{
				removeBackpack _unit;
				removeAllWeapons _unit;
				{
					_unit removeMagazine _x
				} forEach magazines _unit;
			};
	};
if (DZMSUseNVG) then 
	{_unit removeWeapon "NVGoggles";};
if (DZMSUseRPG AND ("RPG7V" in (weapons _unit))) then
	{	
		_unit removeWeapon "RPG7V";
		_unit removeMagazines "PG7V";
	};
if (DZMSCleanDeath) then 
	{
		deleteVehicle _unit;
		if (DZMSCleanDeath) exitWith {};
	};
sleep DZMSBodyTime;
deleteVehicle _unit;