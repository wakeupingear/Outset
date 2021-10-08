/// @description Particle
alarm[0]=60;
if !visible exit;
if sprite_get_width(sprite_index)+sprite_get_height(sprite_index)==2
{
	var _p=particle(x-1,y-1,depth+1,sprite_index,image_index,partProperties); //top
	_p.image_xscale=image_xscale+2;
	_p.xscaleSpd=1;
	_p.yscaleSpd= 0.5;
	_p.hsp=-0.5;
	_p.vsp=-0.5;
	
	_p=particle(x-1,y+sprite_height,depth+1,sprite_index,image_index,partProperties); //bottom
	_p.image_xscale=image_xscale+2;
	_p.xscaleSpd=1;
	_p.yscaleSpd= 0.5;
	_p.hsp=-0.5;
	
	_p=particle(x-1,y,depth+1,sprite_index,image_index,partProperties); //left
	_p.image_yscale=image_yscale;
	_p.xscaleSpd= 0.5;
	_p.hsp=-0.5;
	
	_p=particle(x+sprite_width,y,depth+1,sprite_index,image_index,partProperties); //right
	_p.image_yscale=image_yscale;
	_p.xscaleSpd= 0.5;
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
