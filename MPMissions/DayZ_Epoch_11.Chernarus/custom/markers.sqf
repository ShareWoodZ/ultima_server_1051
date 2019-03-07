private ["_marker_radiation_zone","_marker_radiation_zone_text","_marker_aviaship","_marker_aviaship_text","_marker_miner","_marker_miner_text","_tmp"];
//diag_log ("#Ultima МАРКЕРЫ: Создание маркеров карты.");

//	Радиационная база
_marker_radiation_zone = createMarker ["_marker_radiation_zone", [6573, 14158]];
_marker_radiation_zone setMarkerShape "RECTANGLE";
_marker_radiation_zone setMarkerColor "ColorRed";
_marker_radiation_zone setMarkerBrush "Grid";
_marker_radiation_zone setMarkerSize [1000,1000];
//	Радиационная база текст
_marker_radiation_zone_text = createMarker ["_marker_radiation_zone_text", [6573, 14158]];
_marker_radiation_zone_text setMarkerColor "ColorBlack";
_marker_radiation_zone_text setMarkerType "Vehicle";
_tmp	=	localize "Ultima_Radiation_Zone";
_marker_radiation_zone_text setMarkerText _tmp;

//	Авианосец
_marker_aviaship = createMarker ["_marker_aviaship", [13058, 3584]];
_marker_aviaship setMarkerShape "RECTANGLE";
_marker_aviaship setMarkerColor "ColorYellow";
_marker_aviaship setMarkerBrush "Grid";
_marker_aviaship setMarkerSize [30,30];
//	Авианосец текст
_marker_aviaship_text = createMarker ["_marker_aviaship_text", [13058, 3584]];
_marker_aviaship_text setMarkerColor "ColorBlack";
_marker_aviaship_text setMarkerType "Vehicle";
_tmp	=	localize "Ultima_Aircraft_carrier";
_marker_aviaship_text setMarkerText _tmp;

//	Рудокоп
_marker_miner = createMarker ["_marker_miner", [6441, 6545]];
_marker_miner setMarkerShape "ELLIPSE";
_marker_miner setMarkerColor "ColorYellow";
_marker_miner setMarkerBrush "Grid";
_marker_miner setMarkerSize [30,30];
//	Рудокоп текст
_marker_miner_text = createMarker ["_marker_miner_text", [6441, 6545]];
_marker_miner_text setMarkerColor "ColorBlack";
_marker_miner_text setMarkerType "Vehicle";
_tmp	=	localize "Ultima_T_Miner";
_marker_miner_text setMarkerText _tmp;