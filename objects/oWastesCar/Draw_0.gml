/// @description Draw
draw_sprite_ext(sprite_index,1,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
for (var i=0;i<array_length(wheels);i++) with wheels[i] draw_self();
draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);