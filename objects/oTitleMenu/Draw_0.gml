if showHud draw_sprite_ext(sTitleText,0,0,camY(),1,1,0,-1,titleAlpha);

surf=drawBlur(surf,fade,192,108,topLeft,botRight,blurFunc);
/*surface_set_target(surf);
gpu_set_blendmode(bm_subtract);
draw_sprite(sprite_index,0,192,108);
gpu_set_blendmode(bm_normal);
surface_reset_target();
draw_surface(surf,camX(),camY());

/*shader_set(shd_colorReplace);
shader_set_uniform_f(shader_get_uniform(shd_cutout,"redCol"),color_get_red(global.hudColorList[global.hudColor]));
shader_set_uniform_f(shader_get_uniform(shd_cutout,"greenCol"),color_get_green(global.hudColorList[global.hudColor]));
shader_set_uniform_f(shader_get_uniform(shd_cutout,"blueCol"),color_get_blue(global.hudColorList[global.hudColor]));
for (var i=0;i<instance_number(oTitleFile);i++) with instance_find(oTitleFile,i) draw();
shader_reset();