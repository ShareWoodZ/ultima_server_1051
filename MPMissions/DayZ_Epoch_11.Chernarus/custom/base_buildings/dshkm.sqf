Private ["_required","_usedParts","_keyColor","_keyNumber","_keySelected","_isOk","_location","_sign","_vehicle","_city"];

_usedParts	=	
	[
		["ItemAluminumBar",10]
		,["Pecheneg_DZ",1]
	];
	
_required	=	[_usedParts] call Craft_Find_Required_Items;
if ( _required != "true" ) exitWith
	{taskHint [format["Не хватает: %1",_required], [1,0,0.1,1], "taskFailed"]};

//	Удаляем из инвентаря расходники
[_usedParts] call Craft_Delete_Required_Items;	

_vehicle			=	"DSHKM_TK_INS_EP1";		
_keyColor			=	["Green","Red","Blue","Yellow","Black"] call BIS_fnc_selectRandom;
_keyNumber			=	(floor(random 2500)) + 1;
_keySelected		=	format[("ItemKey%1%2"),_keyColor,_keyNumber];
_isOk				=	[player,_keySelected] call BIS_fnc_invAdd;
waitUntil {!isNil "_isOk"};
_location			=	getPosATL player;
_sign				=	createVehicle ["Sign_arrow_down_large_EP1", _location, [], 0, "CAN_COLLIDE"];
_sign setPosATL _location;
PVDZE_veh_Publish2	=	[_sign,[0,_location],_vehicle,false,_keySelected,player,0];
PublicVariableServer  "PVDZE_veh_Publish2";
