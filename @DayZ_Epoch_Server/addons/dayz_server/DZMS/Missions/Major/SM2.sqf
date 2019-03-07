private ["_missName","_coords","_plane","_aiGrp","_pilot","_wp","_wp_pos","_loop","_half","_newPos","_plane2","_chute","_box","_dropDir","_wp2","_fallCount","_boxFin"];
_missName	=	"Груз с приспасами";
_coords		=	call DZMSFindPos;
[nil,nil,rTitleText,"Замечен АН-2 перевозящий припасы группироквки!\nПроверь местонахождения и захвати груз!", "PLAIN",10] call RE;
[_coords,_missname] ExecVM DZMSAddMajMarker;
_plane	=	createVehicle ["AN2_DZ", [0,0,500], [], 0, "FLY"];
[_plane] call DZMSProtectObj;
_plane engineOn true;
_plane flyInHeight 150;
_plane forceSpeed 175;
clearMagazineCargoGlobal _plane;
clearWeaponCargoGlobal _plane;
_aiGrp	=	creategroup east;
_pilot	=	_aiGrp createUnit ["SurvivorW2_DZ",getPos _plane,[],0,"FORM"];
_pilot moveindriver _plane;
_pilot assignAsDriver _plane;
_wp	=	_aiGrp addWaypoint [[(_coords select 0), (_coords select 1),150], 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "CARELESS";
_wp_pos	=	waypointPosition [_aiGrp,1];
_pilot addWeapon 'NVGoggles';
_pilot addWeapon 'ItemCompass';
_pilot addWeapon 'ItemRadio';
_pilot addWeapon 'ItemMap';
_pilot addWeapon 'ItemGPS';
sleep 5;
[_coords,6,1] ExecVM DZMSAISpawn;
sleep 5;
[_coords,6,1] ExecVM DZMSAISpawn;
sleep 5;
[_coords,4,1] ExecVM DZMSAISpawn;
sleep 5;
_loop	=	true;
_half		=	false;
while {_loop} do
	{
		if (!Alive _plane OR !Alive _pilot) then
			{
				sleep 5;
				deleteVehicle _plane;
				deleteVehicle _pilot;
				_newPos	=	[(_coords select 0) + (random(2000)),(_coords select 1) - (random(2000)),0];
				if (surfaceIsWater _newPos) then
					{_newPos	=	_coords;};
				_plane2	=	createVehicle ["AN2_DZ", [(_newPos select 0),(_newPos select 1),200], [], 0, "FLY"];
				[_plane2] call DZMSProtectObj;
				_plane2 engineOn true;
				_plane2 flyInHeight 150;
				_plane2 forceSpeed 175;
				sleep 2;
				_plane2 setDamage 1;
				[_coords,"AN2 Wreck"] ExecVM DZMSAddMajMarker;
				[nil,nil,rTitleText,"Подбит АН-2!\nНайди его груз!", "PLAIN",10] call RE;
				_chute	=	createVehicle ["ParachuteMediumEast", [(_newPos select 0),(_newPos select 1),200], [], 0, "FLY"];
				[_chute] call DZMSProtectObj;
				_box	=	createVehicle ["USVehicleBox", [(_newPos select 0),(_newPos select 1),200],[], 0, "CAN_COLLIDE"];
				[_box] call DZMSProtectObj;
				_box attachTo [_chute, [0, 0, 1]];
				_loop	=	false;
			};
		if ((Alive _plane) AND (Alive _pilot) AND ((_plane distance _wp_pos) <= 1200) AND (!(_half))) then
			{
				[nil,nil,rTitleText,"1200м до точки сброса груза!", "PLAIN",10] call RE;
				_plane forceSpeed 175;
				_plane flyInHeight 135;
				_plane setspeedmode "LIMITED";
				_half	=	true;
			};
		if ((Alive _plane) AND (Alive _pilot) AND ((_plane distance _wp_pos) <= 200)) then
			{
				_dropDir	=	getDir _plane;
				_newPos	=	[(getPosATL _plane select 0) - 15*sin(_dropDir), (getPosATL _plane select 1) - 15*cos(_dropDir), (getPosATL _plane select 2) - 10];
				[nil,nil,rTitleText,"АН-2 достиг точки и сбросил груз!", "PLAIN",10] call RE;
				_chute	=	createVehicle ["ParachuteMediumEast", _newPos, [], 0, "FLY"];
				[_chute] call DZMSProtectObj;
				_box	=	createVehicle ["USVehicleBox", _newPos,[], 0, "CAN_COLLIDE"];
				[_box] call DZMSProtectObj;
				_box attachTo [_chute, [0, 0, 1]];
				deleteWaypoint [_aiGrp, 1];
				_wp2	=	_aiGrp addWaypoint [[0,0,150], 0];
				_wp2 setWaypointType "MOVE";
				_wp2 setWaypointBehaviour "CARELESS";
				_plane forceSpeed 350;
				_plane setSpeedmode "FULL";
				_loop	=	false;
			};
	};
_fallCount	=	0;
while {_fallCount < 45} do
	{
		if (((getPos _box) select 2) < 1) then
			{_fallCount	=	46};
		sleep 0.1;
		_fallCount	=	_fallCount + 0.1;
	};
detach _box;
_box setpos [(getpos _box select 0), (getpos _box select 1), 0];
_boxFin	=	createVehicle ["USVehicleBox",[(getpos _box select 0),(getpos _box select 1), 0],[],0,"CAN_COLLIDE"];
deletevehicle _box;
deletevehicle _chute;
[[(getpos _boxFin select 0), (getpos _boxFin select 1), 0],"Груз АН-2"] ExecVM DZMSAddMajMarker;
clearWeaponCargoGlobal _boxFin;
clearMagazineCargoGlobal _boxFin;
clearBackpackCargoGlobal _boxFin;
[_boxFin,"weapons"] ExecVM DZMSBoxSetup;
[_boxFin] call DZMSProtectObj;
_boxFin addWeaponCargoGlobal ["BAF_L85A2_RIS_CWS",1];
_boxFin addWeaponCargoGlobal ["Binocular_Vector",1];
waitUntil{{isPlayer _x && _x distance _boxFin <= 30 } count playableunits > 0}; 
[nil,nil,rTitleText,"Груз АН-2 перешел под контроль выживших!", "PLAIN",6] call RE;
diag_log format["[DZMS]: Мажор миссия SM2 завершена."];
deleteMarker "DZMSMajMarker";
deleteMarker "DZMSMajDot";
DZMSMajDone	=	true;