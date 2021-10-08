image_speed=0;
alarm[0]=60;
if sprite_index==sPlaceholderPixelB image_alpha=0.6;

objects=ds_list_create();
pause=-1;
partProperties={
	fade:0.05*image_alpha,
	blend: image_blend,
	alpha: image_alpha,
	alwaysMove: true
};

xDir=0;
yDir=0;

drawLight=function(){
	if sprite_index==sPlaceholderPixelB{
	var _cX=x-camX();
	var _cY=y-camY();
	draw_circle(_cX,_cY,8,false);
	draw_circle(_cX+image_xscale,_cY,8,false);
	draw_circle(_cX,_cY+image_yscale,8,false);
	draw_circle(_cX+image_xscale,_cY+image_yscale,8,false);
	draw_rectangle(_cX,_cY-8,_cX+image_xscale,_cY+image_yscale+8,false);
	draw_rectangle(_cX-8,_cY,_cX+image_xscale+8,_cY+image_yscale,false);
	}
}