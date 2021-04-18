shader_set(shd_rotateDarken);
shader_set_uniform_f(shader_get_uniform(shd_rotateDarken,"u_xs"),1-abs(image_xscale));
shader_set_uniform_f(shader_get_uniform(shd_rotateDarken,"u_amp"),8);
draw_sprite_ext(sprite_index,2,x,y,image_xscale,1,image_angle,-1,1); //arm
shader_reset();
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,1,image_angle,-1,1); //cabin
draw_sprite(sprite_index,1,x,y); //base