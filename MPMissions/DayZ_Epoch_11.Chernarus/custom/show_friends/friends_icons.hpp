class NameTag
	{
		idd = -1;
		onLoad = "uiNamespace setVariable ['ultima_friends_display', _this select 0]; _this execVM 'custom\show_friends\ficon.sqf'";
		fadein = 0;
		fadeout = 0;
		duration = 1e+1000;
		controlsBackground[] = {};
		objects[] = {};
		class controls
			{
				class NT_BASIC
					{
						idc = 7200;
						type = 13;
						style = 16 + 0x200;
						x = -1;
						y = -1;
						w = 0.4;
						h = 0.1;
						sizeEx = 0.025;
						size = 0.025;
						font = "Zeppelin32";
						linespacing = 1;
						colorBackground[] = {0,0,0,0};
						colorText[] = {1,1,1,0};
						text = "";
					};
				class NT1 : NT_BASIC
					{idc = 7201;};
				class NT2 : NT_BASIC
					{idc = 7202;};
				class NT3 : NT_BASIC
					{idc = 7203;};
				class NT4 : NT_BASIC
					{idc = 7204;};
				class NT5 : NT_BASIC
					{idc = 7205;};
				class NT6 : NT_BASIC
					{idc = 7206;};
				class NT7 : NT_BASIC
					{idc = 7207;};
				class NT8 : NT_BASIC
					{idc = 7208;};
				class NT9 : NT_BASIC
					{idc = 7209;};
				class NT10 : NT_BASIC
					{idc = 7210;};
				class NT11 : NT_BASIC
					{idc = 7211;};
			};
	};