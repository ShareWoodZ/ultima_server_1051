private ["_usageTime","_LastBandageTime","_control","_display"];
if (isNil "BandageTime") then
	{BandageTime	=	0;};
_usageTime				=	60;							//Время повторного использования скила
_LastBandageTime	=	time - BandageTime;	//Сколько времени прошло с прошлого использования скила
if(_LastBandageTime < _usageTime) exitWith
	{cutText [format[localize "Ultima_Reuse",(_LastBandageTime - _usageTime)], "PLAIN DOWN"];};
disableserialization;
BandageTime		=	time;
r_player_injured	=	false;
"dynamicBlur" ppEffectAdjust [0]; "dynamicBlur" ppEffectCommit 5;		
r_player_handler	=	false;
if (r_player_blood == r_player_bloodTotal) then
	{player setVariable["USEC_lowBlood",false,true];};
_display				=	uiNamespace getVariable 'DAYZ_GUI_display';
_control				=	_display displayCtrl  1303;
_control ctrlShow false;
dayz_sourceBleeding =	objNull;
{player setVariable[_x,false,true];} forEach USEC_woundHit;
player setVariable ["USEC_injured",false,true];
titleText [localize "Ultima_Skill_Bleeding_Stopped","PLAIN DOWN"]; titleFadeOut 8;
player setVariable["combattimeout", time + 30, true];
player setVariable["startcombattimer", 0, true];
dayz_combat = 1;