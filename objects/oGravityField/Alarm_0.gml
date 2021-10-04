/// @description Particle
if !visible exit;
if sprite_get_width(sprite_index)+sprite_get_height(sprite_index)==2
{
	particle(x,y,depth+1,sprite_index,image_index,{
		xscale:image_xscale,
		yscale:image_yscale,
		xscaleSpd: 1,
		yscaleSpd: 1,
		hsp: -0.5,
		vsp: -0.5,
		alpha:1.3,
		fade:0.05,
		blend: image_blend,
		alpha: image_alpha
	});
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
		fade:0.05,
		blend: image_blend,
		alpha: image_alpha
	});
}
alarm[0]=60;
