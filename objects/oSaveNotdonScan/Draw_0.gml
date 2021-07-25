/// @description Draw tiles below
if scanDraw() image_blend=global.scanColor;
else image_blend=-1;
for (var i=1;i<6;i++)
{
	draw_sprite_ext(sprite_index,1,x,y+sprite_height*i,1,1,0,image_blend,image_alpha);
}