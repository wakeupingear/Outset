if distance_to_point(camX()+192,camY()+108)<384+sprite_width
{
	if place_meeting(x,y,ply)
	{
		if image_alpha>0 image_alpha-=0.1;
	}
	else
	{
		if image_alpha<1 image_alpha+=0.1;
	}
}

draw_self();