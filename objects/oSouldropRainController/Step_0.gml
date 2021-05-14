count++;
if count mod tiers[pos].rate==0 
{
	var _sc=tiers[pos].sc;
	var _s=instance_create_depth(camX()-irandom_range(60,270),camY()-90-irandom(30),depth+tiers[pos].d,oSouldropRain);
	_s.xLerp=_sc;
	_s.yLerp=_sc;
	_s.image_alpha=1-_sc;
	_s.image_xscale=sqrt(_sc);
	_s.image_yscale=_s.image_xscale;
}
if count>=tiers[pos].num
{
	pos=(pos+1) mod array_length(tiers);
	count=0;
}