/// @description Button text
if !global.controllerConnected
{
	if str==""
	{
		for (var i=0;i<ds_list_size(global.keyboardInputs[button]);i++)
		{
			var _newKey=keyToName(global.keyboardInputs[|button][i]);
			if string_contains(str,_newKey) continue;
			if i>0 str+=" / ";
			str+=_newKey;
		}
		strLen=round(string_width(str)/2);
	}
	
	surface_set_target(global.guiSurf);
	draw_text_outline_transformed_color(toGuiX(x)-strLen,toGuiY(y),str,c_nearWhite,c_nearWhite,image_alpha,c_nearBlack,c_nearBlack,image_alpha,6*global.guiScale,12,1,1,0);
	surface_reset_target();
}