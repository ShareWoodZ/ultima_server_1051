//	Стандартный класс окна
class Terminal_Frame
	{
		accesss = 0;
		type = 0;
		style = 64;
		shadow = 2;
		colorText[]			=	{1,1,1,1};
		colorBackground[]	=	{1,1,1,0};
		font = "TahomaB";
		sizeEx = 0.03;
		text = "Торговый терминал";
	};
class Terminal_Ground
	{
		accesss = 0;
		type = 0;
		style = 2;
		shadow = 2;
		colorText[]			=	{1,1,1,1};
		colorBackground[]	=	{1,1,1,1};
		font = "TahomaB";
		sizeEx = 0.03;
		text = "";
	};	
class Terminal_Text 
	{
		access = 0;
		type = 0;
		idc = -1;
		style = 0x00;
		w = 0.5; 
		h = 0.05;
		font = "Zeppelin32";
		sizeEx = 0.04;
		colorBackground[] = {0,0,0,0};
		colorText[] = {1,1,1,1};
		fixedWidth = 0;
		shadow = 0;
	};
	
 class Terminal_Edit
	{
		access = 0;
		type = 2;
		style = 0x00;
		w = 0.5; 
		h = 0.05;
		colorBackground[] = {0,0,0,0};
		colorText[] = {1,1,1,1};
		colorSelection[] = {1,1,1,0.25};
		font = "Zeppelin32";
		sizeEx = 0.04;
		autocomplete = "scripting";
		text = "";
		size = 0.2;
		shadow = 0;
	};
//	Стандартный класс кнопки
 class Terminal_Button 
	{
		access = 0;
		type = 1;
		style = 2;
		font = "Zeppelin32";
		sizeEx = 0.03;
		colorText[] = {0,0,0,1};
		colorDisabled[] = {0.3,0.3,0.3,1};
		colorBackground[] = {0.6,0.6,0.6,1};
		colorBackgroundDisabled[] = {0.6,0.6,0.6,1};
		colorBackgroundActive[] = {1,0.5,0,1};
		offsetX = 0.004;
		offsetY = 0.004;
		offsetPressedX = 0.002;
		offsetPressedY = 0.002;
		colorFocused[] = {0,0,0,1};
		colorShadow[] = {0,0,0,1};
		shadow = 0;
		colorBorder[] = {0,0,0,1};
		borderSize = 0.008;
		soundEnter[] = {"",0.1,1};
		soundPush[] = {"",0.1,1};
		soundClick[] = {"",0.1,1};
		soundEscape[] = {"",0.1,1};
	};
	
class Terminal_ListBox
	{
		access = 0;
		type = 5;
		rowHeight = 0;
		colorText[] = {0.8784, 0.8471, 0.651, 1};
		colorScrollbar[] = {0.95, 0.95, 0.95, 1};
		colorSelect[] = {0.95, 0.95, 0.95, 1};
		colorSelect2[] = {0.95, 0.95, 0.95, 1};
		colorSelectBackground[] = {0, 0, 0, 1};
		colorSelectBackground2[] = {0.8784, 0.8471, 0.651, 1};
		colorBackground[] = {0, 0, 0, 1};
		soundSelect[] = {"", 0.1, 1};
		arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
		arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
		class ScrollBar
			{
				color[] = {1, 1, 1, 0.6};
				colorActive[] = {1, 1, 1, 1};
				colorDisabled[] = {1, 1, 1, 0.3};
				shadow = false;
				thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
				arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
				arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
				border = "\ca\ui\data\ui_border_scroll_ca.paa";
			};
			
		style = 16;
		font = "Zeppelin32";
		shadow = 2;
		sizeEx = 0.04;
		color[] = {1, 1, 1, 1};
		period = 1.2;
		maxHistoryDelay = 1;
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = 0;
	};
	
class Terminal_Memo
	{
		access = 0;
		type = 5;
		rowHeight = 0;
		colorText[] = {0.8784, 0.8471, 0.651, 1};
		colorScrollbar[] = {0.95, 0.95, 0.95, 1};
		colorSelect[] = {0.8784, 0.8471, 0.651, 1};
		colorSelect2[] = {0.8784, 0.8471, 0.651, 1};
		colorSelectBackground[] = {0, 0, 0, 0};
		colorSelectBackground2[] = {0, 0, 0, 0};
		colorBackground[] = {0, 0, 0, 0};
		soundSelect[] = {"", 0.1, 1};
		arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
		arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
		class ScrollBar
			{
				color[] = {1, 1, 1, 0.6};
				colorActive[] = {1, 1, 1, 1};
				colorDisabled[] = {1, 1, 1, 0.3};
				shadow = false;
				thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
				arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
				arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
				border = "\ca\ui\data\ui_border_scroll_ca.paa";
			};
			
		style = 16;
		font = "Zeppelin32";
		shadow = 2;
		sizeEx = 0.04;
		color[] = {1, 1, 1, 1};
		period = 1.2;
		maxHistoryDelay = 1;
		autoScrollSpeed = -1;
		autoScrollDelay = 5;
		autoScrollRewind = 0;
	};