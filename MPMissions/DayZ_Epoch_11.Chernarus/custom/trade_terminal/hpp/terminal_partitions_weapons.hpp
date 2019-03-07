class Terminal_Partitions_Weapons
	{
		idd		=	22000;
		name	=	"Terminal_Partitions_Weapons";
		class controls 
			{
				class Terminal_Form: Terminal_Frame
					{
						idc = 22001;
						x = 0.328125 * safezoneW + safezoneX;
						y = 0.396875 * safezoneH + safezoneY;
						w = 0.32453 * safezoneW;
						h = 0.150234 * safezoneH;
					};			
				class Button_Terminal_Partition_Pistols: Terminal_Button
					{
						idc = 22002;
						text = "Пистолеты";
						x = 0.345313 * safezoneW + safezoneX;
						y = 0.422656 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""pistols""] execVM ""custom\trade_terminal\sqf\terminal_sell_items.sqf"";";
					};
				class Button_Terminal_Partition_Shotguns: Terminal_Button
					{
						idc = 22003;
						text = "Дробовики";
						x = 0.345313 * safezoneW + safezoneX;
						y = 0.461328 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""shotguns""] execVM ""custom\trade_terminal\sqf\terminal_sell_items.sqf"";";					
					};
				class Button_Terminal_Partition_Rifles: Terminal_Button
					{
						idc = 22004;
						text = "Штурмовое";
						x = 0.345313 * safezoneW + safezoneX;
						y = 0.5 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""rifles""] execVM ""custom\trade_terminal\sqf\terminal_sell_items.sqf"";";					
					};
				class Button_Terminal_Partition_Machineguns: Terminal_Button
					{
						idc = 22005;
						text = "Пулеметы";
						x = 0.5 * safezoneW + safezoneX;
						y = 0.422656 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""machineguns""] execVM ""custom\trade_terminal\sqf\terminal_sell_items.sqf"";";						
					};
				class Button_Terminal_Partition_SniperRifles: Terminal_Button
					{
						idc = 22006;
						text = "Снайперское";
						x = 0.5 * safezoneW + safezoneX;
						y = 0.461328 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""sniperrifles""] execVM ""custom\trade_terminal\sqf\terminal_sell_items.sqf"";";						
					};					
			};
	};