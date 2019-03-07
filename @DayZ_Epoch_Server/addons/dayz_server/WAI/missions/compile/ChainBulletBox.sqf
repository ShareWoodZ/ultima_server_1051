//Chain Bullet Box

_box = _this select 0;
_box setVariable ["ObjectID","1",true];
_box setVariable ["permaLoot",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_box];

clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;

// AMMUNITION
_box addMagazineCargoGlobal ["2000Rnd_762x51_M134", 2];
_box addMagazineCargoGlobal ["200Rnd_762x51_M240", 4];
_box addMagazineCargoGlobal ["100Rnd_127x99_M2", 5];
_box addMagazineCargoGlobal ["150Rnd_127x107_DSHKM", 2];
_box addMagazineCargoGlobal ["30Rnd_556x45_G36", 20];
_box addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 20];
_box addMagazineCargoGlobal ["30Rnd_762x39_AK47", 20];
_box addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 20];
_box addMagazineCargoGlobal ["75Rnd_545x39_RPK", 20];
_box addMagazineCargoGlobal ["30Rnd_556x45_StanagSD", 20];

// BACKPACKS
_box addBackpackCargoGlobal ["DZ_LargeGunBag_EP1", 1];

_box addMagazineCargoGlobal ["ItemCopperBar", 5];
_box addMagazineCargoGlobal ["ItemAluminumBar", 2];
