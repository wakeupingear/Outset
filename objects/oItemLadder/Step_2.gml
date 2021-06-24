/// @description 
if !global.menuOpen&&!global.transitioning&&distance_to_object(ply)<64&&(ply.state==moveState.standing||ply.state==moveState.running)
{
	if !place_meeting(x,y,ply)&&place_meeting(x-image_xscale*12,y,ply)
	{
		global.interactText=check;
		if buttonPressed(control.up)||buttonPressed(control.confirm)
		{
			addItem("iLadder");
			instance_destroy();
		}
	}
}