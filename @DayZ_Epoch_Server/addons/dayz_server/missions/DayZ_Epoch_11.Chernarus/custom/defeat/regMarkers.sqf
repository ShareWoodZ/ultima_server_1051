//*************************************************//
//Создаем маркеры регистрации
//*************************************************//	
private ["_um0","_um1","_um2","_umt0","_umt1","_umt2","_coordRegDef","_coordRegAttack","_coordUnreg","_mkrRegShape","_colorRegDef","_colorRegAttack","_colorUnreg","_mrkRegRad"];
_coordRegDef		=	_this select 0;
_coordRegAttack	=	_this select 1;
_coordUnreg			=	_this select 2;
_mkrRegShape		=	_this select 3;
_colorRegDef		=	_this select 4;
_colorRegAttack	=	_this select 5;
_colorUnreg			=	_this select 6;
_mrkRegRad			=	_this select 7;
while {regtime} do
	{
		if (Ultima_Diag_Level > 2) then
			{diag_log("[#Ultima]: [Защита]: Создание маркеров регистрации!");};
		_um0 = createMarker ["_um0", [_coordRegDef select 0, _coordRegDef select 1]];
		_um0 setMarkerShape _mkrRegShape;
		_um0 setMarkerColor _colorRegDef;
		_um0 setMarkerBrush "Grid";
		_um0 setMarkerSize [_mrkRegRad,_mrkRegRad];
		_umt0 = createMarker ["_umt0", [_coordRegDef select 0, _coordRegDef select 1]];
		_umt0 setMarkerColor "ColorBlack";
		_umt0 setMarkerType "Vehicle";
		_umt0 setMarkerText "Регистрация защиты! Ополчение!";					
		_um1 = createMarker ["_um1", [_coordRegAttack select 0, _coordRegAttack select 1]];
		_um1 setMarkerShape _mkrRegShape;
		_um1 setMarkerColor _colorRegAttack;
		_um1 setMarkerBrush "Grid";
		_um1 setMarkerSize [_mrkRegRad,_mrkRegRad];
		_umt1 = createMarker ["_umt1", [_coordRegAttack select 0, _coordRegAttack select 1]];
		_umt1 setMarkerColor "ColorBlack";
		_umt1 setMarkerType "Vehicle";
		_umt1 setMarkerText "Регистрация атакующих! Наемники!";
		_um2 = createMarker ["_um2", [_coordUnreg select 0, _coordUnreg select 1]];
		_um2 setMarkerShape _mkrRegShape;
		_um2 setMarkerColor _colorUnreg;
		_um2 setMarkerBrush "Grid";
		_um2 setMarkerSize [_mrkRegRad,_mrkRegRad];
		_umt2 = createMarker ["_umt2", [_coordUnreg select 0, _coordUnreg select 1]];
		_umt2 setMarkerColor "ColorBlack";
		_umt2 setMarkerType "Vehicle";
		_umt2 setMarkerText "Отмена регистрации!";
		sleep 20;
		if (Ultima_Diag_Level > 2) then
			{diag_log("[#Ultima]: [Защита]: Удаление маркеров регистрации!");};
		deleteMarker "_um0";
		deleteMarker "_umt0";
		deleteMarker "_um1";
		deleteMarker "_umt1";
		deleteMarker "_um2";
		deleteMarker "_umt2";				
	};