/// @description Draw clouds
if !surface_exists(surf) surf=scr_surface_create(384,216);
if !surface_exists(surf2) surf2=scr_surface_create(384,216);

surface_set_target(surf);
draw_clear_alpha(c_black,0);
with airHitobj draw_sprite_ext(sprite_index,image_index+index+1,x-camX(),y-camY(),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
with airHitobj draw_sprite_ext(sprite_index,image_index+index+2,x-camX(),y-camY(),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
surface_reset_target();

surface_set_target(surf2);
draw_clear_alpha(c_black,0);
with oClouds draw(-camX(),-camY());
gpu_set_blendmode(bm_subtract);
shader_set(shd_cloudEdge);
draw_surface(surf,0,0);
shader_reset();
gpu_set_blendmode(bm_normal);
surface_reset_target();


draw_surface(surf2,camX(),camY());