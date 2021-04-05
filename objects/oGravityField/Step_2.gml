//Move objects
if place_meeting(x,y,oPhysicsObj)
{
	if xDir==0 xDir="hsp"
	if yDir==0 yDir="vsp"
	var _size= instance_place_list(x,y,oPhysicsObj,objects,false);
	for (var i=0;i<_size;i++)
	{
		impulse(xDir,yDir,objects[|i]);
	}
	ds_list_clear(objects);
}