/// @description Draw glitches
for (var i=0;i<ds_list_size(list);i++)
{
	if global.alive||list[|i].alwaysMove
	{
		list[|i].count++;
		if list[|i].count>=list[|i].rate
		{
			list[|i].count=0;
			list[|i].active=!list[|i].active;
		}
	}
	if list[|i].active
	{
		draw_sprite_ext(sPlaceholderPixelW,0,list[|i].x+camX()*followCam,list[|i].y+camY()*followCam,list[|i].xs,list[|i].ys,0,list[|i].blend,list[|i].alpha);
	}
}