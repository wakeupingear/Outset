/// @description Draw
if riding 
{
	var _ang=100+image_angle;
	var _dist=16;
	var _x=lengthdir_x(_dist,_ang);
	var _y=lengthdir_y(_dist,_ang);
	draw_sprite_ext(sprite_index,4,x+_x,y+_y,image_xscale,image_yscale,0,image_blend,image_alpha);
}
draw_sprite_ext(sprite_index,1,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
for (var i=0;i<array_length(wheels);i++) with wheels[i] draw_self();
draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);