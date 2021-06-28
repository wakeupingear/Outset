event_inherited();
image_speed=0;

alarm[0]=1;

draw=function(_x,_y){
	draw_sprite(sprite_index,image_index,_x,_y+round(sin(yVars.pos)*yVars.amp));
}