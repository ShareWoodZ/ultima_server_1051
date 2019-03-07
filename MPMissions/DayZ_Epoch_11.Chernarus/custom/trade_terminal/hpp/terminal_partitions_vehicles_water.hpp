class Terminal_Partitions_Vehicles_Water
	{
		idd		=	15000;
		name	=	"Terminal_Partitions_Vehicles_Water";
		class controls 
			{
				class Terminal_Form: Terminal_Frame
					{
						idc = 15001;
						x = 0.328125 * safezoneW + safezoneX;
						y = 0.396875 * safezoneH + safezoneY;
						w = 0.32453 * safezoneW;
						h = 0.150234 * safezoneH;
					};			
				class Button_Terminal_Partition_Vehicles_Water_Ship: Terminal_Button
					{
						idc = 15002;
						text = "Разоруженные";
						x = 0.345313 * safezoneW + safezoneX;
						y = 0.422656 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""ships""] execVM ""custom\trade_terminal\sqf\terminal_sell_items.sqf"";";
					};
				class Button_Terminal_Partition_Vehicles_Water_Ship_Military: Terminal_Button
					{
						idc = 15004;
						text = "Вооруженные";
						x = 0.5 * safezoneW + safezoneX;
						y = 0.422656 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""ships_with_weapons""] execVM ""custom\trade_terminal\sqf\terminal_sell_items.sqf"";";					
					};			
			};
	};