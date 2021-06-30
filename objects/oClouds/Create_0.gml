event_inherited();

tileX=true;
tileY=true;
spd=1;

canDraw=true;
draw=function(_xOff,_yOff)
{
	if tileWidth==-1
	{
		tileWidth=sprite_width;
		tileHeight=sprite_height;
	}
	for (var i=0;i<1+(tileX)*ceil(room_width/tileWidth);i++)
	{
		for (var k=0;k<1+(tileY)*ceil(room_height/tileHeight);k++)
		{
			draw_sprite_ext(sprite_index,image_index,x+i*tileWidth+_xOff,y+k*tileHeight+_yOff,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
		}
	}	
}