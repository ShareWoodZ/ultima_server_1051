class Base_Set_Friend
	{
		idd		=	51000;
		name	=	"Base_Set_Friend";
		class controls
			{
				class Transfer_Form: Terminal_Frame
					{
						idc = 51001;
						text = "Добавление друга базы";
						x = 0.379687 * safezoneW + safezoneX;
						y = 0.267969 * safezoneH + safezoneY;
						w = 0.229219 * safezoneW;
						h = 0.150000 * safezoneH;
					};
				class Transfer_Text_Receiver: Terminal_Text
					{
						idc = 51002;
						text = "ID друга:";
						x = 0.388281 * safezoneW + safezoneX;
						y = 0.29375 * safezoneH + safezoneY;
						w = 0.118281 * safezoneW;
						h = 0.0154297 * safezoneH;
					};
				class Transfer_Edit_Receiver: Terminal_Edit
					{
						idc = 51003;
						text = "";
						x = 0.388281 * safezoneW + safezoneX;
						y = 0.32 * safezoneH + safezoneY;
						w = 0.21 * safezoneW;
						h = 0.0261719 * safezoneH;
					};					
				class Transfer_Button: Terminal_Button
					{
						idc = 51004;
						text = "Добавить друга";
						x = 0.388281 * safezoneW + safezoneX;
						y = 0.37 * safezoneH + safezoneY;
						w = 0.21 * safezoneW;
						h = 0.0261719 * safezoneH;
						action = "closeDialog 2; [(ctrlText 51003)] call Defense_Add_Friend";
					};	
			};
	};