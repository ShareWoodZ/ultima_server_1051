private ["_zed","_killer","_kills","_array","_type","_humanity"];
_array	=	_this select 0;
_zed	=	_array select 0;
_killer	=	_array select 1;
_type	=	_this select 1;
if (local _zed) then
	{
		_kills = _killer getVariable[_type,0];
		_killer setVariable[_type,(_kills + 1),true];
		_humanity = _killer getVariable["humanity",0];
		_humanity = _humanity + 3;
		_killer setVariable["humanity",_humanity,true];
		
		if (_killer	==	player) then
			{
				if (Ultima_Zombie_Reward > 0) then
					{			
						Terminal_Server	=	[player, "reward", Ultima_Zombie_Reward];
						publicVariableServer "Terminal_Server";
					};
						
				if !(isNil "Ultima_Quest_Zombie_Kill_Done") then
					{
						Ultima_Quest_Zombie_Kill	=	Ultima_Quest_Zombie_Kill + 1;
						if (Ultima_Quest_Zombie_Kill > 150) then
							{Ultima_Quest_Zombie_Kill_Done	=	true;};
					};
			};
	};