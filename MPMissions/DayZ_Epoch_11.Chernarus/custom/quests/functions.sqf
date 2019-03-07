Ultima_Quest_AD	=
	{
		Private ["_mission"];
		_mission	=	lbText [24002, (lbCurSel 24002)];
		if (_mission == "") exitWith {};
		if (_mission in Ultima_Quests_Accepted) then
			{[] call Ultima_Quest_Decline;}
		else
			{[] call Ultima_Quest_Accept;};
	};
Ultima_Quest_Accept	=
	{
		Private ["_mission", "_reputation_need", "_need_items", "_price", "_timer", "_file", "_quest_need", "_magazines"];
		if ( (count Ultima_Quests_Accepted) >= Ultima_Quest_Maximum ) exitWith
			{systemChat "У Вас взято максимально доступное кол-во заданий!";};
		_mission	=	lbText [24002, (lbCurSel 24002)];
		if (_mission == "") exitWith {};
		if (_mission in Ultima_Quests_Accepted) exitWith {};
		{
			if ( (_x select 0) == _mission ) exitWith
				{
					_reputation_need	=	(_x select 2);
					_need_items			=	(_x select 3);
					_price				=	(_x select 4);
					_timer				=	(_x select 10);
					_file				=	(_x select 11);
				};
		} forEach Ultima_Quest_Array;
		//	Проверка репутации
		_reputation		=	player GetVariable["Humanity", 0];
		if ( ((_reputation_need < 0) && (_reputation > _reputation_need)) || ((_reputation_need > 0) && (_reputation < _reputation_need)) ) exitWith
			{systemChat "У Вас не достаточно репутации для взятия данного задания!";};
		//	Проверка необходимых предметов
		_magazines	=	magazines player;
		{
			if ( !(_x in _magazines) && !(_x in weapons player) ) exitWith
				{_quest_need	=	_x;};
		} forEach _need_items;
		if !(isNil "_quest_need") exitWith
			{
				_quest_need	=	[_quest_need] call Terminal_Get_Item_Text_Pic;
				systemChat format["У Вас отсутствует: %1, для принятия данного задания!", (_quest_need select 0)];
			};			
		//	Проверка наличия средств
		if (_price > 0) then
			{
				//	Для баксов(сервера с моей сборкой)
				if ((player getVariable ["Ultima_Money", 0]) < _price) exitWith
					{
						systemChat "У Вас недостаточно средств!";
						_quest_need	=	false;
					};
				//	Списание средств
				Terminal_Server	=	[player, "trader_buy", (_price*-1)];
				publicVariableServer "Terminal_Server";
				/*
				//	Для золота
				
				//	Для коинсов
				
				*/
			};
		if !(isNil "_quest_need") exitWith {};
		//	Принятие миссии
		Terminal_Server	=	[player, "quest_accept", [_mission, (_timer*60)]];
		publicVariableServer "Terminal_Server";
		Ultima_Quests_Accepted set [count Ultima_Quests_Accepted, _mission];
		lbSetColor [24002, (lbCurSel 24002), [0, 1, 0, 1]];
		ctrlSetText [24010, "Отменить"];
		if !(isNil _file) then
			{[_mission] execVM _file;};
	};
	
Ultima_Quest_Decline	=
	{
		Private ["_mission", "_i"];
		_mission	=	lbText [24002, (lbCurSel 24002)];
		if (_mission == "") exitWith {};
		if !(_mission in Ultima_Quests_Accepted) exitWith {};
		if (_mission in Ultima_Quests_Accepted) then
			{
				Terminal_Server	=	[player, "quest_decline_delete", [_mission, true]];
				publicVariableServer "Terminal_Server";
				for "_i" from 0 to (count(Ultima_Quests_Accepted) - 1) do
					{
						if ( (Ultima_Quests_Accepted select _i) == _mission ) exitWith
							{
								Ultima_Quests_Accepted	set [_i, -1];
								Ultima_Quests_Accepted	=	Ultima_Quests_Accepted - [-1];
							};
					};
				lbSetColor [24002, (lbCurSel 24002), [1, 1, 1, 1]];
			};
		ctrlSetText [24010, "Принять"];
	};
	
