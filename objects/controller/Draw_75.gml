/// @description Draw guiSurf + pause menu
if instance_exists(ply)&&instance_find(ply,0).object_index==ply //check that it's actually the player
{
	surface_set_target(global.guiSurf);
	draw_text_color((getHudX()-16)/384*1920*global.guiScale,(17)/216*1080*global.guiScale,string(max(global.plyHealth,0)),-1,-1,-1,-1,hudFade);
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