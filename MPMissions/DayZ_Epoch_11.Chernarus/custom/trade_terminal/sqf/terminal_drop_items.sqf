Private ["_item","_price","_text_pic","_text","_pic","_index"];
//	Удаляем переменную массива
Terminal_Array	=	nil;

//	Запрос на сервер о предметах игрока
Terminal_Server	=	[player, "terminal_my_items"];
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

//	Открываем таблицу предметов игрока, выставленных на торги
["Terminal_Drop_Items"] call Terminal_Open_Dialog;
//diag_log(format["TERMINAL_ARRAY drop: %1",Terminal_Array]);
if ( count (Terminal_Array) > 0) then
	{
		_price	= -1;
		//	Выводим предметы в список
		{
			_item		=	(_x select 0);
			if (_price == -1) then
				{_price			=	(_x select 1);};
			//diag_log(format["[#Ultima]: [Терминал торговли]: _item %1, _price: %2",_item,_price]);	
			_text_pic	=	[_item] call Terminal_Get_Item_Text_Pic;
			//diag_log(format["[#Ultima]: [Терминал торговли]: _count _text_pic %1",(count (_text_pic))]);
			if ( (count(_text_pic)) > 0) then
				{
					_text	=	_text_pic select 0;
					_pic	=	_text_pic select 1;
					_index		=	lbAdd[19002,_text];
					lbSetPicture [19002, _index, _pic];
				};		
		} forEach Terminal_Array;
		ctrlSetText [19004, (localize "Ultima_TT_Price") + str(_price)];
		lbSetCursel[19002, 0];
	};
hintSilent localize "Ultima_TT";