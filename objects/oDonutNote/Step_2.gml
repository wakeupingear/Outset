/// @description Click
if instance_exists(oDonutBoxPopup)&&oDonutBoxPopup.yscaleProg>0.5
{
	hover=place_meeting(x,y,oCursor);
	if hover&&buttonPressed(control.confirm)
	{
		addData("aDonut");
		oPopup.exiting=true;
		oTextbox.text=array_combine(oTextbox.text,textLoad("air_donutBoxNote"));
		instance_destroy();
	}
}