event_inherited();

time=0;
draw=function(_x,_y){
	if global.alive time=(time+0.001)mod 1;
	shader_set(shd_water);
	shader_set_uniform_f(shader_get_uniform(shd_water,"u_time"),time);
	shader_set_uniform_f(shader_get_uniform(shd_water,"u_yoff"),0);
	draw_sprite(sprite_index,global.timeOfDay,_x,_y);
	shader_reset();
}