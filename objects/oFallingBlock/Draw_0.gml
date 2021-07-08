/// @description Draw brick
var _w=abs(sprite_width);
var _h=abs(sprite_height);
draw_sprite_part_ext(sprite_index,image_index,0,0,_w,_h-yRemoved,x-_w/2,y-_h/2,image_xscale,image_yscale,image_blend,image_alpha);