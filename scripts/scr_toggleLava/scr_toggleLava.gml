function scr_toggleLava(){
	if hasData("islandFlood") removeData("islandFlood");
	else addData("islandFlood");
	if room==rIsland
	{
		if instance_exists(oIslandTerrainHole) with oIslandTerrainHole event_perform(ev_alarm,1);
		if instance_exists(oWater) with oWater if image_xscale>1000 
		{
			if !hasData("islandFlood") x=3600;
			else x=xstart;
		}
	}
	
	if instance_exists(ply) with ply if groundCollision(x,y) scr_toggleLava();
}