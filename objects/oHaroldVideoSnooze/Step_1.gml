/// @description Interactions
if image_index<2
{
	image_index=place_meeting(x,y,oCursor);
	if image_index&&(buttonPressed(control.confirm)||buttonPressed(control.grapple))
	{
		image_index=2;
		shake(1,1,10);
		alarm[1]=1;
		alarm[2]=1;
		oHaroldVideo.mode=1.5;
	}
}