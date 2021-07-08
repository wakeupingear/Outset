/// @description Move
if on
{
	if !instance_exists(oDiscoballManager) instance_create_depth(0,0,0,oDiscoballManager);
	if global.alive
	{
		if instance_exists(oGrapple)&&oGrapple.followObj==id
		{
			var _pos=ply.x+spd;
			with ply if !groundCollision(_pos,y) 
			{
				if vsp!=0 hsp=_pos-x;
				x=_pos;
			}
		}
	}
}