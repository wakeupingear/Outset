/// @description Draw
image_yscale=twerp(TwerpType.in_expo,1,-1,yscaleProg);
draw_sprite_ext(sprite_index,1+(image_yscale<0)*2,x,y,image_xscale,image_yscale,image_angle,-1,image_alpha);
if hover draw_sprite_ext(sprite_index,2,x,y,image_xscale,image_yscale,image_angle,-1,image_alpha);