class Terminal_Drop_Items
	{
		idd		=	19000;
		name	=	"Terminal_Drop_Items";
		class controls
			{
				class Terminal_Form: Terminal_Frame
					{
						idc = 19001;
						x = 0.259375 * safezoneW + safezoneX;
						y = 0.29375 * safezoneH + safezoneY;
						w = 0.483125 * safezoneW;
						h = 0.405078 * safezoneH;
					};
				class Terminal_ListBox: Terminal_ListBox
					{
						idc = 19002;
						x = 0.267969 * safezoneW + safezoneX;
						y = 0.317384 * safezoneH + safezoneY;
						w = 0.465938 * safezoneW;
						h = 0.334767 * safezoneH;
						onLBSelChanged = "[Terminal_Array select (lnbCurSelRow 19002), 19004, -1] call Terminal_Show_Price"; 
					};
				class Terminal_Button_Drop: Terminal_Button
					{
						idc = 19003;
						text = "Снять с продажи";
						x = 0.615625 * safezoneW + safezoneX;
						y = 0.66211 * safezoneH + safezoneY;
						w = 0.108125 * safezoneW;
						h = 0.0261719 * safezoneH;
						action = "closeDialog 2; [lnbCurSelRow 19002] call Terminal_Drop;";
					};
				class Terminal_Text_Price: Terminal_Text
					{
						idc = 19004;
						text = "Цена:";
						x = 0.267969 * safezoneW + safezoneX;
						y = 0.667578 * safezoneH + safezoneY;
						w = 0.0979687 * safezoneW;
						h = 0.0261719 * safezoneH;
					};					
			};
	};