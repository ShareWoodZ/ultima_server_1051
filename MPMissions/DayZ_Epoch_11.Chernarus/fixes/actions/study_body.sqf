private["_body","_name","_method","_methodStr"];
_body	=	_this select 3;
_name	=	_body getVariable["Ultima_Reloger_Name",localize "Ultima_Unknown"];
if (_name == localize "Ultima_Unknown") then
	{_name	=	_body getVariable["bodyName", localize "Ultima_Unknown"];};
_method		=	_body getVariable["deathType", localize "Ultima_Unknown"];
_methodStr	=	localize format ["str_death_%1",_method];
cutText [format[(localize  "str_player_studybody"),_name,_methodStr], "PLAIN DOWN"];