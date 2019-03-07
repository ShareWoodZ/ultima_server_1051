private ["_buy", "_gems_conversion", "_cancel", "_humanity"];
if (DZE_ActionInProgress) exitWith
	{ cutText [(localize "str_epoch_player_103") , "PLAIN DOWN"]; };
DZE_ActionInProgress	=	true;
{
	(player removeAction _x);
} forEach s_player_parts;
s_player_parts			=	[];
s_player_parts_crtl		=	1;
_gems_conversion		=
	[
		["ItemBriefcase100oz", "ItemCitrine", 1, 1, "buy", (localize "Ultima_Citrine"), (localize "Ultima_Briefcase100ozGold"), 99]
		,["ItemBriefcase100oz", "ItemEmerald", 2, 1, "buy", (localize "Ultima_Emerald"), (localize "Ultima_Briefcase100ozGold"), 99]
		,["ItemBriefcase100oz", "ItemAmethyst", 3, 1, "buy", (localize "Ultima_Ametiste"), (localize "Ultima_Briefcase100ozGold"), 99]
		,["ItemBriefcase100oz", "ItemSapphire", 4, 1, "buy", (localize "Ultima_Sapfire"), (localize "Ultima_Briefcase100ozGold"), 99]
	];
_humanity_gems			=
	[
		["ItemTopaz", "ItemBriefcase100oz", 1, 6, "buy", (localize "Ultima_Briefcase100ozGold"), (localize "Ultima_Topaz"), 99]
		,["ItemBriefcase100oz", "ItemTopaz", 6, 1, "buy", (localize "Ultima_Topaz"), (localize "Ultima_Briefcase100ozGold"), 99]
		,["ItemObsidian", "ItemBriefcase100oz", 1, 12, "buy", (localize "Ultima_Briefcase100ozGold"), (localize "Ultima_Obsidian"), 99]
		,["ItemBriefcase100oz", "ItemObsidian", 12, 1, "buy", (localize "Ultima_Obsidian"), (localize "Ultima_Briefcase100ozGold"), 99]
		,["ItemRuby", "ItemObsidian", 1, 2, "buy", (localize "Ultima_Obsidian"), (localize "Ultima_Ruby"), 99]
		,["ItemObsidian", "ItemRuby", 2, 1, "buy", (localize "Ultima_Ruby"), (localize "Ultima_Obsidian"), 99]
	];
_humanity = player getVariable ["humanity",0];
if ((_humanity < -10000) || (_humanity > 10000)) then
	{_gems_conversion	=	_gems_conversion + _humanity_gems;};
{
    _buy = player addAction [format["%1 %2 %3 %4 %5 %6", (localize "Ultima_Change"), (_x select 3),(_x select 5), (localize "Ultima_To"),(_x select 2),(_x select 6)], "\z\addons\dayz_code\actions\trade_items_wo_db.sqf",[(_x select 0),(_x select 1),(_x select 2),(_x select 3),(_x select 4),(_x select 5),(_x select 6)], (_x select 7), true, true, "",""];
    s_player_parts set [count s_player_parts,_buy];
} forEach _gems_conversion;
_cancel	=	player addAction [(localize "Ultima_Cancel"), "\z\addons\dayz_code\actions\trade_cancel.sqf",["na"], 0, true, false, "",""];
s_player_parts set [count s_player_parts,_cancel];
DZE_ActionInProgress = false;