/// @description Draw
if state==0
{
	if flying
	{
		if landingYscale>0 landingYscale-=0.05;	
	}
	else
	{
		if landingYscale<1 landingYscale+=0.05;
	}
	draw_sprite_ext(sprite_index,1,x,y,image_xscale,landingYscale,image_angle,image_blend,1);
	
	draw_sprite_ext(sprite_index,2,x,y,image_xscale,image_yscale,image_angle,image_blend,1);
	if seethroughOverride==-1||(seethroughOverride==0&&!flying&&place_meeting(x,y,ply))
	{
		if seethroughAlpha>0 seethroughAlpha-=0.05;
	}
	else if seethroughAlpha<1 seethroughAlpha+=0.05;
	draw_sprite_ext(sprite_index,3,x,y,image_xscale,image_yscale,image_angle,image_blend,seethroughAlpha);
}