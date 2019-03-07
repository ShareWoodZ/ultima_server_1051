private ["_missName","_coords","_vehicle"];
_missName = "Вечеринка";
_coords = call DZMSFindPos;
[nil,nil,rTitleText,"Преступники устроили вечеринку! Проверь свою карту!", "PLAIN",10] call RE;
//DZMSAddMinMarker is a simple script that adds a marker to the location
[_coords,_missName] ExecVM DZMSAddMinMarker;
//Create the vehicle as normal
_vehicle = createVehicle ["UAZ_Unarmed_UN_EP1",[(_coords select 0) + 10, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
//DZMSSetupVehicle prevents the vehicle from disappearing and sets fuel and such
[_vehicle] call DZMSSetupVehicle;
[_coords,2,1] ExecVM DZMSAISpawn;
sleep 5;
[_coords,2,1] ExecVM DZMSAISpawn;
sleep 5;
[_coords,2,1] ExecVM DZMSAISpawn;
sleep 5;
[_coords,2,1] ExecVM DZMSAISpawn;
sleep 1;
waitUntil{ {isPlayer _x && _x distance _coords <= 30 } count playableunits > 0 };
[_vehicle] ExecVM DZMSSaveVeh;
[nil,nil,rTitleText,"Выжившие прервали вечеринку преступников!", "PLAIN",6] call RE;
diag_log format["[DZMS]: Минор миссия SM1 завершена."];
deleteMarker "DZMSMinMarker";
deleteMarker "DZMSMinDot";
DZMSMinDone = true;