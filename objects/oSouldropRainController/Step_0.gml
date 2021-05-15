for (var i=0;i<array_length(count);i++)
{
	count[i]++;
	if count[i] mod tiers[i].rate==0 
	{
		var _sc=clamp(tiers[i].sc+random_range(-0.1,0.1),0,1);
		var _s=instance_create_depth(camX()+irandom_range(-300,300),camY()-40,depth+tiers[i].d,oSouldropRain);
		with _s
		{
			xLerp=_sc;
			yLerp=_sc;
			image_blend=merge_color(image_blend,c_white,(_sc)*_sc*_sc);
			image_xscale=1-_sc;
			image_yscale=image_xscale;
			//image_alpha=image_xscale
			xOff=round(x-xLerp*camX());
			yOff=round(y-yLerp*camY());
			event_user(0);
		}
		count[i]=0;
	}
}