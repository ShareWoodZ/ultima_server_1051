private ["_humanityTarget","_distance","_size","_friendlies","_charID","_rcharID","_rfriendlies","_rfriendlyTo","_color","_string","_tmpVar","_display","_displayCtrl","_foodval","_thirstVal","_pathGreen","_pathYellow","_pathRed","_stime","_hours","_minutes","_minutes2"];

_foodVal	=	1 - (dayz_hunger / SleepFood);
_thirstVal	=	1 - (dayz_thirst / SleepWater);
disableSerialization;
if (uiNamespace getVariable ["DZ_displayUI", 0] == 1) exitWith
	{
		_array = [_foodVal,_thirstVal];
		_array
	};
_foodVal		=	floor ((1 - dayz_hunger / SleepFood) * 100);	
_pathGreen		=	"custom\ultima_debug\icons\green\green_";
_pathYellow		=	"custom\ultima_debug\icons\yellow\yellow_";
_pathRed		=	"custom\ultima_debug\icons\red\red_";
_display		=	uiNamespace getVariable 'DAYZ_GUI_display';
//	Иконки внизу, с правой стороны.
//	Голод
_displayCtrl	=	_display displayCtrl 8200;
_tmpVar			=	floor ((1 - dayz_hunger / SleepFood) * 100);
if (_tmpVar > 60) then
	{_displayCtrl ctrlSetText _pathGreen+"food.paa";}
else
	{
		if (_tmpVar > 30) then
			{_displayCtrl ctrlSetText _pathYellow+"food.paa";}
		else
			{_displayCtrl ctrlSetText _pathRed+"food.paa";}
	};
//	Жажда
_displayCtrl	=	_display displayCtrl 8201;
_tmpVar			=	floor ((1 - dayz_thirst / SleepWater) * 100);
if (_tmpVar > 60) then
	{_displayCtrl ctrlSetText _pathGreen+"water.paa";}
else
	{
		if (_tmpVar > 30) then
			{_displayCtrl ctrlSetText _pathYellow+"water.paa";}
		else
			{_displayCtrl ctrlSetText _pathRed+"water.paa";}
	};
//	Температура
_displayCtrl	=	_display displayCtrl 8202;
_tmpVar			=	round (dayz_temperatur);
if (_tmpVar > 35) then
	{_displayCtrl ctrlSetText _pathGreen+"temperature.paa";}
else
	{
		if (_tmpVar == 35) then
			{_displayCtrl ctrlSetText _pathYellow+"temperature.paa";}
		else
			{_displayCtrl ctrlSetText _pathRed+"temperature.paa";};
	};
//	Кровотечение
_displayCtrl	=	_display displayCtrl 8203;
if (r_player_injured) then
	{_displayCtrl ctrlSetText _pathRed+"bleeding.paa";}
else
	{_displayCtrl ctrlSetText _pathGreen+"bleeding.paa";};
//	Перелом
_displayCtrl	=	_display displayCtrl 8204;
if (r_fracture_legs) then
	{_displayCtrl ctrlSetText _pathRed+"bone.paa";}
else
	{_displayCtrl ctrlSetText _pathGreen+"bone.paa";};
//	Инфекция
_displayCtrl	=	_display displayCtrl 8205;
if (r_player_infected) then
	{_displayCtrl ctrlSetText _pathRed+"infection.paa";}
else
	{_displayCtrl ctrlSetText _pathGreen+"infection.paa";};
//	Боль
_displayCtrl	=	_display displayCtrl 8206;
if (r_player_inpain) then
	{_displayCtrl ctrlSetText _pathRed+"pain.paa";}
else
	{_displayCtrl ctrlSetText _pathGreen+"pain.paa";};
//	Статус битвы
_displayCtrl		=	_display displayCtrl 8207;
if (dayz_combat > 0) then
	{_displayCtrl ctrlSetText _pathRed+"battle.paa";}
else
	{_displayCtrl ctrlSetText _pathGreen+"battle.paa";};
//	Слышимость
_displayCtrl	=	_display displayCtrl 8208;
_tmpVar			=	floor dayz_disAudial;
if (_tmpVar < 15) then
	{_displayCtrl ctrlSetText _pathGreen+"listen.paa";}
