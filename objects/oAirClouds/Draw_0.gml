/// @description Draw clouds
if !surface_exists(surf) surf=surface_create(384,216);
if !surface_exists(surf2) surf2=surface_create(384,216);

surface_set_target(surf);
draw_clear_alpha(c_black,0);
with airHitobj draw_sprite_ext(sprite_index,image_index+index+1,x-camX(),y-camY(),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
with airHitobj draw_sprite_ext(sprite_index,image_index+index+2,x-camX(),y-camY(),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
surface_reset_target();

surface_set_target(surf2);
draw_clear_alpha(c_black,0);
for (var i=0;i<ds_list_size(clouds);i++) with clouds[|i] draw(-camX(),-camY());
gpu_set_blendmode(bm_subtract);
shader_set(shd_cloudEdge);
if global.alive cloudRippleProg=(cloudRippleProg+0.025)%1;
shader_set_uniform_f(shader_get_uniform(shd_cloudEdge,"u_time"),cloudRippleProg);
shader_set_uniform_f(shader_get_uniform(shd_solidColor,"u_color"),0,0,0);
draw_surface(surf,0,0);
gpu_set_blendmode(bm_normal);
surface_reset_target();

shader_set_uniform_f(shader_get_uniform(shd_solidColor,"u_color"),1,1,1);
draw_surface_ext(surf,camX(),camY(),1,1,0,-1,image_alpha*0.5);
shader_reset();
draw_surface(surf2,camX(),camY());