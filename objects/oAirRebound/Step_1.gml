/// @description Move
if global.transitioning exit;
if mode==1 //bounce back
{
	ply.reverse=true;
	while place_meeting(x,y,ply) ply.y--;
	mode=0;
}
else if !global.menuOpen
{
	if place_meeting(x,y,ply)
	{
		ply.state=moveState.floating;
		if !hasData("respAir") conversation(key);
		else mode=1;
	}
}