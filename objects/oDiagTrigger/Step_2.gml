/// @description Touch player
if (global.alive||!onlyAlive)&&!global.menuOpen&&!global.transitioning{
if place_meeting(x,y,ply)
{
	if !touch&&alarm[0]==-1
	{
		touch=true;
		alarm[0]=delay;
	}
}
else touch=false;
}