Private ["_player", "_base", "_client", "_uid", "_base_radius", "_base_pos", "_admin_money", "_cost", "_balance", "_date_time"];
_player			=	(_this select 0);
_base			=	(_this select 2);
_client			=	(owner _player);
_uid			=	(getPlayerUID _player);
_base_radius	=	(_base select 0);
_base_pos		=	(_base select 1);
{
	if ( (_x select 0) == _base_radius ) exitWith
		{_cost	=	(_x select 1);};
}forEach Ultima_Defense_Cost;
if (isNil "_cost") exitWith {};
_admin_money	=	[_uid] call Ultima_Get_Admin_Money;
_balance		=	(_admin_money - _cost);
if ( _balance < 0 ) exitWith
	{
		Terminal_Client = ["error", "Не хватает средств для оплаты услуги!"];
		_client publicVariableClient "Terminal_Client";
	};
[_player, _uid, _balance] call Ultima_Admin_Money_Set_Balance;
_base	=	[Ultima_Date, 30, [_base_radius, _base_pos, [_uid]]];
Ultima_Base_Defense set [count Ultima_Base_Defense, _base];
_date_time	=	"ultima_ini" callExtension "11";
_uid		=	_uid + "_" + _date_time;
"ultima_ini" callExtension format["9|base|%1|%2", _uid, _base];
