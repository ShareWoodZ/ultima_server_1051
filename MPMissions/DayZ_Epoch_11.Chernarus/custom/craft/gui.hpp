class Ultima_Craft
	{
		idd		=	23000;
		name	=	"Ultima_Craft";
		class controls 
			{
				class Craft_Frame: Terminal_Frame
					{
						idc = 23001;
						text = "Изготовление предметов";
						x = 0.225 * safezoneW + safezoneX;
						y = 0.242188 * safezoneH + safezoneY;
						w = 0.547186 * safezoneW;
						h = 0.513477 * safezoneH;
					};	
				class Craft_List: Terminal_ListBox
					{
						idc = 23002;
						x = 0.233594 * safezoneW + safezoneX;
						y = 0.280859 * safezoneH + safezoneY;
						w = 0.168283 * safezoneW;
						h = 0.422657 * safezoneH;
						onLBSelChanged = "[] call craft_list_fill;";
					};
				class Craft_Items_List: Terminal_ListBox
					{
						idc = 23003;
						x = 0.405469 * safezoneW + safezoneX;
						y = 0.29375 * safezoneH + safezoneY;
						w = 0.356563 * safezoneW;
						h = 0.141406 * safezoneH;
						onLBSelChanged = "[] call craft_required_list_fill;";						
					};
				class Craft_Required_List: Terminal_ListBox
					{
						idc = 23004;
						x = 0.401562 * safezoneW + safezoneX;
						y = 0.470703 * safezoneH + safezoneY;
						w = 0.357345 * safezoneW;
						h = 0.23418 * safezoneH;
					};
				class Craft_List_Text: Terminal_Text
					{
						idc = 23005;
						text = "Группы:";
						x = 0.233594 * safezoneW + safezoneX;
						y = 0.255078 * safezoneH + safezoneY;
						w = 0.0737501 * safezoneW;
						h = 0.0242188 * safezoneH;
					};
				class Craft_Items_Text: Terminal_Text
					{
						idc = 23006;
						text = "Предметы:";
						x = 0.405469 * safezoneW + safezoneX;
						y = 0.255078 * safezoneH + safezoneY;
						w = 0.0737501 * safezoneW;
						h = 0.0242188 * safezoneH;
					};					
				class Craft_Required_Text: Terminal_Text
					{
						idc = 23007;
						text = "Требуется:";
						x = 0.403125 * safezoneW + safezoneX;
						y = 0.4375 * safezoneH + safezoneY;
						w = 0.153438 * safezoneW;
						h = 0.0251954 * safezoneH;
					};
				class Craft_Create_Button: Terminal_Button
					{
						idc = 23008;
						text = "Создать";
						x = 0.233594 * safezoneW + safezoneX;
						y = 0.719141 * safezoneH + safezoneY;
						w = 0.53 * safezoneW;
						h = 0.028125 * safezoneH;
						action = "[] call Craft_Button_Click;";
					};
			};
	};