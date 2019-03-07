//Стартовый инвентарь по умолчанию
DefaultMagazines		=	["ItemBandage","ItemBandage","17Rnd_9x19_glock17","17Rnd_9x19_glock17","ItemMorphine","ItemPainkiller","ItemWaterbottleBoiled","FoodSteakCooked"];
DefaultWeapons			=	["glock17_EP1","ItemFlashlight","ItemHatchet_DZE","ItemMap"];
DefaultBackpack			=	"DZ_Patrol_Pack_EP1";
DefaultBackpackItems	=	[]; 
//Стартовый инвентарь для донаторов
if (((getPlayerUID player) in Ultima_Donators) or ((getPlayerUID player) in Ultima_Admins)) then
	{
		DefaultMagazines		=	["ItemBandage","ItemBandage","ItemBandage","ItemBandage","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","30Rnd_9x19_MP5","30Rnd_9x19_MP5","ItemMorphine","ItemPainkiller","ItemBloodbag","ItemAntibiotic","ItemWaterbottleBoiled","ItemWaterbottleBoiled","FoodSteakCooked","Skin_Soldier1_DZ"];
		DefaultWeapons			=	["M9SD","MP5A5","Binocular","ItemMap","ItemCompass","ItemFlashlightRed","ItemKnife","ItemMatchbox_DZE","ItemHatchet_DZE","ItemToolbox"];
		DefaultBackpack			=	"DZ_CivilBackpack_EP1";
		DefaultBackpackItems	=	[]; 
	};
