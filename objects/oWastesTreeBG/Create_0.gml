event_inherited();

draw=function(_x,_y){
	draw_sprite_ext(sprite_index,image_index,_x,_y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	draw_sprite_ext(sprite_index,image_index,_x,_y-20,-image_xscale,-image_yscale,image_angle,image_blend,image_alpha);
}