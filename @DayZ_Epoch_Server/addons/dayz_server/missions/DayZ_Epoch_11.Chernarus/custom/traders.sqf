private ["_aTraders","_bldObj"];
_aTraders =
			[
				["RU_Citizen4",[13531.9, 6356.7, 1.7],102.7],
				["RU_Citizen1",[4360.6, 2260.9, 3.8],196.6],
				["Pilot_EP1", [6340, 7709, 0],130],
				["Rita_Ensler_EP1", [6357, 7699,0],300],
				["Worker2", [12061.6, 12636.2, 0],19.9],
				["GUE_Soldier_MG", [1623.1, 7797.7, 0.2],274.5],
				["RU_Profiteer4", [6332.23, 7703.54, 0.001], 49],
				["Woodlander3", [6348, 7693, 0], 49],
				["HouseWife1", [13468.3, 5439.5, 2.8],-91.7],
				["Doctor", [4059.4, 11660.4, 0],24.2],
				["GUE_Woodlander2", [6346, 7716, 0],205],
				["RU_Functionary1", [12946.3, 12766.5, 2],194.2],
				["Woodlander1", [11471.1, 11361.2, -9.1],250.1],
				["RU_WorkWoman1", [11463.9, 11351.6, 0.9],261.2],
				["Rocker4", [11465.5, 11354.4, 0],310],
				["RU_Citizen3", [11462.3, 11365.9, 0],125.7],
				["Dr_Annie_Baker_EP1", [11472, 11370.6, 0],208.2],
				["TK_CIV_Takistani04_EP1", [6342, 7713, 0],130],
				["CIV_EuroMan02_EP1", [4058, 11678.7, 0.3],89.8],
				["Dr_Hladik_EP1", [6354, 7696, 0],300],
				["Worker3", [4041.6, 11668.8, 0.2],24.9],
				["CIV_EuroMan01_EP1", [4064, 11680, 0],231],
				["RU_WorkWoman5", [4072, 11676.7, 0],566.8],
				["TK_GUE_Soldier_5_EP1", [4054.2, 11664.6, -0.5],422.9],
				["Profiteer4", [11449.4, 11341, -9.1],34.5],
				["RU_Villager3", [7996.1, 2899, 0.6],86.8],
				["Rocker2", [7083.7, 2516.5, 0],185.6],
				["pook_Doc_Bell47", [6441.28,6545.22,0.001],173]
			];
_bldObj = objNull;
if (true) then
{
	{
		_bldObj = createAgent [(_x select 0), (_x select 1), [], 0, "CAN_COLLIDE"];
		_bldObj setDir (_x select 2);
		_bldObj setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
		_bldObj setUnitAbility 0.60000002;
		_bldObj allowDammage false; _bldObj disableAI 'FSM'; _bldObj disableAI 'MOVE'; _bldObj disableAI 'AUTOTARGET'; _bldObj disableAI 'TARGET'; _bldObj setBehaviour 'CARELESS'; _bldObj forceSpeed 0;_bldObj enableSimulation false;
	} forEach _aTraders;
};
processInitCommands;  
