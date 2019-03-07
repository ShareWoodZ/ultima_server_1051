private ["_pathmain","_pathhero","_pathbandit","_pathboth","_EXECscriptHero","_EXECscriptBandit","_EXECscriptBoth","_skill_level","_counter"];
_pathmain			=	"custom\skills\";
_pathhero			=	_pathmain+"heroskills\";
_pathbandit			=	_pathmain+"banditskills\";
_pathboth			=	_pathmain+"both\";
_EXECscriptHero		=	'player execVM "'+_pathhero+'%1"';
_EXECscriptBandit	=	'player execVM "'+_pathbandit+'%1"';
_EXECscriptBoth		=	'player execVM "'+_pathboth+'%1"';
_skill_level		=	player getVariable['humanity', 0];
_counter			=	2;
skill_menu			=	[["",true]];
skill_menu set [count skill_menu, [localize "Ultima_Skill_Create_Bike", [_counter],  "", -5,  [["expression", format[_EXECscriptBoth,"bike.sqf"]]], "1", "1"]];
_counter	=	_counter + 1;
if ((_skill_level > 5000) or (_skill_level < -5000)) then
	{
		if (_skill_level > 5000) then
			{
				skill_menu set [count skill_menu, [localize "Ultima_Skill_Stop_The_Bleeding", [_counter],  "", -5,  [["expression", format[_EXECscriptHero,"hero_bandage.sqf"]]], "1", "1"]];
				_counter	=	_counter + 1;
			};
		if (_skill_level > 10000) then
			{
				skill_menu set [count skill_menu, [localize "Ultima_Skill_Zombie_Shield", [_counter],  "", -5,  [["expression", format[_EXECscriptBoth,"both_zombie_shield.sqf"]]], "1", "1"]];
				_counter	=	_counter + 1;
			};
		if (_skill_level < -5000) then
			{
				skill_menu set [count skill_menu, [localize "Ultima_Skill_Set_A_Bone", [_counter],  "", -5,  [["expression", format[_EXECscriptBandit,"bandit_legs.sqf"]]], "1", "1"]];
				_counter	=	_counter + 1;
			};
		if (_skill_level < -10000) then
			{
				skill_menu set [count skill_menu, [localize "Ultima_Skill_Zombie_Shield", [_counter],  "", -5,  [["expression", format[_EXECscriptBoth,"both_zombie_shield.sqf"]]], "1", "1"]];
				_counter	=	_counter + 1;
			};
	};
skill_menu set [count skill_menu, [localize "Ultima_Skill_Suicide", [_counter],  "", -5,  [["expression", format[_EXECscriptBoth,"suicid.sqf"]]], "1", "1"]];	

skill_menu set [count skill_menu, ["", [-1], "", -5, [["expression", ""]], "1", "0"]];
skill_menu set [count skill_menu, [localize "Ultima_Skill_Exit", [13], "", -3, [["expression", ""]], "1", "1"]];
showCommandingMenu "#USER:skill_menu";