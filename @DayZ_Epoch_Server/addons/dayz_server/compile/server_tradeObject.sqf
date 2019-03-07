private ["_player","_name","_traderid","_buyorsell","_data","_result","_key","_outcome","_clientID"];
_player			=	_this select 0;
_traderID		=	_this select 1;
_buyorsell		=	_this select 2;	//0 > Buy // 1 > Sell
_classname	=	_this select 3;
_traderCity	=	_this select 4;
_clientID		=	owner _player;
_name			=	if (alive _player) then { name _player; } else { "Мертвый игрок"; };
if ((count _this) > 5) then
	{
		_currency		=	_this select 5;
		_qty			=	_this select 6;
		_price			=	format ["%2x %1",_currency,_qty];
		if (_buyorsell == 0) then
			{diag_log format["[Сервер]: Торговля: %1 (%2) купил %3 в %4 за %5", _name, (getPlayerUID _player), _classname, _traderCity, _price];}
		else
			{diag_log format["[Сервер]: Торговля: %1 (%2) продал %3 в %4 за %5",_name, (getPlayerUID _player), _classname, _traderCity, _price];};		
	}
else
	{
		if (_buyorsell == 0) then
			{diag_log format["[Сервер]: Торговля: %1 (%2) купил %3, в %4 за камни", _name, (getPlayerUID _player), _classname, _traderCity];}
		else
			{diag_log format["[Сервер]: Торговля: %1 (%2) продал %3 в %4 за камни",_name, (getPlayerUID _player), _classname, _traderCity];};
	};		
if (DZE_ConfigTrader) then
	{_outcome	=	"PASS";}
else
	{
		_key		=	format["CHILD:398:%1:%2:",_traderID,_buyorsell];
		_data		=	"HiveEXT" callExtension _key;
		_result		=	call compile format ["%1",_data];
		_outcome	=	_result select 0;
	};
dayzTradeResult	=	_outcome;
if(!isNull _player) then
	{_clientID publicVariableClient "dayzTradeResult";};