if ( "ItemBriefcase100oz" in (magazines player) ) then
	{
		player removeMagazine "ItemBriefcase100oz";
		Terminal_Server	=	[player, "reward", (10000*Ultima_Bax_Silver)];
		publicVariableServer "Terminal_Server";		
		taskHint [localize "Ultima_TT_Exchange_Complite", [0,1,0,1], 'taskDone'];
	}
else
	{taskHint [localize "Ultima_TT_Need_Gold_To_Exchange", [1,0,0.1,1], 'taskFailed'];};