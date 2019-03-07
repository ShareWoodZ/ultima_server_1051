Private ["_wArray","_mArray","_Terminal_Set_User_Items_Array","_bag"];
//	Составляем массив предметов, подходящих для продажи
Terminal_User_Items	=	[];
_wArray	=	weapons player;
_mArray	=	magazines player;

//	Функция заполнения массива предметов, допустимых к выставлению на торги
_Terminal_Set_User_Items_Array	=
	{
		Private ["_array"];
		_array	=	_this select 0;
		{
			//diag_log(format["Terminal_User_Items _x: %1",_x]);
			if !(_x in Terminal_User_Items) then
				{
					if ( ([_x] call Terminal_Find_Array_Type) != "error" ) then
						{Terminal_User_Items set [count Terminal_User_Items, _x];};
				};
		} forEach _array;
	};
//	Смотрим что есть в магазинных и оружейных слотах
//forEach [_wArray, _mArray];
[_wArray] call _Terminal_Set_User_Items_Array;
[_mArray] call _Terminal_Set_User_Items_Array;

//	Добавляем рюкзак
_bag	=	unitBackpack player;
if !(isNull _bag) then
	{
		_bag	=	typeOf _bag;
		Terminal_User_Items set [count Terminal_User_Items, _bag]
	};

//	Добавляем технику в продажу
[] call Terminal_Find_Vehicle;
//diag_log(format["Terminal_Find_Vehicle: %1",Terminal_Vehicle]);
if ( (count(Terminal_Vehicle)) > 0 ) then
	{Terminal_User_Items set [count Terminal_User_Items, (Terminal_Vehicle select 0)];};

//diag_log(format["Terminal_User_Items: %1",Terminal_User_Items]);

//	Открываем таблицу
["Terminal_Add_Items"] call Terminal_Open_Dialog;
if ( count (Terminal_User_Items) > 0) then
	{
		Private ["_text_pic","_text","_pic","_index"];
		{
			_text_pic	=	[_x] call Terminal_Get_Item_Text_Pic;
			if ( (count(_text_pic)) > 0) then
				{
					_text	=	_text_pic select 0;
					_pic	=	_text_pic select 1;
					_index	=	lbAdd[20002,_text];
					lbSetPicture [20002, _index, _pic];
				};		
		} forEach Terminal_User_Items;
		lbSetCursel[20002, 0];
	};
hintSilent localize "Ultima_TT";