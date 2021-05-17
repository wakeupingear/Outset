event_inherited();
image_speed=0;

xLerp=0.8+image_index*0.1;
yLerp=xLerp;
tileX=true;

draw=function(_x,_y){
	draw_sprite(sprite_index,image_index,_x,_y);
}