Private ["_admin_money"];
_admin_money	=	player getVariable ["admin_money", 0];
if ( (_admin_money - Ultima_Defense_Friend_Cost) < 0 ) exitWith
	{systemChat "У вас недостаточно монет для оплаты!";};
//	Открытие диалога
["Base_Set_Friend"] call Terminal_Open_Dialog;