/// @description Hud + Pause menu

if global.lightAlpha>0
{
	if !surface_exists(global.lightSurf) global.lightSurf=surface_create(386,218);
	surface_set_target(global.lightSurf);
	draw_clear_alpha(c_black,global.lightAlpha);
	gpu_set_blendmode(bm_subtract);
	for (var i=0;i<array_length(global.lightObj);i++) if instance_exists(global.lightObj[i]) with global.lightObj[i]
	{
		if !variable_instance_exists(id,"drawLight")
		{
			if distance_to_point(camX()+192,camY()+108)-24<200 draw_circle(round(x)-camX(),round(y)-camY(),24,false);
		}
		else drawLight();
	}
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
	draw_surface(global.lightSurf,camX(),camY());
}

if !global.notPause//&&global.alive
{
	if pauseMenuCopied==-1
	{
		surfPosX=camX();
		surfPosY=camY();
		pauseMenuCopied=sprite_create_from_surface(application_surface,0,0,384,216,false,false,0,0);
		instance_deactivate_all(true);
		loadMenu(pauseMenuCurrent);
	}
	draw_clear_alpha(c_black,1);
	draw_sprite(pauseMenuCopied,0,surfPosX,surfPosY);
}
else if !global.transitioning&&!global.menuOpen&&global.alive&&instance_exists(ply)&&instance_find(ply,0).object_index==ply
{
	if image_alpha<1 image_alpha+=0.1;
}
else if image_alpha>0 image_alpha-=0.1;

if instance_exists(ply)
{
	draw_sprite_ext(sHudHealth,0,getHudX()+camX(),24+camY(),1,1,0,global.hudColorList[global.hudColor],image_alpha*0.8);
}


if pauseAlpha>0
{
	var _x=max(camX(),surfPosX);
	var _y=max(camY(),surfPosY);
	draw_set_alpha(pauseAlpha);
	draw_set_color(c_black);
	draw_rectangle(_x,_y,_x+384,_y+216,false);
	draw_set_color(c_white);
	draw_set_alpha(1);
}