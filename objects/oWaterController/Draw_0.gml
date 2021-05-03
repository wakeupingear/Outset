if !surface_exists(surf) surf=surface_create(384,216);
if global.alive time=(time+0.005) mod 1;

surface_set_target(surf);
draw_clear_alpha(c_black,0);
with oWater if inRange 
{
	draw_surface_part_ext(application_surface,max(x-camX(),0),max(y-camY(),0),image_xscale-max(camX()-x,0),image_yscale-max(camY()-y,0),max(x-camX(),0),max(y-camY(),0),1,1,-1,1);
}
surface_reset_target();

shader_set(shd_water);
shader_set_uniform_f(shader_get_uniform(shd_water,"u_time"),time);
shader_set_uniform_f(shader_get_uniform(shd_water,"u_yoff"),(camY() mod 384)/384);
draw_surface(surf,camX(),camY());
shader_reset();

if instance_exists(ply)&&ply.breathAlpha>0
{
	oTerrain.image_blend=merge_color(c_white,c_blue,sqrt(ply.breathAlpha)*0.3);
	shader_set(shd_invisDraw);
	shader_set_uniform_f(shader_get_uniform(shd_invisDraw,"u_color"),58/255,61/255,146/255,ply.breathAlpha*0.5);
	draw_surface(surf,camX(),camY());
	shader_reset();
}