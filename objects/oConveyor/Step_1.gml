/// @description Add hsp
for (var i=0;i<ds_list_size(objs);i++)
{
	var _i=objs[|i];
	if !place_meeting(x,y-1,_i)
	{
		_i.hsp+=image_speed;
		//show_message("Ff")
	}
}

moveObjects(-1,0);
moveObjects(1,0);
moveObjects(0,1);
moveObjects(0,-1);