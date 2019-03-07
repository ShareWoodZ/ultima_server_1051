class Terminal_Add_Items
	{
		idd		=	20000;
		name	=	"Terminal_Add_Items";
		class controls
			{
				class Terminal_Form: Terminal_Frame
					{
						idc = 20001;
						x = 0.259375 * safezoneW + safezoneX;
						y = 0.29375 * safezoneH + safezoneY;
						w = 0.483125 * safezoneW;
						h = 0.405078 * safezoneH;
					};
				class Terminal_ListBox: Terminal_ListBox
					{
						idc = 20002;
						x = 0.267969 * safezoneW + safezoneX;
						y = 0.317384 * safezoneH + safezoneY;
						w = 0.465938 * safezoneW;
						h = 0.334767 * safezoneH;
					};
				class Terminal_Button_Add: Terminal_Button
					{
						idc = 20003;
						text = "На продажу";
						x = 0.615625 * safezoneW + safezoneX;
						y = 0.66211 * safezoneH + safezoneY;
						w = 0.108125 * safezoneW;
						h = 0.0261719 * safezoneH;
						action = "closeDialog 2; [(lnbCurSelRow 20002),(ctrlText 20005)] call Terminal_Add";
					};
				class Terminal_Text_Price: Terminal_Text
					{
						idc = 20004;
						text = "Цена:";
						x = 0.267969 * safezoneW + safezoneX;
						y = 0.667578 * safezoneH + safezoneY;
						w = 0.1 * safezoneW;
						h = 0.0261719 * safezoneH;
					};
				class Terminal_Edit_Price: Terminal_Edit
					{
						idc = 20005;
						text = "1";
						x = 0.35 * safezoneW + safezoneX;
						y = 0.667578 * safezoneH + safezoneY;
						w = 0.1 * safezoneW;
						h = 0.0261719 * safezoneH;
					};					
			};
	};