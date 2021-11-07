/// @description Particle
if !visible exit;
alarm[0]=60;
if !isInRange(x,y) exit;
if sprite_get_width(sprite_index)+sprite_get_height(sprite_index)==2
{
	rectangleOutwardParticle(x,y,depth+1,sPlaceholderPixelB,0,1,partProperties);
}
else
{
	var _xsSpd=0.05*sqrt(abs(image_xscale))*sign(image_xscale);
	var _ysSpd=0.05*sqrt(abs(image_yscale))*sign(image_yscale);

	particle(x,y,depth+1,sprite_index,image_index,{
		xscale:image_xscale,
		yscale:image_yscale,
		xscaleSpd: _xsSpd,
		yscaleSpd: _ysSpd,
		alpha:1.5,
		fade:0.05*image_alpha,
		blend: image_blend,
		alpha: image_alpha
	});
}
