Private ["_vehicle", "_typeOf", "_vehicles", "_magazines", "_weapons", "_i", "_u"];
_vehicle	=	(_this select 0);
_typeOf		=	typeOf _vehicle;
//	Имя класса | Удаляемые магазины | Удаляемое вооружение | Отключить тепловизор и ПНВ
_vehicles	=
	[
		["LAV25_DZE" ,["210Rnd_25mm_M242_APDS"], ["M242"], true]
		,["BMP2_HQ_CDF", ["SmokeLauncherMag", "100Rnd_762x54_PK"], [], false]
		,["BMP3", ["22Rnd_100mm_HE_2A70", "8Rnd_AT10_BMP3", "250Rnd_30mmAP_2A72", "250Rnd_30mmHE_2A72", "250Rnd_762x54_PKT_T90", "2000Rnd_762x54_PKT"], ["2A70", "2A70Rocket", "2A72"], true]
		,["BTR60_TK_EP1", ["500Rnd_145x115_KPVT"], [], false]
	];
{
	if ( (_x select 0) == _typeOf ) exitWith
		{		
			_magazines	=	(_x select 1);
			if ( count _magazines > 0 ) then
				{
					for "_i" from ((count _magazines) -1) to 0 step -1 do
						{
							for "_u" from -1 to 3 do
								{
									_vehicle magazinesTurret [_u];
									_vehicle removeMagazinesTurret [(_magazines select _i),[_u]];
								};
						};
				};
			_weapons	=	(_x select 2);
			if ( count _weapons > 0 ) then
				{
					for "_i" from ((count _weapons) -1) to 0 step -1 do
						{
							for "_u" from -1 to 3 do
								{			
									_vehicle WeaponsTurret [_u];
									_vehicle removeWeapon (_weapons select _i);
								};
						};
				};
			if (_x select 3) then
				{_vehicle disableTIEquipment true;};
		};
} forEach _vehicles;

