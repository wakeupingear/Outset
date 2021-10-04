event_inherited();
image_speed=0;

alarm[0]=1;

draw=function(_x,_y){
	if instance_exists(oSkyNotdon)
	{
		image_blend=merge_color(c_white,merge_color(c_blue,c_black,0.7),twerp(TwerpType.in_expo,0,0.5,oSkyNotdon.vShipTime));
	}
	draw_sprite_ext(sprite_index,image_index,_x,_y+round(sin(yVars.pos)*yVars.amp),
	image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}