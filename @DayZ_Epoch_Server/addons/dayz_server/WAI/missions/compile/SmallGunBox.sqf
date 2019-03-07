//Small Gun Box

_box = _this select 0;
_box setVariable ["ObjectID","1",true];
_box setVariable ["permaLoot",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_box];

clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;

// RIFLES
_box addWeaponCargoGlobal ["M16A2", 3];
_box addWeaponCargoGlobal ["AKS_74_kobra", 3];
_box addWeaponCargoGlobal ["LeeEnfield", 3];
_box addWeaponCargoGlobal ["KSVK_DZE", 1];
_box addWeaponCargoGlobal ["SVD", 3];
_box addWeaponCargoGlobal ["AK_74_GL", 3];
_box addWeaponCargoGlobal ["SCAR_L_CQC", 2];
_box addWeaponCargoGlobal ["DMR_DZ", 1];

// PISTOLS
_box addWeaponCargoGlobal ["glock17_EP1", 1];
_box addWeaponCargoGlobal ["Colt1911", 1];

// AMMUNITION
_box addMagazineCargoGlobal ["20Rnd_556x45_Stanag", 5];
_box addMagazineCargoGlobal ["30Rnd_545x39_AK", 5];
_box addMagazineCargoGlobal ["8Rnd_B_Beneli_Pellets", 5];
_box addMagazineCargoGlobal ["10Rnd_762x54_SVD", 5];

_box addMagazineCargoGlobal ["17Rnd_9x19_glock17", 5];
_box addMagazineCargoGlobal ["7Rnd_45ACP_1911", 5];
// TOOLS
_box addWeaponCargoGlobal ["ItemToolbox", 2];

// BACKPACKS
_box addBackpackCargoGlobal ["DZ_British_ACU", 2];
_box addBackpackCargoGlobal ["DZ_LargeGunBag_EP1", 1];

_box addMagazineCargoGlobal ["ItemCopperBar", 5];
_box addMagazineCargoGlobal ["ItemAluminumBar", 2];
