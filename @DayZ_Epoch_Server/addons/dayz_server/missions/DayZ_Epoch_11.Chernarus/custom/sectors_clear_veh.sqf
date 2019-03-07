if (Ultima_Diag_Level > 0) then
	{diag_log("[#Ultima]: [Чистка техники в секторах]: Старт скрипта");};
sleep 20;
[nil,nil,rTitleText,"Техника в торговых зонах, будет телепортирована через 3 минуты!", "PLAIN",10] call RE;
sleep 60;
[nil,nil,rTitleText,"Техника в торговых зонах, будет телепортирована через 2 минуты!", "PLAIN",10] call RE;
sleep 60;
[nil,nil,rTitleText,"Техника в торговых зонах, будет телепортирована через 1 минуту!", "PLAIN",10] call RE;
sleep 50;
[nil,nil,rTitleText,"Техника в торговых зонах, будет телепортирована через 10 секунд!", "PLAIN",10] call RE;
sleep 10;
private ["_typeOf","_ObjName","_VehType","_Radius","_aTradeZones","_Coord","_Pos","_SafeSpot","_NearObjs","_i","_NewPos","_vehDelete","_vehTP","_vehUnlock","_vehDelInventory","_Obj"];
_vehDelete			=	false;	//	Удалять технику
_vehTP				=	true;	//	Телепортировать технику
_vehTPUpdate		=	true;	//	Записывать в БД новые координаты полсе телепорта	
_vehUnlock			=	false;	//	Открывать технику
_vehDelInventory	=	false;	//	Удалять инвентарь в технике
_vehType				=	[
									"Air"
									,"LandVehicle"
									,"Ship"
								];
_Radius				=	100;
_aTradeZones		=	[
							[6337,7690,6555,7734]			//	Старый собор
							,[4063,11664,4135,10999]		//	Баш
							,[11468,11345,10989,11501]		//	Клен
						];
{
	_Coord		=	_x;
	_Pos			=	[(_Coord select 0), (_Coord select 1), 0];
	_SafeSpot	=	[(_Coord select 2), (_Coord select 3), 0];
	_NearObjs	=	nearestObjects [_Pos, _VehType, _Radius];
	if (Ultima_Diag_Level > 1) then
		{diag_log(format["[#Ultima]: [Чистка техники в секторах]: В секторе: %1, найдено %2 объектов.",str(_Coord), count (_NearObjs)]);};
	for "_i" from 0 to count _NearObjs - 1 do
		{
			_Obj			=	(_NearObjs select _i);
			_typeOf		=	typeOf _Obj;
			_ObjName	=	(gettext (configFile >> "CfgVehicles" >> _typeOf >> "displayName"));
			if (Ultima_Diag_Level > 1) then
				{diag_log(format["[#Ultima]: [Чистка техники в секторах]: Выбран объект: %1", _ObjName]);};
			if (_vehDelInventory) then
				{
					clearWeaponCargoGlobal _Obj;
					clearMagazineCargoGlobal _Obj;
					clearBackpackCargoGlobal _Obj;
					if (Ultima_Diag_Level > 1) then
						{diag_log(format["[#Ultima]: [Чистка техники в секторах]: Объекту: %1, удален инвентарь.", _ObjName]);};
				};
			if ((_vehUnlock) && (locked _obj)) then
				{
					_Obj setVehicleLock "UNLOCKED";
					_Obj setVariable ["R3F_LOG_disabled",false,true];
					if (Ultima_Diag_Level > 1) then
						{diag_log(format["[#Ultima]: [Чистка техники в секторах]: Объект: %1, открыт.", _ObjName]);};
				};
			if (_vehTP) then
				{
					_NewPos 	=	[_SafeSpot, 0, _Radius, 10, 0, 2000, 0] call BIS_fnc_findSafePos;
					_Obj setpos _NewPos;
					if (Ultima_Diag_Level > 1) then
						{diag_log(format["[#Ultima]: [Чистка техники в секторах]: Объект: %1, телепортирован в координаты: %2", _ObjName, str(_NewPos)]);};
					if (_vehTPUpdate) then
						{
							private["_position","_worldspace","_fuel","_key","_ObjID"];
							_ObjID			= _Obj getVariable["ObjectID","0"];
							_position		=	getPosATL _Obj;
							_worldspace	=	[round(direction _Obj),_position];
							_fuel				=	fuel _Obj;
							_key				=	format["CHILD:305:%1:%2:%3:",_ObjID,_worldspace,_fuel];
							if (Ultima_Diag_Level > 1) then
								{diag_log ("[#Ultima]: [Чистка техники в секторах]: [БД]: Запись: "+ str(_key));};
							_key call server_hiveWrite;
						};
				};
			if (_vehDelete) then
				{
					deleteVehicle _Obj;
					if (Ultima_Diag_Level > 1) then
						{diag_log(format["[#Ultima]: [Чистка техники в секторах]: Объект: %1, удален.", _ObjName]);};
				};
		};
} forEach _aTradeZones;
[nil,nil,rTitleText,"Вся техника в торговых зонах, телепортирована за их пределы!", "PLAIN",10] call RE;
if (Ultima_Diag_Level > 0) then
	{diag_log("[#Ultima]: [Чистка техники в секторах]: Чистка завершена.");};