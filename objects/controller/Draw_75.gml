/// @description Draw guiSurf + pause menu
if !surface_exists(global.guiSurf) exit;
if instance_exists(ply)&&instance_find(ply,0).object_index==ply //check that it's actually the player
{
	
	surface_set_target(global.guiSurf);
	var _str=string(max(global.plyHealth,0));
	draw_text_color((getHudX()+8)*guiX()-round(string_width(_str)/2),(26)*guiY()-round(string_height(_str)/2),_str,-1,-1,-1,-1,sqrt(hudFade));
	surface_reset_target();
}

if isHtml draw_surface_ext(global.guiSurf,0,0,window_get_width()/surface_get_width(global.guiSurf),window_get_width()/surface_get_width(global.guiSurf),0,-1,1);
else 
{
	shader_set(shd_fxaa);
	var tex = surface_get_texture(global.guiSurf);
	shader_set_uniform_f(shader_get_uniform(shd_fxaa, "u_texel"), texture_get_texel_width(tex), texture_get_texel_height(tex));
	shader_set_uniform_f(shader_get_uniform(shd_fxaa, "u_strength"), 4);
	if instance_exists(oCamera) draw_surface(global.guiSurf,oCamera.shakeRandX*4,oCamera.shakeRandY*4);
	else draw_surface(global.guiSurf,0,0);
	shader_reset();
}