image_speed=0;

tileX=false;
tileY=false;
tileWidth=-1;
tileHeight=-1;

xOff=0;
yOff=0;
xLerp=0.5;
yLerp=0.5;

draw=function(_x,_y){
	draw_sprite_ext(sprite_index,image_index,_x,_y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}