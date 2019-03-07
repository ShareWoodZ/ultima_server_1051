diag_log ("[#Ultima]: [Создание предметов]: Инициализация массива создаваемых предметов...");
Ultima_Craft_Array	=
	[
		//Массив в который входит пердмет(пистолеты-и т.п.)|Предмет|Массив частей на крафт: Предмет, кол-во|Необходимые инструменты|Массив: Необходимый объект в радиусе, радиус|необходимое кол-во хуманити
		//	Инструменты
			//	Ящик с инструментами
		["Инструменты","ItemToolBox",[["ItemTrashRazor",4],["ItemTrashToiletpaper",4],["PartGeneric",4]],[],[],0]
			//	Нож
		,["Инструменты","ItemKnife",[["ItemTrashToiletpaper",2],["ItemTrashRazor",1],["ItemCopperBar", 1]],["ItemToolbox"],[],0]
			//	Топорик
		,["Инструменты","ItemHatchet_DZE",[["ItemKnife",1],["TrashTinCan",3],["ItemCopperBar",1]],["ItemToolbox"],[],0]
			//	Фомка
		,["Инструменты","ItemCrowbar",[["ItemCopperBar",3]],[],[["Land_Fire_DZ","Костер",5]],0]
			//	Лопатка
		,["Инструменты","ItemEtool",[["PartPlankPack",1],["ItemAluminumBar",1]],["ItemToolbox"],[["Land_Fire_DZ","Костер",5],["WorkBench_DZ","Верстак",5]],0]
			//	Наболдажник для кувалды			
		,["Инструменты","ItemSledgeHead",[["ItemAluminumBar",2]],["ItemToolbox"],[["Land_Fire_DZ","Костер",5]],0]
			//	Рукоять для кувалды
		,["Инструменты","ItemSledgeHandle",[["PartWoodLumber",6]],["ItemToolbox","ItemKnife","ItemHatchet_DZE"],[["WorkBench_DZ","Верстак",5]],0]
			//	Удочка
		,["Инструменты","ItemFishingPole",[["PartWoodLumber",2],["TrashTinCan",1],["ItemWire",1]],["ItemToolbox"],[],0]
			//	Набор для создания ключей
		,["Инструменты","ItemKeyKit",[["ItemToolbox",1],["ItemAluminumBar",1]],[],[["Land_Fire_DZ","Костер",5],["WorkBench_DZ","Верстак",5]],0]

		//	Инвентарь
			//	Карта
		,["Инвентарь","ItemMap",[["ItemTrashToiletpaper",10]],[],[],0]
			//	Спички
		,["Инвентарь","ItemMatchbox_DZE",[["PartWoodPile",2],["ItemMixOil",1]],["ItemKnife"],[],0]
			//	Часы
		,["Инвентарь","ItemWatch",[["ItemCopperBar",1],["PartGlass",1]],["ItemToolbox"],[["WorkBench_DZ","Верстак",5]],0]
			//	Компас
		,["Инвентарь","ItemCompass",[["ItemWatch",1],["PartGlass",1]],["ItemToolbox"],[["WorkBench_DZ","Верстак",5]],0]
			//	Фонарик
		,["Инвентарь","ItemFlashlightRed",[["ItemWatch",1],["PartGlass",1]],["ItemToolbox"],[["WorkBench_DZ","Верстак",5]],0]
			//	Пустая фляга
		,["Инвентарь","ItemWaterbottleUnfilled",[["ItemCanvas",1],["TrashTinCan",5]],["ItemToolbox","ItemKnife"],[["Land_Fire_DZ","Костер",5],["WorkBench_DZ","Верстак",5]],0]
			//	Бинокль
		,["Инвентарь","Binocular",[["PartGlass",2],["ItemCopperBar",1]],["ItemToolbox"],[["WorkBench_DZ","Верстак",5]],0]
		
		//	Ресурсы
			//	Металлолом
		,["Ресурсы","PartGeneric",[["ItemSodaEmpty",10]],["ItemToolbox"],[],0]
			//	Слиток меди
		,["Ресурсы","ItemCopperBar",[["PartGeneric",10]],[],[["Land_Fire_DZ","Костер",5]],0]
			//	Слиток Аллюминия
		,["Ресурсы","ItemAluminumBar",[["ItemCopperBar",10]],[],[["Land_Fire_DZ","Костер",5]],0]

		//	Запчасти и т.п.
			//	Пустая канистра
		,["Запчасти","ItemJerrycanEmpty",[["PartGeneric",1]],["ItemToolbox"],[["Land_Fire_DZ","Костер",5]],0]
			//	Колесо
		,["Запчасти","PartWheel",[["PartGeneric",1]],["ItemToolbox"],[["WorkBench_DZ","Верстак",5]],0]
		
		//	Медицина
			//	Бинт
			//	Эпинифрин(Адреналин)
		,["Медицина","ItemEpinephrine",[["PartWoodPile",2],["ItemKiloHemp",7],["TrashTinCan",1],["ItemWaterbottle",1]],["ItemKnife"],[["Land_Fire_DZ","Костер",5]],0]			
			//	Болеутоляющее
		,["Медицина","ItemPainkiller",[["PartWoodPile",2],["ItemKiloHemp",1],["TrashTinCan",1],["ItemWaterbottle",1]],["ItemKnife"],[["Land_Fire_DZ","Костер",5]],0]			
			//	Морфий
		,["Медицина","ItemMorphine",[["PartWoodPile",2],["ItemKiloHemp",3],["TrashTinCan",1],["ItemWaterbottle",1]],["ItemKnife"],[["Land_Fire_DZ","Костер",5]],0]			
			//	Антибиотик
		,["Медицина","ItemAntibiotic",[["PartWoodPile",2],["ItemKiloHemp",5],["TrashTinCan",1],["ItemWaterbottle",1]],["ItemKnife"],[["Land_Fire_DZ","Костер",5]],0]
			//	Жаропонижающее
		,["Медицина","ItemHeatPack",[["PartWoodPile",2],["ItemKiloHemp",2],["TrashTinCan",1]],["ItemKnife"],[["Land_Fire_DZ","Костер",5]],0]			
		
		
	];
diag_log ("[#Ultima]: [Создание предметов]: Инициализация массива создаваемых предметов, - завершена.");	
