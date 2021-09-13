/// @description Bounce player
if alarm[0]==-1
{
	if image_index==2 mask_index=sGreemerBounce2
	if place_meeting(x,y,oPhysicsObj)
	{
		var _p=instance_place(x,y,oPhysicsObj);
		if _p.object_index==oWastesCarWheel 
		{
			shake(1,1,10);
			_p=oWastesCarWheel;
		}
		else if isPlayer(_p)
		{
			if ply.image_blend==c_red exit;
			shake(1,1,10);
		}
		ind=1;
		alarm[0]=7;
		alarm[1]=-1;
		if instance_exists(parent) parent.attacking=false;
		if image_index==0
		{
			impulse(max(3,abs(_p.hsp))*-image_xscale,-4,_p);
		}
		else
		{
			impulse(0,-7,_p);
		}
	}
	mask_index=sGreemerBounce;
}