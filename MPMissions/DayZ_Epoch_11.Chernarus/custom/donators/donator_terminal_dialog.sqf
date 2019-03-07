//diag_log("Открытие диалога");
Private ["_admin_terminal","_array","_partition"];
_admin_terminal = createDialog ("Ultima_Donator_Terminal");
disableSerialization;
if (!_admin_terminal) exitWith
	{hint "Нет возможности открыть диалог торговли!"};
lbClear 24002;
_array	=	[];
{
	_partition	=	(_x select 0);
	if !(_partition in _array) then 
		{
			lbAdd[24002,_partition];
			_array set [count _array, _partition];
		};
} forEach a_Terminal_Admin;