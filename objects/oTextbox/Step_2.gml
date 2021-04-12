/// @description Animation
//if global.alive
{
	if boxHidden
	{
		if image_alpha>0 image_alpha-=0.1;
	}
	else if mode<0
	{
		if mode==-1
		{
			if instance_number(oTextbox)==1 global.menuOpen=false;
			mode=-2;
		}
		image_alpha-=0.1;
		if image_alpha<=0 instance_destroy();
	}
	else
	{
		if wait&&image_alpha>0 image_alpha-=0.1;
		else if !wait&&image_alpha<1&&sentence!="" image_alpha+=0.1;
	}
}