class Transfer_Dialog
	{
		idd		=	21000;
		name	=	"Transfer_Dialog";
		class controls
			{
				class Transfer_Form: Terminal_Frame
					{
						idc = 21001;
						text = "Банковский перевод";
						x = 0.379687 * safezoneW + safezoneX;
						y = 0.267969 * safezoneH + safezoneY;
						w = 0.229219 * safezoneW;
						h = 0.300000 * safezoneH;
					};
				class Transfer_Text_Receiver: Terminal_Text
					{
						idc = 21002;
						text = "ID получателя:";
						x = 0.388281 * safezoneW + safezoneX;
						y = 0.29375 * safezoneH + safezoneY;
						w = 0.118281 * safezoneW;
						h = 0.0154297 * safezoneH;
					};
				class Transfer_Edit_Receiver: Terminal_Edit
					{
						idc = 21003;
						text = "";
						x = 0.388281 * safezoneW + safezoneX;
						y = 0.319531 * safezoneH + safezoneY;
						w = 0.118281 * safezoneW;
						h = 0.0261719 * safezoneH;
					};					
				class Transfer_Text_Summa: Terminal_Text
					{
						idc = 21004;
						text = "Сумма:";
						x = 0.388281 * safezoneW + safezoneX;
						y = 0.358203 * safezoneH + safezoneY;
						w = 0.118281 * safezoneW;
						h = 0.0154297 * safezoneH;
					};
				class Transfer_Edit_Summa: Terminal_Edit
					{
						idc = 21005;
						text = "1";
						x = 0.388281 * safezoneW + safezoneX;
						y = 0.383984 * safezoneH + safezoneY;
						w = 0.118281 * safezoneW;
						h = 0.0261719 * safezoneH;
					};					
				class Transfer_Button: Terminal_Button
					{
						idc = 21006;
						text = "Отправить";
						x = 0.388281 * safezoneW + safezoneX;
						y = 0.435547 * safezoneH + safezoneY;
						w = 0.118281 * safezoneW;
						h = 0.0261719 * safezoneH;
						action = "closeDialog 2; [(ctrlText 21003),(ctrlText 21005)] call Transfer_Receive";
					};
				class Transfer_Cash_Button: Terminal_Button
					{
						idc = 21007;
						text = "Положить в банк";
						x = 0.388281 * safezoneW + safezoneX;
						y = 0.48711 * safezoneH + safezoneY;
						w = 0.118281 * safezoneW;
						h = 0.0261719 * safezoneH;
						action = "closeDialog 2; Terminal_Server	=	[player, 'cashtobank']; publicVariableServer 'Terminal_Server';";
					};
				class Transfer_Deposite_Button: Terminal_Button
					{
						idc = 21008;
						text = "Снять с хранилища";
						x = 0.388281 * safezoneW + safezoneX;
						y = 0.538673 * safezoneH + safezoneY;
						w = 0.118281 * safezoneW;
						h = 0.0261719 * safezoneH;
						action = "closeDialog 2; Terminal_Server	=	[player, 'depositetocash']; publicVariableServer 'Terminal_Server';";
					};	
			};
	};