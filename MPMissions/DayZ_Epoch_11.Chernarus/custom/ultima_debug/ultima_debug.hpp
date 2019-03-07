class TUltimaDebugMain
	{
		type				=	0;
		text				=	"";
		font				=	Zeppelin32;
		SizeEx				=	0.03;
		colorText[]			=	{1,1,1,1};
		colorBackground[]	=	{0, 0, 0, 0};
		linespacing			=	1;
		//	Размер вычисляется, из соотношения сторон. Для ширины - ширина экрана, умноженная на процент
		h	=	0.04;	//	Высота изображения
	};
class TUltimaDebugPicture : TUltimaDebugMain
	{w		=	0.04;};	//	Ширина изображения
//	Иконки внизу с права(вдоль оси X - указано только расположение по оси Y. Ось X внутри классов)
class TUltimaDebugPictureBottom : TUltimaDebugPicture
	{
		style	=	2096;	//	Стиль отображения: 48(идентификатор, что это изображение), или напрямую тип:  ST_PICTURE
		y	=	safezoneY + safezoneH - (safezoneH * 0.029296);
	};
//	Иконки c права(вдоль оси Y - указано только расположение по оси X. Ось Y внутри классов)
class TUltimaDebugPictureRight : TUltimaDebugPicture
	{
		style	=	2096;	//	Стиль отображения: 48(идентификатор, что это изображение), или напрямую тип:  ST_PICTURE
		x	=	safezoneX + safezoneW - ((safezoneW * 0.0234375)*3);
	};
//	Текст иконок внизу(Вдоль оси X - указано только расположение по оси Y. Ось X внутри класов)
class TUltimaDebugPictureLeftText : TUltimaDebugMain
	{
		style	=	0x100+0x01;
		w		=	safezoneW * 0.05;	//	Ширина текста
		y		=	safezoneY + safezoneH - (safezoneH * 0.029296);
	};
//	Текст иконок c права(вдоль оси Y - указано только расположение по оси X. Ось Y внутри классов)
class TUltimaDebugPictureRightText : TUltimaDebugMain
	{
		style	=	0x100+0x01;
		w		=	safezoneW * 0.05;	//	Ширина текста
		x		=	safezoneX + safezoneW - ((safezoneW * 0.029296)*2);
	};


//	Стандартный монитор - класс для текста	
class RscStructuredText
	{class Attributes;};

//	Стандартный монитор - класс для изображения
class RscPictureGUI
	{
		access				=	0;
		type				=	0;
		idc					=	-1;
		colorBackground[]	=	{0, 0, 0, 0};
		colorText[]			=	{0.38, 0.63, 0.26, 0.75};
		font				=	"TahomaB";
		sizeEx				=	0;
		lineSpacing			=	0;
		text				=	"";
		style				=	0x30 + 0x100;
		x					=	0;
		y					=	0;
		w					=	0.2;
		h					=	0.15;
	};

