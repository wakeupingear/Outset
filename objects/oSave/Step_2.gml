/// @description Save
if alarm[0]==-1&&!touch&&place_meeting(x,y,ply)
{
	touch=true;
	shake(1,1,10);
	rumbleStart(rumbleType.heavyPulse);
	alarm[0]=40;
	if global.alive
	{
		global.plyX=x;
		global.plyY=y;
		global.nextRoom=room;
		global.startXscale=xscale;
		global.plyHealth=global.maxHealth;
	}
	else
	{
		respawn(x,y);
	}
	if !isDev save(global.lastFile);
}
else if touch&&!place_meeting(x,y,ply) touch=false;