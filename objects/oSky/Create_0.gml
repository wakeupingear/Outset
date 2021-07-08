event_inherited();

xLerp=1;
yLerp=1;

draw=function(_x,_y){
	draw_sprite_ext(sprite_index,global.timeOfDay,_x,_y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}