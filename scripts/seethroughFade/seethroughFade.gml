function seethroughFade(){
	if distance_to_point(camX()+192,camY()+108)<384+sprite_width
	{
		var _touching=false;
		var _this=id;
		with ply _touching=groundCollision(x,y,_this,false);
		if _touching
		{
			if image_alpha>0 image_alpha-=0.1;
		}
		else
		{
			if image_alpha<1 image_alpha+=0.1;
		}
	}
}