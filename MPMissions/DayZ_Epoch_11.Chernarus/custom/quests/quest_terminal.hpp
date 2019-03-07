class Ultima_Quest_Terminal
	{
		idd		=	24000;
		name	=	"Ultima_Quest_Terminal";
		class controls 
			{
				class Ultima_Quest_Terminal_Ground: Terminal_Ground
					{
						idc = 24001;
						x = 0.225 * safezoneW + safezoneX;
						y = 0.252 * safezoneH + safezoneY;
						w = 0.547186 * safezoneW;
						h = 0.54 * safezoneH;
						colorBackground[]	=	{0,0,0,0.8};
					};				
				class Ultima_Quest_Terminal_Frame: Terminal_Frame
					{
						idc = 24012;
						text = "Терминал заданий";
						x = 0.225 * safezoneW + safezoneX;
						y = 0.242188 * safezoneH + safezoneY;
						w = 0.547186 * safezoneW;
						h = 0.55 * safezoneH;
					};					
				class Ultima_Quest_Terminal_List: Terminal_ListBox
					{
						idc = 24002;
						x = 0.233594 * safezoneW + safezoneX;
						y = 0.280859 * safezoneH + safezoneY;
						w = 0.218283 * safezoneW;
						h = 0.422657 * safezoneH;
						onLBSelChanged = "[] call Ultima_Quest_Open_Info;";
					};
				class Ultima_Quest_Terminal_Memo: Terminal_Memo
					{
						idc = 24003;
						x = 0.455469 * safezoneW + safezoneX;
						y = 0.28 * safezoneH + safezoneY;
						w = 0.306563 * safezoneW;
						h = 0.422657 * safezoneH;
					};
				class Ultima_Quest_Terminal_Lable: Terminal_Text
					{
						idc = 24004;
						text = "Задания:";
						x = 0.233594 * safezoneW + safezoneX;
						y = 0.255078 * safezoneH + safezoneY;
						w = 0.07 * safezoneW;
						h = 0.0242188 * safezoneH;
					};
				class Ultima_Quest_Terminal_Solution_Lable: Terminal_Text
					{
						idc = 24005;
						text = "Описание задания:";
						x = 0.455469 * safezoneW + safezoneX;
						y = 0.255078 * safezoneH + safezoneY;
						w = 0.2 * safezoneW;
						h = 0.0242188 * safezoneH;
					};
				class Ultima_Quest_Terminal_Needs_Lable: Terminal_Text
					{
						idc = 24006;
						text = "Требования:";
						x = 0.455469 * safezoneW + safezoneX;
						y = 0.63 * safezoneH + safezoneY;
						w = 0.306563 * safezoneW;
						h = 0.0242188 * safezoneH;
						colorText[] = { 128,0,128, 1 };
					};
				class Ultima_Quest_Terminal_Reputation_Lable: Terminal_Text
					{
						idc = 24007;
						text = "Репутация:";
						x = 0.46 * safezoneW + safezoneX;
						y = 0.66 * safezoneH + safezoneY;
						w = 0.306563 * safezoneW;
						h = 0.0242188 * safezoneH;
						colorText[] = { 27,14,190, 1 };
					};
				class Ultima_Quest_Terminal_Price_Lable: Terminal_Text
					{
						idc = 24008;
						text = "Стоимость:";
						x = 0.46 * safezoneW + safezoneX;
						y = 0.69 * safezoneH + safezoneY;
						w = 0.306563 * safezoneW;
						h = 0.0242188 * safezoneH;
						colorText[] = { 27,14,190, 1 };
					};
				class Ultima_Quest_Terminal_Time_Lable: Terminal_Text
					{
						idc = 24009;
						text = "Время выполнения:";
						x = 0.46 * safezoneW + safezoneX;
						y = 0.72 * safezoneH + safezoneY;
						w = 0.306563 * safezoneW;
						h = 0.0242188 * safezoneH;
						colorText[] = { 27,14,190, 1 };
					};					
				class Ultima_Quest_Terminal_Decline_Button: Terminal_Button
					{
						idc = 24010;
						text = "";
						x = 0.455469 * safezoneW + safezoneX;
						y = 0.75 * safezoneH + safezoneY;
						w = 0.306563 * safezoneW;
						h = 0.027 * safezoneH;
						action = "[] call Ultima_Quest_AD;";
					};					
			};
	};