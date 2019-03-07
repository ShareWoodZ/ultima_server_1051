"ultima_log" callExtension format["0|%1ultima_anticheat.ini|1", Ultima_ini_Files];
Ultima_Anti_Spawn_Log	=
	{
		Private ["_log","_date_time"];
		_partition	=	((_this select 1) select 0);
		_log		=	((_this select 1) select 1);
		_date_time	=	"ultima_log" callExtension "11";
		"ultima_log" callExtension format["9|%1|%2|%3", _partition, _date_time, _log];
	};
"Ultima_Anti_Spawn_Server" addPublicVariableEventHandler
	{
		_this spawn Ultima_Anti_Spawn_Log;
	};