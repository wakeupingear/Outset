event_inherited();
image_speed=0;
image_index=hasData("vrChase");

time=0;
draw=function(_x,_y){
	draw_sprite_ext(sprite_index,image_index,_x,_y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}