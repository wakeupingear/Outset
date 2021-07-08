event_inherited();

time=0;
draw=function(_x,_y){
	draw_sprite_ext(sprite_index,global.timeOfDay,_x,_y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	if global.timeOfDay==times.night
	{
		var _width=42;
		var _num=5;
		if global.alive time=(time+0.005) mod 1;
		for (var i=-_num;i<_num+1;i++)
		{
			var _xPos=_width*i+(time*_width);
			draw_sprite(sStarfield,0,camX()+192+_xPos,camY()-130+sqr(_xPos)/200);
		}
	}
}