if !surface_exists(surf) surf=scr_surface_create(384,216);

surface_set_target(surf);
draw_clear_alpha(c_black,0);
with oReflection if inRange 
{
	var _ySub=ceil(max(camY()-yAxis,0));
	draw_surface_part_ext(application_surface,max(x-camX(),0),floor(max(yAxis-camY(),0)),image_xscale-max(camX()-x,0),image_yscale-_ySub,max(x-camX(),0),(y-camY())+image_yscale-_ySub,1,-1,-1,1);
	for (var i=0;i<array_length(myReflectObj);i++)
	{
		with myReflectObj[i] 
		{
			drawExt(sprite_index,image_index,0,2*(yAxis-y),1,-1,0,-1,1);
		}
	}
}
surface_reset_target();

draw_surface(surf,camX(),camY());