Ultima_Quest_Delete	=
	{
		Private ["_i", "_mission"];
		_mission	=	(_this select 0);
		if (_mission == "") exitWith {};
		if !(_mission in Ultima_Quests_Accepted) exitWith {};
		for "_i" from 0 to (count(Ultima_Quests_Accepted) - 1) do
			{
				if ( (Ultima_Quests_Accepted select _i) == _mission ) exitWith
					{
						Ultima_Quests_Accepted	set [_i, -1];
						Ultima_Quests_Accepted	=	Ultima_Quests_Accepted - [-1];
					};
			};
	};

Ultima_Quest_Open_Dialog	=
	{
		Private ["_quest_need", "_quest_terminal"];
		//	Проверка необходимых предметов, перед открытием терминала заданий
		if ( (count Ultima_Quest_Menu_Need_Items) > 0 ) then
			{
				{
					if ( !(_x in magazines player) && !(_x in weapons player) ) exitWith
						{_quest_need	=	_x;};
				} forEach Ultima_Quest_Menu_Need_Items; 
				if !(isNil "_quest_need") then
					{
						_quest_need	=	[_quest_need] call Terminal_Get_Item_Text_Pic;
						systemChat format["У Вас отсутствует: %1, для открытия терминала заданий!", (_quest_need select 0)];
					};
			};
		if !(isNil "_quest_need") exitWith {};
		//	Открытие диалога заданий
		closeDialog 2;
		_quest_terminal = createDialog ("Ultima_Quest_Terminal");
		disableSerialization;
		if (!_quest_terminal) exitWith
			{hint "Нет возможности открыть диалог заданий!"};
		Private ["_reputation", "_quest_show", "_menu_location", "_quest", "_quest_coords", "_pos", "_radius", "_index", "_reputation_need"];			
		lbClear 24002;
		_reputation		=	player GetVariable["Humanity", 0];
		_quest_show		=	true;
		{
			_quest			=	(_x select 0);
			_menu_location	=	(_x select 12);
			//	Если включена опция, - не отображать задания неподходящие по условиям репутации
			if !(Ultima_Quest_Show_Reputation) then
				{
					_reputation_need	=	(_x select 2);
					if ( ((_reputation_need < 0) && (_reputation > _reputation_need)) || ((_reputation_need > 0) && (_reputation < _reputation_need)) ) then
						{_quest_show	=	false;};
				};
			//	Если включена опция, - не отображать задания не относящиеся к данной локации
			if (_menu_location && _quest_show) then
				{
					_quest_coords	=	(_x select 5);
					{
						_pos	=	(_x select 0);
						_radius	=	(_x select 1);
						if ( (player distance _pos) > _radius ) exitWith
							{_quest_show	=	false;};
					} forEach _quest_coords;
				};
			if (_quest_show) then
				{
					_index = lbAdd[24002, _quest];
					if (_quest in Ultima_Quests_Accepted) then
						{lbSetColor [24002, _index, [0, 1, 0, 1]];};				
				};
		} forEach Ultima_Quest_Array;
		lbSetCurSel [24002, 0];
	};
	
Ultima_Quest_Open_Info	=
	{
		Private ["_mission", "_solution"];
		_mission	=	lbText [24002, (lbCurSel 24002)];
		{
			if ( _mission == (_x select 0) ) exitWith
				{
					lbClear 24003;
					ctrlSetText [24007, ("Репутация: " + str(_x select 2))];
					ctrlSetText [24008, ("Стоимость: " + str(_x select 4))];
					ctrlSetText [24009, ("Время выполнения: " + str(_x select 10) + "мин.")];
					_solution	=	(_x select 1);
				};
		} forEach Ultima_Quest_Array;
		{
			lbAdd[24003, _x];
		} forEach _solution;
		if (_mission in Ultima_Quests_Accepted) then
			{ctrlSetText [24010, "Отменить"];}
		else
			{ctrlSetText [24010, "Принять"];}
	};