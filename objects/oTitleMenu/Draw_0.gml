var _y=y;
y=108;

draw_sprite_ext(sTitleText,0,0,camY(),1,1,0,-1,titleAlpha);

if !surface_exists(surf) surf=surface_create(384,216);
surface_set_target(surf);

draw_clear_alpha(c_black,0);
shader_set(shd_blur);
draw_surface(application_surface,0,0);
shader_reset();

draw_self();

shader_set(shd_colorReplace);
shader_set_uniform_f(shader_get_uniform(shd_cutout,"redCol"),color_get_red(global.hudColorList[global.hudColor]));
shader_set_uniform_f(shader_get_uniform(shd_cutout,"greenCol"),color_get_green(global.hudColorList[global.hudColor]));
shader_set_uniform_f(shader_get_uniform(shd_cutout,"blueCol"),color_get_blue(global.hudColorList[global.hudColor]));
for (var i=0;i<instance_number(oTitleFile);i++) with instance_find(oTitleFile,i) draw();
shader_reset();
surface_reset_target();

shader_set(shd_cutout);
shader_set_uniform_f(shader_get_uniform(shd_cutout,"top"),topLeft[1]*fade+y);
shader_set_uniform_f(shader_get_uniform(shd_cutout,"bot"),botRight[1]*fade+y);
shader_set_uniform_f(shader_get_uniform(shd_cutout,"left"),topLeft[0]*fade+x);
shader_set_uniform_f(shader_get_uniform(shd_cutout,"right"),botRight[0]*fade+x);
draw_surface(surf,camX(),camY());
shader_reset();

y=_y;