private ["_uid","_do","_unit","_winners","_i"];
_winners	=	_this select 0;
{
	_uid	=	getPlayerUID _x;
	if (_uid in _winners) then
		{
			//Кидаем итем в инвентарь игроку.
			_do = format ['if (getPlayerUID player == "%1") then {player addMagazine "ItemBriefcase100oz";};',_uid];
			_unit = createAgent ["Sheep", [4000,4000,0], [], 0, "FORM"];
			_unit setVehicleInit _do;
			processInitCommands;
			deleteVehicle _unit;
			_savelog = format['Победителю %1, выдан приз',name _x];
			PVAH_WriteLogReq = [_savelog];
			publicVariableServer 'PVAH_WriteLogReq';
		};
} forEach playableUnits;