/// @description Button text
if !global.controllerConnected
{
	if str==""
	{
		for (var i=0;i<array_length(global.keyboardInputs[button]);i++)
		{
			if i>0 str+=" / ";
			str+=keyToName(global.keyboardInputs[button][i]);
		}
		strLen=round(string_width(str)/2);
	}
	
	surface_set_target(global.guiSurf);
	draw_text(toGuiX(x)-strLen,toGuiY(y),str);
	surface_reset_target();
}