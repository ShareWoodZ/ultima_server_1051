//Large Gun Box

_box = _this select 0;
_box setVariable ["ObjectID","1",true];
_box setVariable ["permaLoot",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_box];

clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;

// RIFLES
_box addWeaponCargoGlobal ["AK_74_GL", 5];
_box addWeaponCargoGlobal ["G36A_camo", 5];
_box addWeaponCargoGlobal ["AK_107_PSO", 1];
_box addWeaponCargoGlobal ["KSVK_DZE", 1];
_box addWeaponCargoGlobal ["M249_DZ", 3];
_box addWeaponCargoGlobal ["M24", 2];
_box addWeaponCargoGlobal ["M40A3", 3];
_box addWeaponCargoGlobal ["SVD_CAMO", 3];
_box addWeaponCargoGlobal ["M4SPR", 2];
_box addWeaponCargoGlobal ["SCAR_L_CQC", 2];


// PISTOLS
_box addWeaponCargoGlobal ["glock17_EP1", 5];
_box addWeaponCargoGlobal ["UZI_EP1", 5];
_box addWeaponCargoGlobal ["Colt1911", 5];
_box addWeaponCargoGlobal ["bizon", 5];

// AMMUNITION
_box addMagazineCargoGlobal ["30Rnd_762x39_AK47", 5];
_box addMagazineCargoGlobal ["30Rnd_556x45_G36", 5];
_box addMagazineCargoGlobal ["20Rnd_762x51_DMR", 5];
_box addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 5];
_box addMagazineCargoGlobal ["200Rnd_556x45_M249", 5];
_box addMagazineCargoGlobal ["5Rnd_762x51_M24", 4];


_box addMagazineCargoGlobal ["17Rnd_9x19_glock17", 5];
_box addMagazineCargoGlobal ["30Rnd_9x19_UZI", 5];
_box addMagazineCargoGlobal ["7Rnd_45ACP_1911", 5];
_box addMagazineCargoGlobal ["64Rnd_9x19_Bizon", 5];

// TOOLS
_box addWeaponCargoGlobal ["ItemToolbox", 2];
_box addWeaponCargoGlobal ["ItemEtool", 2];
_box addWeaponCargoGlobal ["ItemCrowbar", 2];
_box addWeaponCargoGlobal ["ItemKnife", 2];
_box addWeaponCargoGlobal ["DMR_DZ", 1];

// BACKPACKS
_box addBackpackCargoGlobal ["DZ_LargeGunBag_EP1", 1];

_box addMagazineCargoGlobal ["ItemCopperBar", 5];
_box addMagazineCargoGlobal ["ItemAluminumBar", 2];
