if yOff<0 yOff+=0.5;
for (var i=0;i<array_length(count);i++)
{
	count[i]++;
	if count[i] mod tiers[i].rate==0 
	{
		var _sc=clamp(tiers[i].sc+random_range(-0.1,0.1),0.1,1);
		var _s=instance_create_depth(oCamera.x+irandom_range(-200,200),camY()-40,max(depth+tiers[i].d,controller.depth+100),oSouldropRain);
		with _s
		{
			xLerp=_sc;
			yLerp=xLerp;
			image_blend=merge_color(image_blend,c_white,(_sc)*_sc*_sc);
			image_xscale=1-_sc;
			image_yscale=image_xscale;
			xOff=round(x-xLerp*camX());
			yOff=round(y-yLerp*camY());
			image_angle=270+(x-oCamera.x)/4;
			spd=new Vec2(lengthdir_x(0.5/(1.1-image_xscale),image_angle),lengthdir_y(0.5/(1.1-image_xscale),image_angle));
			event_user(0);
			depth-=image_xscale*10;
		}
		count[i]=0;
	}
}