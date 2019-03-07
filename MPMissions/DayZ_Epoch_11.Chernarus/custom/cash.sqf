private["_onLadder", "_body", "_cash", "_players", "_near_player"];
_body = _this select 3;
_onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
if (_onLadder) exitWith
	{cutText [localize "Ultima_No_Action_On_Stairs" , "PLAIN DOWN"]};
if (vehicle player != player) exitWith
	{cutText [localize "Ultima_No_Action_In_Vehicles", "PLAIN DOWN"]};
_players		=	nearestObjects [player, ["CAManBase"], 5];
_near_player	=	false;
{
	if ( (isPlayer _x) && (_x != player) ) exitWith
		{_near_player	=	true;};
}forEach _players;
if (_near_player) exitWith
	{cutText [localize "Ultima_No_Action_If_Other_Player", "PLAIN DOWN"]};
	
player removeAction s_player_cash;
s_player_cash = -1;
player playActionNow "Medic";
sleep 3;
_cash	=	0;
_cash	=	_body getVariable["Ultima_Cash_Body",0];
if(_cash > 0) then
	{
		_body setVariable["Ultima_Cash_Body",0,true];
		Terminal_Server	=	[player, "reward", _cash];
		publicVariableServer "Terminal_Server";
		cutText [format[localize "Ultima_Bax_Body",_cash], "PLAIN DOWN"];
	}
else
	{cutText [localize "Ultima_Body_Empty", "PLAIN DOWN"];};
