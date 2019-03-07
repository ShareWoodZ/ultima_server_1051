Private ["_text_pic","_pic","_text","_index","_name","_item","_price"];
//	Удаляем переменную массива
Terminal_Array	=	nil;

//	Тип запрашеваемого массива
Terminal_Array_Type	=	_this select 0;

diag_log(format["TERMINAL_ARRAY type: %1",Terminal_Array_Type]);
//	Запрос на сервер о ценах и товарах
Terminal_Server	=	[player, Terminal_Array_Type];
publicVariableServer "Terminal_Server";

//	Максимум 5 секунд, ждем прихода массива
for "_i" from 0 to 9 do
	{
		if !(isNil "Terminal_Array") exitWith {};
		sleep 0.5;
	};
//	Если массив не пришел - обнуляем массив вывода
if (isNil "Terminal_Array") then
	{Terminal_Array = [];};

//	Открываем таблицу
["Terminal_Buy"] call Terminal_Open_Dialog;
//diag_log(format["TERMINAL_ARRAY sell: %1",Terminal_Array]);
if ( count (Terminal_Array) > 0) then
	{
		_price	=	-1;
		{
			if	(_price	==	-1) then
				{
					_name		=	(_x select 0);
					_price		=	(_x select 3);
				};
			_item		=	(_x select 2);
			_text_pic	=	[_item] call Terminal_Get_Item_Text_Pic;
			//diag_log (format["_item: %1,_price: %2",_item,_price]);
			if ( (count(_text_pic)) > 0) then
				{
					_text	=	_text_pic select 0;
					_pic	=	_text_pic select 1;
					_index	=	lbAdd[13002,_text];
					lbSetPicture [13002, _index, _pic];
				};		
		} forEach Terminal_Array;
		ctrlSetText [13004, (localize "Ultima_TT_Price") + str(_price)];	//	Цена
		ctrlSetText [13005, (localize "Ultima_TT_Trader") + _name];		//	Продавец
		lbSetCursel[13002, 0];
	};
hintSilent localize "Ultima_TT";
