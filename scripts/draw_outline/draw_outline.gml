function draw_outline(sprite,subimg,_x,_y,xscale,yscale,rot,col,alpha,outlineCol,alsoDrawSprite){
	shader_set(shd_solidColor);
	shader_set_uniform_f(shader_get_uniform(shd_solidColor,"u_color"),color_get_red(outlineCol)/255,color_get_green(outlineCol)/255,color_get_red(outlineCol)/255);
	draw_sprite_ext(sprite,subimg,_x-1,_y,xscale,yscale,rot,col,alpha);
	draw_sprite_ext(sprite,subimg,_x+1,_y,xscale,yscale,rot,col,alpha);
	draw_sprite_ext(sprite,subimg,_x,_y-1,xscale,yscale,rot,col,alpha);
	draw_sprite_ext(sprite,subimg,_x,_y+1,xscale,yscale,rot,col,alpha);
	shader_reset();
	if alsoDrawSprite draw_sprite_ext(sprite,subimg,_x,_y,xscale,yscale,rot,col,alpha);
}