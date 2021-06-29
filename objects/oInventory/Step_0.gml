/// @description Animation
var _x=camX();
x=_x+192;
var _y=camY();
y=_y+108;
if open{
if fade<1 fade+=0.1;
if (buttonPressed(control.confirm)||buttonPressed(control.select))&&fade>0.1
{
	if mode==0&&contentMode==1
	{
		if hover 
		{
			open=false;
		}
	}
	else if buttonPressed(control.select)||(buttonPressed(control.confirm)&&!place_meeting(camX()+192,camY()+108,oCursor))
	{
		open=false;
	}
}
if mode==0 //slate
{
	if contentMode==1 //menu
	{
		if doneTyping
		{
			hover=(mouse_x>x-76&&mouse_x<x+76&&mouse_y>y+52&&mouse_y<y+76);
		}
	}
}
else if mode==1 //inventory
{
	
}
}
else
{
	fade-=0.1;
	if fade<=0
	{
		global.menuOpen=false;
		instance_destroy();
	}
}