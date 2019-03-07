diag_log ("[#Ultima]: [Глобальные переменные]: Инициализация...");
Ultima_Map_Center			=	(getMarkerPos "center");
Ultima_Map_Radius			=	(Ultima_Map_Center select 0);	
Ultima_Map_Name				=	worldName;
Ultima_Server_Scripts_Path	=	"\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\custom\";
Ultima_ini_Files			=	"C:\Program Files (x86)\Steam\steamapps\common\Arma 2 Operation Arrowhead\ini\#1Ultima\";
diag_log ("[#Ultima]: [Глобальные переменные]: Инициализация завершена.");
diag_log format["[#Ultima]: [Глобальные переменные]: Карта определена как %1.", Ultima_Map_Name];
diag_log format["[#Ultima]: [Глобальные переменные]: Центр карты: %1.", Ultima_Map_Center];
diag_log format["[#Ultima]: [Глобальные переменные]: Радиус карты: %1.", Ultima_Map_Radius];
diag_log format["[#Ultima]: [Глобальные переменные]: Путь к собственным скриптам: %1.", Ultima_Server_Scripts_Path];
diag_log format["[#Ultima]: [Глобальные переменные]: Путь к ini файлам: %1.", Ultima_ini_Files];

//	Техника за которую снимают в минус человечность, при уничтожении.
Ultima_Vehicle_Humanity_Dec	=
	[
		["CH_47_EP1_DZE", 400]
		,["UH1H_DZE", 400]
		,["Mi17_DZE", 300]
		,["UH60M_EP1_DZE", 400]
		,["UH1Y_DZE", 400]

		,["HMMWV_M1151_M2_CZ_DES_EP1_DZE", 200]
		,["GAZ_Vodnik_DZE", 300]
		,["ArmoredSUV_PMC_DZE", 400]
		,["BAF_Jackal2_L2A1_W", 500]

		,["Mi17_Civilian_DZ", 90]
		,["AH6X_DZ", 80]
		,["MH6J_DZ", 80]
		,["BAF_Merlin_HC3_D", 200]
	];