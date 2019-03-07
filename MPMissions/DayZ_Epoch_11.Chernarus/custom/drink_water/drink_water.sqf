private["_isInfected", "_display"];
_isInfected		=	25;	//	Процент заражения, от 0 до 101. 0 - Нет заражения. 101 - 100% заражение.
player playActionNow "PutDown";
if ((floor (random 100) < _isInfected)) then
	{
		r_player_infected = true;
		player setVariable["USEC_infected",true,true];
		cutText ["Вода теплая и ​​вкус своего рода странный, но ваша жажда угасла.", "PLAIN DOWN"];
	}
else
	{
		dayz_thirst = 0;
		cutText ["Вода прохладная и вкус немного несвежий, но ваша жажда угасла.", "PLAIN DOWN"];
	};
dayz_lastDrink	=	time;
disableserialization;			
_display		=	uiNamespace getVariable 'DAYZ_GUI_display';
(_display displayCtrl 1302) ctrlShow true;