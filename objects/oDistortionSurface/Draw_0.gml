/// @description 
if !surface_exists(surf) surf=surface_create(384,216);
surface_set_target(surf);
draw_clear_alpha(COLOUR_FOR_NO_MOVE,0);
if instance_exists(ply) draw_sprite(sNormalMap,0,ply.x-camX(),ply.y-camY());
surface_reset_target();

var surface_texture_page=surface_get_texture(surf);
shader_set(shd_distort);
texture_set_stage(distortion_stage, surface_texture_page);
draw_surface(application_surface,0,0);
shader_reset()