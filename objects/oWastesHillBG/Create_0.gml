event_inherited();

draw=function(_x,_y){
	draw_sprite_ext(sprite_index,0,_x,_y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	for (var i=1;i<5;i++)
	{
		draw_sprite_ext(sprite_index,1,_x,_y+i*sprite_height,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}
}

tileX=true;