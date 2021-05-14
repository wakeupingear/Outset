

function drawBlur(surface,alpha,xPos,yPos,topLeft,botRight,drawFunc){
	if !surface_exists(surface) surface=surface_create(384,216);
	surface_set_target(surface);
	draw_clear_alpha(c_black,0);
	
	shader_set(shd_blur);
	gpu_set_blendmode_ext(bm_one,bm_inv_src_alpha);
	draw_surface(application_surface,0,0);
	shader_reset();
	gpu_set_blendmode(bm_normal);
	
	if drawFunc!=-1 drawFunc();
	
	surface_reset_target();
	shader_set(shd_cutout);
	shader_set_uniform_f(shader_get_uniform(shd_cutout,"top"),topLeft[1]*alpha+yPos);
	shader_set_uniform_f(shader_get_uniform(shd_cutout,"bot"),botRight[1]*alpha+yPos);
	shader_set_uniform_f(shader_get_uniform(shd_cutout,"left"),topLeft[0]*alpha+xPos);
	shader_set_uniform_f(shader_get_uniform(shd_cutout,"right"),botRight[0]*alpha+xPos);
	draw_surface(surface,camX(),camY());
	drawEffectObj(global.blurObj);
	shader_reset();
	return surface; //stops memory leak
}