///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////Нанесение повреждений технике, в радиационной зоне
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if (isServer) then
	{
		private ["_sectors","_incDMG","_Seconds"];
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////Конфигурация
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		_incDMG	=	0.032;	//Урон наносимый модулям техники каждую итерацию скрипта (по умолчанию 0.032
		_Seconds	=	60;		//Пауза между итерациями скрипта (по умолчанию 60 сек)
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////Старт скрипта
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		if (Ultima_Diag_Level > 0) then
			{diag_log ( "[#Ultima]: [Повреждение техники в секторах]: Загрузка секторов." );};
		_sectors = 
			[
				[1000,6573,14158,_incDMG,_Seconds]
			];
		if (Ultima_Diag_Level > 1) then
			{diag_log ( "[#Ultima]: [Повреждение техники в секторах]: Сектора загружены. Идет создание потоков..." );};
		{
			[_x] spawn
				{
					private ["_pos","_radius","_vehicles","_sector","_dmg","_inc","_sec","_modules","_module","_type","_veh","_allDMG"];
					_sector		=	(_this select 0);
					_radius		=	(_sector select 0);
					_pos			=	[(_sector select 1),(_sector select 2),0];
					_inc			=	(_sector select 3);
					_sec			=	(_sector select 4);
					_allDMG	=	0;
					if (Ultima_Diag_Level > 1) then
						{diag_log (format["[#Ultima]: [Повреждение техники в секторах]: Создан поток сектора: %1,%2. Радиусом: %3",(_sector select 1),(_sector select 2),(_radius)]);};
					while { true } do
						{
							if (Ultima_Diag_Level > 2) then
								{diag_log (format["[#Ultima]: [Повреждение техники в секторах]: Отработка цикла WHILE сектора: %1,%2. Радиусом: %3",(_pos select 0),(_pos select 1),(_radius)]);};
							_vehicles = _pos nearEntities [["LandVehicle","Air"],_radius];
								{
									_type = typeOf _x;
									_veh = _x;
									//_allDMG = 0;
									_modules = _x call vehicle_getHitpoints;
									{
										_dmg = [_veh,_x] call object_getHit;
										_dmg = _dmg + _inc;
										_allDMG = _allDMG + _dmg;
										if (_dmg > 1) then
											{
												_dmg = 1;
											};
										_module = getText(configFile >> "cfgVehicles" >> _type >> "HitPoints" >> _x >> "name");
										_veh setHit [_module, _dmg];
										_module = "hit_" + (_module);
										_veh setVariable [_module,_dmg,true];
										PVDZE_veh_Update = [_veh,"damage"];
										publicVariableServer "PVDZE_veh_Update";
										if (Ultima_Diag_Level > 2) then
											{diag_log (format["[#Ultima]: [Повреждение техники в секторах]: Нанесен урон %1, по модулю %2, технике %3",_dmg,_module,_veh]);};
									} forEach _modules;
									_allDMG	=	getDammage	_veh;
									_allDMG	=	_allDMG + _inc;
									if (Ultima_Diag_Level > 2) then
										{diag_log (format["[#Ultima]: [Повреждение техники в секторах]: Установлен общий урон %1",_dmg]);};
									if (_allDMG > 1) then
										{_allDMG = 1;};
									_veh setDamage _allDMG;
								} forEach _vehicles;
							sleep _sec;//Пауза
						};
				};
		} forEach _sectors;
		if (Ultima_Diag_Level > 0) then
			{diag_log ( "[#Ultima]: [Повреждение техники в секторах]: Все потоки созданы." );};
	};
