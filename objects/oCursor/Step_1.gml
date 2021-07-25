/// @description Move
if initialPress
{
	if !buttonHold(control.confirm) initialPress=false;
}
else image_index=(buttonHold(control.confirm));
if mouseXPrevious!=mouse_x||mouseYPrevious!=mouse_y
{
	x=mouse_x;
	y=mouse_y;
	justMoved=true;
}
else
{
	justMoved=false;
	if buttonHold(control.left) x-=2;
	if buttonHold(control.right) x+=2;
	if buttonHold(control.up) y-=2;
	if buttonHold(control.down) y+=2;
}
x=clamp(x,camX(),camX()+384);
y=clamp(y,camY(),camY()+216);
mouseXPrevious=mouse_x;
mouseYPrevious=mouse_y;