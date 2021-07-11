/// @description Bounce player
if alarm[0]==-1&&distance_to_object(ply)<24
{
	if image_index==2 mask_index=sGreemerBounce2
	if ply.image_blend!=c_red&&place_meeting(x,y,ply)
	{
		ind=1;
		alarm[0]=30;
		if instance_exists(parent) parent.attacking=false;
		if image_index==0
		{
			impulse(max(3,abs(ply.hsp))*-image_xscale,-4,ply);
		}
		else
		{
			impulse(0,-7,ply);
		}
	}
	mask_index=sGreemerBounce;
}