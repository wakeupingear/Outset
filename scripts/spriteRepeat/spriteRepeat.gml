

/*function draw_sprite_repeated(_x,_y,sprite,index,xscale,yscale,angle,blend,alpha,xSep,ySep){
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
}*/

function draw_sprite_repeated(_x,_y,sprite,index,xscale,yscale,angle,blend,alpha,xSep,ySep){
	var _w=xscale*sprite_get_width(sprite)+xSep;
	var _h=yscale*sprite_get_height(sprite)+ySep;
	while _x+_w<camX() _x+=_w;
	while _y+_h*2<camY() _y+=_h;
	var _yStart=_y;
	while _x<camX()+384+_w
	{
		while _y<camY()+216+_h
		{
			draw_sprite_ext(sprite,index,_x,_y,xscale,yscale,angle,blend,alpha);
			_y+=_h;
		}
		_y=_yStart;
		_x+=_w;
	}
}

function draw_sprite_repeated_fullroom(_x,_y,sprite,index,xscale,yscale,angle,blend,alpha,xSep,ySep){
	var _w=xscale*sprite_get_width(sprite)+xSep;
	var _h=yscale*sprite_get_height(sprite)+ySep;
	var _yStart=_y;
	while _x<room_width
	{
		while _y<room_height
		{
			draw_sprite_ext(sprite,index,_x,_y,xscale,yscale,angle,blend,alpha);
			_y+=_h;
		}
		_y=_yStart;
		_x+=_w;
	}
}

function draw_sprite_repeated_offset(_x,_y,sprite,index,xscale,yscale,angle,blend,alpha,xSep,ySep,xOff,yOff){
	var _yStart=_y;
	var _w=xscale*sprite_get_width(sprite)+xSep;
	var _h=yscale*sprite_get_height(sprite)+ySep;
	var _xShift=0;
	var _yShift=0;
	while _x<room_width
	{
		while _y<room_height
		{
			draw_sprite_ext(sprite,index,_x+_xShift,_y+_yShift,xscale,yscale,angle,blend,alpha);
			_y+=_h;
			_xShift=(_xShift-xOff)%_w;
		}
		_y=_yStart;
		_x+=_w;
		_yShift=(_yShift-yOff)%_h;
	}
}