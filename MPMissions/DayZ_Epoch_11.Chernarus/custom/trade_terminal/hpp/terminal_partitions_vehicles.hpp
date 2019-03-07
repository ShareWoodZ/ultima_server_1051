class Terminal_Partitions_Vehicles
	{
		idd		=	18000;
		name	=	"Terminal_Partitions_Vehicles";
		class controls 
			{
				class Terminal_Form: Terminal_Frame
					{
						idc = 18001;
						x = 0.328125 * safezoneW + safezoneX;
						y = 0.396875 * safezoneH + safezoneY;
						w = 0.32453 * safezoneW;
						h = 0.190234 * safezoneH;
					};
				class Button_Terminal_Partitions_Vehicle_Land: Terminal_Button
					{
						idc = 18007;
						text = "Наземная техника";
						x = 0.345313 * safezoneW + safezoneX;
						y = 0.422656 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""Terminal_Partitions_Vehicles_Land""] call Terminal_Open_Dialog;";						
					};
				class Button_Terminal_Partitions_Vehicle_Air: Terminal_Button
					{
						idc = 18008;
						text = "Воздушная техника";
						x = 0.345313 * safezoneW + safezoneX;
						y = 0.461328 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""Terminal_Partitions_Vehicles_Air""] call Terminal_Open_Dialog;";						
					};
				class Button_Terminal_Partitions_Vehicle_Water: Terminal_Button
					{
						idc = 18009;
						text = "Морская техника";
						x = 0.5 * safezoneW + safezoneX;
						y = 0.422656 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""Terminal_Partitions_Vehicles_Water""] call Terminal_Open_Dialog;";						
					};
			};
	};