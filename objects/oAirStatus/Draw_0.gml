image_index=updateAnimation(image_index,flipAnimation);
draw_sprite_ext(sprite_index,flipAnimation.on.endFrame+1,x,y,image_xscale,image_yscale,image_angle,image_blend,1);
draw_self();