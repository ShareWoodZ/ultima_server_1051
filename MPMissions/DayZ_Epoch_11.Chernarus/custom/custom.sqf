if !(isServer) then
	{
		[] execVM "custom\trade_terminal\init.sqf";			//	�������� ��������
		[] execVM "custom\infistar_safezone.sqf";			//	������ �������� ��� �� ��������� � ��������� 
		[] execVM "custom\skills\activate_skills.sqf";		//	����� ����������
		[] execVM "custom\service\init.sqf";				//	��������, ������, ���������� ������������ ������� �� ��������������
		[] execVM "custom\show_friends\ficoninit.sqf";		//	������ ������
		[] execVM "custom\watermark\watermark.sqf";			//	������� ����
		[] execVM "custom\welcom_message.sqf";				//	�����������
		[] execVM "custom\ultima_debug\init.sqf";			//	�������������� ������� ������
		[] execVM "custom\vehicle_ammo.sqf";				//	���������� ����������� ��� �������, ����� ���������
		[] execVM "custom\craft\init.sqf";					//	������������� ������
		[] execVM "custom\drink_water\action.sqf";			//	���� ���� �� �������� � ��������
		[] execVM "custom\anti_spawn.sqf";					//	���������
		[] execVM "custom\base_protect.sqf";				//	������ ���
		[] execVM "custom\donators\init.sqf";				//	������ ���������
		[] execVM "custom\quests\init.sqf";					//	�������
		[] execVM "custom\chat_kick.sqf";					//	��� �� ������������� ���������� ����
		[] execVM "custom\markers.sqf";						//	�������
		[] execVM "custom\marker_name.sqf";					//	����������� ����� ������, ������� �������� ������ �� �����(�������� � �������)
		[] execVM "custom\antidupe\inventory_delay.sqf";	//	������� ��� �������� ���� ���������.
		[] execVM "custom\trade_gold_action.sqf";			//	����� ������� ���������� �� �����.
		[] execVM "custom\ban_chat.sqf";					//	��� ����.
	};
