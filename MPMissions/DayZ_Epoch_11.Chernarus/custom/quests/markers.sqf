Private ["_quest_markers", "_mission", "_pos_array", "_color", "_shape", "_size", "_marker", "_pos"];
_quest_markers	=	[];
while {true} do
	{
		_show_markers	=	true;
		{
			if ( !(_x in (magazines player)) && !(_x in (weapons player)) ) exitWith
				{
					{deleteMarkerLocal _x;} forEach _quest_markers;
					_quest_markers	=	[];
					_show_markers	=	false;
				};
		} forEach Ultima_Quest_Need_Show_Markers;	
		if (_show_markers) then
			{
				{
					_mission	=	(_x select 0);
					_pos_array	=	(_x select 5);
					_color		=	(_x select 6);	
					_shape		=	(_x select 7);
					_size		=	(_x select 8);
					{
						_pos	=	(_x select 0);
						_marker = createMarkerLocal [("_marker" + (str ((count _quest_markers) + 1))), _pos];
						_quest_markers set [(count _quest_markers), _marker];
						_marker setMarkerShape _shape;
						_marker setMarkerColor _color;
						_marker setMarkerBrush "Grid";
						_marker setMarkerSize [_size, _size];
						if (Ultima_Quest_Show_Markers_Text) then
							{
								_marker = createMarkerLocal [("_marker" + (str ((count _quest_markers) + 1))), _pos];
								_quest_markers set [(count _quest_markers), _marker];
								_marker setMarkerColor "ColorBlack";
								_marker setMarkerType "Vehicle";
								_marker setMarkerText _mission;
							};
					} forEach _pos_array;
				} forEach Ultima_Quest_Array;
			};
		sleep 2;
	};