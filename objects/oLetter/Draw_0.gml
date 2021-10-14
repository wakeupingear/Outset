/// @description Sprite
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,image_blend,image_alpha*(1-(!active)*0.5));
if active draw_sprite_ext(sprite_index,image_index+(hover||selected),x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);