/// @description Animation
showHud=(!instance_exists(oTextbox)&&!global.transitioning);

if open{
if fade<1 fade+=0.05;
if (buttonPressed(control.select)||(mouse_check_button_pressed(mb_left)&&abs(mouse_x-192)>90))&&fade>0.1
{
	open=false;
	instance_destroy(oCursor);
}
}
else
{
	if fade>0 fade-=0.05;
	if anyButtonPressed()&&showHud
	{
		if titleAlpha==1&&textAlpha==1 
		{
			open=true;
			instance_create_depth(camX()+48,camY()+48,depth-1,oCursor);
		}
		else 
		{
			titleAlpha=1;
			textAlpha=1;
			for (var i=0;i<1;i++) alarm[i]=-1;
			oCamera.yTo=y;
			oCamera.y=y;
		}
	}
}