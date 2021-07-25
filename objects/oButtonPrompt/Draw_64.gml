/// @description Button text
if !global.controllerConnected
{
	if str==""
	{
		for (var i=0;i<array_length(global.keyboardInputs[button]);i++)
		{
			var _newKey=keyToName(global.keyboardInputs[button][i]);
			if string_contains(str,_newKey) continue;
			if i>0 str+=" / ";
			str+=_newKey;
		}
		strLen=round(string_width(str)/2);
	}
	
	surface_set_target(global.guiSurf);
	draw_text_outline(toGuiX(x)-strLen,toGuiY(y),str);
	surface_reset_target();
}