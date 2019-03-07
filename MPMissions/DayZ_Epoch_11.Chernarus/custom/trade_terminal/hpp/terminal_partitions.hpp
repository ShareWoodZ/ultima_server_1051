class Terminal_Partitions
	{
		idd		=	11000;
		name	=	"Terminal_Partitions";
		class controls 
			{
				class Terminal_Form: Terminal_Frame
					{
						idc = 11001;
						x = 0.328125 * safezoneW + safezoneX;
						y = 0.396875 * safezoneH + safezoneY;
						w = 0.32453 * safezoneW;
						h = 0.190234 * safezoneH;
					};
				class Button_Terminal_Partitions_Weapon: Terminal_Button
					{
						idc = 11002;
						text = "Оружие";
						x = 0.345313 * safezoneW + safezoneX;
						y = 0.422656 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""Terminal_Partitions_Weapons""] call Terminal_Open_Dialog;";
					};
				class Button_Terminal_Partitions_Ammo: Terminal_Button
					{
						idc = 11003;
						text = "Патроны";
						x = 0.345313 * safezoneW + safezoneX;
						y = 0.461328 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""Terminal_Partitions_Ammo""] call Terminal_Open_Dialog;";						
					};
				class Button_Terminal_Partitions_Tools: Terminal_Button
					{
						idc = 11004;
						text = "Инструменты";
						x = 0.345313 * safezoneW + safezoneX;
						y = 0.5 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""tools""] execVM ""custom\trade_terminal\sqf\terminal_sell_items.sqf"";";						
					};
				class Button_Terminal_Partitions_Constructions: Terminal_Button
					{
						idc = 11005;
						text = "Строительство";
						x = 0.345313 * safezoneW + safezoneX;
						y = 0.538672 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""Terminal_Partitions_Constructions""] call Terminal_Open_Dialog;";						
					};					
				class Button_Terminal_Partitions_Parts: Terminal_Button
					{
						idc = 11006;
						text = "Запчасти";
						x = 0.5 * safezoneW + safezoneX;
						y = 0.422656 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""parts""] execVM ""custom\trade_terminal\sqf\terminal_sell_items.sqf"";";
					};
				class Button_Terminal_Partitions_Medical: Terminal_Button
					{
						idc = 11007;
						text = "Медикаменты";
						x = 0.5 * safezoneW + safezoneX;
						y = 0.461328 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""medicals""] execVM ""custom\trade_terminal\sqf\terminal_sell_items.sqf"";";
					};
				class Button_Terminal_Partitions_FoodAndOther: Terminal_Button
					{
						idc = 11008;
						text = "Пища и инвентарь";
						x = 0.5 * safezoneW + safezoneX;
						y = 0.5 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""foodother""] execVM ""custom\trade_terminal\sqf\terminal_sell_items.sqf"";";
					};
				class Button_Terminal_Partitions_Vehicle: Terminal_Button
					{
						idc = 11009;
						text = "Техника";
						x = 0.5 * safezoneW + safezoneX;
						y = 0.538672 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""Terminal_Partitions_Vehicles""] call Terminal_Open_Dialog;";						
					};
			};
	};