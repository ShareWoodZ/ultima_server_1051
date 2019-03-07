///////////////////////////////////////////////////////
/// Используйте встроенный в системе миссии (конфигурационный файл для системы миссии в папке миссии)
ai_mission_sysyem = True;

///////////////////////////////////////////////////////
/// очищает все оружие и журналы от тела после смерти
ai_clear_body = False;

/// Очищает трупы после данный момент времени
ai_clean_dead = True;

/// Time (in seconds) after which a dead body will be cleaned up
cleanup_time = 900;
///////////////////////////////////////////////////////
/// Sets radius for AI patrols (call spawn_group)
ai_patrol_radius = 600;

/// Sets number of waypoints to add in patrol area (call spawn_group)
ai_patrol_radius_wp = 10;

/// Наборы поведение ИИ групп 
ai_combatmode = "RED";
ai_behaviour = "SAFE"; //безопасный

///////////////////////////////////////////////////////
/// Включает AI информация обмена (делает их очень трудно даже на условиях нехватки мастерства)
ai_ahare_info = True;

/// Distance AI will let other enemies know of your position (currently only on kill) 
ai_share_distance = 1000;

///////////////////////////////////////////////////////
/// Gain humanity for killing an AI unit (True: is on. False: is off.) 
ai_humanity_gain = True;

/// Humanity added for AI kill 
ai_add_humanity = 10;

/// Добавляет бандит убить при убийстве AI (True: на ложных.. Офф)
ai_banditkills_gain = false;

///////////////////////////////////////////////////////
/// Allows you to set a custom skill array for units. (True: will use these arrays. False: will use number in spawn array)
ai_custom_skills = True;

/// Custom skill array. Use 0 to use this with ai_custom_skills = True 
ai_custom_array1 = [
["aimingAccuracy",1.00],
["aimingShake",1.00],
["aimingSpeed",1.00],
["endurance",1.00],
["spotDistance",1.00],
["spotTime",1.00],
["courage",1.00],
["reloadSpeed",1.00],
["commanding",1.00],
["general",1.00]
];

/// Custom skill array. Use 1 to use this with ai_custom_skills = True 
ai_custom_array2 = [
["aimingAccuracy",1.00],
["aimingShake",1.00],
["aimingSpeed",1.00],
["endurance",1.00],
["spotDistance",1.00],
["spotTime",1.00],
["courage",1.00],
["reloadSpeed",1.00],
["commanding",1.00],
["general",1.00]
];

/// Custom skill array. Use 2 to use this with ai_custom_skills = True 
ai_custom_array3 = [
["aimingAccuracy",1.00],
["aimingShake",1.00],
["aimingSpeed",1.00],
["endurance",1.00],
["spotDistance",1.00],
["spotTime",1.00],
["courage",1.00],
["reloadSpeed",1.00],
["commanding",1.00],
["general",1.00]
];

/// Arrays used in "Random" custom skill 
ai_skill_random = [ai_custom_array1,ai_custom_array2,ai_custom_array3];

///////////////////////////////////////////////////////
/// Позволяет А.И. на статических орудий иметь экипировки
ai_static_useweapon = True;

/// Allows you to set custom array for AI on static weapons. (True: On False: Off) 
ai_static_skills = True;

/// Custom skill array. Use this with ai_static_skills = True;
ai_static_array = [
["aimingAccuracy",1.00],
["aimingShake",1.00],
["aimingSpeed",1.00],
["endurance",1.00],
["spotDistance",1.00],
["spotTime",1.00],
["courage",1.00],
["reloadSpeed",1.00],
["commanding",1.00],
["general",1.00]
];

///////////////////////////////////////////////////////
/// Gearset arrays for unit Loadouts ///

/// 0 ///
ai_gear0 = [
["ItemBandage","ItemPainkiller"],
["ItemKnife","ItemFlashlight"]
];

/// 1 ///
ai_gear1 = [
["ItemBandage","ItemPainkiller"],
["ItemKnife","ItemFlashlight"]
];

/// 2 ///
ai_gear2 = [
["ItemBandage","ItemPainkiller"],
["ItemKnife","ItemFlashlight"]
];

/// 3 ///
ai_gear3 = [
["ItemBandage","ItemPainkiller"],
["ItemKnife","ItemFlashlight"]
];

/// 4 ///
ai_gear4 = [
["ItemBandage","ItemPainkiller"],
["ItemKnife","ItemFlashlight"]
];

/// Gearsets to use if set to "Random" ///
ai_gear_random = [ai_gear0,ai_gear1,ai_gear2,ai_gear3,ai_gear4];

///////////////////////////////////////////////////////
/// Weapon arrays for unit Loadouts ///
/// Format is ["Gun","Ammo"] ///

/// 0 ///
ai_wep0 = [
["AKS_74_UN_kobra","30Rnd_545x39_AKSD"], 
["M4A3_CCO_EP1","30Rnd_556x45_Stanag"], 
["M4A1_AIM_SD_camo","30Rnd_556x45_StanagSD"], 
["M16A4","30Rnd_556x45_Stanag"], 
["m8_carbine","30Rnd_556x45_Stanag"], 
["Sa58V_CCO_EP1","30Rnd_762x39_AK47"]
];

/// 1 ///
ai_wep1 = [
["AK_107_pso","30Rnd_545x39_AK"], 
["M16A4_ACG","30Rnd_556x45_Stanag"], 
["Sa58V_RCO_EP1","30Rnd_762x39_AK47"], 
["M4A1_AIM_SD_camo","30Rnd_556x45_StanagSD"], 
["M14_EP1","20Rnd_762x51_DMR"], 
["M8_sharpshooter","30Rnd_556x45_Stanag"]
];

/// 2 ///
ai_wep2 = [
["AK_107_GL_pso","30Rnd_545x39_AK"], 
["AK_107_GL_kobra","30Rnd_545x39_AK"], 
["M4A1_HWS_GL","30Rnd_556x45_Stanag"], 
["M16A4_ACG_GL","30Rnd_556x45_Stanag"], 
["M8_carbineGL","30Rnd_556x45_Stanag"], 
["M4A3_RCO_GL_EP1","30Rnd_556x45_Stanag"]
];

/// 3 ///
ai_wep3 = [ 
["SVD_CAMO","10Rnd_762x54_SVD"], 
["VSS_Vintorez","20Rnd_9x39_SP5_VSS"], 
["M40A3","5Rnd_762x51_M24"]
];

/// 4 ///
ai_wep4 = [
["RPK_74","75Rnd_545x39_RPK"], 
["MK_48_DZ","100Rnd_762x51_M240"], 
["M249_DZ","200Rnd_556x45_M249"], 
["Pecheneg_DZ","100Rnd_762x54_PK"], 
["M240_DZ","100Rnd_762x51_M240"]
];

/// Arrays used in "Random" for weapons///
ai_wep_random = [ai_wep0,ai_wep1,ai_wep2,ai_wep3,ai_wep4];

///////////////////////////////////////////////////////
/// Backpacks used when "" for random ///
ai_packs = [
"DZ_Czech_Vest_Puch",
"DZ_ALICE_Pack_EP1",
"DZ_TK_Assault_Pack_EP1",
"DZ_British_ACU",
"DZ_GunBag_EP1",
"DZ_CivilBackpack_EP1",
"DZ_Backpack_EP1"
];

///////////////////////////////////////////////////////
/// Skins used when "" for random ///
ai_skin = ["Bandit1_DZ"];
//////////////////////////////////////////////////////
WAIconfigloaded = True;