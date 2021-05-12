/// @description Touch player
if (global.alive||!onlyAlive)&&!global.menuOpen&&!global.transitioning{
if place_meeting(x,y,ply)
{
	if !touch
	{
		conversation(textLoad(key));
		if persist instance_destroy();
	}
}
else touch=false;
}