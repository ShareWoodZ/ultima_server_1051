class Terminal_Partitions_Ammo
	{
		idd		=	14000;
		name	=	"Terminal_Partitions_Ammo";
		class controls 
			{
				class Terminal_Form: Terminal_Frame
					{
						idc = 14001;
						x = 0.328125 * safezoneW + safezoneX;
						y = 0.396875 * safezoneH + safezoneY;
						w = 0.32453 * safezoneW;
						h = 0.150234 * safezoneH;
					};			
				class Button_Terminal_Partition_Ammo_Pistols: Terminal_Button
					{
						idc = 14002;
						text = "К пистолетам";
						x = 0.345313 * safezoneW + safezoneX;
						y = 0.422656 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""ammo_pistols""] execVM ""custom\trade_terminal\sqf\terminal_sell_items.sqf"";";
					};
				class Button_Terminal_Partition_Ammo_Shotguns: Terminal_Button
					{
						idc = 14003;
						text = "К дробовикам";
						x = 0.345313 * safezoneW + safezoneX;
						y = 0.461328 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""ammo_shotguns""] execVM ""custom\trade_terminal\sqf\terminal_sell_items.sqf"";";					
					};
				class Button_Terminal_Partition_Ammo_Rifles: Terminal_Button
					{
						idc = 14004;
						text = "К штурмовому";
						x = 0.345313 * safezoneW + safezoneX;
						y = 0.5 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""ammo_rifles""] execVM ""custom\trade_terminal\sqf\terminal_sell_items.sqf"";";					
					};
				class Button_Terminal_Partition_Ammo_Machineguns: Terminal_Button
					{
						idc = 14005;
						text = "К Пулеметам";
						x = 0.5 * safezoneW + safezoneX;
						y = 0.422656 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""ammo_machineguns""] execVM ""custom\trade_terminal\sqf\terminal_sell_items.sqf"";";						
					};
				class Button_Terminal_Partition_Ammo_SniperRifles: Terminal_Button
					{
						idc = 14006;
						text = "К снайперскому";
						x = 0.5 * safezoneW + safezoneX;
						y = 0.461328 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""ammo_sniperrifles""] execVM ""custom\trade_terminal\sqf\terminal_sell_items.sqf"";";						
					};
				class Button_Terminal_Partition_Ammo_Bombs: Terminal_Button
					{
						idc = 14007;
						text = "Взрывчатое";
						x = 0.5 * safezoneW + safezoneX;
						y = 0.5 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [""ammo_bombs""] execVM ""custom\trade_terminal\sqf\terminal_sell_items.sqf"";";						
					};					
			};
	};