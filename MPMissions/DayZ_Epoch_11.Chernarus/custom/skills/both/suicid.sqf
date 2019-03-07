private ["_Secondary","_lostHope","_plEH","_actSuicide"];
_Secondary	=	currentWeapon player;
_plEH		=	player addEventHandler ["fired", "player SetDamage 1.1"];
_lostHope	=	time;
r_interrupt	=	false;
cutText [format[localize "Ultima_Skill_Suicide_1"], "PLAIN DOWN"];
sleep 2;
player playmove "ActsPercMstpSnonWpstDnon_suicide1B";
_actSuicide = 1;
while {alive player}do
	{
		if(r_interrupt)exitWith
			{
				player playMoveNow "AmovPercMstpSlowWrflDnon_AmovPsitMstpSlowWrflDnon";
				cutText [format[localize "Ultima_Skill_Suicide_5"], "PLAIN DOWN"];
				while{true}do
					{
						if(!((animationState player) in ["AmovPercMstpSlowWrflDnon_AmovPsitMstpSlowWrflDnon"]) && (alive player))exitWith
							{player removeEventHandler["fired", _plEH];sleep 1;player switchmove "";sleep 1;PVDZE_plr_Save = [player,[],true,true];publicVariableServer "PVDZE_plr_Save";};
					};
			};
		if(time - _lostHope > 2 && _actSuicide < 2)then
			{
				cutText [format[localize "Ultima_Skill_Suicide_2"], "PLAIN DOWN"];
				_actSuicide = 2;
			};
		if(time - _lostHope > 6 && _actSuicide < 3)then
			{
				cutText [format[localize "Ultima_Skill_Suicide_3"], "PLAIN DOWN"];
				_actSuicide = 3;
			};
		if(time - _lostHope > 7 && _actSuicide <4)then
			{
				cutText [format[localize "Ultima_Skill_Suicide_4"], "PLAIN DOWN"];
				_actSuicide = 4;
			};
		if(time - _lostHope > 9.2 && _actSuicide > 3)exitWith
			{
				player fire _Secondary;
				player setDamage 1;
			};
		sleep .1;
	};