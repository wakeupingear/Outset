/// @description Draw sparkles
if !surface_exists(surf) surf=surface_create(384,216);

surface_set_target(surf);
draw_clear_alpha(c_black,0);
for (var i=0;i<array_length(objList);i++) with objList[i] shimmerDraw();
gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_src_alpha);
draw_surface(application_surface,0,0);
gpu_set_blendmode(bm_normal);
surface_reset_target();

gpu_set_blendmode(bm_add);
//shader_set(shd_sparkle);
//if global.alive time=(time+0.005) mod 1;
//shader_set_uniform_f(shader_get_uniform(shd_sparkle,"u_time"),time);
//shader_set_uniform_f(shader_get_uniform(shd_sparkle,"u_size"),20);
draw_surface_ext(surf,camX(),camY(),1,1,0,-1,1);
gpu_set_blendmode(bm_normal);
shader_reset();