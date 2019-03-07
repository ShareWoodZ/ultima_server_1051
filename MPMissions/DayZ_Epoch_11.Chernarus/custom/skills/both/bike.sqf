if !(((getPlayerUID player) in Ultima_Donators) or ((getPlayerUID player) in Ultima_Admins)) exitWith
	{titleText [localize "Ultima_Skill_Need_Professional","PLAIN DOWN"]; titleFadeOut 5;};
if (dayz_combat == 1) then
	{cutText [format[localize "Ultima_No_Action_In_Battle"], "PLAIN DOWN"];}
else
	{
		if ("ItemToolbox" in (weapons player)) then
			{
				private ["_dis","_sfx"];
				player removeWeapon "ItemToolbox";
				player playActionNow "Medic";
				r_interrupt = false;
				_dis	=	10;
				_sfx	=	"repair";
				[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
				[player,_dis,true,(getPosATL player)] spawn player_alertZombies;
				sleep 1;
				_object = "Old_bike_TK_CIV_EP1" createVehicle (position player);
				_object setVariable ["ObjectID", "1", true];
				_object setVariable ["ObjectUID", "1", true];
				_object attachto [player,[0.0,3.0,0.5]];
				sleep 1;
				detach _object;
				player reveal _object;
				cutText [format[localize "Ultima_Action_Complete"], "PLAIN DOWN"];
				r_interrupt = false;
				player switchMove "";
				player playActionNow "stop";
			}
		else
			{titleText [format[localize "Ultima_Skill_Need_Part", (typeOf "ItemToolbox")],"PLAIN DOWN"]; titleFadeOut 5;};
	};