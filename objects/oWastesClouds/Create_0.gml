event_inherited();
image_blend=c_green;

alpha=0.5;
tileX=true;
bottomClouds=[];
alarm[0]=1;
origXOff=-1;
origYOff=-1;
lerpProgX=0;
lerpProgY=0;
spd=1;

draw=function(_x,_y){
	draw_sprite_ext(sprite_index,image_index,_x,_y,image_xscale,image_yscale,image_angle,image_blend,image_alpha*alpha);
}