else
	{
		if (_tmpVar < 35) then
			{_displayCtrl ctrlSetText _pathYellow+"listen.paa";}
		else
			{_displayCtrl ctrlSetText _pathRed+"listen.paa";};
	};
//	Видимость
_displayCtrl	=	_display displayCtrl 8209;
_tmpVar			=	floor dayz_disVisual;
if (_tmpVar < 50) then
	{_displayCtrl ctrlSetText _pathGreen+"eye.paa";}
else
	{
		if (_tmpVar < 70) then
			{_displayCtrl ctrlSetText _pathYellow+"eye.paa";}
		else
			{_displayCtrl ctrlSetText _pathRed+"eye.paa";};
	};
//*********Иконки внизу, с левой стороны*********//
//	FPS
_tmpVar			=	floor diag_fps;
_displayCtrl	=	_display displayCtrl 8210;
if (_tmpVar > 40) then
	{_displayCtrl ctrlSetText _pathGreen+"fps.paa";}
else
	{
		if (_tmpVar > 20) then
			{_displayCtrl ctrlSetText _pathYellow+"fps.paa";}
		else
			{_displayCtrl ctrlSetText _pathRed+"fps.paa";};
	};
//	Текст - FPS
_displayCtrl	=	_display displayCtrl 8211;
_displayCtrl ctrlSetText str(_tmpVar);
// Время работы сервера
if(serverTime > 36000) then
	{_stime = time;}
else
	{_stime = serverTime;};
_hours		=	(_stime/60/60);
_hours		=	toArray (str _hours);
_hours resize 1;
_hours		=	toString _hours;
_hours		=	compile _hours;
_hours		=	call  _hours;
_minutes	=	floor(_stime/60);
_minutes2	=	((_minutes - (_hours*60)) min 60) max 0;
_displayCtrl	=	_display displayCtrl 8212;
if ((_hours < 3) || (_minutes2 < 30)) then
	{_displayCtrl ctrlSetText _pathGreen+"uptime.paa";}
else
	{
		if (_minutes2 < 45) then
			{_displayCtrl ctrlSetText _pathYellow+"uptime.paa";}
		else
			{_displayCtrl ctrlSetText _pathRed+"uptime.paa";};
	};
if (_minutes2 < 10) then
	{_minutes2 = format ['0%1',_minutes2];};	
//	Текст - время работы сервера
_tmpVar	= format ["%1%2 %3%4", _hours, localize "Ultima_Hours", _minutes2, localize "Ultima_Minutes"];
_displayCtrl	=	_display displayCtrl 8213;
_displayCtrl ctrlSetText _tmpVar;
//	Онлайн
_displayCtrl	=	_display displayCtrl 8214;
_displayCtrl ctrlSetText _pathGreen+"online.paa";
//	Текст - Онлайн
_displayCtrl	=	_display displayCtrl 8215;
_displayCtrl ctrlSetText str(playersNumber west);
//GPS
//if ("ItemGPS" in weapons player) then {
//str(mapGridPosition position player);
//***************Иконки с правого края, с верху - в низ.*********************//
// Здоровье
_displayCtrl	=	_display displayCtrl 8216;
if (r_player_blood > 9000) then
	{_displayCtrl ctrlSetText _pathGreen+"health.paa";}
else
	{
		if (r_player_blood > 4500) then
			{_displayCtrl ctrlSetText _pathYellow+"health.paa";}
		else
			{_displayCtrl ctrlSetText _pathRed+"health.paa";};
	};
//	Текст - Здоровье
_displayCtrl	=	_display displayCtrl 8217;
_displayCtrl ctrlSetText str(r_player_blood);
// Репутация
_displayCtrl	=	_display displayCtrl 8218;
_tmpVar			=	player getVariable ["humanity", 0];
if (_tmpVar > 4999) then
	{_displayCtrl ctrlSetText _pathGreen+"humanity.paa";}
else
	{
		if (_tmpVar > -4999) then
			{_displayCtrl ctrlSetText _pathYellow+"humanity.paa";}
		else
			{_displayCtrl ctrlSetText _pathRed+"humanity.paa";};
	};
