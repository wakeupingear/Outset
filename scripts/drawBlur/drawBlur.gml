// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function drawBlur(surface,alpha,xPos,yPos,topLeft,botRight,drawFunc){
	if !surface_exists(surface) surface=surface_create(384,216);
	surface_set_target(surface);
	draw_clear_alpha(c_black,0);
	
	shader_set(shd_blur);
	draw_surface(application_surface,0,0);
	shader_reset();
	
	if drawFunc!=-1 drawFunc();
	
	surface_reset_target();
	shader_set(shd_cutout);
	shader_set_uniform_f(shader_get_uniform(shd_cutout,"top"),topLeft[1]*alpha+yPos);
	shader_set_uniform_f(shader_get_uniform(shd_cutout,"bot"),botRight[1]*alpha+yPos);
	shader_set_uniform_f(shader_get_uniform(shd_cutout,"left"),topLeft[0]*alpha+xPos);
	shader_set_uniform_f(shader_get_uniform(shd_cutout,"right"),botRight[0]*alpha+xPos);
	draw_surface(surface,camX(),camY());
	shader_reset();
	
	for (var i=0;i<instance_number(oBlurObj);i++) with instance_find(oBlurObj,i) draw();
}