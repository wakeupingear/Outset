/// @description Draw text 
var _color=(selected?c_orange:c_nearWhite)
surface_set_target(global.guiSurf);
draw_text_color(toGuiX(x+camX())-round(string_width(text)/2),toGuiY(y+camY())-round(string_height(text)/2),text,
_color,_color,_color,_color,1-0.3*slideProg-(1-slideIn));
if choiceStr!=""
{
	draw_text(toGuiX(x+camX()+round(sprite_width/2)+4+sprite_width/image_xscale*choiceXscale/2)-round(string_width(choiceStr)/2),toGuiY(y+camY())-round(string_height(choiceStr)/2),
	choiceStr);
}
surface_reset_target();