if (isServer) then
	{
		if (Ultima_Diag_Level > 0) then
			{diag_log("[#Ultima]: Гонки: Загрузка скрипта инициализации.");};
		private ["_minutes_to_start","_race","_racetime","_randomtime","_racetimeout","_rnd","_timer","_vehlist","_veh"];
		_race		=	compile preprocessFileLineNumbers (Ultima_Server_Scripts_Path + "race\race.sqf");
		_vehlist	=	["ATV_US_EP1","SUV_Camo","KamazOpen_DZE"];
		if (Ultima_Diag_Level > 1) then
			{diag_log(format["[#Ultima]: [Гонки]: Кол-во техники в списке: %1.",count _vehlist]);};
		
		_racetime			=	3600;	//	1 час. Время проведения гонок.
		_racetimeout		=	1200;	//	20 минут. Время ожидания до следующей гонки.
		_randomtime			=	600;	//	10 минут. Время добавляемое к ожиданию следующей гонки. - Случайный интервал.
		_minutes_to_start	=	5;		//	5 минут. Время на подготовку к гонке.

		sleep 60;
		while {true} do
			{
				_rnd		=	round(random((count _vehlist) - 1));
				_veh		=	_vehlist select _rnd;
				if (Ultima_Diag_Level > 1) then
					{diag_log(format["[#Ultima]: [Гонки]: Выбрана техника: %1.",_veh]);};
				_timer		=	0;
				startrace	=	true;
				racetime	=	true;
				if (Ultima_Diag_Level > 1) then
					{diag_log("[#Ultima]: [Гонки]: Вызов скрипта гонки.");};
				[_veh,_racetime,_minutes_to_start] spawn _race;
				sleep 300; //Ожидние сообщений и запуска скрипта
				while {startrace} do
					{
						sleep 10;
						_timer	=	_timer + 10;
						if (_timer > _racetime) then
							{
								if (Ultima_Diag_Level > 1) then
									{diag_log("[#Ultima]: [Гонки]: Вышло время отведенное на гонки.");};
								racetime	=	false;
								sleep 30;
							};
					};
				if (Ultima_Diag_Level > 0) then
					{diag_log("[#Ultima]: [Гонки]: Пауза между гонками...");};
				sleep _racetimeout;
				_rnd	=	round(random(_randomtime));
				sleep _rnd;
			};
	};
