private["_run","_nul","_nil","_zap","_zip"];
diag_log format ["[DZMS]: Запуск скрипта обновления маркеров!"];
if (isNil "DZMSMajCoords") then
	{DZMSMajCoords	=	[0,0,0];};
if (isNil "DZMSMinCoords") then
	{DZMSMinCoords	=	[0,0,0];};
_run	=	true;
while {_run} do
	{
		sleep 25;
		if (!(getMarkerColor "DZMSMajMarker" == "")) then
			{
				deleteMarker "DZMSMajMarker";
				deleteMarker "DZMSMajDot";
				_nul = createMarker ["DZMSMajMarker", DZMSMajCoords];
				"DZMSMajMarker" setMarkerColor "ColorOrange";
				"DZMSMajMarker" setMarkerShape "ELLIPSE";
				"DZMSMajMarker" setMarkerBrush "Grid";
				"DZMSMajMarker" setMarkerSize [175,175];
				_zap = createMarker ["DZMSMajDot", DZMSMajCoords];
				"DZMSMajDot" setMarkerColor "ColorBlack";
				"DZMSMajDot" setMarkerType "Vehicle";
				"DZMSMajDot" setMarkerText DZMSMajName;
			};
		if (!(getMarkerColor "DZMSMinMarker" == "")) then
			{
				deleteMarker "DZMSMinMarker";
				deleteMarker "DZMSMinDot";
				_nil = createMarker ["DZMSMinMarker", DZMSMinCoords];
				"DZMSMinMarker" setMarkerColor "ColorGreen";
				"DZMSMinMarker" setMarkerShape "ELLIPSE";
				"DZMSMinMarker" setMarkerBrush "Grid";
				"DZMSMinMarker" setMarkerSize [150,150];
				_zip = createMarker ["DZMSMinDot", DZMSMinCoords];
				"DZMSMinDot" setMarkerColor "ColorBlack";
				"DZMSMinDot" setMarkerType "Vehicle";
				"DZMSMinDot" setMarkerText DZMSMinName;
			};
	};