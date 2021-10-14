if !surface_exists(surf) surf=surface_create(384,216);
if global.alive time=(time+0.005) mod 1;

surface_set_target(surf);
draw_clear_alpha(c_black,0);
with oWater if inRange 
{
	draw_surface_part_ext(application_surface,max(x-camX(),0),max(y-camY(),0),image_xscale-max(camX()-x,0),image_yscale-max(camY()-y,0),max(x-camX(),0),max(y-camY(),0),1,1,-1,1);
}

//gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_src_alpha);
//if global.alive flickerTime+=0.01;
//var _color=c_white;
//	shader_set(shd_fog);
//	shader_set_uniform_f(shader_get_uniform(shd_fog,"time"),flickerTime);
//	shader_set_uniform_f(shader_get_uniform(shd_fog,"fog_color"),color_get_red(_color)/255,color_get_green(_color)/255,color_get_blue(_color)/255);
//	shader_set_uniform_f(shader_get_uniform(shd_fog,"alpha"),1);
//	shader_set_uniform_f(shader_get_uniform(shd_fog,"stepNum"),3);
//	draw_sprite(sFogBigChunky,0,-camX(),-camY());
//	//draw_sprite(sFogBigChunky,0,-camX()+2048,-camY());
//gpu_set_blendmode(bm_normal);
//shader_reset();
surface_reset_target();

shader_set(shd_water);
shader_set_uniform_f(shader_get_uniform(shd_water,"u_time"),time);
shader_set_uniform_f(shader_get_uniform(shd_water,"u_yoff"),(camY() mod 384)/384);
draw_surface(surf,camX(),camY());
shader_reset();

if instance_exists(ply)
{
	if !global.alive
	{
		if ply.breathAlpha>0 ply.breathAlpha-=0.1;
		var _color=merge_color(c_white,c_blue,sqrt(ply.breathAlpha)*0.3);
		oTerrain.image_blend=_color;
	}
	else if ply.breathAlpha>0
	{
		var _color=merge_color(c_white,c_blue,sqrt(ply.breathAlpha)*0.3);
		oTerrain.image_blend=_color;
		if instance_exists(enemWall) enemWall.image_blend=_color;
		shader_set(shd_invisDraw);
		shader_set_uniform_f(shader_get_uniform(shd_invisDraw,"u_color"),58/255,61/255,146/255,ply.breathAlpha*0.5);
		draw_surface(surf,camX(),camY());
		shader_reset();
	}
}

with oWater// if inRange 
{
	draw_self();
	//TODO: get this stupid effect working
	if reflects&&false draw_sprite_ext(sprite_index,0,x,y,image_xscale,min(-round((y-camY()-64)/3),0),0,-1,0.5)
}