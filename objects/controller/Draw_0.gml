/// @description Lighting
if !global.notPause&&pauseMenuCopied!=-1 exit; //don't draw on pause menu
var edgeX=camX();
var edgeY=camY();
if instance_exists(oDiscoballManager) with oDiscoballManager draw();
else if global.lightAlpha>0
{
	if !surface_exists(global.lightSurf) global.lightSurf=surface_create(386,218);
	surface_set_target(global.lightSurf);
	draw_clear_alpha(c_black,global.lightAlpha);
	gpu_set_blendmode(bm_subtract);
	for (var i=0;i<array_length(global.lightObj);i++) if instance_exists(global.lightObj[i]) with global.lightObj[i]
	{
		if !variable_instance_exists(id,"drawLight")
		{
			if distance_to_point(edgeX+192,edgeY+108)-24<200 draw_circle(floor(x)-edgeX,floor(y)-edgeY,24,false);
		}
		else drawLight();
	}
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
	draw_surface_ext(global.lightSurf,edgeX,edgeY,1,1,0,-1,darknessAlpha);
}