//	Стандартый монитор, и собственные классы, внутри него, для альтернативного монитора	
class playerStatusGUI
	{
		idd				=	-1;
		movingEnable	=	0;
		duration		=	100000;
		name			=	"statusBorder";
		onLoad			=	"uiNamespace setVariable ['DAYZ_GUI_display', _this select 0];";
		
		// Стандартный класс и его подклассы
		class ControlsBackground 
			{
				class RscStructuredText_1199 : RscStructuredText
					{
						idc = 1199;
						x = 0.250001;
						y = 0.350001;
						w = 0.5;
						h = 0.1;
					};
			
				class RscPicture_1901 : RscPictureGUI
					{
						idc = 1901;
						x = "0.955313 * safezoneW + safezoneX";
						y = "0.86 * safezoneH + safezoneY";
						w = 0.075;
						h = 0.1;
					};
			
				class RscPicture_1307 : RscPictureGUI
					{
						idc = 1307;
						text = "\z\addons\dayz_code\gui\status_combat_inside_ca.paa";
						x = "0.955313 * safezoneW + safezoneX";
						y = "0.65 * safezoneH + safezoneY";
						w = 0.06;
						h = 0.08;
					};
			
				class RscPicture_1201 : RscPictureGUI
					{
						idc = 1201;
						x = "0.955313 * safezoneW + safezoneX";
						y = "0.86 * safezoneH + safezoneY";
						w = 0.075;
						h = 0.1;
					};
			
				class RscPicture_1900 : RscPictureGUI
					{
						idc = 1900;
						x = "0.955313 * safezoneW + safezoneX";
						y = "0.79 * safezoneH + safezoneY";
						w = 0.075;
						h = 0.1;
					};
			
				class RscPicture_1200 : RscPictureGUI
					{
						idc = 1200;
						x = "0.955313 * safezoneW + safezoneX";
						y = "0.79 * safezoneH + safezoneY";
						w = 0.075;
						h = 0.1;
					};
			
				class RscPicture_1902 : RscPictureGUI
					{
						idc = 1902;
						x = "0.955313 * safezoneW + safezoneX";
						y = "0.93 * safezoneH + safezoneY";
						w = 0.075;
						h = 0.1;
					};
			
				class RscPicture_1202 : RscPictureGUI
					{
						idc = 1202;
						x = "0.955313 * safezoneW + safezoneX";
						y = "0.93 * safezoneH + safezoneY";
						w = 0.075;
						h = 0.1;
					};
			
				class RscPicture_1908 : RscPictureGUI
					{
						idc = 1908;
						x = "0.955313 * safezoneW + safezoneX";
						y = "0.72 * safezoneH + safezoneY";
						w = 0.075;
						h = 0.1;
					};
			
				class RscPicture_1208 : RscPictureGUI
					{
						idc = 1208;
						x = "0.955313 * safezoneW + safezoneX";
						y = "0.72 * safezoneH + safezoneY";
						w = 0.075;
						h = 0.1;
					};
			
				class RscPicture_1203 : RscPictureGUI
					{
						idc = 1203;
						text = "\z\addons\dayz_code\gui\status\status_effect_brokenleg.paa";
						x = "0.955313 * safezoneW + safezoneX";
						y = "0.58 * safezoneH + safezoneY";
						w = 0.075;
						h = 0.1;
						colorText[] = {1, 1, 1, 1};
					};
			
				class RscPicture_1204 : RscPictureGUI
					{
						idc = 1204;
						text = "\z\addons\dayz_code\gui\status\status_connection_ca.paa";
						x = "0.955313 * safezoneW + safezoneX";
						y = "0.51 * safezoneH + safezoneY";
						w = 0.075;
						h = 0.1;
						colorText[] = {1, 1, 1, 1};
					};
			
				class RscPicture_1205 : RscPictureGUI
					{
						idc = 1205;
						x = "0.955313 * safezoneW + safezoneX";
						y = "0.30 * safezoneH + safezoneY";
						w = 0.075;
						h = 0.1;
					};
			
				class RscPicture_1206 : RscPictureGUI
					{
						idc = 1206;
						x = "0.955313 * safezoneW + safezoneX";
						y = "0.37 * safezoneH + safezoneY";
						w = 0.075;
						h = 0.1;
					};
			};
		
		//	Стандартные и собственные классы
		class Controls
			{
			
				// Стандартные контролы
				class RscPicture_1301 : RscPictureGUI
					{
						idc = 1301;
						x = "0.955313 * safezoneW + safezoneX";
						y = "0.86 * safezoneH + safezoneY";
						w = 0.075;
						h = 0.1;
					};
			
				class RscPicture_1300 : RscPictureGUI
					{
						idc = 1300;
						x = "0.955313 * safezoneW + safezoneX";
						y = "0.79 * safezoneH + safezoneY";
						w = 0.075;
						h = 0.1;
					};
			
				class RscPicture_1302 : RscPictureGUI
					{
						idc = 1302;
						x = "0.955313 * safezoneW + safezoneX";
						y = "0.93 * safezoneH + safezoneY";
						w = 0.075;
						h = 0.1;
					};
			
				class RscPicture_1306 : RscPictureGUI
					{
						idc = 1306;
						x = "0.955313 * safezoneW + safezoneX";
						y = "0.72 * safezoneH + safezoneY";
						w = 0.075;
						h = 0.1;
					};
			
				class RscPicture_1303 : RscPictureGUI
					{
						idc = 1303;
						text = "\z\addons\dayz_code\gui\status\status_bleeding_ca.paa";
						x = "0.955313 * safezoneW + safezoneX";
						y = "0.79 * safezoneH + safezoneY";
						w = 0.075;
						h = 0.1;
						colorText[] = {1, 1, 1, 0.5};
					};
			
				class RscPicture_1304 : RscPictureGUI
					{
						idc = 1304;
						text = "\z\addons\dayz_code\gui\status\status_noise.paa";
						x = "0.955313 * safezoneW + safezoneX";
						y = "0.30 * safezoneH + safezoneY";
						w = 0.075;
						h = 0.1;
					};
			
				class RscPicture_1305 : RscPictureGUI
					{
						idc = 1305;
						text = "\z\addons\dayz_code\gui\status\status_visible.paa";
						x = "0.955313 * safezoneW + safezoneX";
						y = "0.37 * safezoneH + safezoneY";
						w = 0.075;
						h = 0.1;
					};
			
				//	Собственные классы
				//	Голод
				class Green_Food : TUltimaDebugPictureBottom
					{
						idc		=	8200;
						text	=	"";
						x		=	safezoneX + safezoneW - (safezoneW * 0.0234375);	//	Положение по оси X
					};
				//	Жажда
				class Green_Water : TUltimaDebugPictureBottom
					{
						idc		=	8201;
						text	=	"";
						x		=	safezoneX + safezoneW - ((safezoneW * 0.0234375) * 2);
					};
				//	Температура
				class Green_Temperature : TUltimaDebugPictureBottom
					{
						idc		=	8202;
						text	=	"";
						x		=	safezoneX + safezoneW - ((safezoneW * 0.0234375) * 3);
					};
				//	Кровотечение
				class Green_Bleeding : TUltimaDebugPictureBottom
					{
						idc		=	8203;
						text	=	"";
						x		=	safezoneX + safezoneW - ((safezoneW * 0.0234375) * 4);
					};
				//	Перелом
				class Green_Bone : TUltimaDebugPictureBottom
					{
						idc		=	8204;
						text	=	"";
						x		=	safezoneX + safezoneW - ((safezoneW * 0.0234375) * 5);
					};
				//	Инфекция
				class Green_Infection : TUltimaDebugPictureBottom
					{
						idc		=	8205;
						text	=	"";
						x		=	safezoneX + safezoneW - ((safezoneW * 0.0234375) * 6);
					};
				//	Боль
				class Green_Pain : TUltimaDebugPictureBottom
					{
						idc		=	8206;
						text	=	"";
						x		=	safezoneX + safezoneW - ((safezoneW * 0.0234375) * 7);
					};
				//	Статус битвы
				class Green_Battle : TUltimaDebugPictureBottom
					{
						idc		=	8207;
						text	=	"";
						x		=	safezoneX + safezoneW - ((safezoneW * 0.0234375) * 8);
					};
				//	Слышимость
				class Green_Listen : TUltimaDebugPictureBottom
					{
						idc		=	8208;
						text	=	"";
						x		=	safezoneX + safezoneW - ((safezoneW * 0.0234375) * 9);
					};
				//	Видимость
				class Green_Eye : TUltimaDebugPictureBottom
					{
						idc		=	8209;
						text	=	"";
						x		=	safezoneX + safezoneW - ((safezoneW * 0.0234375) * 10);
					};
				//	FPS
				class Green_FPS : TUltimaDebugPictureBottom
					{
						idc		=	8210;
						text	=	"";
						x		=	safezoneX;	//	Положение по оси X
					};
				//	Текст - FPS
				class Green_FPS_Text : TUltimaDebugPictureLeftText
					{
						idc		=	8211;
						text	=	"";
						x		=	safezoneX + (safezoneW * 0.01);	//	Положение по оси X
					};
				//	Время работы сервера
				class Green_UpTime : TUltimaDebugPictureBottom
					{
						idc		=	8212;
						text	=	"";
						x		=	safezoneX + (safezoneW * 0.0234375)*3;	//	Положение по оси X
					};
				//	Текст - Время работы сервер
				class Green_UpTime_Text : TUltimaDebugPictureLeftText
					{
						idc		=	8213;
						text	=	"";
						x		=	safezoneX + (safezoneW * 0.0234375)*4;	//	Положение по оси X
					};
				//	Онлайн
				class Green_Online : TUltimaDebugPictureBottom
					{
						idc		=	8214;
						text	=	"";
						x		=	safezoneX + (safezoneW * 0.0234375)*6;	//	Положение по оси X
					};
				//	Текст - Онлайн
				class Green_Online_Text : TUltimaDebugPictureLeftText
					{
						idc		=	8215;
						text	=	"";
						x		=	safezoneX + (safezoneW * 0.028)*5;	//	Положение по оси X
					};
				//	Здоровье
				class Green_Health : TUltimaDebugPictureRight
					{
						idc		=	8216;
						text	=	"";
						y		=	safezoneY + safezoneH - ((safezoneH * 0.029296)*10);	//	Положение по оси X
					};
				//	Текст здоровья
				class Green_Health_Text : TUltimaDebugPictureRightText
					{
						idc		=	8217;
						text	=	"";
						y		=	safezoneY + safezoneH - ((safezoneH * 0.029296)*10);	//	Положение по оси X
					};
				//	Репутация
				class Green_Humanity : TUltimaDebugPictureRight
					{
						idc		=	8218;
						text	=	"";
						y		=	safezoneY + safezoneH - ((safezoneH * 0.029296)*9);	//	Положение по оси X
					};
				//	Текст - Репутация
				class Green_Humanity_Text : TUltimaDebugPictureRightText
					{
						idc		=	8219;
						text	=	"";
						y		=	safezoneY + safezoneH - ((safezoneH * 0.029296)*9);	//	Положение по оси X
					};
				//	Убито в голову
				class Green_Headshots : TUltimaDebugPictureRight
					{
						idc		=	8220;
						text	=	"";
						y		=	safezoneY + safezoneH - ((safezoneH * 0.029296)*8);	//	Положение по оси X
					};
				//	Текст - Убито в голову
				class Green_Headshots_Text : TUltimaDebugPictureRightText
					{
						idc		=	8221;
						text	=	"";
						y		=	safezoneY + safezoneH - ((safezoneH * 0.029296)*8);	//	Положение по оси X
					};
				//	Убито зомби
				class Green_KillZombies : TUltimaDebugPictureRight
					{
						idc		=	8222;
						text	=	"";
						y		=	safezoneY + safezoneH - ((safezoneH * 0.029296)*7);	//	Положение по оси X
					};
				//	Текст - Убито зомби
				class Green_KillZpmbies_Text : TUltimaDebugPictureRightText
					{
						idc		=	8223;
						text	=	"";
						y		=	safezoneY + safezoneH - ((safezoneH * 0.029296)*7);	//	Положение по оси X
					};
				//	Убито бандитов
				class Green_KillBandits : TUltimaDebugPictureRight
					{
						idc		=	8224;
						text	=	"";
						y		=	safezoneY + safezoneH - ((safezoneH * 0.029296)*6);	//	Положение по оси X
					};
				//	Текст - Убито бандитов
				class Green_KillBandits_Text : TUltimaDebugPictureRightText
					{
						idc		=	8225;
						text	=	"";
						y		=	safezoneY + safezoneH - ((safezoneH * 0.029296)*6);	//	Положение по оси X
					};
				//	Убито людей
				class Green_Humans : TUltimaDebugPictureRight
					{
						idc		=	8226;
						text	=	"";
						y		=	safezoneY + safezoneH - ((safezoneH * 0.029296)*5);	//	Положение по оси X
					};
				//	Текст - Убито людей
				class Green_Humans_Text : TUltimaDebugPictureRightText
					{
						idc		=	8227;
						text	=	"";
						y		=	safezoneY + safezoneH - ((safezoneH * 0.029296)*5);	//	Положение по оси X
					};
				//	Деньги
				class Green_Money : TUltimaDebugPictureRight
					{
						idc		=	8228;
						text	=	"";
						y		=	safezoneY + safezoneH - ((safezoneH * 0.029296)*4);	//	Положение по оси X
					};
				//	Текст - Деньги
				class Green_Money_Text : TUltimaDebugPictureRightText
					{
						idc		=	8229;
						text	=	"";
						y		=	safezoneY + safezoneH - ((safezoneH * 0.029296)*4);	//	Положение по оси X
					};
				//	Наличные
				class Green_Money_Cash : TUltimaDebugPictureRight
					{
						idc		=	8230;
						text	=	"";
						y		=	safezoneY + safezoneH - ((safezoneH * 0.029296)*3);	//	Положение по оси X
					};
				//	Текст - Наличные
				class Green_Money_Cash_Text : TUltimaDebugPictureRightText
					{
						idc		=	8231;
						text	=	"";
						y		=	safezoneY + safezoneH - ((safezoneH * 0.029296)*3);	//	Положение по оси X
					};
				//	Депозит
				class Green_Money_Deposite : TUltimaDebugPictureRight
					{
						idc		=	8232;
						text	=	"";
						y		=	safezoneY + safezoneH - ((safezoneH * 0.029296)*2);	//	Положение по оси X
					};
				//	Текст - Депозит
				class Green_Money_Deposite_Text : TUltimaDebugPictureRightText
					{
						idc		=	8233;
						text	=	"";
						y		=	safezoneY + safezoneH - ((safezoneH * 0.029296)*2);	//	Положение по оси X
					};
				//	Локация
				class Green_Location : TUltimaDebugPictureBottom
					{
						idc		=	8234;
						text	=	"";
						x		=	safezoneX + (safezoneW * 0.0234375)*9;	//	Положение по оси X
					};
				//	Текст - Локация
				class Green_Location_Text : TUltimaDebugPictureLeftText
					{
						idc		=	8235;
						text	=	"";
						w		=	safezoneW * 0.1;					//	Ширина текста
						x		=	safezoneX + (safezoneW * 0.027)*8;	//	Положение по оси X
					};
				//	Имена в торговых зонах
				class NickNameTag : TUltimaDebugPictureLeftText
					{
						idc 	=	8236;
						text	=	"";						
						w		=	safezoneW * 0.1;					//	Ширина текста
						x		=	safezoneX + (safezoneW * 0.027)*11;	//	Положение по оси X
					};
				//	Админские монеты
				class Green_Admin_Coins : TUltimaDebugPictureRight
					{
						idc		=	8237;
						y		=	safezoneY + safezoneH - ((safezoneH * 0.029296)*11);	//	Положение по оси X
						text	=	"";
					};
				//	Текст админские монеты
				class Green_Admin_Coins_Text : TUltimaDebugPictureRightText
					{
						idc		=	8238;
						text	=	"";
						y		=	safezoneY + safezoneH - ((safezoneH * 0.029296)*11);	//	Положение по оси X
					};
			};
	};