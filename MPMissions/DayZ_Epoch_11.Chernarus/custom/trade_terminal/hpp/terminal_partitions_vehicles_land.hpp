class Terminal_Partitions_Vehicles_Land
	{
		idd		=	17000;
		name	=	"Terminal_Partitions_Vehicles_Land";
		class controls 
			{
				class Terminal_Form: Terminal_Frame
					{
						idc = 17001;
						x = 0.328125 * safezoneW + safezoneX;
						y = 0.396875 * safezoneH + safezoneY;
						w = 0.32453 * safezoneW;
						h = 0.150234 * safezoneH;
					};			
				class Button_Terminal_Partition_Vehicles_Land_: Terminal_Button
					{
						idc = 17002;
						text = "Байки и квадро";
						x = 0.345313 * safezoneW + safezoneX;
						y = 0.422656 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""bikes""] execVM ""custom\trade_terminal\sqf\terminal_sell_items.sqf"";";
					};
				class Button_Terminal_Partition_Vehicles_Land_Car: Terminal_Button
					{
						idc = 17003;
						text = "Легковые";
						x = 0.345313 * safezoneW + safezoneX;
						y = 0.461328 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""cars""] execVM ""custom\trade_terminal\sqf\terminal_sell_items.sqf"";";					
					};
				class Button_Terminal_Partition_Vehicles_Land_Jeep: Terminal_Button
					{
						idc = 17004;
						text = "Внедорожники";
						x = 0.345313 * safezoneW + safezoneX;
						y = 0.5 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""jeeps""] execVM ""custom\trade_terminal\sqf\terminal_sell_items.sqf"";";					
					};
				class Button_Terminal_Partition_Vehicles_Land_Cargo_Car: Terminal_Button
					{
						idc = 17005;
						text = "Грузовики и автобусы";
						x = 0.5 * safezoneW + safezoneX;
						y = 0.422656 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""cargos""] execVM ""custom\trade_terminal\sqf\terminal_sell_items.sqf"";";						
					};
				class Button_Terminal_Partition_Vehicles_Land_Military_No_Weapons: Terminal_Button
					{
						idc = 17006;
						text = "Военные разоруженные";
						x = 0.5 * safezoneW + safezoneX;
						y = 0.461328 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""military_no_weapons""] execVM ""custom\trade_terminal\sqf\terminal_sell_items.sqf"";";						
					};
				class Button_Terminal_Partition_Vehicles_Land_Military_Weapons: Terminal_Button
					{
						idc = 17007;
						text = "Военные с вооружением";
						x = 0.5 * safezoneW + safezoneX;
						y = 0.5 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""military_with_weapons""] execVM ""custom\trade_terminal\sqf\terminal_sell_items.sqf"";";						
					};					
			};
	};