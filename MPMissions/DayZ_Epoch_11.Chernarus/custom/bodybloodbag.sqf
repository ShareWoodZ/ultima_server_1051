private["_onLadder","_body","_result","_BodyBloodBag"];
_body = _this select 3;
_onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
if (_onLadder) exitWith {cutText [localize "Ultima_No_Action_On_Stairs" , "PLAIN DOWN"]};
if (vehicle player != player) exitWith {cutText [localize "Ultima_No_Action_In_Vehicles", "PLAIN DOWN"]};
player removeAction s_player_BodyBloodBag;
s_player_BodyBloodBag = -1;
player playActionNow "Medic";
sleep 3;
_BodyBloodBag = _body getVariable["BodyBloodBag",false];
if(!_BodyBloodBag) then
	{
		_result = [player,"ItemBloodbag"] call BIS_fnc_invAdd;
		if (_result) then
			{
				_body setVariable["BodyBloodBag",true,true];
				cutText [localize "Ultima_Blood_Bag_Added", "PLAIN DOWN"];
			}
		else
			{cutText [localize "Ultima_No_Space_In_Inventory", "PLAIN DOWN"];};
	}
else
	{cutText [localize "Ultima_Body_Empty", "PLAIN DOWN"];};