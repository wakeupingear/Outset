image_speed=0;

objects=ds_list_create();

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