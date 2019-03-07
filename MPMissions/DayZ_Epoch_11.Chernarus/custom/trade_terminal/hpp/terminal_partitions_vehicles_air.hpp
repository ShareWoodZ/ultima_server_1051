class Terminal_Partitions_Vehicles_Air
	{
		idd		=	16000;
		name	=	"Terminal_Partitions_Vehicles_Air";
		class controls 
			{
				class Terminal_Form: Terminal_Frame
					{
						idc = 16001;
						x = 0.328125 * safezoneW + safezoneX;
						y = 0.396875 * safezoneH + safezoneY;
						w = 0.32453 * safezoneW;
						h = 0.150234 * safezoneH;
					};			
				class Button_Terminal_Partition_Vehicles_Air_Ship: Terminal_Button
					{
						idc = 16002;
						text = "Самолеты";
						x = 0.345313 * safezoneW + safezoneX;
						y = 0.422656 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""airships""] execVM ""custom\trade_terminal\sqf\terminal_sell_items.sqf"";";
					};
				class Button_Terminal_Partition_Vehicles_Air_Heli: Terminal_Button
					{
						idc = 16003;
						text = "Вертолеты";
						x = 0.345313 * safezoneW + safezoneX;
						y = 0.461328 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""helis""] execVM ""custom\trade_terminal\sqf\terminal_sell_items.sqf"";";					
					};	
				class Button_Terminal_Partition_Vehicles_Air_Heli_Weapons: Terminal_Button
					{
						idc = 16004;
						text = "Вооруженные вертолеты";
						x = 0.5 * safezoneW + safezoneX;
						y = 0.422656 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""helis_weapons""] execVM ""custom\trade_terminal\sqf\terminal_sell_items.sqf"";";					
					};					
			};
	};