Private ["_s_player_trade_gold"];
_s_player_trade_gold	=	-1;
while {true} do
	{
		if ( (player distance [6441, 6545]) < 5 ) then
			{
				if (_s_player_trade_gold < 0) then
					{_s_player_trade_gold	=	player addaction["Обменять 10 самородков, на 20 баксов", "custom\trade_gold.sqf", "", 5, false, true, "", ""];};
			}
		else
			{
				player removeAction _s_player_trade_gold;
				_s_player_trade_gold	=	-1;
			};
		sleep 2;
	};