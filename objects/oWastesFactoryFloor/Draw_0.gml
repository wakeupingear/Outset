/// @description Draw tiles
var _tilScale=12;
for (var i=0;i<image_xscale;i+=_tilScale)
{
	for (var j=0;j<image_yscale;j+=_tilScale)
	{
		draw_sprite_ext(sMykoBrick,0,x+i,y+j,1,1,0,-1,image_alpha);
	}
}