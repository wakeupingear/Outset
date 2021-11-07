/// @description Draw tiles below
if scanDraw() image_blend=merge_color(global.scanColor,c_white,0.5);
else image_blend=-1;
for (var i=1;i<6;i++)
{
	draw_sprite_ext(sprite_index,1,x,y+sprite_height*i,1,1,0,image_blend,image_alpha);
}