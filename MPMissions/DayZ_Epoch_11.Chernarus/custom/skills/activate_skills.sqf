waituntil {!alive player ; !isnull (finddisplay 46)};
sleep 5;
player addaction[("<t color=""#0074E8"">" + (localize "Ultima_Skills") + "</t>"), "custom\skills\init_skills.sqf", "", 5, false, true, "", ""];
