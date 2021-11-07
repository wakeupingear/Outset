/// @description Interact
if isScanned&&!instance_exists(oSouldropRainController)
{
	if place_meeting(x,y,ply)
	{
		setInteractText(7);
		if buttonPressed(control.up)||buttonPressed(control.confirm)
		{
			var _c=instance_create_layer(0,0,"bg2",oSouldropRainController);
			_c.alarm[0]=300;
		}
	}
}