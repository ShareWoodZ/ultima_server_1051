private ["_aItem","_i","_work","_LastTime","_usageTime","_workTime","_radius","_usedParts","_part","_magazines","_mypos", "_dir", "_createShield", "_sounddist", "_shield", "_shieldUp", "_timer", "_zombies", "_count", "_zombie", "_soundList"];

//if !(((getPlayerUID player) in Ultima_Donators) or ((getPlayerUID player) in Ultima_Admins)) then
//	{cutText [localize "Ultima_Skill_Need_Professional", "PLAIN DOWN"];};
	
if (isNil "zmShieldTime") then
	{zmShieldTime	=	0;};	

_usageTime		=	120;	//	Время повторного использования скила
_workTime		=	360;	//	Время действия скила
_radius			=	20;		//	Радиус действия скила
_sounddist		=	50;		//	Дистанция звука
_usedParts		=
	[
		["TrashTinCan",1]
		,["ItemJerrycan",1]
		,["ItemZombieParts",4]
	];
					
_LastTime = time - zmShieldTime; //Сколько времени прошло с прошлого использования скила

if (_LastTime < _usageTime) exitWith 
	{cutText [format[localize "Ultima_Reuse",(_LastTime - _usageTime)], "PLAIN DOWN"];};

_work	=	true;
_magazines = magazines player;

for "_i" from 0 to (count(_usedParts) -1) do 
	{
		_aItem			=	_usedParts select _i;
		_part			=	_aItem select 0;
		_count			=	_aItem select 1;
		_count_parts	= {_x == _part} count _magazines;	
		if (_count_parts < _count) exitWith 
			{
				_work	=	false;
				titleText [format[localize "Ultima_Skill_Need_Count_Part", _count, _part],"PLAIN DOWN"]; titleFadeOut 8;
			};
	};
	
_objects	=	(getPosATL player) nearObjects ["Generator_DZ",5];
if ( count(_objects) < 1) exitWith
	{
		_work	=	false;
		titleText [format [localize "Ultima_Skill_Need_Part", "Generator"],"PLAIN DOWN"]; titleFadeOut 8;
	};	

if (!_work) exitWith {};

{
	_part	=	(_x select 0);
	_count	=	(_x select 1);
	for "_i" from 1 to _count do
		{player removeMagazine _part;};
} forEach _usedParts;

player playActionNow "Medic";
sleep 1;
titleText [localize "Ultima_Action_Complete", "PLAIN DOWN"]; titleFadeOut 5;
 
_mypos			=	getposATL player;
_dir			=	getdir player;
_mypos			=	[(_mypos select 0) + 2 * sin(_dir),(_mypos select 1) + 2 * cos(_dir), (_mypos select 2)];
_createShield	= createVehicle ["SkeetMachine", _mypos, [], 0, "CAN_COLLIDE"];
_createShield setDir _dir;
_createShield setposATL _mypos;
sleep 1;
 
titleText [localize "Ultima_Skill_Device_Activated", "PLAIN DOWN"]; titleFadeOut 5;
zmShieldTime	=	time;
_workTime		=	round(_workTime / 10);
while {_workTime > 0} do 
	{
		_shield	=	nearestObject [player, "SkeetMachine"];
		[nil,_shield,rSAY,["engine_12s", _sounddist]] call RE;
		_shieldUp	=	(alive _shield);
		_timer		=	time;
		while {_shieldUp} do 
			{
				_zombies	=	(getPosATL _shield) nearEntities ["zZombie_Base",_radius];
				_count		=	count _zombies;
				for "_i" from 0 to (_count -1) do 
					{
						_zombie	=	_zombies select _i;
						_zombie setdamage 1;
						if (alive player) then
							{
								Terminal_Server	=	[player, "reward", 1];
								publicVariableServer "Terminal_Server";
							};
						sleep 0.1;
					};
				if ((time - _timer) > 10) exitwith {};
			};
		_soundList	=	["PMC_ElectricBlast1","PMC_ElectricBlast2"] call BIS_fnc_selectRandom;
		[nil,_shield,rSAY,[_soundList, _sounddist]] call RE;
		_workTime	=	_workTime - 1;
	};
 
sleep 1;
deleteVehicle _createShield;
titleText [localize "Ultima_Skill_Device_Deactivated","PLAIN DOWN"]; titleFadeOut 5;