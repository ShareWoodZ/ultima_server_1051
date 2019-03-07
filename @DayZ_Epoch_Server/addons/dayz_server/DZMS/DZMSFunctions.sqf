DZMSMajTimer		=	"\z\addons\dayz_server\DZMS\Scripts\DZMSMajTimer.sqf";
DZMSMinTimer		=	"\z\addons\dayz_server\DZMS\Scripts\DZMSMinTimer.sqf";
DZMSMarkerLoop		=	"\z\addons\dayz_server\DZMS\Scripts\DZMSMarkerLoop.sqf";
DZMSAddMajMarker	=	"\z\addons\dayz_server\DZMS\Scripts\DZMSAddMajMarker.sqf";
DZMSAddMinMarker	=	"\z\addons\dayz_server\DZMS\Scripts\DZMSAddMinMarker.sqf";
DZMSAISpawn			=	"\z\addons\dayz_server\DZMS\Scripts\DZMSAISpawn.sqf";
DZMSAIKilled		=	"\z\addons\dayz_server\DZMS\Scripts\DZMSAIKilled.sqf";
DZMSBoxSetup		=	"\z\addons\dayz_server\DZMS\Scripts\DZMSBox.sqf";
DZMSSaveVeh			=	"\z\addons\dayz_server\DZMS\Scripts\DZMSSaveToHive.sqf";
DZMSFindPos			=
	{
		private["_mapHardCenter","_isTavi","_centerPos","_pos","_hardX","_hardY","_findRun","_posX","_posY","_feel1","_feel2","_feel3","_feel4","_noWater","_tavTest","_tavHeight","_disMaj","_disMin","_okDis"];
		_mapHardCenter	=	true;
		_isTavi			=	false;
		_centerPos		=	[7100, 7750, 0];
		_pos			=	[getMarkerPos "center",0,5500,60,0,20,0] call BIS_fnc_findSafePos;
		_mapHardCenter	=	false;
		if (_mapHardCenter AND (!(DZMSStaticPlc))) then
			{
				_hardX		=	_centerPos select 0;
				_hardY		=	_centerPos select 1;
				_findRun	=	true;
				while {_findRun} do
					{
						_pos		=	[_centerPos,0,5500,60,0,20,0] call BIS_fnc_findSafePos;
						_posX		=	_pos select 0;
						_posY		=	_pos select 1;
						_feel1		=	[_posX, _posY+50, 0];
						_feel2		=	[_posX+50, _posY, 0];
						_feel3		=	[_posX, _posY-50, 0];
						_feel4		=	[_posX-50, _posY, 0];
						_noWater	=	(!surfaceIsWater _pos && !surfaceIsWater _feel1 && !surfaceIsWater _feel2 && !surfaceIsWater _feel3 && !surfaceIsWater _feel4);
						if (_isTavi) then
							{
								_tavTest	=	createVehicle ["Can_Small",[_posX,_posY,0],[], 0, "CAN_COLLIDE"];
								_tavHeight	=	(getPosASL _tavTest) select 2;
								deleteVehicle _tavTest;
							};
						_disMaj	=	(_pos distance DZMSMajCoords);
						_disMin	=	(_pos distance DZMSMinCoords);
						_okDis	=	((_disMaj > 1000) AND (_disMin > 1000));
						if ((_posX != _hardX) AND (_posY != _hardY) AND _noWater AND _okDis) then
							{
								if (!(_isTavi)) then
									{_findRun	=	false;};
								if (_isTavi AND (_tavHeight <= 185)) then
									{_findRun	=	false;};
							};
						sleep 2;
					};
			};
		if (DZMSStaticPlc) then
			{
				if (isNil "DZMS_Old_Pos") then
					{DZMS_Old_Pos	=	[0,0,0];};
				_pos	=	DZMSStatLocs call BIS_fnc_selectRandom;
				if ( (_pos select 0) == (DZMS_Old_Pos select 0) && (_pos select 0) == (DZMS_Old_Pos select 0) && (_pos select 0) == (DZMS_Old_Pos select 0) ) then
					{
						sleep 300;
						_pos	=	DZMSStatLocs call BIS_fnc_selectRandom;
					};
			};
		_fin	=	[(_pos select 0), (_pos select 1), 0];
		_fin
	};
DZMSSetupVehicle =
	{
		private ["_object","_objectID","_ranFuel"];
		_object		=	_this select 0;
		_objectID	=	str(round(random 999999));
		_object setVariable ["ObjectID", _objectID, true];
		_object setVariable ["ObjectUID", _objectID, true];
		if (DZMSEpoch) then
			{PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor, _object];}
		else
			{dayz_serverObjectMonitor set [count dayz_serverObjectMonitor, _object];	};
		waitUntil {(!isNull _object)};
		clearWeaponCargoGlobal _object;
		clearMagazineCargoGlobal _object;
		_ranFuel = random 1;
		if (_ranFuel < .1) then
			{_ranFuel	=	.1;};
		_object setFuel _ranFuel;
		_object setvelocity [0,0,1];
		_object setDir (round(random 360));
		if (!(DZMSSaveVehicles)) then
			{_object addEventHandler ["GetIn",{_nil = [nil,(_this select 2),"loc",rTITLETEXT,"Внимание: Эта техника пропадет после рестарта сервера!","PLAIN DOWN",5] call RE;}];};
		true
	};
DZMSProtectObj	=
	{
		private ["_object","_objectID"];
		_object		=	_this select 0;
		_objectID	=	str(round(random 999999));
		_object setVariable ["ObjectID", _objectID, true];
		_object setVariable ["ObjectUID", _objectID, true];
		if (_object isKindOf "ReammoBox") then
			{_object setVariable ["permaLoot",true];};
		if (DZMSEpoch) then
			{PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor, _object];}
		else
			{dayz_serverObjectMonitor set [count dayz_serverObjectMonitor, _object];};
		true
	};
DZMSGetWeapon	=
	{
		private ["_skill","_aiweapon","_weapon","_magazine","_fin"];
		_skill = _this select 0;
		switch (_skill) do
			{
				case 0: {_aiweapon = DZMSWeps1;};
				case 1: {_aiweapon = DZMSWeps2;};
				case 2: {_aiweapon = DZMSWeps3;};
			};
		_weapon		=	_aiweapon call BIS_fnc_selectRandom;
		_magazine	=	getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines") select 0;
		_fin		= [_weapon,_magazine];
		_fin
	};
diag_log format ["[DZMS]: Скрипт функций миссии загружен!"];