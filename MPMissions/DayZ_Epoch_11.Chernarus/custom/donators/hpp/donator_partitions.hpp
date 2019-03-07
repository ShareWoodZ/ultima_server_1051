class Ultima_Donator_Terminal
	{
		idd		=	24000;
		name	=	"Ultima_Donator_Terminal";
		class controls 
			{
				class Ultima_Donator_Terminal_Frame: Terminal_Frame
					{
						idc = 24001;
						text = "Терминал донатора";
						x = 0.225 * safezoneW + safezoneX;
						y = 0.242188 * safezoneH + safezoneY;
						w = 0.547186 * safezoneW;
						h = 0.55 * safezoneH;
					};	
				class Ultima_Donator_Terminal_List: Terminal_ListBox
					{
						idc = 24002;
						x = 0.233594 * safezoneW + safezoneX;
						y = 0.280859 * safezoneH + safezoneY;
						w = 0.218283 * safezoneW;
						h = 0.422657 * safezoneH;
						onLBSelChanged = "[] call donator_terminal_list_partition;";
					};
				class Ultima_Donator_Terminal_Items_List: Terminal_ListBox
					{
						idc = 24003;
						x = 0.455469 * safezoneW + safezoneX;
						y = 0.280859 * safezoneH + safezoneY;
						w = 0.306563 * safezoneW;
						h = 0.422657 * safezoneH;
						onLBSelChanged = "[] call donator_terminal_show_price;";						
					};
				class Ultima_Donator_Terminal_List_Text: Terminal_Text
					{
						idc = 24004;
						text = "Группы:";
						x = 0.233594 * safezoneW + safezoneX;
						y = 0.255078 * safezoneH + safezoneY;
						w = 0.07 * safezoneW;
						h = 0.0242188 * safezoneH;
					};
				class Ultima_Donator_Terminal_Items_Text: Terminal_Text
					{
						idc = 24005;
						text = "Предметы и услуги:";
						x = 0.455469 * safezoneW + safezoneX;
						y = 0.255078 * safezoneH + safezoneY;
						w = 0.2 * safezoneW;
						h = 0.0242188 * safezoneH;
					};
				class Ultima_Donator_Terminal_Price_Text: Terminal_Text
					{
						idc = 24006;
						text = "Стоимость:";
						x = 0.233594 * safezoneW + safezoneX;
						y = 0.719141 * safezoneH + safezoneY;
						w = 0.4 * safezoneW;
						h = 0.0242188 * safezoneH;
					};
				class Ultima_Donator_Terminal_Create_Button: Terminal_Button
					{
						idc = 24007;
						text = "Приобрести";
						x = 0.233594 * safezoneW + safezoneX;
						y = 0.75 * safezoneH + safezoneY;
						w = 0.53 * safezoneW;
						h = 0.028125 * safezoneH;
						action = "closeDialog 2; [] call donator_terminal_buy;";
					};
			};
	};