//	Текст - Репутация
_displayCtrl	=	_display displayCtrl 8219;
_displayCtrl ctrlSetText str(_tmpVar);
// Убито в голову
_displayCtrl	=	_display displayCtrl 8220;
_displayCtrl ctrlSetText _pathGreen+"headshots.paa";
//	Текст - Убито в голову
_displayCtrl	=	_display displayCtrl 8221;
_displayCtrl ctrlSetText str(player getVariable["headshots", 0]);
// Убито зомби
_displayCtrl	=	_display displayCtrl 8222;
_displayCtrl ctrlSetText _pathGreen+"killzombies.paa";
//	Текст - зомби
_displayCtrl	=	_display displayCtrl 8223;
_displayCtrl ctrlSetText str(player getVariable["zombieKills", 0]);
// Убито бандитов
_displayCtrl	=	_display displayCtrl 8224;
_displayCtrl ctrlSetText _pathGreen+"killbandits.paa";
//	Текст - Убито бандитов
_displayCtrl	=	_display displayCtrl 8225;
_displayCtrl ctrlSetText str(player getVariable["banditKills", 0]);
// Убито людей
_displayCtrl	=	_display displayCtrl 8226;
_displayCtrl ctrlSetText _pathGreen+"killhumans.paa";
//	Текст - Убито людей
_displayCtrl	=	_display displayCtrl 8227;
_displayCtrl ctrlSetText str(player getVariable["humanKills", 0]);
//	Деньги
_displayCtrl	=	_display displayCtrl 8228;
_displayCtrl ctrlSetText _pathGreen+"bank.paa";
//	Текст - Деньги	
_displayCtrl	=	_display displayCtrl 8229;
_displayCtrl ctrlSetText str(player getVariable ["Ultima_Money", -1]);

//	Наличные
_displayCtrl	=	_display displayCtrl 8230;
_displayCtrl ctrlSetText _pathGreen+"money.paa";
//	Текст - Наличные	
_displayCtrl	=	_display displayCtrl 8231;
_displayCtrl ctrlSetText str(player getVariable ["Ultima_Cash", -1]);

//	Депозит
_displayCtrl	=	_display displayCtrl 8232;
_displayCtrl ctrlSetText _pathGreen+"deposite.paa";
//	Текст - Депозит
_displayCtrl	=	_display displayCtrl 8233;
_displayCtrl ctrlSetText str(player getVariable ["Ultima_Deposite", -1]);


//	Локация
_tmpVar = nearestLocations [getPos player, ['NameCityCapital', 'NameCity', 'NameVillage', 'NameLocal'], 750];
_displayCtrl	=	_display displayCtrl 8234;
if (count _tmpVar > 0) then
	{
		_tmpVar = text (_tmpVar select 0);
		_displayCtrl ctrlSetText _pathGreen+"location.paa";
	}
else
	{
		_tmpVar = localize "Ultima_Unknown";
		_displayCtrl ctrlSetText _pathRed+"location.paa";
	};
//	Текст - Локация
_displayCtrl	=	_display displayCtrl 8235;
_displayCtrl ctrlSetText _tmpVar;

//	Имена в трейд зонах
_displayCtrl = _display displayCtrl 8236;
if !(canbuild) then
	{
		_humanityTarget = cursorTarget;
		if (!isNull _humanityTarget && isPlayer _humanityTarget && alive _humanityTarget && ((_humanityTarget distance player) < 20)) then
			{_displayCtrl ctrlSetText (name _humanityTarget);}
		else
			{_displayCtrl ctrlSetText "";};
	}
else
	{_displayCtrl ctrlSetText "";};	
	
//	Текст - Админские монетки
_tmpVar	=	player getVariable ["admin_money", 0];	
if (_tmpVar > 0) then
	{
		_displayCtrl	=	_display displayCtrl 8237;
		_displayCtrl ctrlSetText _pathGreen+"donat.paa";
		_displayCtrl	=	_display displayCtrl 8238;
		_displayCtrl ctrlSetText str(_tmpVar);
	}
else
	{
		_displayCtrl	=	_display displayCtrl 8237;
		_displayCtrl ctrlSetText "";
		_displayCtrl	=	_display displayCtrl 8238;
		_displayCtrl ctrlSetText "";
	};
	
_array = [_foodVal,_thirstVal];
_array