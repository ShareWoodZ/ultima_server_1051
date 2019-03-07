private ["_uid","_savelog","_distance","_coordSafeTP","_mrkDefRad","_coordBase"];
_coordSafeTP	=	_this select 0;
_mrkDefRad		=	_this select 1;
_coordBase		=	_this select 2;
while {DefeatTime} do
	{
		{
			_uid	=	getPlayerUID _x;
			if ((alive _x) and  !(_x isKindOf "zZombie_base") and !(_x isKindOf "Animal") and (!(_uid in defeaters) and !(_uid in attackers)) and !(_uid in Ultima_Admins)) then
				{
					_distance	=	_x distance _coordBase;
					if (_distance < _mrkDefRad) then
						{
							if (Ultima_Diag_Level > 1) then
								{diag_log(format["[#Ultima]: [Защита]: Игрок %1, перемещен из зоны боевых действий!",name _x]);};
							(vehicle _x) setPosATL _coordSafeTP;
							_x setVariable['AHworldspace',[getDir _x,_coordSafeTP],true];
							_savelog = format["%1 перемещен из зоны боевых действий", name _x];
							PVAH_WriteLogReq = [_savelog];
							publicVariableServer "PVAH_WriteLogReq";
						};
				};
		} forEach playableUnits;
		sleep 2;
	};