/// @description Add hsp
if global.alive{
image_speed=spd;
for (var i=0;i<ds_list_size(objs);i++)
{
	var _i=objs[|i];
	if (_i.object_index!=ply||oGrapple.state!=2)&&_i.object_index!=oGrapple&&!place_meeting(x,y-2,_i)//||buttonPressed(control.jump)
	{
		_i.hsp+=image_speed;
	}
}

moveObjects(-1,0);
moveObjects(1,0);
moveObjects(0,1);
moveObjects(0,-1);
}
else image_speed=0;