x=camX()+340;
y=camY()+174;
vars=oscillate(vars,"y",false,false);
draw_sprite_ext(sprite_index,image_index+6,x,y+1,image_xscale,image_yscale,image_angle,image_blend,0.4);
draw_self();