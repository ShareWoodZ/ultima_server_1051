private["_itemNew","_onLadder","_skin","_body","_okSkin","_clothesTaken","_itemNewName","_result"];
_body = _this select 3;
_onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
if (_onLadder) exitWith {cutText [(localize "Ultima_No_Action_On_Stairs") , "PLAIN DOWN"]};
if (vehicle player != player) exitWith {cutText [localize "Ultima_No_Action_In_Vehicles", "PLAIN DOWN"]};
player removeAction s_player_clothes;
s_player_clothes = -1;
_skin = (typeOf _body);
_itemNew = _skin;
switch (_itemNew) do
	{
		case "Survivor3_DZ":
			{_itemNew = "Survivor2_DZ";};
		case "Bandit1_DZ":
			{_itemNew = "Survivor2_DZ";};
	};
_itemNew = "Skin_" + _itemNew;
_okSkin = isClass (configFile >> "CfgMagazines" >> _itemNew);
if(_okSkin) then
	{
		player playActionNow "Medic";
		sleep 3;
		_clothesTaken = _body getVariable["clothesTaken",false];
		if(!_clothesTaken) then
			{
				_itemNewName = getText (configFile >> "CfgMagazines" >> _itemNew >> "displayName");
				_result = [player,_itemNew] call BIS_fnc_invAdd;
				if (_result) then
					{
						_body setVariable["clothesTaken",true,true];
						cutText [localize "Ultima_Action_Complete", "PLAIN DOWN"];
					}
				else
					{cutText [localize "Ultima_No_Space_In_Inventory", "PLAIN DOWN"];};
			}
		else
			{cutText ["Одежду уже сняли с тела!", "PLAIN DOWN"];};
	}
else
	{cutText [localize "Ultima_Body_Empty", "PLAIN DOWN"];};