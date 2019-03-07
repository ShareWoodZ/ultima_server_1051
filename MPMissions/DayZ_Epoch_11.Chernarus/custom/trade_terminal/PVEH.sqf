if !(isServer) then
	{
		"Terminal_Client" addPublicVariableEventHandler
			{
				Private ["_packet_type","_data"];
				_packet_type	=	((_this select 1) select 0);
				_data			=	((_this select 1) select 1);
				switch (_packet_type) do
					{
						case "partition"			: {Terminal_Array	=	_data;};
						case "terminal_my_items"	: {Terminal_Array	=	_data;};
						case "base_days"			: {Ultima_Base_Days	=	_data;};						
						case "error"				: {taskHint [_data, [1,0,0.1,1], 'taskFailed'];};
						case "message"				: {taskHint [_data, [0,1,0,1], 'taskDone'];};
						case "acceptAdd"			: {[_data] call Terminal_Accept_Add;};
						case "acceptDrop"			: {[_data] call Terminal_Accept_Drop_Buy;};
						case "system"				: {systemChat _data};
						case "quest_expaired"		: {[_data] call Ultima_Quest_Delete;};
						case "ultima_ban_chat"		: {Ultima_Ban_Chat	=	true;};
						case "ultima_ban_chat_off"	: {Ultima_Ban_Chat	=	false;};
					};
			};
		diag_log("[#Ultima]: [Терминал торговли]: Зарегистрировано публичное событие Terminal_Client!");
	};