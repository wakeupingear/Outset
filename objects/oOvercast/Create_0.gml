event_inherited();
image_speed=0;

xLerp=0.8+image_index*0.1;
yLerp=xLerp;
tileX=true;

yVars=new oscillateVars(5,8);
yVars.pos+=pi*image_index/2;

draw=function(_x,_y){
	draw_sprite(sprite_index,image_index,_x,_y+round(sin(yVars.pos)*yVars.amp));
}