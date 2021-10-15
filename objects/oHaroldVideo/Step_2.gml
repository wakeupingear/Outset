/// @description Animate
x=camX()+192;
y=camY()+108;

if mode==0
{
	image_xscale+=0.1;
	image_yscale+=0.1;
	if image_xscale==1
	{
		mode=0.6;
		alarm[0]=30;
	}
}
else if mode==1
{
	count++;
	if count>=frames[image_index-1]
	{
		image_index++;
		count=0;
		if image_index>=array_length(frames)
		{
			mode=1.6;
			alarm[0]=30;
		}
	}
}
else if mode==2
{
	if instance_exists(oHaroldVideoSnooze)&&oHaroldVideoSnooze.alarm[1]==-1
	{
		oHaroldVideoSnooze.alarm[1]=1;
	}
	image_xscale-=0.1;
	image_yscale-=0.1;
	if image_xscale==0
	{
		oPopup.exiting=true;
		instance_destroy();
	}
}