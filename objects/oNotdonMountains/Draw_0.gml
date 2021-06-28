/// @description Draw
if tileWidth==-1
{
	tileWidth=sprite_width;
	tileHeight=sprite_width;
}

image_index=1;
image_xscale*=-1;
draw(x,y);
image_xscale*=-1;
image_index=0;
for (var i=0;i<tileX;i++)
{
	draw(x+i*tileWidth,y);
}
image_index=1;
draw(x+tileX*tileWidth,y);