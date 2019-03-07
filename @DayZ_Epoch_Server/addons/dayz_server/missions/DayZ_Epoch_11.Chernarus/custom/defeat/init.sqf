if (isServer) then
	{
		private ["_mission","_dmg","_box","_boxID","_folder","_baseBuildings","_regTriggers","_regMarkers","_preDefMarkers","_defMarkers","_preDefTP","_DefTP","_reward","_mkrRegShape","_mkrDefShape","_coordRegDef","_coordRegAttack","_coordUnreg","_coordBase","_coordSafeTP","_mrkRegRad","_mrkDefRad","_startTime","_rndTime","_regTime","_defTime","_preDefTime","_colorRegDef","_colorRegAttack","_colorUnreg","_colorPreDef","_colorDef"];
		if (Ultima_Diag_Level > 0) then
			{diag_log("[#Ultima]: [Защита]: Старт скрипта!");};
		
		_folder			=	(Ultima_Server_Scripts_Path + "defeat\"); // Рабочая папка для компиляции.

		_mission		=	compile preprocessFileLineNumbers (_folder + "init.sqf");
		_baseBuildings	=	compile preprocessFileLineNumbers (_folder + "baseBuildings.sqf");
		_regTriggers	=	compile preprocessFileLineNumbers (_folder + "regTriggers.sqf");
		_regMarkers		=	compile preprocessFileLineNumbers (_folder + "regMarkers.sqf");
		_preDefMarkers	=	compile preprocessFileLineNumbers (_folder + "preDefMarkers.sqf");
		_defMarkers		=	compile preprocessFileLineNumbers (_folder + "defMarkers.sqf");
		_preDefTP		=	compile preprocessFileLineNumbers (_folder + "preDefTP.sqf");
		_DefTP			=	compile preprocessFileLineNumbers (_folder + "DefTP.sqf");
		_reward			=	compile preprocessFileLineNumbers (_folder + "reward.sqf");
		
		defeaters		=	[];						//	Массив ополчения.
		attackers		=	[];						//	Массив наемников.
		regtime			=	true;					//	Регистрация.
		preDefeatTime	=	true;					//	Подготовка к обороне.
		DefeatTime 		=	true;					//	Штурм.
		_mkrRegShape	=	"ELLIPSE";				//	Форма маркеров регистрации.
		_mkrDefShape	=	"ELLIPSE";				//	Форма маркеров области атаки.
		_coordRegDef	=	[11462, 11297, 0];		//	Координаты триггера регистрации ополчения.
		_coordRegAttack	=	[11527, 11370, 0];		//	Координаты триггера регистрации наемников.
		_coordUnreg		=	[11518, 11304, 0];		//	Координаты триггера отмены регистрации.
		_coordBase		=	[13619, 3166, 0];		//	Координаты базовой постройки.
		_coordSafeTP	=	[11401, 11369, 0];		//	Координаты для перемещения из зоны боевых действий.
		_mrkRegRad		=	20;						//	Радиус триггеров регистрации.
		_mrkDefRad		=	700;					//	Радиус триггеров области обороны.
		_startTime		=	300;//3600;				//	Один час. Минимальное время для старта миссии.
		_rndTime		=	1;//3600;				//	Один час. Рандом для старта миссии.
		_regTime		=	1200;					//	Двадцать минут. Время на регистрацию.
		_defTime		=	1800;					//	30 минут. Время на проведение осады.
		_preDefTime		=	900;					//	15 минут. Время на подготовку, для защитников.
		_colorRegDef	=	"ColorGreen";			//	Цвет триггера, маркера карты, для регистрации ополчения.
		_colorRegAttack	=	"ColorRed";				//	Цвет триггера, маркера карты, для регистрации наемников.
		_colorUnreg		=	"ColorYellow";			//	Цвет триггера, маркера карты, для отмены регистрации.
		_colorPreDef	=	"ColorYellow";			//	Цвет триггера, маркера карты, на подготовительном этапе обороны.
		_colorDef		=	"ColorRed";				//	Цвет триггера, маркера карты, на этапе обороны.
		//Ждем до старта миссии. (Минимальное время до старта миссии, плюс случайное число из переменной).
		if (isNil "reDefeat") then
			{uiSleep _startTime + round(random(_rndTime));}
		else
			{uiSleep 300};
		//Сообщение о старте регистрации
		[nil,nil,rTitleText,"Наемники и ополчение! Начинается регистрация на осаду! Спешите в Клен! У вас 20 минут!", "PLAIN",10] call RE;
		//Создаем триггеры для регистрации участников
		[_coordUnreg,_coordRegDef,_coordRegAttack,_mrkRegRad] spawn	_regTriggers;
		//Создаем маркеры регистрации для карты.
		[_coordRegDef,_coordRegAttack,_coordUnreg,_mkrRegShape,_colorRegDef,_colorRegAttack,_colorUnreg,_mrkRegRad] spawn _regMarkers;
		//Создаем функцию оповещения, о кол-ве наемников и ополченцев
		[] spawn
			{
				if (Ultima_Diag_Level > 1) then
					{diag_log("[#Ultima]: [Защита]: Запуск цикла оповещений, о кол-ве участников миссии!");};
				private ["_prevDef","_prevAttackers","_realDef","_realAttackers","_do","_unit"];
				_prevDef			=	0;
				_prevAttackers	=	0;
				while {regtime} do
					{
						if (count defeaters <= 0) then
							{_realDef = 0;}
						else
							{_realDef			=	count defeaters;};
						if (count attackers <= 0) then
							{_realAttackers	=	0;}
						else
							{_realAttackers	=	count attackers;};
							
						if ((_realDef != _prevDef) or (_realAttackers != _prevAttackers)) then
							{
								if (Ultima_Diag_Level > 1) then
									{diag_log(format["[#Ultima]: [Защита]: Регистрация: Ополчение %1. Наемники %2.",_realDef,_realAttackers]);};
								_prevDef			=	_realDef;
								_prevAttackers	=	_realAttackers;
								_do = format ['systemChat("Миссия: Защита. Регистрации: Ополчение: %1. Наемники: %2.");',_realDef,_realAttackers];
								_unit = createAgent ["Sheep", [4000,4000,0], [], 0, "FORM"];
								_unit setVehicleInit _do;
								processInitCommands;
								deleteVehicle _unit;
							};
						sleep 1;
					};
			};
			
		//Ждем окончания времени регистрации
		uiSleep _regtime;
		//Указываем, что регистрация завершена.
		regtime	=	false;
		//Сообщение об окончании регистрации
		[nil,nil,rTitleText,"Регистрация ополчения и наемников завершена!", "PLAIN",10] call RE;
		//Ждем удаления маркеров.
		sleep 25;
		//Проверка условий для старта миссии, исходя из кол-ва зарегистрированных участников.
		if ((count defeaters) < 2) exitWith
			{
				//Сообщение об отмене эвента
				if (Ultima_Diag_Level > 1) then
					{diag_log("[#Ultima]: [Защита]: Миссия отменена, - недостаточно ополченцев!");};
				[nil,nil,rTitleText,"Не удалось собрать достаточное кол-во ополченцев... Миссия отменена!", "PLAIN",10] call RE;
				reDefeat = true;
				[] spawn _mission;				
			};
		if ((count attackers) < (count defeaters)) exitWith
			{
				//Сообщение об отмене эвента
				if (Ultima_Diag_Level > 1) then
					{diag_log("[#Ultima]: [Защита]: Миссия отменена, - недостаточно наемников!");};
				[nil,nil,rTitleText,"Не удалось собрать достаточное кол-во наемников... Миссия отменена!", "PLAIN",10] call RE;
				reDefeat = true;
				[] spawn _mission;				
			};
		if ((count attackers) > ((count defeaters) + 5)) exitWith
			{
				//Сообщение об отмене эвента
				if (Ultima_Diag_Level > 1) then
					{diag_log("[#Ultima]: [Защита]: Миссия отменена, - наемников слишком много.");};
				[nil,nil,rTitleText,"наемников слишком много. Это была бы бойня... Миссия отменена!", "PLAIN",10] call RE;
				reDefeat = true;
				[] spawn _mission;	
			};
		//Сообщение о начале защиты
		if (Ultima_Diag_Level > 1) then
			{diag_log("[#Ultima]: [Защита]: 15 минут до начала атаки!");};
		[nil,nil,rTitleText,"Ополчение! У вас 20 минут до начала атаки! Прибудьте на Скалистый!", "PLAIN",10] call RE;
		//Создаем маркер защищаемой области.(20 минутная готовность).
		if (Ultima_Diag_Level > 1) then
			{diag_log("[#Ultima]: [Защита]: Создание маркера, защищаемой области.");};
		[_coordBase,_mkrDefShape,_colorPreDef,_mrkDefRad] spawn _preDefMarkers;
		//Ждем пока телепортанет оттуда лишний народ
		uiSleep 5;
		//Создаем триггер телепортации из точки защитников, всех кроме защитников(на 15 минут).
		[_coordSafeTP,_mrkDefRad,_coordBase] spawn _preDefTP;
		//Создаем базу.
		if (Ultima_Diag_Level > 1) then
			{diag_log("[#Ultima]: [Защита]: Создание базы!");};
		[] spawn _baseBuildings;
		//Cпавним объект, при разрушении которого до истечения времени боевых действий, осаждающие проигрывают.
		if (Ultima_Diag_Level > 1) then
			{diag_log("[#Ultima]: [Защита]: Создание объекта!");};
		_boxID	=	str(round(random 999999));
		_box	=	objNull;
		_box 	= createVehicle ["USVehicleBox", _coordBase, [], 0, "CAN_COLLIDE"];
		_box setPos _coordBase;
		_box setVariable ["ObjectID", _boxID, true];
		_box setVariable ["ObjectUID", _boxID, true];
		_box setVariable ["permaLoot",true];
		PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor, _box];
		clearWeaponCargoGlobal _box;
		clearMagazineCargoGlobal _box;
		
		
		//Ждем окончания времени данного на подготовку, защитникам базы
		diag_log(format["[#Ultima]: [Защита]: Время на подготовку: %1", _preDefTime]);
		uiSleep _preDefTime;
		if (Ultima_Diag_Level > 1) then
			{diag_log("[#Ultima]: [Защита]: Время отведенное на подготовку атаки, закончилось!");};
		preDefeatTime = false;
		//Ждем удаления маркера зоны боевых действий(тот который 15 минутный)
		uiSleep 25;
		//Сообщение о начале защиты
		if (Ultima_Diag_Level > 1) then
			{diag_log("[#Ultima]: [Защита]: Начало атаки!");};
		[nil,nil,rTitleText,"Ополченцы! Время пришло! Защищайтесь!", "PLAIN",10] call RE;
		//Создаем маркер зоны боевых действий
		if (Ultima_Diag_Level > 1) then
			{diag_log("[#Ultima]: [Защита]: Создание маркера, защищаемой области.");};
		[_coordBase,_mkrDefShape,_colorDef,_mrkDefRad] spawn _defMarkers;
		//Создаем триггер телепортации, из зоны боевых действий, всех незарегистрированных участников
		[_coordSafeTP,_mrkDefRad,_coordBase] spawn _DefTP;
		//Проверка уничтожения коробки и коррекция времени эвента
		while {DefeatTime} do
			{
				uiSleep 10;
				_defTime	=	_defTime - 10;
				_dmg		=	getDammage _box;
				if (_dmg >= 1) exitWith
					{
						DefeatTime	=	false;
						if (Ultima_Diag_Level > 1) then
							{diag_log("[#Ultima]: [Защита]: Миссия завершена! Атакующие штурмом взяли укрепление ополченцев!");	};
						[nil,nil,rTitleText,"Миссия защита, - завершена! Атакующие, штурмом взяли укрепление ополченцев!", "PLAIN",10] call RE;
						[attackers] spawn _reward;
					};
				if (_defTime < 0) exitWith
					{
						DefeatTime	=	false;
						if (Ultima_Diag_Level > 1) then
							{diag_log("[#Ultima]: [Защита]: Миссия завершена! Ополчение успешно отразило атаку!");};
						[nil,nil,rTitleText,"Миссия защита, - завершена! Ополчение успешно отразило атаку!", "PLAIN",10] call RE;
						[defeaters] spawn _reward;
					};
			};
	};