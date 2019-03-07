waitUntil {!isNull player};
sleep 10;
titleText [localize "Ultima_In_Radioactive_Zone", "PLAIN DOWN", 3]; titleFadeOut 4;
sleep 10;
while { true } do
	{
		r_player_lowblood = true;
		r_player_inpain = true;
		r_player_injured = true;
		r_player_cardiac = true;
		dayz_thirst = 1;
		player setVariable ["USEC_injured",true,true];
		player setVariable['medForceUpdate',true,true];
		playSound "geiger";
		sleep 10;
	};
