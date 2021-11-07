/// @description Draw guiSurf + pause menu
if !surface_exists(global.guiSurf) exit;
if instance_exists(ply)&&instance_find(ply,0).object_index==ply //check that it's actually the player
{
	surface_set_target(global.guiSurf);
	draw_text_color((getHudX()+4)/384*1920*global.guiScale,(18)/216*1080*global.guiScale,string(max(global.plyHealth,0)),-1,-1,-1,-1,sqrt(hudFade));
	surface_reset_target();
}

if isHtml draw_surface_ext(global.guiSurf,0,0,window_get_width()/surface_get_width(global.guiSurf),window_get_width()/surface_get_width(global.guiSurf),0,-1,1);
else 
{
	//shader_set(shd_fxaa);
	if instance_exists(oCamera) draw_surface(global.guiSurf,oCamera.shakeRandX*4,oCamera.shakeRandY*4);
	else draw_surface(global.guiSurf,0,0);
	//shader_reset();
}