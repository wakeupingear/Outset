/// @description 
draw_self();
draw_sprite_ext(sprite_index,1,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
if !holdingTop draw_sprite_ext(sprite_index,2,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);