//Водяной знак
if (!isNil "server_name") then 
	{
		[] spawn 
			{
				waitUntil {(!isNull Player) and (alive Player) and (player == player)};
				waituntil {!(isNull (findDisplay 46))};
				5 cutRsc ["wm_disp","PLAIN"];
				((uiNamespace getVariable "wm_disp") displayCtrl 1) ctrlSetText server_name;
			};
	};