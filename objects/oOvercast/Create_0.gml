event_inherited();
image_speed=0;

alarm[0]=1;

draw=function(_x,_y){
	draw_sprite_ext(sprite_index,image_index,_x,_y+round(sin(yVars.pos)*yVars.amp),
	image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}