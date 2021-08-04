/// @description Draw
if tileWidth==-1
{
	tileWidth=sprite_get_width(sprite_index);
	tileHeight=sprite_get_height(sprite_index);
}
for (var i=0;i<1+(tileX)*(1+ceil(room_width/tileWidth));i++) //add 1 when tiling for -xscale
{
	for (var k=0;k<1+(tileY)*(1+ceil(room_height/tileHeight));k++)
	{
		draw(x+i*tileWidth,y+k*tileHeight);
	}
}