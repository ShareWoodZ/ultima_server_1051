private ["_bloodAmount","_humanityBool","_infectionChance","_humanityNegBool","_humanityNegAmount","_humanityAmount","_infectedLifeLost","_infectedLifeBool","_lastBloodbag","_bloodbagLastUsedTime","_bloodbagTime","_bloodbagUseTime","_bloodbagUsageTime","_incombat","_timeout"];
_bloodAmount			=	4000;	//	Сколько крови будет залито
_bloodbagUseTime		=	30;		//	Сколько секунд будет происхоидить переливание
_bloodbagLastUsedTime	=	60;		//	Через сколько секунд, можно повторить переливание
_infectionChance		=	10;		//	Шанс заражения при переливании (10 = 10% | 2 = 50% | 1 = 100%)
_infectedLifeBool		=	true;	//	Персонаж может потерять кровь при переливании, если сработает шанс заражения (True = да | False = нет)
_infectedLifeLost		=	1000;	//	Кол-во крови которое потеряет персонаж, после переливания, если сработает шанс заражения
_humanityBool			=	false;	//	Игрок получает человечность при заливке крови самому себе (True = да | False = нет)
_humanityAmount			=	50;		//	Кол-во человечности, которое начислят игроку за переливание (250 стандартное, для обычного переливания от игрока к игроку, но не себе)
if (isNil "lastBloodbag") then
	{lastBloodbag	=	0;};
_bloodbagTime = time - lastBloodbag;
_bloodbagUsageTime = time;
_timeout = player getVariable["combattimeout", 0];
_inCombat = if (_timeout >= diag_tickTime) then { true } else { false };
if(_bloodbagTime < _bloodbagLastUsedTime) exitWith
	{cutText [format[localize "Ultima_Reuse",(_bloodbagTime - _bloodbagLastUsedTime)], "PLAIN DOWN"];};
if (_inCombat) then
	{cutText [format[localize "Ultima_No_Action_In_Battle"], "PLAIN DOWN"];}
else
	{
		player removeAction s_player_selfBloodbag;
		player playActionNow "Medic";
		r_interrupt = false;
		_animState = animationState player;
		r_doLoop = true;
		_started = false;
		_finished = false;
		while {r_doLoop} do
			{
				_animState = animationState player;
				_isMedic = ["medic",_animState] call fnc_inString;
				if (_isMedic) then
					{_started = true;};
				if(!_isMedic && !r_interrupt && (time - _bloodbagUsageTime) < _bloodbagUseTime) then
					{
						player playActionNow "Medic";
						_isMedic = true;
					};
				if (_started && !_isMedic && (time - _bloodbagUsageTime) > _bloodbagUseTime) then
					{
						r_doLoop = false;
						_finished = true;
						lastBloodbag = time;
					};
				if (r_interrupt) then
					{r_doLoop = false;};
				sleep 0.1;
			};
		r_doLoop = false;
		if (_finished) then
			{
				player removeMagazine "ItemBloodbag";
				r_player_blood = r_player_blood + _bloodAmount;
				if(r_player_blood > 12000) then
					{r_player_blood = 12000;};
				if (random(_infectionChance) < 1) then
					{
						r_player_infected = true;
						player setVariable["USEC_infected",true,true];
						cutText [format[localize "Ultima_Blood_Bag_Ingfected"], "PLAIN DOWN"];
						if(_infectedLifeBool) then
							{
								r_player_blood = r_player_blood - _infectedLifeLost;
								player setVariable["USEC_BloodQty",r_player_blood,true];
							}
						else
							{
								r_player_lowblood = false;
								10 fadeSound 1;
								"dynamicBlur" ppEffectAdjust [0]; "dynamicBlur" ppEffectCommit 5;
								"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];"colorCorrections" ppEffectCommit 5;
								r_player_lowblood = false;
								player setVariable["USEC_BloodQty",r_player_blood,true];
							};
					}
				else
					{
						r_player_lowblood = false;
						10 fadeSound 1;
						"dynamicBlur" ppEffectAdjust [0]; "dynamicBlur" ppEffectCommit 5;
						"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];"colorCorrections" ppEffectCommit 5;
						r_player_lowblood = false;
						player setVariable["USEC_BloodQty",r_player_blood,true];
						cutText [format[localize "Ultima_Action_Complete"], "PLAIN DOWN"];
					};
				if(_humanityBool) then
					{[player,_humanityAmount] call player_humanityChange;};
			}
		else
			{
				r_interrupt = false;
				player switchMove "";
				player playActionNow "stop";
				cutText [format[localize "Ultima_Action_Interrupted"], "PLAIN DOWN"];
			};
	};