      //Custom Spawns file//
/*##################################################################################
Custom group spawns Eg.

[[953.237,4486.48,0.001], //position
4,						  //Number Of units
1,					      //Skill level 0-1 or skill array number if using custom skills "Random" for random Skill array.
"Random",			      //Primary gun set number. "Random" for random weapon set.
4,						  //Number of magazines
"",						  //Backpack "" for random or classname here.
"Bandit2_DZ",			  //Skin "" for random or classname here.
"Random"                  //Gearset number. "Random" for random gear set.
] call spawn_custom;

Place your custom group spawns below
##################################################################################*/

//засада возле геройского лагеря
//[[10120.7,7572.68,0],2,1,"Random",4,"","Bandit2_DZ","Random"] call spawn_custom;      
//[[5554.19, 4548.6,0.001],2,1,"Random",4,"","Bandit2_DZ","Random"] call spawn_custom;

// Suhrenfeld Array
/*##################################################################################
[[10120.7,7572.68,0.001],2,1,"Random",4,"","Graves_Light_DZ","Random"] call spawn_custom;             //Фронтальные гвардии
[[16438.6, 18362.2,0.001],2,1,"Random",4,"","Bandit2_DZ","Random"] call spawn_custom;        //Возврат гвардии
[[16599.7, 18223.1,0.001],2,1,"Random",4,"","Graves_Light_DZ","Random"] call spawn_custom;    //Weapons Crate
[[16006.2, 18764.5,0.001],2,1,"Random",4,"","Bandit2_DZ","Random"] call spawn_custom;             //Vehicle + Building Supplies Crate
[[16096.6, 18747.7,0.001],2,1,"Random",4,"","Graves_Light_DZ","Random"] call spawn_custom;         //Medical + Food/Drink Crate

// Hemp Farms
/*[[10835, 12663.3,0.001],2,1,"Random",4,"","Graves_Light_DZ","Random"] call spawn_custom;            
[[10819, 12622,0.001],2,1,"Random",4,"","Bandit2_DZ","Random"] call spawn_custom;        
[[10002.5, 13791.6,0.001],2,1,"Random",4,"","Graves_Light_DZ","Random"] call spawn_custom;   
[[9872.12, 13583.9,0.001],2,1,"Random",4,"","Bandit2_DZ","Random"] call spawn_custom;            
[[9900.11, 13573.3,0.274],2,1,"Random",4,"","Graves_Light_DZ","Random"] call spawn_custom;        
[[12338, 8215,0.001],2,1,"Random",8,"","Bandit2_DZ","Random"] call spawn_custom;             
[[12319, 8214,0.274],2,1,"Random",8,"","Graves_Light_DZ","Random"] call spawn_custom;         
[[3490, 9752,0.001],2,1,"Random",8,"","Bandit2_DZ","Random"] call spawn_custom;            
[[3472, 9757,0.274],2,1,"Random",8,"","Graves_Light_DZ","Random"] call spawn_custom;       
[[16890, 5044,0.001],2,1,"Random",8,"","Bandit2_DZ","Random"] call spawn_custom;            
[[16901, 5020,0.274],2,1,"Random",8,"","Graves_Light_DZ","Random"] call spawn_custom;   
[[9024, 3415,0.001],2,1,"Random",4,"","Bandit2_DZ","Random"] call spawn_custom;            
[[9021, 3383,0.274],2,1,"Random",8,"","Graves_Light_DZ","Random"] call spawn_custom; 
[[9999, 16719,0.001],2,1,"Random",4,"","Bandit2_DZ","Random"] call spawn_custom;            
[[10002, 16705,0.274],2,1,"Random",8,"","Graves_Light_DZ","Random"] call spawn_custom;

##################################################################################*/

/*##################################################################################
Custom static weapon spawns Eg. (with one position)

[[[911.21545,4532.7612,2.6292224]], //position(s) (can be multiple).
"M2StaticMG",             //Classname of turret
1,					  //Skill level 0-1. Has no effect if using custom skills
"Bandit2_DZ",			  //Skin "" for random or classname here.
1,						  //Primary gun set number. "Random" for random weapon set. (not needed if ai_static_useweapon = False)
2,						  //Number of magazines. (not needed if ai_static_useweapon = False)
"",						  //Backpack "" for random or classname here. (not needed if ai_static_useweapon = False)
"Random"				  //Gearset number. "Random" for random gear set. (not needed if ai_static_useweapon = False)
] call spawn_static;

Custom static weapon spawns Eg. (with mutiple positions)

[[[911.21545,4532.7612,2.6292224],[921.21545,4532.7612,2.6292224]], //position(s) (can be multiple).
"Stinger_Pod_US_EP1",             //Classname of turret
1,                      //Skill level 0-1. Has no effect if using custom skills
"Bandit2_DZ",              //Skin "" for random or classname here.
1,                          //Primary gun set number. "Random" for random weapon set. (not needed if ai_static_useweapon = False)
2,                          //Number of magazines. (not needed if ai_static_useweapon = False)
"",                          //Backpack "" for random or classname here. (not needed if ai_static_useweapon = False)
"Random"                  //Gearset number. "Random" for random gear set. (not needed if ai_static_useweapon = False)
] call spawn_static

Place your custom static weapon spawns below
##################################################################################*/

