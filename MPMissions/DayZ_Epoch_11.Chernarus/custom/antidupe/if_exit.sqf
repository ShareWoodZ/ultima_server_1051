Private ["_no_exit_objs", "_vehType", "_message", "_typeOf"];
_no_exit_objs	=
	[
		"WeaponHolder"
		,"VaultStorage"
		,"LockboxStorage"
		,"TentStorage"
		,"Wooden_shed_DZ"
		,"WoodShack_DZ"
		,"StorageShed_DZ"
		,"GunRack_DZ"
		,"WoodCrate_DZ"
		,"DebugBoxPlayer_DZ"
	];
_vehType	=	["Air" ,"LandVehicle", "Ship"];
disableSerialization;
_message	=
	{
		titleText [localize "Ultima_Exit_Near_Storage", "PLAIN DOWN", 3];
		systemchat localize "Ultima_Exit_Near_Storage";
		(findDisplay 49) closedisplay 0;
	};
waitUntil {!isNull findDisplay 49};
findDisplay 106 closeDisplay 1;
if ( (count nearestObjects [player, _vehType, 5]) > 0 ) exitWith
	{[] call _message;};
{
	_typeOf	=	typeOf _x;
	if (_typeOf in _no_exit_objs) exitWith
		{[] call _message;};
} foreach (nearestObjects [player, ["All"], 5]);