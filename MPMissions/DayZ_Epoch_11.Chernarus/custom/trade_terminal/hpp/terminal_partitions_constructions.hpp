class Terminal_Partitions_Constructions
	{
		idd		=	15000;
		name	=	"Terminal_Partitions_Constructions";
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
				class Button_Terminal_Partition_Wood: Terminal_Button
					{
						idc = 15002;
						text = "Деревянное";
						x = 0.345313 * safezoneW + safezoneX;
						y = 0.422656 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""woods""] execVM ""custom\trade_terminal\sqf\terminal_sell_items.sqf"";";
					};
				class Button_Terminal_Partition_Stone: Terminal_Button
					{
						idc = 15003;
						text = "Железо-бетонные";
						x = 0.345313 * safezoneW + safezoneX;
						y = 0.461328 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""stones""] execVM ""custom\trade_terminal\sqf\terminal_sell_items.sqf"";";					
					};
				class Button_Terminal_Partition_Material: Terminal_Button
					{
						idc = 15004;
						text = "Материалы";
						x = 0.5 * safezoneW + safezoneX;
						y = 0.461328 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""materials""] execVM ""custom\trade_terminal\sqf\terminal_sell_items.sqf"";";					
					};
				class Button_Terminal_Partition_Construction: Terminal_Button
					{
						idc = 15005;
						text = "Конструкции";
						x = 0.5 * safezoneW + safezoneX;
						y = 0.422656 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""constructions""] execVM ""custom\trade_terminal\sqf\terminal_sell_items.sqf"";";						
					};				
			};
	};