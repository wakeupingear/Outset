/// @description Draw shadow
draw_sprite_ext(sprite_index,image_index+2,x,y,image_xscale,image_yscale,image_angle,-1,0.2);
seethroughFade();
if image_alpha<0.5 
{
	if !touch
	{
		oCamera.followMode=0;
		oCamera.xTo=x;
		oCamera.yTo=y;
		touch=true;
	}
}
else
{
	if touch
	{
		oCamera.followMode=1;
		oCamera.followObj=oPlayerCam;
		touch=false;
	}
}
draw_sprite_ext(sprite_index,image_index+1,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);