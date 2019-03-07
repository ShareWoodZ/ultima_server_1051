private ["_atm0","_atmmt0","_coordBase","_mkrDefShape","_colorDef","_mrkDefRad"];
_coordBase		=	_this select 0;
_mkrDefShape	=	_this select 1;
_colorDef			=	_this select 2;
_mrkDefRad		=	_this select 3;
while {DefeatTime} do
	{
		if (Ultima_Diag_Level > 2) then
			{diag_log("[#Ultima]: [Защита]: Создание маркера укрепления ополченцев. Идет атака...");};
		_atmm0 = createMarker ["_atmm0", [_coordBase select 0, _coordBase select 1]];
		_atmm0 setMarkerShape _mkrDefShape;
		_atmm0 setMarkerColor _colorDef;
		_atmm0 setMarkerBrush "Grid";
		_atmm0 setMarkerSize [_mrkDefRad,_mrkDefRad];
		_atmmt0 = createMarker ["_atmmt0", [_coordBase select 0, _coordBase select 1]];
		_atmmt0 setMarkerColor "ColorBlack";
		_atmmt0 setMarkerType "Vehicle";
		_atmmt0 setMarkerText "Укрепления ополченцев.";
		sleep 25;
		if (Ultima_Diag_Level > 2) then
			{diag_log("[#Ultima]: [Защита]: Удаление маркера укрепления ополченцев. Идет атака...");};
		deleteMarker "_atmm0";
		deleteMarker "_atmmt0";			
	};