private ["_target","_objectClasses","_range","_objects","_objects_filtered","_count","_requirements","_option"];
if (DZE_ActionInProgress) exitWith
	{cutText [(localize "STR_EPOCH_ACTIONS_2") , "PLAIN DOWN"];};
DZE_ActionInProgress	=	true;
player removeAction s_player_maintain_area;
player removeAction s_player_maintain_area_preview;
s_player_maintain_area			=	1;
s_player_maintain_area_preview	=	1;
_target							=	cursorTarget;
_objectClasses					=	DZE_maintainClasses;
_range							=	DZE_maintainRange;
_objects						=	nearestObjects [_target, _objectClasses, _range];
_objects_filtered				=	[];
{
    if (damage _x >= DZE_DamageBeforeMaint) then
		{_objects_filtered set [count _objects_filtered, _x];};
} count _objects;
_objects	=	_objects_filtered;
_count		=	count _objects;
if (_count == 0) exitWith
	{
		cutText [format[(localize "STR_EPOCH_ACTIONS_22"), _count], "PLAIN DOWN"];
		DZE_ActionInProgress			=	false;
		s_player_maintain_area			=	-1;
		s_player_maintain_area_preview	=	-1;
	};
switch true do
	{
		case (_count <= 10):  {_requirements = 2};
		case (_count <= 20):  {_requirements = 4};
		case (_count <= 35):  {_requirements = 6};
		case (_count <= 50):  {_requirements = 8};
		case (_count <= 75):  {_requirements = 12};
		case (_count <= 100): {_requirements = 200};
		case (_count <= 175): {_requirements = 400};
		case (_count <= 250): {_requirements = 600};
		case (_count <= 325): {_requirements = 800};
		case (_count <= 400): {_requirements = 1000};
		case (_count <= 475): {_requirements = 1200};
		case (_count <= 550): {_requirements = 1400};
		case (_count <= 625): {_requirements = 1600};
		case (_count > 625):  {_requirements = 1800};
	};
_option = _this select 3;
switch _option do
	{
		case "maintain":
			{
				//	Проверка наличия средств на покупку
				private ["_ultima_money","_dec"];
				_ultima_money	=	player getVariable ["Ultima_Money", 0];
				_dec			=	_ultima_money - _requirements;
				if (_dec >= 0) then
					{
						Terminal_Server	=	[player, "trader_buy", (-1*_requirements)];
						publicVariableServer "Terminal_Server";
						cutText [(localize "Ultima_Action_Complete"), "PLAIN DOWN", 5];
						PVDZE_maintainArea = [player, 1, _target];
						publicVariableServer "PVDZE_maintainArea";
					}
				else
					{cutText [(localize "Ultima_TT_Not_Enough_Cash"), "PLAIN DOWN", 5];};
			};
		case "preview":
			{cutText [format[(localize "Ultima_Price"), _requirements], "PLAIN DOWN"];};
	};
DZE_ActionInProgress			=	false;
s_player_maintain_area			=	-1;
s_player_maintain_area_preview	=	-1;
