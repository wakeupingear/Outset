image_speed=0;
image_index=5;

selected=false;
draw=function(){draw_sprite_ext(sprite_index,image_index,x-camX(),y-camY(),1,1,0,image_blend,image_alpha);};