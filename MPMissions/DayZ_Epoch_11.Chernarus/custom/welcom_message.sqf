Ultima_Base_Days	=	[];
Terminal_Server		=	[player, "base_days"];
publicVariableServer "Terminal_Server";
private ["_messages","_memberFunction","_memberNames","_finalText","_onScreenTime","_message"];
_onScreenTime	=	5;
 waitUntil {!isNil "dayz_animalCheck"};
sleep 5;
_messages	=
	[
		[localize "Ultima_WM_Welcom",["SERVERNAME"]]
		,[localize "Ultima_WM_Admins",["ADMINNAME"]]
		,[localize "Ultima_WM_VK",["vk_group"]]
		,[localize "Ultima_WM_Site",["site"]]
		,[localize "Ultima_WM_HotKeys",[localize "Ultima_WM_HotKeys1" + "Shift+1", localize "Ultima_WM_HotKeys2" + "Shift+2", localize "Ultima_WM_HotKeys3" + "Shift+3", localize "Ultima_WM_HotKeys4" + "Shift+4", localize "Ultima_WM_HotKeys5" + "Shift+5"]]
	];
if ( (count Ultima_Base_Days) > 0 ) then
	{
		systemChat localize "Ultima_WM_Expire";
		_message	=	[];
		{
			_message set [count _message, ((_x select 0) + " " + str(_x select 1) + " дней")];
			systemChat format["%1", (_message select ((count _message) - 1) )];
		}forEach Ultima_Base_Days;
		_messages set [count _messages, [localize "Ultima_WM_Expire", _message]]; 
		Ultima_Base_Days	=	nil;
	};
{
	sleep 2;
	_memberFunction	=	(_x select 0);
	_memberNames	=	(_x select 1);
	_finalText		=	format ["<t size='0.40' color='#f2cb0b' align='right'>%1<br /></t>", _memberFunction] + "<t size='0.70' color='#FFFFFF' align='right'>";
	{_finalText		=	_finalText + format ["%1<br />", _x]} forEach _memberNames;
	_finalText		=	_finalText + "</t>";
	_onScreenTime + (((count _memberNames) - 1) * 0.5);
	[
		_finalText
		,[safezoneX + safezoneW - 0.8,0.50]
		,[safezoneY + safezoneH - 0.8,0.7]
		,_onScreenTime
		,0.5
	] spawn BIS_fnc_dynamicText;
	sleep (_onScreenTime);
} forEach _messages;
