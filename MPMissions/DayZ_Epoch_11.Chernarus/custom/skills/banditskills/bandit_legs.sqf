private ["_usageTime","_LastMorphineTime","_control","_display"];
if (isNil "MorphineTime") then
	{MorphineTime	=	0;};
_usageTime				=	60;							//Время повторного использования скила
_LastMorphineTime	=	time - MorphineTime;	//Сколько времени прошло с прошлого использования скила
if(_LastMorphineTime < _usageTime) exitWith
	{cutText [format[localize "Ultima_Reuse",(_LastMorphineTime - _usageTime)], "PLAIN DOWN"];};
disableserialization;
MorphineTime	=	time;
player setVariable ["hit_legs",0];
player setVariable ["hit_hands",0];
r_fracture_legs	=	false;
r_fracture_arms	=	false;
player setHit["legs",0];
player setHit["hands",0];
_display = uiNamespace getVariable 'DAYZ_GUI_display';
_control = _display displayCtrl 1203;
_control ctrlShow false;
PVDZE_send = [player,"Morphine",[player,player]];
publicVariableServer "PVDZE_send";	
titleText [localize "Ultima_Skill_Fracture_Cured","PLAIN DOWN"]; titleFadeOut 8;
player setVariable["combattimeout", time + 30, true];
player setVariable["startcombattimer", 0, true];
dayz_combat = 1;