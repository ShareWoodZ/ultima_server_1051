disableSerialization;
private ["_display","_displayCtrl"];
ultima_debug_var	=	false;
waituntil {!isnull (finddisplay 46)};
systemChat ("<Ultima>: Альтернативный монитор перcонажа: Shift+3");
ultima_debug_event	=	
	{
		if  ( (_this select 1 == 4) && (_this select 2) ) then //shift+3
			{
				ultima_debug_var = !ultima_debug_var;
				_display		=	uiNamespace getVariable 'DAYZ_GUI_display';
				if (ultima_debug_var) then
					{
						systemChat ("<Ultima>: Альтернативный монитор включен!");
						for "_i" from 1300 to 1307 do
							{
								_displayCtrl	=	_display displayCtrl _i;
								_displayCtrl ctrlSetText "";
							};
						_displayCtrl	=	_display displayCtrl 1199;
						_displayCtrl ctrlSetText "";
						
						player_updateGui	=	compile preprocessFileLineNumbers "custom\ultima_debug\ultima_debug.sqf";
					}
				else
					{
						systemChat ("<Ultima>: Альтернативный монитор отключен!");
						for "_i" from 8200 to 8238 do
							{
								_displayCtrl	=	_display displayCtrl _i;
								_displayCtrl ctrlSetText "";
							};
						player_updateGui	=	compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_updateGui.sqf";
					};
			};
	};
(findDisplay 46) displayAddEventHandler["KeyUp","_this call ultima_debug_event"];