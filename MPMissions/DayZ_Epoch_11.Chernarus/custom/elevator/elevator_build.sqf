private ["_args","_option","_obj","_id","_elevatorStop","_dist"];

if (DZE_ActionInProgress) exitWith { cutText ["Идет процесс обновления..." , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

player removeAction s_player_elevator_upgrade;
s_player_elevator_upgrade = 1;
player removeAction s_player_elevator_upgrade_stop;
s_player_elevator_upgrade_stop = 1;

_args = _this select 3;
_option = _args select 0;
switch (_option) do {
	case "build": {
		_obj = _args select 1;
		_id = [_obj] call ELE_fnc_generateElevatorId;
		if (_id == "") exitWith { cutText ["Неправильно сгенерирован идентификатор лифта", "PLAIN"] };
		if ((ELE_RequiredBuildTools call AC_fnc_hasTools) && {ELE_RequiredBuildItems call AC_fnc_checkAndRemoveRequirements}) then {
			["Medic", ELE_MaxRange] call AC_fnc_doAnimationAndAlertZombies;
			ELE_elevator = [_obj, _id] call AC_fnc_swapObject;
			titleText ["Elevator Built", "PLAIN"];
		};
	};
	case "build_stop": {
		_obj = _args select 1;
		if (isNil "ELE_elevator") exitWith { cutText ["Лифт не выбран", "PLAIN"] };
		_dist = _obj distance ELE_elevator;
		if (_dist > ELE_MaxRange) exitWith { cutText [format["Остановка слишком далеко от лифта (%1 > %2)", _dist, ELE_MaxRange], "PLAIN"] };
		_id = [ELE_elevator] call ELE_fnc_getNextStopId;
		if (_id == "") exitWith { cutText ["Слишком много остановок для лифта. (Максимум: 9)", "PLAIN"] };
		if ((ELE_RequiredBuildTools call AC_fnc_hasTools) && {ELE_RequiredBuildStopItems call AC_fnc_checkAndRemoveRequirements}) then {
			["Medic", ELE_MaxRange] call AC_fnc_doAnimationAndAlertZombies;
			_elevatorStop = [_obj, _id, ELE_StopClass] call AC_fnc_swapObject;
			titleText ["Изготовлена остановка для лифта.", "PLAIN"];
		};
	};
};

DZE_ActionInProgress = false;
s_player_elevator_upgrade = -1;
s_player_elevator_upgrade_stop = -1;
