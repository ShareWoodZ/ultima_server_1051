private ["_part_out","_part_in","_qty_out","_qty_in","_qty","_buy_o_sell","_textPartIn","_textPartOut","_bos","_needed","_started","_finished","_animState","_isMedic","_total_parts_out","_abort","_removed","_activatingPlayer","_traderID","_done"];
if(DZE_ActionInProgress) exitWith
	{cutText [(localize "str_epoch_player_103") , "PLAIN DOWN"]};
DZE_ActionInProgress	=	true;
_activatingPlayer		=	player;
_part_out				=	(_this select 3) select 0;
_part_in				=	(_this select 3) select 1;
_qty_out				=	(_this select 3) select 2;
_qty_in					=	(_this select 3) select 3;
_buy_o_sell				=	(_this select 3) select 4;
_textPartIn				=	(_this select 3) select 5;
_textPartOut			=	(_this select 3) select 6;
_traderID				=	(_this select 3) select 7;
_bos					=	0;
if(_buy_o_sell == "sell") then
	{_bos	=	1;};
_abort		=	false;
r_autoTrade	=	true;
while {r_autoTrade} do
	{
		_removed	=	0;
		if ((count (magazines player)) > 20) exitWith
			{
				cutText [(localize "STR_DAYZ_CODE_2"), "PLAIN DOWN"];
				r_autoTrade	=	false;
			};
		_canAfford	=	false;
		if (_bos == 1) then
			{
				_qty	=	{_x == _part_in} count magazines player;
				if (_qty >= _qty_in) then
					{_canAfford	=	true;};
			}
		else
			{
				//	Проверка наличия средств на покупку
				private ["_ultima_money","_dec"];
				_ultima_money	=	player getVariable ["Ultima_Money", 0];
				_dec			=	_ultima_money - _qty_in;
				if (_dec >= 0) then
					{_canAfford	=	true;};
			};
		if(!_canAfford) exitWith
			{
				_qty	=	{_x == _part_in} count magazines player;
				_needed	=	_qty_in - _qty;
				cutText [format[(localize "str_epoch_player_184"),_needed,_textPartIn] , "PLAIN DOWN"];
				r_autoTrade	=	false
			};
		cutText [(localize "str_epoch_player_105"), "PLAIN DOWN"];
		[1,1] call dayz_HungerThirst;
		player playActionNow "Medic";
		r_interrupt	=	false;
		_animState	=	animationState player;
		r_doLoop	=	true;
		_started	=	false;
		_finished	=	false;
		while {r_doLoop} do
			{
				_animState	=	animationState player;
				_isMedic	=	["medic",_animState] call fnc_inString;
				if (_isMedic) then
					{_started	=	true;};
				if (_started && !_isMedic) then
					{
						r_doLoop	=	false;
						_finished	=	true;
					};
				if (r_interrupt) then
					{r_doLoop	=	false;};
				sleep 0.1;
			};
		r_doLoop	=	false;
		if (!_finished) exitWith
			{
				r_interrupt	=	false;
				if (vehicle player == player) then
					{
						[objNull, player, rSwitchMove,""] call RE;
						player playActionNow "stop";
					};
				cutText [(localize "str_epoch_player_106") , "PLAIN DOWN"];
			};
		if (_finished) then
			{
				if (isNil "_part_in") then
					{_part_in = "Неизвестный предмет"};
				if (isNil "inTraderCity") then
					{inTraderCity = "Неизвестный торговый город"};
				if(_bos == 1) then
					{PVDZE_obj_Trade	=	[_activatingPlayer,_traderID,_bos,_part_in,inTraderCity,_part_out,_qty_out];}
				else
					{PVDZE_obj_Trade	=	[_activatingPlayer,_traderID,_bos,_part_out,inTraderCity,_part_in,_qty_in];};
				publicVariableServer  "PVDZE_obj_Trade";
				if(_bos == 0) then
					{
						waitUntil {!isNil "dayzTradeResult"};
						if(dayzTradeResult == "PASS") then
							{
								//	Снятие средств - оплата покупки
								_done			=	true;
								Terminal_Server	=	[player, "trader_buy", (-1*_qty_in)];
								publicVariableServer "Terminal_Server";
								if (_done) then
									{
										for "_x" from 1 to _qty_out do
											{player addMagazine _part_out;};
										cutText [format[(localize "str_epoch_player_186"),_qty_in,_textPartIn,_qty_out,_textPartOut], "PLAIN DOWN"];
									};
							}
						else
							{
								_abort	=	true;
								cutText [format[(localize "str_epoch_player_183"),_textPartOut] , "PLAIN DOWN"];
							};
					}
				else
					{
						_part_inClass	=	configFile >> "CfgMagazines" >> _part_in;
						_removed		=	_removed + ([player,_part_inClass,_qty_in] call BIS_fnc_invRemove);
						if (_removed == _qty_in) then
							{
								//	Начисление средств за продажу
								_canAfford		=	true;
								Terminal_Server	=	[player, "reward", _qty_out];
								publicVariableServer "Terminal_Server";
							};
						cutText [format[(localize "str_epoch_player_186"),_qty_in,_textPartIn,_qty_out,_textPartOut], "PLAIN DOWN"];
					};
				dayzTradeResult	=	nil;
			};
		if(_abort) exitWith
			{r_autoTrade	=	false;};
		sleep 1;
	};
DZE_ActionInProgress = false;