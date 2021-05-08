/// @description Move + animation
if moving
{
	x+=(target_x-x)/10;
	y+=(target_y-y)/10;
	if abs(x-target_x)<3&&abs(y-target_y)<3
	{
		x=target_x;
		y=target_y;
		moving=false;
	}
}
else if mode>0
{
	x=mouse_x+mouseXOff;
	y=mouse_y+mouseYOff;
	if mode==1
	{
		
	}
	if !buttonHold(control.confirm)&&mode==1
	{
		
	}
}
else if mode==0
{
	if buttonPressed(control.confirm)&&place_meeting(x,y,oMouse)
	{
		if !inDeck||sign(image_xscale==1)
		{
			mode=1;
			for (var i=child;i!=-1;i=i.child) child.mode=2;
		}
		else
		{
			if sign(image_xscale)==1
			{
				moving=true;
				if child!=-1
				{
					child.moving=true;
					if child.child!=-1 child.child.moving=true;
				}
			}
		}
	}
}