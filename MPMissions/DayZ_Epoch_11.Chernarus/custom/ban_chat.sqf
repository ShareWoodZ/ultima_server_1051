Private ["_control", "_chat", "_channel", "_global_text", "_all_block"];
_all_block	=	true;	//	Блокировать весь чат
if (isNil "Ultima_Ban_Chat") then
	{Ultima_Ban_Chat	=	false;};
disableSerialization;
while {true} do
	{
		if (Ultima_Ban_Chat) then
			{
				if !(isNull	(findDisplay 63)) then
					{
						_control	=	((findDisplay 63) displayCtrl 101);
						if !(isNil "_control") then
							{
								if (_all_block) then
									{
										findDisplay 24 closeDisplay 2;
										systemChat "<Бан чата> Вы не можете писать в глобальный чат!";
									}
								else
									{
								
										_channel	=	ctrlText _control;
										if (_channel == localize "str_channel_side") then
											{
												_chat			=	((findDisplay 24) displayCtrl 101);
												_global_text	=	ctrlText _chat;
												if (_global_text != "") then
													{
														_chat ctrlSetText "";
														findDisplay 24 closeDisplay 2;
														systemChat "<Бан чата> Вы не можете писать в глобальный чат!";
													};
											};
									};
							};
					};
			};
		uiSleep 0.5;
	};