/// @description Touch objects
if image_index==0
{
	if place_meeting(x,y,oPhysicsObj)
	{
		var _o=instance_place(x,y,oPhysicsObj);
		_o.vsp=min(bounceVsp,_o.vsp);
		image_index=1;
		alarm[0]=resetTime;
	}
}