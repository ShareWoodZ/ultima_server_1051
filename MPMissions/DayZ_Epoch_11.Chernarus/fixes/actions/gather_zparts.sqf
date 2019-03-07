private ["_hasKnife","_qty","_item","_text","_type","_started","_finished","_animState","_isMedic","_hasHarvested","_hasKnifeBlunt","_humanity"];
if(DZE_ActionInProgress) exitWith 
	{cutText [(localize "str_epoch_player_31") , "PLAIN DOWN"];};
DZE_ActionInProgress = true;
player removeAction s_player_butcher;
s_player_butcher = 1;
_item			=	(_this select 3);
_hasKnife		=	"ItemKnife" in items player;
_hasKnifeBlunt	=	"ItemKnifeBlunt" in items player;
_type			=	typeOf _item;
_hasHarvested	=	_item getVariable["meatHarvested",false];
if ((_hasKnife || _hasKnifeBlunt) && !_hasHarvested) then
	{
		_text	=	getText (configFile >> "CfgVehicles" >> _type >> "displayName");
		[1,1] call dayz_HungerThirst;
	 	player playActionNow "Medic";
		[player,50,true,(getPosATL player)] spawn player_alertZombies;
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
		r_doLoop = false;
		if (!_finished) exitWith
			{
				r_interrupt	=	false;
				if (vehicle player == player) then
					{
						[objNull, player, rSwitchMove,""] call RE;
						player playActionNow "stop";
					};
				cutText [(localize "str_epoch_player_30") , "PLAIN DOWN"];
			};
		_hasHarvested = _item getVariable["meatHarvested",false];
		if(_finished && !_hasHarvested) then
			{
				_item setVariable["meatHarvested",true,true];
				[player, "gut", 0, false, 10] call dayz_zombieSpeak;  
				_qty	=	1;
				if (local _item) then
					{[_item,_qty] spawn local_gutObjectZ;}
				else
					{
						PVDZE_plr_GutBodyZ	=	[_item,_qty];	
						publicVariable "PVDZE_plr_GutBodyZ";
					};
				_humanity	=	player getVariable["humanity",0];
				_humanity	=	_humanity - 4;
				player setVariable["humanity",_humanity,true];
				cutText [localize "Ultima_Gather_Z", "PLAIN DOWN"];
			};
	};
s_player_butcher = -1;
DZE_ActionInProgress = false;