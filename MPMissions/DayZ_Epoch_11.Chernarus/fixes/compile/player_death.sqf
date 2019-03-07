private ["_wait","_array","_DeadHumanity","_KillerHumanity","_gainHum","_source","_kills","_FreeKill","_infected","_method","_body","_playerID","_id","_myGroup","_humanitylevel","_isPZombie","_killsZ"];
disableSerialization;
if (deathHandled) exitWith {};
deathHandled = true;
if ((alive player) && {isNil {dayz_playerName}}) then
	{dayz_playerName = name player;};
_DeadHumanity = player getVariable["humanity",0];	
//Prevent client freezes
_display = findDisplay 49;
if(!isNull _display) then {_display closeDisplay 0;};
if (dialog) then {closeDialog 0;};
if (visibleMap) then {openMap false;};
_body		=	player;
_playerID	=	getPlayerUID player;
disableUserInput true;
_infected	=	0;
if (r_player_infected && DZE_PlayerZed) then
	{_infected	= 1;};
//	Устанавливаем трупу наличку	
_cash	=	player getVariable ["Ultima_Cash", 0];
_body setVariable ["Ultima_Cash_Body",_cash,true];
PVDZE_plr_Died = [dayz_characterID,0,_body,_playerID,_infected, dayz_playerName];
publicVariableServer "PVDZE_plr_Died";
_id	=	[player,20,true,getPosATL player] call player_alertZombies;
sleep 0.5;
player setDamage 1;
0.1 fadeSound 0;
player setVariable ["NORRN_unconscious", false, true];
player setVariable ["unconsciousTime", 0, true];
player setVariable ["USEC_isCardiac",false,true];
player setVariable ["medForceUpdate",true,true];
player setVariable ["startcombattimer", 0];
r_player_unconscious = false;
r_player_cardiac = false;
_wait		=	0;
_array	=	_this;
if (count _array > 0) then 
	{
		_source	=	_array select 0;
		_method	=	_array select 1;
		if (!(isNull _source) and (_source != player)) then
			{
				_FreeKill		=	player getVariable ["freeTarget",false];	//Кто начал стрелять первым
				_KillerHumanity	=	_source getVariable["humanity",0];			//Карма убийцы
				if (_DeadHumanity < 0) then
					{
						_kills	=	_source getVariable ["banditKills",0];
						_source setVariable ["banditKills",(_kills + 1),true];
					}
				else
					{
						if !(_FreeKill) then
							{
								_kills	=	_source getVariable ["humanKills",0];
								_source setVariable ["humanKills",(_kills + 1),true];
							};
					};
				_gainHum	=	0;//Обнулим прирост кармы для дальнейшей работы					
				if ((_KillerHumanity < 0) and ((_DeadHumanity > 200) or (_DeadHumanity < -200))) then //Если убийца бандит и у жертвы было больше 200 кармы(-+)
					{_gainHum	=	-200;};
				if ((_KillerHumanity >= 0) and (_DeadHumanity < -200)) then //Если убийца герой, и он убил бандита и у бандита было больше 200 кармы(-+)
					{_gainHum	=	200;};
				if ((_KillerHumanity >= 0) and (_DeadHumanity >= 0) and (!_FreeKill)) then //Если убийца герой, и он убил выжившего стреляя первым
					{_gainHum	=	-200;};
				if (_gainHum != 0) then
					{
						PVDZE_send	=	[_source,"Humanity",[_source,(_gainHum),_wait]];
						publicVariableServer "PVDZE_send";
					}
				else
					{
						if (_KillerHumanity < 0) then
							{_gainHum = -25}
						else
							{_gainHum = 25};
						PVDZE_send	=	[_source,"Humanity",[_source,(_gainHum),_wait]];
						publicVariableServer "PVDZE_send";					
					};
			};
		_body setVariable ["deathType",_method,true];
	};
terminate dayz_musicH;
terminate dayz_slowCheck;
terminate dayz_animalCheck;
terminate dayz_monitor1;
terminate dayz_medicalH;
terminate dayz_gui;
r_player_dead	=	true;
"dynamicBlur" ppEffectEnable true;"dynamicBlur" ppEffectAdjust [4]; "dynamicBlur" ppEffectCommit 0.2;
"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 0.01],  [1, 1, 1, 0.0]];
"colorCorrections" ppEffectCommit 1;
3 fadeSound 0;
sleep 1;
dayz_originalPlayer enableSimulation true;
addSwitchableUnit dayz_originalPlayer;
setPlayable dayz_originalPlayer;
selectPlayer dayz_originalPlayer;
3 cutRsc ["default", "PLAIN",3];
4 cutRsc ["default", "PLAIN",3];
_body setVariable["combattimeout", 0, true];
sleep 2;
1 cutRsc ["DeathScreen","BLACK OUT",3];
playMusic "dayz_track_death_1";
"dynamicBlur" ppEffectAdjust [0]; "dynamicBlur" ppEffectCommit 5;
"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];"colorCorrections" ppEffectCommit 5;
sleep 2;
for  "_x" from 5 to 1 step -1 do {
	titleText [format[localize "str_return_lobby", _x], "PLAIN DOWN", 1];
	sleep 1;
};
PVDZE_Server_Simulation = [_body, false];
publicVariableServer "PVDZE_Server_Simulation";
endMission "END1";