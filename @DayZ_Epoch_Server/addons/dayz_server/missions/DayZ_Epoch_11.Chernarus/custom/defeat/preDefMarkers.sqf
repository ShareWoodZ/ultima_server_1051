private ["_dm0","_dmt0","_coordBase","_mkrDefShape","_colorPreDef","_mrkDefRad"];
_coordBase		=	_this select 0;
_mkrDefShape	=	_this select 1;
_colorPreDef		=	_this select 2;
_mrkDefRad		=	_this select 3;
while {preDefeatTime} do
	{
		if (Ultima_Diag_Level > 2) then
			{diag_log("[#Ultima]: [Защита]: Создание маркера укрепления ополченцев. Идет подготовка...");};
		_dm0 = createMarker ["_dm0", [_coordBase select 0, _coordBase select 1]];
		_dm0 setMarkerShape _mkrDefShape;
		_dm0 setMarkerColor _colorPreDef;
		_dm0 setMarkerBrush "Grid";
		_dm0 setMarkerSize [_mrkDefRad,_mrkDefRad];
		_dmt0 = createMarker ["_dmt0", [_coordBase select 0, _coordBase select 1]];
		_dmt0 setMarkerColor "ColorBlack";
		_dmt0 setMarkerType "Vehicle";
		_dmt0 setMarkerText "Укрепления ополченцев.";					
		sleep 25;
		if (Ultima_Diag_Level > 2) then
			{diag_log("[#Ultima]: [Защита]: Удаление маркера укрепления ополченцев. Идет подготовка...");};
		deleteMarker "_dm0";
		deleteMarker "_dmt0";			
	};