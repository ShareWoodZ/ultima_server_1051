//	[Настройки ремонта]
Ultima_Repair_Distance	=	15;			//	Максимальная дистанция для появления меню ремонта
Ultima_Repair_Cost		=	10;			//	Цена ремонта транспорта
Ultima_Repair_Delay		=	2;			//	Время ремонта в секуднах
Ultima_Repair_Objects	=				//	Массив объектов рядом с которыми работает ремонт техники
	[
		"Land_A_FuelStation_Feed"
		,"FuelPump_DZ"
		,"Land_fuel_tank_small"
	];
Ultima_Repair_Veh	=					//	Отдельные цены на ремонт: Техника|Цена|Задержка
	[
		["ArmoredSUV_PMC_DZE", 20, 2]
		,["Pickup_PK_TK_GUE_EP1_DZE", 20, 2]
		,["Offroad_DSHKM_Gue_DZE", 20, 2]
		,["Pickup_PK_GUE_DZE", 20, 2]
		,["Pickup_PK_INS_DZE", 20, 2]
		,["BAF_Jackal2_L2_A1_W", 20, 2]
		
		,["HMMWV_M998A2_SOV_DES_EP1_DZE", 20, 2]
		,["HMMWV_M1151_M2_CZ_DES_EP1_DZE", 20, 2]
		,["LandRover_Special_CZ_EP1_DZE", 20, 2]
		,["LandRover_MG_TK_EP1_DZE", 20, 2]
		,["UAZ_MG_TK_EP1_DZE", 20, 2]
		,["GAZ_Vodnik_DZE", 20, 2]
		,["LAV25_DZE", 20, 2]
		,["BMP2_HQ_CDF", 20, 2]
		,["BMP3", 20, 2]
		
		,["CH_47F_EP1_DZE", 100, 2]
		,["UH1H_DZE", 100, 2]
		,["UH60M_EP1_DZE", 100, 2]
		,["UH1Y_DZE", 100, 2]
		
		,["RHIB", 50, 2]
		
		,["BTR60_TK_EP1", 200, 2]
		
		,["BTR90_HQ_DZE", 150, 2]
		,["BTR40_MG_TK_GUE_EP1", 150, 2]
		
		,["pook_H13_transport_GUE", 50, 2]
		,["pook_H13_gunship_GUE", 50, 2]
		
		,["C130J_US_EP1", 50, 2]
		,["MV22_DZ", 50, 2]
		
		,["Mi17_Civilian_DZ", 50, 2]
		,["AH6X_DZ", 50, 2]
		,["MH6J_DZ", 50, 2]
		,["BAF_Merlin_HC3_D", 50, 2]
		
	];

//	[Настройки заправки]
Ultima_Refuel_Distance	=	15;			//	Максимальная дистанция для появления меню заправки
Ultima_Refuel_Cost		=	10;			//	Цена заправки транспорта
Ultima_Refuel_Delay		=	1;			//	Время заправки в секуднах
Ultima_Refuel_Amount	=	0.05;		//	Кол-во топлива, заливаемого за один цикл
Ultima_Refuel_Objects	=				//	Массив объектов рядом с которыми работает заправка техники
	[
		"Land_A_FuelStation_Feed"
		,"FuelPump_DZ"
		,"Land_fuel_tank_small"
	];
Ultima_Refuel_Veh	=					//	Отдельные настройки: Техника|Цена|Задержка|Кол-во топлива
	[
		["KamazRefuel_DZ", 30, 1, 0.05]
		,["MtvrRefuel_DES_EP1_DZ", 30, 1, 0.05]
		,["UralRefuel_TK_EP1_DZ", 30, 1, 0.05]
		,["V3S_Refuel_TK_GUE_EP1_DZ", 30, 1, 0.05]
		,["MtvrRefuel_DZ", 30, 1, 0.05]
		
		,["C130J_US_EP1", 70, 1, 0.05]
		,["MV22_DZ", 70, 1, 0.05]
		
		,["Mi17_Civilian_DZ", 50, 1, 0.05]
		,["AH6X_DZ", 50, 1, 0.05]
		,["MH6J_DZ", 50, 1, 0.05]
		,["BAF_Merlin_HC3_D", 50, 1, 0.05]
		
		,["RHIB", 50, 1, 0.05]
	];
	
//	[Настройки пополнения БК]
Ultima_Rearm_Distance	=	15;			//	Максимальная дистанция для появления меню пополнения БК
Ultima_Rearm_Cost		=	200;		//	Цена поплнения БК
Ultima_Rearm_Delay		=	1;			//	Время пополнения БК в секуднах
Ultima_Rearm_Amount		=	1;			//	Кол-во рожков
Ultima_Rearm_Objects	=				//	Массив объектов рядом с которыми работает пополнение БК
	[
		"Land_A_FuelStation_Feed"
		,"FuelPump_DZ"
		,"Land_fuel_tank_small"
	];
Ultima_Rearm_Veh	=					//	Отдельные настройки: Техника|Цена|Задержка|Кол-во рожков
	[
		["ArmoredSUV_PMC_DZE", 600, 1, 1]
		
		,["CH_47F_EP1_DZE", 600, 1, 1]
		,["UH1H_DZE", 600, 1, 1]
		,["UH60M_EP1_DZE", 600, 1, 1]
		,["UH1Y_DZE", 600, 1, 1]
		
		,["BTR60_TK_EP1", 600, 1, 1]
		,["LAV25_HQ_DZE", 600, 1, 1]
		
		,["BTR90_HQ_DZE", 300, 1, 1]
		,["BTR40_MG_TK_GUE_EP1", 300, 1, 1]
		
		,["LAV25_DZE", 300, 1, 1]
		,["BMP2_HQ_CDF", 300, 1, 1]
		,["BMP3", 300, 1, 1]
				
	];	
	
[] ExecVM "custom\service\actions.sqf";
