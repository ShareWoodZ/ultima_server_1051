disableSerialization;
private ["_pm","_Man","_Visibility","_list_friends_gps","_GPSVisibility","_RadioVisibility","_player_ID","_recPlayer_ID","_player_friends","_recPlayer_friends","_list_friends","_DC","_ColorName","_ColorHealth","_ColorDistance","_ColorVehicleType","_isNot","_isIn","_AmountOfUnits","_NameOfUnit","_Who","_Distance","_Health","_Screen","_Text","_NoVeh","_YesVeh","_CND","_isShown","_Display"];

_DC					=	uiNamespace getVariable 'ultima_friends_display';
_ColorName			=	"#AAFFAA";	//
_ColorHealth		=	"#FFFFFF";	//
_ColorDistance		=	"#AAAAFF";	//
_ColorVehicleType	=	"#FFFFFF";	//
_Visibility			=	100;		//	Дальность видимости имени, здоровья, дистанции - в 3D, до друга.
_RadioVisibility	=	500;		//	Дальность видимости	имени, здоровья, дистанции - в 3D, до друга, при наличии рации, у друга, и у себя.
_GPSVisibility		=	2000;		//	Дальность видимости на карте, при налчии GPS, у друга и у себя.
_AmountOfUnits		=	10;			//	Максимальное кол-во юнитов для отображения(ограничено кол-вом классов, объявленых в friends_icons.hpp).

_isNot = "<t align='center'><t color='%5'>%1</t><br/><t color='%6'>[%2%3]</t><br/><t color='%7'>%4 m</t></t>";
_isIn = "<t align='center'><t color='%4'>%1</t><br/><t color='%5'>[%2]</t><br/><t color='%6'>%3 m</t></t>";

//	Получаем свой ID
_player_ID	=	player getVariable ["CharacterID", "0"];
while {alive player} do
	{
		while {!ultima_show_friends_var} do
			{sleep 1};
		if (str(_DC) == "No display") exitWith
			{
				sleep 5;
				1 cutrsc ["NameTag","PLAIN"];
			};
		//	Получаем список друзей.
		_player_friends = player getVariable ["friendlies",[]];
		//	Обнуляем список друзей (LIST)
		_list_friends		=	[];
		_list_friends_gps	=	[];
		
		
		//	Проверяем друзей, - что мы тоже у них в списке друзей.(Подтверждены).
		{	//	Цикл по всем юнитам на карте
			if ((count _list_friends) == _AmountOfUnits) ExitWith {};	//	Если список достиг лимита отображения - выходим.
			if (alive _x) then	//	Если юнит живой
				{
					_recPlayer_ID	=	_x getVariable["CharacterID","0"];	//	Получаем ID юнита
					if (_recPlayer_ID in _player_friends) then	//	Если его ID найден в наших друзьях
						{
							_recPlayer_friends = _x getVariable ["friendlies",[]];	//	Получаем список друзей юнита
							if (_player_ID in _recPlayer_friends) then	//	Если, мы у него так же в друзьях
								{
									//	Проверяем расстояние до друга, для отображения: Имени, здоровья, расстояния.
									if ( (_x distance player < _Visibility) ||  ( (_x distance player < _RadioVisibility) && (player hasWeapon "ItemRadio") && (_x hasWeapon "ItemRadio") ) ) then
										{_list_friends set [count _list_friends, _x];};	//	Добавляем друга в список для отображения.
									//	Проверяем расстояние до друга, и наличие GPS, для отображения на карте.
									if ( ("ItemGPS" in items player) && (_x distance player < _GPSVisibility) and ("ItemGPS" in items _x) ) then
										{_list_friends_gps set [count _list_friends_gps, _x];};	//	Добавляем друга в список для отображения на карте.
								};
						};
				};
		} forEach playableUnits;	
		
		for "_i" from 0 to _AmountOfUnits do
			{
				if ( (_i < (count _list_friends)) && ( (count _list_friends) > 0 ) && (!visibleMap) && (ultima_show_friends_var) ) then	//	Если дисплей меньше, или равен кол-ву записей в списке отображения - выводим.
					{
						_Man		=	(_list_friends select _i);
						_Who		=	(vehicle _Man);
						_Distance	=	round (_Man distance player);
						_Health		=	ceil ((_Man getVariable['USEC_BloodQty',12000]) / 120);
						_ManName	=	name _Man;
						_Screen		=	(worldToScreen [(getPosATL _Man select 0), (getPosATL _Man select 1), (getPosATL _Man select 2) + 4]);
						_Text		=	getText (configFile >> "CfgVehicles" >> (typeOf _Who) >> "DisplayName");
						_NoVeh		=	parseText format [_isNot, _ManName, _Health, "%", _Distance, _ColorName, _ColorHealth, _ColorDistance];
						_YesVeh		=	parsetext format [_isIn, _ManName, _Text, _Distance, _ColorName, _ColorVehicleType, _ColorDistance];
						_CND		=	if (_Who != _Man) then 
											{
												if (_Man == effectiveCommander _Who) then 
													{_YesVeh}
												else 
													{parseText ""}
											}
										else 
											{_NoVeh};
						_isShown	=	(count _Screen);
						if (!isNull player && _isShown > 0 && !visibleMap) then
							{
								_Display = _DC displayCtrl (7201 + _i);
								_Display ctrlSetPosition [(_Screen select 0)-0.2,(_Screen select 1)];
								_Display ctrlSetStructuredText _CND;
								_Display ctrlCommit 0;
							}
						else
							{
								_Display = _DC displayCtrl (7201 + _i);
								_Display ctrlSetStructuredText parseText "";
								_Display ctrlCommit 0;
							};
					}
				else
					{
						_Display = _DC displayCtrl (7201 + _i);
						_Display ctrlSetStructuredText parseText "";
						_Display ctrlCommit 0;
					};
			};
		//	Если есть GPS
		if ("ItemGPS" in items player) then
			{
				if ("ItemGPS" in items player) then
					{
						for "_i" from 0 to (_AmountOfUnits + 1) do
							{deleteMarkerLocal ("ultima_gps" + (str _i));};
					};
				//	Добавляем себя, в список отображения на карте.
				_list_friends_gps set [count _list_friends_gps, player];
				for "_i" from 0 to (count _list_friends_gps) - 1 do
					{
						deleteMarkerLocal ("ultima_gps" + (str _i));
						if ( (alive (_list_friends_gps select _i)) )  then 
							{
								deleteMarkerLocal ("ultima_gps" + (str _i));
								_pm = createMarkerLocal [("ultima_gps" + (str _i)), getPos (_list_friends_gps select _i)];
								_pm setMarkerTypeLocal "selector_selectedMission";
								_pm setMarkerSizeLocal [0.8, 0.8];
								_pm setMarkerTextLocal format ["%1", name (_list_friends_gps select _i)];
								_pm setMarkerColorLocal ("ColorBlue");
							};
					};
			};
		sleep 0.003;
		/*if (!isnull (finddisplay 75)) then
			{systemChat ("<Ultima>: НАЙДЕНА МИНИКАРТА");}
		else
			{systemChat ("<Ultima>: МИНИКАРТА ОТКЛЮЧЕНА");};
		*/
	};
