if !(isServer) then
	{
		[] execVM "custom\trade_terminal\init.sqf";			//	Торговый терминал
		[] execVM "custom\infistar_safezone.sqf";			//	Защита торговых зон от выстрелов и воровства 
		[] execVM "custom\skills\activate_skills.sqf";		//	Скилы персонажей
		[] execVM "custom\service\init.sqf";				//	Заправка, ремонт, пополнение боекомплекта техники на бензозаправках
		[] execVM "custom\show_friends\ficoninit.sqf";		//	Иконки друзей
		[] execVM "custom\watermark\watermark.sqf";			//	Водяной знак
		[] execVM "custom\welcom_message.sqf";				//	Приветствие
		[] execVM "custom\ultima_debug\init.sqf";			//	Альтернативный монитор игрока
		[] execVM "custom\vehicle_ammo.sqf";				//	Сохранение боеприпасов для техники, после рестартов
		[] execVM "custom\craft\init.sqf";					//	Инициализация крафта
		[] execVM "custom\drink_water\action.sqf";			//	Пите воды из водоемов и колодцев
		[] execVM "custom\anti_spawn.sqf";					//	АнтиСпавн
		[] execVM "custom\base_protect.sqf";				//	Защиты баз
		[] execVM "custom\donators\init.sqf";				//	Услуги донаторов
		[] execVM "custom\quests\init.sqf";					//	Задания
		[] execVM "custom\chat_kick.sqf";					//	Кик за использование голосового чата
		[] execVM "custom\markers.sqf";						//	Маркеры
		[] execVM "custom\marker_name.sqf";					//	Отображение имени игрока, который поставил маркер на карте(приписка к маркеру)
		[] execVM "custom\antidupe\inventory_delay.sqf";	//	АнтиДюп при открытии окна инвентаря.
		[] execVM "custom\trade_gold_action.sqf";			//	Обмен золотых самородков на баксы.
		[] execVM "custom\ban_chat.sqf";					//	Бан чата.
	};
