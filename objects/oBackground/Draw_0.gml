/// @description Draw
if tileWidth==-1
{
	tileWidth=abs(sprite_width);
	tileHeight=abs(sprite_height);
}
for (var i=0;i<1+(tileX)*(1+ceil(room_width/tileWidth));i++) //add 1 when tiling for -xscale
{
	var _xs=image_xscale;
	var _ys=image_yscale;
	for (var k=0;k<1+(tileY)*(1+ceil(room_height/tileHeight));k++)
	{
		draw(x+i*tileWidth,y+k*tileHeight);
		image_xscale*=tileXSMult;
		image_yscale*=tileYSMult;
	}
	image_xscale=_xs;
	image_yscale=_ys;
}