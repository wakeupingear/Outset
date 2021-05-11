/// @description Add hsp
if global.alive{
for (var i=0;i<ds_list_size(objs);i++)
{
	var _i=objs[|i];
	if !place_meeting(x,y-2,_i)//||buttonPressed(control.jump)
	{
		_i.hsp+=image_speed;
	}
}

moveObjects(-1,0);
moveObjects(1,0);
moveObjects(0,1);
moveObjects(0,-1);
}