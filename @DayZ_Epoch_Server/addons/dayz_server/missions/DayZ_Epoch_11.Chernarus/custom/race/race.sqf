if (Ultima_Diag_Level > 0) then
	{diag_log("[#Ultima]: [Гонки]: Старт скрипта гонки.");};
private ["_minutes_to_start","_minutes","_mc0","_mc1","_mc2","_mc3","_nearPlayers","_ml0","_ml1","_ml2","_ml3","_veh","_savelog","_mlist","_unit","_do","_uid","_racetime"];
_veh				=	_this select 0;
_racetime			=	_this select 1;
_minutes_to_start	=	_this select 2;
//Старт гонки
_mlist	=	[];

for "_x" from 1 to _minutes_to_start do
	{
		_minutes	=	_minutes_to_start - _x;
		[nil,nil,rTitleText,format["%1 минут до начала гонок на %2! Готовтесь!",_minutes,_veh], "PLAIN",10] call RE;
		sleep 60;
	};
//Получаем 4 четыре рандомных точки
_mc0		=	[Ultima_Map_Center, 100, Ultima_Map_Radius, 20, 0, 20, 0] call BIS_fnc_findSafePos;
_mc1		=	[Ultima_Map_Center, 100, Ultima_Map_Radius, 20, 0, 20, 0] call BIS_fnc_findSafePos;
_mc2		=	[Ultima_Map_Center, 100, Ultima_Map_Radius, 20, 0, 20, 0] call BIS_fnc_findSafePos;
_mc3		=	[Ultima_Map_Center, 100, Ultima_Map_Radius, 20, 0, 20, 0] call BIS_fnc_findSafePos;
//Создаем маркеры, пусть работают все 4, пока гонка идет.
[_mc0,_mc1,_mc2,_mc3] spawn
	{
		private ["_mc1","_mc2","_mc3","_mc0","_m1","_m2","_m3","_m0","_mt1","_mt2","_mt3","_mt0"];
		_mc0	=	_this select 0;
		_mc1	=	_this select 1;
		_mc2	=	_this select 2;
		_mc3	=	_this select 3;				
		while {startrace} do
			{
				_m0 = createMarker ["_m0", [_mc0 select 0, _mc0 select 1]];
				_m0 setMarkerShape "RECTANGLE";
				_m0 setMarkerColor "ColorGreen";
				_m0 setMarkerBrush "Grid";
				_m0 setMarkerSize [50,50];
				_mt0 = createMarker ["_mt0", [_mc0 select 0, _mc0 select 1]];
				_mt0 setMarkerColor "ColorBlack";
				_mt0 setMarkerType "Vehicle";
				_mt0 setMarkerText "Точка гонки!";					
				_m1 = createMarker ["_m1", [_mc1 select 0, _mc1 select 1]];
				_m1 setMarkerShape "RECTANGLE";
				_m1 setMarkerColor "ColorGreen";
				_m1 setMarkerBrush "Grid";
				_m1 setMarkerSize [50,50];
				_mt1 = createMarker ["_mt1", [_mc1 select 0, _mc1 select 1]];
				_mt1 setMarkerColor "ColorBlack";
				_mt1 setMarkerType "Vehicle";
				_mt1 setMarkerText "Точка гонки!";
				_m2 = createMarker ["_m2", [_mc2 select 0, _mc2 select 1]];
				_m2 setMarkerShape "RECTANGLE";
				_m2 setMarkerColor "ColorGreen";
				_m2 setMarkerBrush "Grid";
				_m2 setMarkerSize [50,50];
				_mt2 = createMarker ["_mt2", [_mc2 select 0, _mc2 select 1]];
				_mt2 setMarkerColor "ColorBlack";
				_mt2 setMarkerType "Vehicle";
				_mt2 setMarkerText "Точка гонки!";
				_m3 = createMarker ["_m3", [_mc3 select 0, _mc3 select 1]];
				_m3 setMarkerShape "RECTANGLE";
				_m3 setMarkerColor "ColorGreen";
				_m3 setMarkerBrush "Grid";
				_m3 setMarkerSize [50,50];
				_mt3 = createMarker ["_mt3", [_mc3 select 0, _mc3 select 1]];
				_mt3 setMarkerColor "ColorBlack";
				_mt3 setMarkerType "Vehicle";
				_mt3 setMarkerText "Точка гонки!";
				sleep 25;
				if (Ultima_Diag_Level > 2) then
					{diag_log("[#Ultima]: [Гонки]: Удаление маркеров гонки!");};
				deleteMarker "_m1";
				deleteMarker "_mt1";
				deleteMarker "_m2";
				deleteMarker "_mt2";
				deleteMarker "_m3";
				deleteMarker "_mt3";
				deleteMarker "_m0";
				deleteMarker "_mt0";				
			};
	};
