if instance_exists(obj)
{
	keepGoing=false
	if alphaStep!=0&&obj.image_alpha!=alphaTo
	{
		obj.image_alpha+=alphaStep;
		if obj.image_alpha==alphaTo&&alphaTo==0 instance_destroy(obj);
		else keepGoing=true;
	}
	if xscaleTo!=0&&obj.image_xscale!=xscaleTo
	{
		obj.image_xscale+=xscaleStep;
		keepGoing=true;
	}
	if yscaleTo!=0&&obj.image_yscale!=yscaleTo
	{
		obj.image_yscale+=yscaleStep;
		keepGoing=true;
	}
	
	if !keepGoing instance_destroy()
}
else instance_destroy();