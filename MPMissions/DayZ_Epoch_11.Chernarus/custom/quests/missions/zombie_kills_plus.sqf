Private ["_mission"];
_mission	=	(_this select 0);

Ultima_Quest_Zombie_Kill		=	0;
Ultima_Quest_Zombie_Kill_Done	=	false;

while {true} do
	{
		if !(_mission in Ultima_Quests_Accepted) exitWith {};	//	Если миссия была удалена из массива - истекло время, или игрок ее отменил - выходим.
		//	Игрок убил 100 зомби
		if (Ultima_Quest_Zombie_Kill_Done) exitWith
			{
				Private ["_reputation"];
				[_mission] call Ultima_Quest_Delete;
				taskHint [format["Миссия: %1 завершена!", _mission], [0, 1, 0, 1], 'taskDone'];
				_reputation	=	player getVariable ["Humanity", 0];
				player setVariable ["Humanity", (_reputation + 100), true];
				Ultima_Quest_Zombie_Kill		=	nil;
				Ultima_Quest_Zombie_Kill_Done	=	nil;
			};
		sleep 1;
	};