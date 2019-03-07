if ( ([[["PartOreGold", 10]]] call Craft_Find_Required_Items) != "true" ) exitWith
	{systemChat localize "Ultima_TT_Need_Gold_To_Exchange";};
[[["PartOreGold", 10]]] call Craft_Delete_Required_Items;
Terminal_Server	=	[player, "reward", 20];
publicVariableServer "Terminal_Server";
systemChat localize "Ultima_Action_Complete";