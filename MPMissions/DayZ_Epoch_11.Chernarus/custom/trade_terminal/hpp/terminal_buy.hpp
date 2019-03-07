class Terminal_Buy
	{
		idd		=	13000;
		name	=	"Terminal_Buy";
		class controls
			{
				class Terminal_Form: Terminal_Frame
					{
						idc = 13001;
						x = 0.259375 * safezoneW + safezoneX;
						y = 0.29375 * safezoneH + safezoneY;
						w = 0.483125 * safezoneW;
						h = 0.405078 * safezoneH;
					};
				class Terminal_ListBox_Buy: Terminal_ListBox
					{
						idc = 13002;
						x = 0.267969 * safezoneW + safezoneX;
						y = 0.317384 * safezoneH + safezoneY;
						w = 0.465938 * safezoneW;
						h = 0.334767 * safezoneH;
						onLBSelChanged = "[Terminal_Array select (lnbCurSelRow 13002), 13004, 13005] call Terminal_Show_Price";
					};
				class Terminal_Button_Buy: Terminal_Button
					{
						idc = 13003;
						text = "Купить";
						x = 0.615625 * safezoneW + safezoneX;
						y = 0.66211 * safezoneH + safezoneY;
						w = 0.108125 * safezoneW;
						h = 0.0261719 * safezoneH;
						action = "closeDialog 2; [Terminal_Array select (lnbCurSelRow 13002), Terminal_Array_Type] call Terminal_Buy;";
					};
				class Terminal_Text_Price: Terminal_Text
					{
						idc = 13004;
						text = "Цена:";
						x = 0.267969 * safezoneW + safezoneX;
						y = 0.667578 * safezoneH + safezoneY;
						w = 0.1 * safezoneW;
						h = 0.0261719 * safezoneH;
					};
				class Terminal_Text_Name: Terminal_Text
					{
						idc = 13005;
						text = "Продавец:";
						x = 0.388281 * safezoneW + safezoneX;
						y = 0.667578 * safezoneH + safezoneY;
						w = 0.2 * safezoneW;
						h = 0.0261719 * safezoneH;
					};
			};
	};
