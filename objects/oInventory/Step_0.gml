/// @description Animation
var _x=camX();
x=_x+192;
var _y=camY();
y=_y+108;

if open{
if fade<1 fade+=0.1;
if (buttonPressed(control.select)||(mouse_check_button_pressed(mb_left)&&abs(mouse_x-192)>90))&&fade>0.1
{
	open=false;
}
if mode==0 //slate
{
	
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