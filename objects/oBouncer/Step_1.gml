/// @description Bounce
if global.alive||true{
if instance_exists(ply)&&image_index==0
{
	if ply.goingFast&&place_meeting(x,y,ply)
	{
		resetGrapple();
		if abs(ply.hsp)>ply.hspMax*1.2
		{
			ply.hsp=-sign(ply.hsp)*max(abs(ply.hsp),3);
			ply.xscale=sign(ply.hsp);
			with ply
			{	
				if sign(hsp)==1&&buttonHold(control.left) buttonFreeze(control.left);
				else if sign(hsp)==-1&&buttonHold(control.right) buttonFreeze(control.right);
			}
		}
		else
		{
			ply.vsp=-sign(ply.vsp)*max(abs(ply.vsp),3);
		}
		
		image_index=1;
		alarm[0]=30;
	}
}
}
else pauseAlarms(0);