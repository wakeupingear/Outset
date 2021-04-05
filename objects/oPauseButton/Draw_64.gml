/// @description Draw text 
draw_set_color(c_nearWhite);
surface_set_target(global.guiSurf);
var _x=x*1920/384*global.guiScale;
var _y=y*1080/216*global.guiScale;

draw_text(_x,_y,text);
surface_reset_target();
draw_set_color(c_white);