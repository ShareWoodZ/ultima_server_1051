private ["_nearPlayers","_uid","_unit","_do","_coordUnreg","_coordRegDef","_coordRegAttack","_mrkRegRad"];
_coordUnreg			=	_this select 0;
_coordRegDef		=	_this select 1;
_coordRegAttack	=	_this select 2;
_mrkRegRad			=	_this select 3;
while {regtime} do
	{
		//Триггер сброса
		_nearPlayers	=	nearestObjects [_coordUnreg, ["CAManBase"], _mrkRegRad];
		{
			_uid	=	getPlayerUID _x;
			if ((alive _x) and  !(_x isKindOf "zZombie_base") and  ((_uid in defeaters) or (_uid in attackers))) then
				{
					if (Ultima_Diag_Level > 1) then
						{diag_log(format["[#Ultima]: [Защита]: Сброс регистрации для игрока: %1!",name _x]);};
					if (_uid in defeaters) then
						{
							defeaters set [(defeaters find _uid), -1]; 
							defeaters	=	defeaters - [-1];
						};
					if (_uid in attackers) then
						{								
							attackers set [(attackers find _uid), -1]; 
							attackers	=	attackers - [-1];
						};
					_do = format ['if (getPlayerUID player == "%1") then {cutText ["Вы отменили регистрацию!", "PLAIN"];};',_uid];
					_unit = createAgent ["Sheep", [4000,4000,0], [], 0, "FORM"];
					_unit setVehicleInit _do;
					processInitCommands;
					deleteVehicle _unit;
				};
		} forEach _nearPlayers;
		//Триггер регистрации за защиту
		_nearPlayers	=	nearestObjects [_coordRegDef, ["CAManBase"], _mrkRegRad];
		{
			_uid	=	getPlayerUID _x;
			if ((alive _x) and  !(_x isKindOf "zZombie_base") and !(_uid in defeaters) and !(_uid in attackers)) then
				{
					if (Ultima_Diag_Level > 1) then
						{diag_log(format["[#Ultima]: [Защита]: Регистрация за ополчение, игрока: %1!",name _x]);};
					defeaters set [count defeaters, _uid];
					_do = format ['if (getPlayerUID player == "%1") then {cutText ["Вы зарегистрировались как ополченец!", "PLAIN"];};',_uid];
					_unit = createAgent ["Sheep", [4000,4000,0], [], 0, "FORM"];
					_unit setVehicleInit _do;
					processInitCommands;
					deleteVehicle _unit;
				};
		} forEach _nearPlayers;
		//Триггер регистрации за атаку
		_nearPlayers	=	nearestObjects [_coordRegAttack, ["CAManBase"], _mrkRegRad];
		{
			_uid	=	getPlayerUID _x;
			if ((alive _x) and  !(_x isKindOf "zZombie_base") and !(_uid in defeaters) and !(_uid in attackers)) then
				{
					if (Ultima_Diag_Level > 1) then
						{diag_log(format["[#Ultima]: [Защита]: Регистрация за атаку, игрока: %1!",name _x]);};
					attackers set [count attackers, _uid];
					_do = format ['if (getPlayerUID player == "%1") then {cutText ["Вы зарегистрировались как наемник!", "PLAIN"];};',_uid];
					_unit = createAgent ["Sheep", [4000,4000,0], [], 0, "FORM"];
					_unit setVehicleInit _do;
					processInitCommands;
					deleteVehicle _unit;
			};
		} forEach _nearPlayers;
		sleep 2;
	};