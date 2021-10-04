/// @description Button press
if !instance_exists(parent) image_index=0;
else if mode==0
{
	image_index=1;
	if place_meeting(x,y,ply)
	{
		if !touch
		{
			touch=true;
			shake(1,1,10);
			image_index=0;
			playerButtonFeedback(ply);
			mode=1;
			parent.button=id;
			parent.alarm[0]=100;
			pressEvent();
		}
	}
	else touch=false;
}
else if !place_meeting(x,y,ply) touch=false;