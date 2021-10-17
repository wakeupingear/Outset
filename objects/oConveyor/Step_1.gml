/// @description Add hsp
if global.alive{
image_speed=spd;
for (var i=0;i<ds_list_size(objs);i++)
{
	var _i=objs[|i];
	if (!isObj(_i,ply)||(!instance_exists(oGrapple)||oGrapple.state!=2))&&_i.object_index!=oGrapple&&!place_meeting(x,y-2,_i)//||buttonPressed(control.jump)
	{
		var _touch=false;
		with _i _touch=place_meeting(x,y+1,oConveyor);
		if !_touch _i.hsp+=image_speed;
	}
}
//moveObjects(0,1);
moveObjects(0,1);
moveObjects(-1,0);
moveObjects(1,0);
moveObjects(0,-1);
if !canMoveGrapple&&instance_exists(oGrapple) with oGrapple if state<2||!place_meeting(x,y,oConveyor) with oConveyor canMoveGrapple=true;
}
else image_speed=0;