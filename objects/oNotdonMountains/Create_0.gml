event_inherited();

setBGPosition(xstart,ystart);
xLerp=0.65;
yLerp=0.65;
tileX=2;

draw=function(_x,_y){
	if instance_exists(oSkyNotdon) image_blend=merge_color(c_white,c_grey,oSkyNotdon.vShipTime);
	draw_sprite_ext(sprite_index,image_index,_x,_y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}