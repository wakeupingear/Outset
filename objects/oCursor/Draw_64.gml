//@description Above text
var _x=toGuiX(x);
var _y=toGuiY(y);
surface_set_target(global.guiSurf);
gpu_set_blendmode(bm_subtract);
draw_sprite_ext(sprite_index,0,_x,_y,guiX(),guiY(),image_angle,image_blend,image_alpha);
gpu_set_blendmode(bm_normal);
surface_reset_target();