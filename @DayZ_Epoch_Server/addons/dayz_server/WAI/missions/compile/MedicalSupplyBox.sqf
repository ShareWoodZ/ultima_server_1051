//Medical Supply Box

_box = _this select 0;
_box setVariable ["ObjectID","1",true];
_box setVariable ["permaLoot",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_box];

clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;

//MEDICAL SUPPLIES
_box addMagazineCargoGlobal ["ItemBandage", 20];
_box addMagazineCargoGlobal ["ItemMorphine", 2];
_box addMagazineCargoGlobal ["ItemEpinephrine", 10];
_box addMagazineCargoGlobal ["ItemPainkiller", 10];
_box addMagazineCargoGlobal ["ItemWaterbottle", 10];
_box addMagazineCargoGlobal ["FoodCanBakedBeans", 20];
_box addMagazineCargoGlobal ["ItemAntibiotic", 20];
_box addMagazineCargoGlobal ["ItemBloodbag", 20];

_box addWeaponCargoGlobal ["ItemRadio", 3];
_box addWeaponCargoGlobal ["NVGoggles", 3];

// BACKPACKS
_box addBackpackCargoGlobal ["DZ_LargeGunBag_EP1", 1];

_box addMagazineCargoGlobal ["ItemCopperBar", 5];
_box addMagazineCargoGlobal ["ItemAluminumBar", 2];