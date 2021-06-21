/// @description Click
if active&&(selected||hover)&&buttonPressed(control.confirm)&&string_length(oKeyboard.str)>0
{
	oKeyboard.str=string_copy(oKeyboard.str,0,string_length(oKeyboard.str)-1);
	with oLetter 
	{
		active=true;
	}
	if string_length(oKeyboard.str)==0 
	{
		oConfirm.active=false;
		active=false;
	}
}