[nil,nil,rTitleText,format["Начинаются гонки на %1! Контрольные точки нанесены на карту!",_veh], "PLAIN",10] call RE;	
[_veh,_racetime] spawn
	{
		private ["_veh","_do","_unit","_racetime","_raceminute"];
		_veh			=	_this select 0;
		_racetime	=	_this select 1;
		while {((startrace) && (_racetime > 0))} do
			{
				_raceminute	=	floor(_racetime / 60);
				_do = format ['systemChat("До окончания гонок на %1, ~%2 мин.");',_veh,_raceminute];
				_unit = createAgent ["Sheep", [4000,4000,0], [], 0, "FORM"];
				_unit setVehicleInit _do;
				processInitCommands;
				deleteVehicle _unit;
				_racetime	=	_racetime - 600;
				sleep 600;
			};
	};
_ml0	=	[];
_ml1	=	[];
_ml2	=	[];
_ml3	=	[];		
while {startrace} do
	{
		sleep 2;
		if (!racetime) exitWith
			{
				[nil,nil,rTitleText,format["Время вышло! Гонки на %1 завершены!",_veh], "PLAIN",10] call RE;	
				startrace	=	false;
			};
		_nearPlayers	=	nearestObjects [_mc0, [], 50];
		{
			_uid	=	getPlayerUID _x;
			if ((alive _x) and  !(_x isKindOf "zZombie_base") and  !(_uid in _ml0) and ((typeof vehicle _x) == _veh)) then
				{
					if (Ultima_Diag_Level > 0) then
						{diag_log(format["[#Ultima]: [Гонки]: Игрок %1 прошел контрольную точку 1!",name _x]);};
					_ml0 set [count _ml0, _uid];
					if !(_uid in _mlist) then
						{_mlist set [count _mlist, _uid];};
					_do = format ['if (getPlayerUID player == "%1") then {cutText ["Вы отметились в данной точке гонки!", "PLAIN"];};',_uid];
					_unit = createAgent ["Sheep", [4000,4000,0], [], 0, "FORM"];
					_unit setVehicleInit _do;
					processInitCommands;
					deleteVehicle _unit;
				};
		} forEach _nearPlayers;
		_nearPlayers	=	nearestObjects [_mc1, [], 50];
		{
			_uid	=	getPlayerUID _x;
			if ((alive _x) and  !(_x isKindOf "zZombie_base") and  !(_uid in _ml1) and ((typeof vehicle _x) == _veh)) then
				{
					if (Ultima_Diag_Level > 0) then
						{diag_log(format["[#Ultima]: [Гонки]: Игрок %1 прошел контрольную точку 2!",name _x]);};
					_ml1 set [count _ml1, _uid];
					if !(_uid in _mlist) then
						{_mlist set [count _mlist, _uid];};	
					_do = format ['if (getPlayerUID player == "%1") then {cutText ["Вы отметились в данной точке гонки!", "PLAIN"];};',_uid];
					_unit = createAgent ["Sheep", [4000,4000,0], [], 0, "FORM"];
					_unit setVehicleInit _do;
					processInitCommands;
					deleteVehicle _unit;								
				};
		} forEach _nearPlayers;
		_nearPlayers	=	nearestObjects [_mc2, [], 50];
		{
			_uid	=	getPlayerUID _x;
			if ((alive _x) and  !(_x isKindOf "zZombie_base") and  !(_uid in _ml2) and ((typeof vehicle _x) == _veh)) then
				{
					if (Ultima_Diag_Level > 0) then
						{diag_log(format["[#Ultima]: [Гонки]: Игрок %1 прошел контрольную точку 3!",name _x]);};
					_ml2 set [count _ml2, _uid];
					if !(_uid in _mlist) then
						{_mlist set [count _mlist, _uid];};
					_do = format ['if (getPlayerUID player == "%1") then {cutText ["Вы отметились в данной точке гонки!", "PLAIN"];};',_uid];
					_unit = createAgent ["Sheep", [4000,4000,0], [], 0, "FORM"];
					_unit setVehicleInit _do;
					processInitCommands;
					deleteVehicle _unit;								
				};
		} forEach _nearPlayers;
		_nearPlayers	=	nearestObjects [_mc3, [], 50];
		{
			_uid	=	getPlayerUID _x;
			if ((alive _x) and  !(_x isKindOf "zZombie_base") and  !(_uid in _ml3) and ((typeof vehicle _x) == _veh)) then
				{
					if (Ultima_Diag_Level > 0) then
						{diag_log(format["[#Ultima]: [Гонки]: Игрок %1 прошел контрольную точку 4!",name _x]);};
					_ml3 set [count _ml3, _uid];
					if !(_uid in _mlist) then
						{_mlist set [count _mlist, _uid];};
					_do = format ['if (getPlayerUID player == "%1") then {cutText ["Вы отметились в данной точке гонки!", "PLAIN"];};',_uid];
					_unit = createAgent ["Sheep", [4000,4000,0], [], 0, "FORM"];
					_unit setVehicleInit _do;
					processInitCommands;
					deleteVehicle _unit;								
				};
		} forEach _nearPlayers;					
		{
			_uid	=	getPlayerUID _x;
			if ((_uid in _mlist) and ((typeof vehicle _x) != _veh)) then
				{
					_do = format ['if (getPlayerUID player == "%1") then {cutText ["Вы были дисквалифицированы, но все еще можете начать гонку заново!", "PLAIN"];};',_uid];
					_unit = createAgent ["Sheep", [4000,4000,0], [], 0, "FORM"];
					_unit setVehicleInit _do;
					processInitCommands;
					deleteVehicle _unit;
					if (Ultima_Diag_Level > 0) then
						{diag_log(format["[#Ultima]: [Гонки]: Игрок %1 сменил технику и был обнулен!",name _x]);};
					_mlist set [(_mlist find _uid), -1]; 
					_mlist	=	_mlist - [-1];
					if (_uid in _ml0) then
						{
							_ml0 set [(_ml0 find _uid), -1]; 
							_ml0	=	_ml0 - [-1];
						};
					if (_uid in _ml1) then
						{								
							_ml1 set [(_ml1 find _uid), -1]; 
							_ml1	=	_ml1 - [-1];
						};
					if (_uid in _ml2) then
						{							
							_ml2 set [(_ml2 find _uid), -1]; 
							_ml2	=	_ml2 - [-1];
						};
					if (_uid in _ml3) then
						{							
							_ml3 set [(_ml3 find _uid), -1]; 
							_ml3	=	_ml3 - [-1];
						};
				};
			if ((_uid  in _ml0) and (_uid  in _ml1) and (_uid  in _ml2) and (_uid  in _ml3) and (startrace)) exitWith
				{
					if (Ultima_Diag_Level > 0) then
						{diag_log(format["[#Ultima]: [Гонки]: Игрок %1 прошел все контрольные точки!",name _x]);};
					if (startrace) then
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
							if (Ultima_Diag_Level > 0) then
								{diag_log("[#Ultima]: [Гонки]: Гонка завершена.");};
							[nil,nil,rTitleText,format["Гонки на %1 завершены! Победитель: %2.",_veh, name _x], "PLAIN",10] call RE;
						};
					startrace	=	false;
					racetime	=	false;
				};
			if (Ultima_Diag_Level > 2) then
				{diag_log(format["[#Ultima]: [Гонки]: Игрок %1 находится в %2.",name _x, (typeof vehicle _x)]);};
		} forEach playableUnits;
	};
