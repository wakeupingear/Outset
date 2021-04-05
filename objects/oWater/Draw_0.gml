if (x+sprite_width<camX()^^x>camX()+384)&&(y+sprite_height<camY()^^y>camY()+216)
{
	if surface_exists(surf) surface_free(surf);
}
else 
{
	show_debug_message(fps_real)
	if !surface_exists(surf) surf=surface_create(384,216);
	surface_set_target(surf);
	draw_clear_alpha(c_white,0);
	shader_set(shd_water);
	shader_set_uniform_f(shader_get_uniform(shd_water,"u_time"),time);
	draw_surface_part_ext(application_surface,(x-camX()),(y-camY()),image_xscale,image_yscale,0,0,1,1,-1,1)
	shader_reset();
	surface_reset_target();
	
	draw_surface(surf,x,y);
}
draw_self();