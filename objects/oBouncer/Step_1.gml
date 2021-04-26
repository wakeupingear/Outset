/// @description Bounce
if global.alive||true{
if instance_exists(ply)&&image_index==0
{
	if abs(ply.hsp)>ply.hspMax&&place_meeting(x,y,ply)
	{
		if ply.y<y-14||true
		{
			ply.hsp=-sign(ply.hsp)*max(abs(ply.hsp),3);
			ply.xscale=sign(ply.hsp);
		}
		else
		{
			ply.vsp=-sign(ply.vsp)*max(abs(ply.vsp),3);
		}
		with ply
		{	
			if sign(hsp)==1&&buttonHold(control.left) buttonFreeze(control.left);
			else if sign(hsp)==-1&&buttonHold(control.right) buttonFreeze(control.right);
		}
		
		image_index=1;
		alarm[0]=30;
	}
}
}
else pauseAlarms(0);