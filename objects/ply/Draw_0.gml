
var _color=image_blend;
shader_set(shd_lighten);
//shader_set_uniform_f(shader_get_uniform(shd_lighten,"u_bright"),max(0,abs(hsp)/hspMax/2-1));
shader_set_uniform_f(shader_get_uniform(shd_lighten,"u_bright"),fastIntensity);
draw_sprite_ext(sprite_index,image_index,x,y,xscale,yscale,0,_color,image_alpha);
if hasBackpack draw_sprite_ext(sPlyBackpack,image_index,x,y,xscale,yscale,0,_color,image_alpha);
shader_reset();