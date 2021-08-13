/// @description 
if place_meeting(x,y,ply)
{
	var _dir=sign(ply.vsp);
	if place_meeting(x,y,ply) 
	{
		while place_meeting(x,y,ply) ply.y-=_dir;
		ply.vsp=0;
	}
}