class Terminal
	{
		idd		=	10000;
		name	=	"Terminal";
		class controls 
			{
				class Terminal_Form: Terminal_Frame
					{
						idc = 10001;
						x = 0.396875 * safezoneW + safezoneX;
						y = 0.396875 * safezoneH + safezoneY;
						w = 0.171406 * safezoneW;
						h = 0.16 * safezoneH;
					};
				class Terminal_Ground: Terminal_Frame
					{
						idc = 10002;
						x = 0.396875 * safezoneW + safezoneX;
						y = 0.396875 * safezoneH + safezoneY;
						w = 0.171406 * safezoneW;
						h = 0.112109 * safezoneH;
						style = 2;
						text = "";
					};					
				class Button_Terminal_Partitions: Terminal_Button 
					{
						idc = 10003;
						text = "Предметы торгов";
						x = 0.414063 * safezoneW + safezoneX;
						y = 0.422656 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;			
						action = "closeDialog 2; [""Terminal_Partitions""] call Terminal_Open_Dialog;";
					};
				class Button_Terminal_Drop_Items: Terminal_Button 
					{
						idc = 10004;
						text = "Мои предметы";
						x = 0.414063 * safezoneW + safezoneX;
						y = 0.461328 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [] execVM ""custom\trade_terminal\sqf\terminal_drop_items.sqf"";";
					};
				class Button_Terminal_Add_Items: Terminal_Button 
					{
						idc = 10005;
						text = "Добавить предмет";
						x = 0.414063 * safezoneW + safezoneX;
						y = 0.5 * safezoneH + safezoneY;
						w = 0.13625 * safezoneW;
						h = 0.0242188 * safezoneH;
						action = "closeDialog 2; [] execVM ""custom\trade_terminal\sqf\terminal_add_items.sqf"";";
					};
			};
	};