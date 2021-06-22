/// @description Draw
image_index=1;
image_xscale*=-1;
draw(x,y);
image_xscale*=-1;
image_index=0;
for (var i=0;i<tileX;i++)
{
	draw(x+i*tileWidth*image_xscale,y);
}
image_index=1;
draw(x+tileX*tileWidth*image_xscale,y);