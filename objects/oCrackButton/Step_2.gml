if active
{
	visible=true;
	if image_alpha<1&&
		(place_meeting(x-1,y,hitobj)||place_meeting(x+1,y,hitobj)||
		place_meeting(x,y-1,hitobj)||place_meeting(x,y+1,hitobj)) image_alpha+=0.1;
	if place_meeting(x,y,ply)
	{
		scr_toggleVRCracks();
		playerButtonFeedback(ply);
	}
}
else
{
	visible=false;
	image_alpha=0;
}