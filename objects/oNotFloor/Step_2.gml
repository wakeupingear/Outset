/// @description 
if place_meeting(x,y,ply)
{
	var _dir=sign(ply.vsp);
	while place_meeting(x,y,ply) ply.y-=_dir;
}