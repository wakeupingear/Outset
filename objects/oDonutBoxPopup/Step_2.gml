/// @description Click
if yscaleProg==0
{
	hover=instance_exists(oCursor)&&(oCursor.x-x>45&&oCursor.x-x<58);
	if hover&&buttonPressed(control.confirm)
	{
		event_perform(ev_alarm,1);
		hover=false;
		trackObj.state=1;
		trackObj.image_index=1;
	}
}