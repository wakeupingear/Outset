/// @description Move
if initialPress
{
	if !buttonHold(control.confirm) initialPress=false;
}
else image_index=(buttonHold(control.confirm));
if (x!=-100&&mouseXPrevious!=mouse_x)||mouseYPrevious!=mouse_y
{
	x=mouse_x;
	y=mouse_y;
	justMoved=true;
}
else
{
	justMoved=false;
	//var _xDir=buttonHold(control.right)-buttonHold(control.left);
	//var _yDir=buttonHold(control.down)-buttonHold(control.up);
	if global.controllerConnected
	{
		var hraxis = gamepad_axis_value(global.controllerSlot, gp_axisrh);
		var vraxis = gamepad_axis_value(global.controllerSlot, gp_axisrv);
		if keyMove
		{
			if hraxis!=0||vraxis!=0
			{
				var _ang = point_direction(0, 0, hraxis,vraxis);
				show_debug_message(_ang)
				x+=lengthdir_x(2,_ang);
				y+=lengthdir_y(2,_ang);
			}
		}
		else
		{
			if hraxis!=0||vraxis!=0 x=-100;
		}
	}
	//else x=-100;
}
if x!=-100 x=clamp(x,camX(),camX()+384);
y=clamp(y,camY(),camY()+216);
mouseXPrevious=mouse_x;
mouseYPrevious=mouse_y;