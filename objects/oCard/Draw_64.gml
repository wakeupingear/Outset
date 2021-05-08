/// @description Draw numbers
if sign(image_xscale)==1
{
	var _x=toGuiX(x);
	var _y=toGuiY(y);
	surface_set_target(global.guiSurf);
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(sprite_index,image_index,_x,_y,image_xscale*global.guiScale,image_yscale*global.guiScale,image_angle,image_blend,image_alpha);
	gpu_set_blendmode(bm_normal);
	draw_text(toGuiX(x-sprite_width/2),toGuiY(y-sprite_height/2),global.cardNames[image_index]);
	surface_reset_target()
}