// Death Alley

//Наземные Башни,пулеметы\\
//Передние гвардии

//[[[18581.9,17206.1,0],[18574.9,17219.2,0],[18568.4,17260.1,13],[18496.7,17266.3,11]],"Stinger_Pod_US_EP1",1,"Graves_Light_DZ",1,2,"","Random"] call spawn_static;
//[[[18724.5,17207.3,18],[18730.5,17200.4,9],[18729.2,17217.4,9]],"Stinger_Pod_US_EP1",1,"Graves_Light_DZ",1,2,"","Random"] call spawn_static;
//[[[17950.7,4174.13,0],[16650.3,3979.26,0],[17922.4,4355.54,0],[16465.8,3149.33,0]],"ZU23_TK_EP1",1,"Graves_Light_DZ",1,2,"","Random"] call spawn_static;

/*##################################################################################
Статические патрули на верталетах.
Описание настроик

[[725.391,4526.06,0],    //Позиция патрулирования
[0,0,0],	             // Позиция появления патруля
1000,					//Радиус видимости
10,                     //Number of waypoints to give
"UH1H_DZ",		        //Classname of vehicle (make sure it has driver and two gunners)
1						//Skill level пехоты 
] spawn heli_patrol;

Place your heli patrols below
##################################################################################*/
//Патрули верталетов

//[[10331.6,7846.52,600],[19142,7316,500],500,10,"UH1H_TK_EP1",1] spawn heli_patrol;
//[[14321.7,12589.7,600],[19142,7316,500],500,10,"UH1H_TK_EP1",1] spawn heli_patrol;
//[[16505.7,18323.5,600],[20192,15765,500],500,10,"UH1H_TK_EP1",1] spawn heli_patrol;//
//[[19180.6,6870.11,600],[20192,15765,500],500,10,"UH60M_EP1_DZ",1] spawn heli_patrol;
//[[18416.7,1732.5,600],[17142,7316,500],500,10,"Ka137_MG_PMC",1] spawn heli_patrol;
//[[8805.28,5150.18,600],[15142,6316,500],500,10,"Ka137_MG_PMC",1] spawn heli_patrol;//

/*################################################################################## 
Custom Vehicle patrol spawns Eg. (Watch out they are stupid)
/*
[[725.391,4526.06,0],   //Position to patrol
[725.391,4526.06,0],	// Postition to spawn at
200,					//Radius of patrol
10,                     //Number of waypoints to give
"HMMWV_Armored",		//Classname of vehicle (make sure it has driver and gunner)
1						//Skill level of units 
] spawn vehicle_patrol;
/*
Place your vehicle patrols below this line
##################################################################################*/
//Патрули на машинах
//[[16379.9,18424.8, 0],[17088.7, 18851.7, 0],400,10,"T90",1] spawn vehicle_patrol;

//Патрули на лодках
//[[1139.18, 15356.7, 0],[6045.21, 10780.4, 0],300,10,"RHIB",1] spawn vehicle_patrol;


/*##################################################################################
Paradropped unit custom spawn Eg.

[[911.21545,4532.7612,2.6292224],  //Position that units will be dropped by
[0,0,0],                           //Starting position of the heli
400,                               //Radius from drop position a player has to be to spawn chopper
"UH1H_DZ",                         //Classname of chopper (Make sure it has 2 gunner seats!)
5,                                 //Number of units to be para dropped
1,                                 //Skill level 0-1 or skill array number if using custom skills "Random" for random Skill array.
"Random",                          //Primary gun set number. "Random" for random weapon set.
4,                                 //Number of magazines
"",                                //Backpack "" for random or classname here.
"Bandit2_DZ",                      //Skin "" for random or classname here.
"Random",                          //Gearset number. "Random" for random gear set.
False                               //True: Heli will stay at position and fight. False: Heli will leave if not under fire. 
] spawn heli_para;

Place your paradrop spawns under this line
##################################################################################*/

//Спавн парашутистов
//[[10120.7,7572.68,0],[15125.8,9687,600],100,"C130J",8,1,"Random",4,"","Bandit2_DZ","Random",False] spawn heli_para;
//[[9800.72,7584.44,0],[2374,6332,600],100,"BAF_Merlin_HC3_D",8,1,"Random",4,"","Graves_Light_DZ","Random",False] spawn heli_para;//
//[[16714.3,18289,0],[18331,2240,600],100,"BAF_Merlin_HC3_D",8,1,"Random",4,"","Graves_Light_DZ","Random",False] spawn heli_para;//
//[[9906,13595,0],[14448,16858,600],100,"BAF_Merlin_HC3_D",8,1,"Random",4,"","Graves_Light_DZ","Random",False] spawn heli_para;           //         //800m Radius//