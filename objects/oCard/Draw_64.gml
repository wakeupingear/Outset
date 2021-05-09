/// @description Draw numbers
if sign(image_xscale)==1
{
	var _x=toGuiX(x);
	var _y=toGuiY(y);
	surface_set_target(global.guiSurf);
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(sprite_index,0,_x,_y,guiX(),guiY(),image_angle,image_blend,image_alpha);
	gpu_set_blendmode(bm_normal);
	draw_text_color(toGuiX(x-sprite_width/2),toGuiY(y-sprite_height/2),global.cardNames[card],textCol,textCol,textCol,textCol,1);
	surface_reset_target()
}