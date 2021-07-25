/// @description Draw text
x=camX();
y=camY();
surface_set_target(global.guiSurf);
var _len=ds_list_size(commands);
for (var i=0;i<=_len;i++)
{
	var _str="> "+keyboard_string;
	if i>0 _str=commands[|_len-i];
	draw_text(toGuiX(x+leftPadding),toGuiY(y+200-i*16),_str);
}
surface_reset_target();