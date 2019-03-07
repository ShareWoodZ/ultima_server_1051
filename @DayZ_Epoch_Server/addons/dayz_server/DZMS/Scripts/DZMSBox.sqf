private ["_crate","_type","_bpackList","_gshellList","_medical","_money","_scount","_sSelect","_item","_x","_ammo"];
_crate	=	_this select 0;
_type	=	_this select 1;
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
_bpackList	=	["DZ_Patrol_Pack_EP1","DZ_Assault_Pack_EP1","DZ_Czech_Vest_Puch","DZ_ALICE_Pack_EP1","DZ_TK_Assault_Pack_EP1","DZ_British_ACU","DZ_CivilBackpack_EP1","DZ_Backpack_EP1"];
_gshellList		=	["HandGrenade_west","FlareGreen_M203","FlareWhite_M203"];
_medical		=	["ItemBandage","ItemMorphine","ItemEpinephrine","ItemPainkiller","ItemWaterbottle","FoodMRE","ItemAntibiotic","ItemBloodbag"];
_money		=	["ItemSilverBar","ItemSilverBar10oz","ItemGoldBar","ItemGoldBar10oz"];
if (_type == "medical") then
	{
		_scount	=	count _medical;
		for "_x" from 0 to 20 do
			{
				_sSelect	=	floor(random _sCount);
				_item		=	_medical select _sSelect;
				_crate addMagazineCargoGlobal [_item,(round(random 2))];
			};
	};
if (_type == "weapons") then
	{
		_scount	=	count _gshellList;
		for "_x" from 0 to 2 do
			{
				_sSelect	=	floor(random _sCount);
				_item		=	_gshellList select _sSelect;
				_crate addMagazineCargoGlobal [_item,(round(random 2))];
			};
		_scount	=	count _bpackList;
		for "_x" from 0 to 3 do
			{
				_sSelect	=	floor(random _sCount);
				_item		=	_bpackList select _sSelect;
				_crate addBackpackCargoGlobal [_item,1];
			};
		_scount	=	count DZMSpistolList;
		for "_x" from 0 to 2 do
			{
				_sSelect	=	floor(random _sCount);
				_item		=	DZMSpistolList select _sSelect;
				_crate addWeaponCargoGlobal [_item,1];
				_ammo	=	[] + getArray (configFile >> "cfgWeapons" >> _item >> "magazines");
				if (count _ammo > 0) then
					{_crate addMagazineCargoGlobal [(_ammo select 0),(round(random 2))];};
			};
		_scount	=	count DZMSsniperList;
		for "_x" from 0 to 1 do
			{
				_sSelect	=	floor(random _sCount);
				_item		=	DZMSsniperList select _sSelect;
				_crate addWeaponCargoGlobal [_item,1];
				_ammo	=	[] + getArray (configFile >> "cfgWeapons" >> _item >> "magazines");
				if (count _ammo > 0) then
					{_crate addMagazineCargoGlobal [(_ammo select 0),(round(random 2))];};
			};
		_scount	=	count DZMSmgList;
		for "_x" from 0 to 1 do
			{
				_sSelect	=	floor(random _sCount);
				_item		=	DZMSmgList select _sSelect;
				_crate addWeaponCargoGlobal [_item,1];
				_ammo		=	[] + getArray (configFile >> "cfgWeapons" >> _item >> "magazines");
				if (count _ammo > 0) then
					{_crate addMagazineCargoGlobal [(_ammo select 0),(round(random 2))];};
			};
		_scount	=	count DZMSprimaryList;
		for "_x" from 0 to 2 do
			{
				_sSelect	=	floor(random _sCount);
				_item		=	DZMSprimaryList select _sSelect;
				_crate addWeaponCargoGlobal [_item,1];
				_ammo		=	[] + getArray (configFile >> "cfgWeapons" >> _item >> "magazines");
				if (count _ammo > 0) then
					{_crate addMagazineCargoGlobal [(_ammo select 0),(round(random 2))];};
			};
	};
if (_type == "supply") then
	{
		_scount	=	count DZMSConTools;
		for "_x" from 0 to 2 do
			{
				_sSelect	=	floor(random _sCount);
				_item		=	DZMSConTools select _sSelect;
				_crate addWeaponCargoGlobal [_item, 1];
			};
		_scount	=	count DZMSConSupply;
		for "_x" from 0 to 30 do
			{
				_sSelect	=	floor(random _sCount);
				_item		=	DZMSConSupply select _sSelect;
				_crate addMagazineCargoGlobal [_item,1];
			};
	};
if (_type == "money") then
	{
		_scount	=	count _money;
		for "_x" from 0 to 3 do
			{
				_sSelect	=	floor(random _sCount);
				_item		=	_money select _sSelect;
				_crate addMagazineCargoGlobal [_item,1];
			};
	};