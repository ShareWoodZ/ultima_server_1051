ultima_show_friends_var	=	true;
waituntil {!isnull (finddisplay 46)};
systemChat ("<Ultima>: Отключение имен друзей: Shift+1");
Ultima_Show_Friends	=	
	{
		if ( (_this select 1 == 2) && (_this select 2) ) then // shift+1
			{
				ultima_show_friends_var = !ultima_show_friends_var;
				if (ultima_show_friends_var) then
					{systemChat ("<Ultima>: Отображение имен друзей включено!");}
				else
					{systemChat ("<Ultima>: Отображение имен друзей отключено!");}
			};
	};
(findDisplay 46) displayAddEventHandler["KeyUp","_this call Ultima_Show_Friends"];
sleep 1;
1 cutrsc ["NameTag","PLAIN"];