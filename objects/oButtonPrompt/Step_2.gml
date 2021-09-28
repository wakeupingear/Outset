/// @description Position
visible=(!global.menuOpen&&!global.transitioning);
if instance_exists(ply)
{
	x=ply.x;
	y=ply.y-20;
}

if mode==0
{
	if image_alpha<1 image_alpha+=0.1;
	else if autoDestory&&global.inputs[button]>holdTime
	{
		switch button
		{
			case control.select:
				if mode==0
				{
					oInventory.contentMode=1;
				}
				break;
			default: break;
		}
		mode=-1;
	}
}
else if mode==-1
{
	image_alpha-=0.1;
	if image_alpha<=0 instance_destroy();
}