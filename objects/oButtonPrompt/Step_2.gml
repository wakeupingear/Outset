/// @description Position
if instance_exists(ply)
{
	x=ply.x;
	y=ply.y-20;
}

if autoDestory&&global.inputs[button]>holdTime
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
	instance_destroy();
}