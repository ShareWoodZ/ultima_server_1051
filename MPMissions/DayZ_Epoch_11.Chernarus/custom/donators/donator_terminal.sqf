//	Заполнение списка предметов, при клике на раздел
donator_terminal_list_partition	=
	{
		Private ["_partition", "_text_pic", "_pic", "_index"];
		_partition	=	lbText [24002, (lbCurSel 24002)];
		lbClear 24003;
		{
			if ( (_partition == (_x select 0)) && (_partition != "Услуги") ) then
				{
					_item	=	(_x select 1);
					_text_pic	=	[_item] call Terminal_Get_Item_Text_Pic;
					if ( (count(_text_pic)) > 0) then
						{
							_text	=	(_text_pic select 0);
							_pic	=	(_text_pic select 1);
							_index	=	lbAdd[24003,_text];
							lbSetPicture [24003, _index, _pic];
						}
					else
						{_index	=	lbAdd[24003,_item];};
					lbSetData [24003, _index, _item];
				};
			if ( (_partition == (_x select 0)) && (_partition == "Услуги") ) then 
				{
					_item	=	(_x select 3);
					_index	=	lbAdd[24003,_item];
					lbSetData [24003, _index, (_x select 1)];
				};
		} forEach a_Terminal_Admin;
	};
	
//	Отображение цены объекта или услуги, при клике на элемент списка
donator_terminal_show_price	=
	{
		Private ["_buy", "_price"];
		_buy	=	lbData [24003, (lbCurSel 24003)];
		{
			if ( _buy == (_x select 1) ) exitWith
				{_price	=	(_x select 2);};
		} forEach a_Terminal_Admin;
		if (isNil "_price") exitWith {};
		ctrlSetText [24006, ("Стоимость: " + str(_price))];		
	};
	
//	Клик на кнопку - Приобрести
donator_terminal_buy	=
	{
		Private ["_buy", "_price"];
		_buy	=	lbData [24003, (lbCurSel 24003)];
		{
			if ( _buy == (_x select 1) ) exitWith
				{_price	=	(_x select 2);};
		} forEach a_Terminal_Admin;
		if (isNil "_price") exitWith {};
		if (_price > (player getVariable ["admin_money", 0])) exitWith
			{taskHint ["У Вас недостаточно средств!", [1,0,0.1,1], "taskFailed"]};
		//	Проверки
		if !([_buy] call Terminal_Test_Buy_Drop_Item) exitWith {};
		Terminal_Server	=	[player, "donator_buy", _buy];
		publicVariableServer "Terminal_Server";
	};