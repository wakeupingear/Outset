

function draw_sprite_repeated(_x,_y,sprite,index,xscale,yscale,angle,blend,alpha,xSep,ySep){
	var _yStart=_y;
	while _x<room_width
	{
		while _y<room_height
		{
			draw_sprite_ext(sprite,index,_x,_y,xscale,yscale,angle,blend,alpha);
			_y+=yscale*sprite_get_height(sprite)+ySep;
		}
		_y=_yStart;
		_x+=xscale*sprite_get_width(sprite)+xSep;
	}
}