var _x=camX();
x=192;
var _y=camY();
y=108;

if !surface_exists(surf) surf=surface_create(384,216);

surface_set_target(surf);
draw_clear_alpha(c_black,0);
shader_set(shd_blur);
draw_surface(application_surface,0,0);
shader_reset();
for (var i=0;i<instance_number(oBlurObj);i++) with instance_find(oBlurObj,i) draw();

draw_self();
surface_reset_target();

shader_set(shd_cutout)
shader_set_uniform_f(shader_get_uniform(shd_cutout,"top"),yy+topLeft[1]*fade);
shader_set_uniform_f(shader_get_uniform(shd_cutout,"bot"),yy+botRight[1]*fade);
shader_set_uniform_f(shader_get_uniform(shd_cutout,"left"),xx+topLeft[0]*fade);
shader_set_uniform_f(shader_get_uniform(shd_cutout,"right"),xx+botRight[0]*fade);
draw_surface(surf,_x,_y);
shader_reset();