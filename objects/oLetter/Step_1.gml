/// @description Click
if (selected||hover)&&buttonPressed(control.confirm)&&string_length(oKeyboard.str)<oKeyboard.strLen
{
	oKeyboard.str+=letter;
	letterClicked();
	oDelete.active=true;
	oConfirm.active=true;
	with oKeyboard if string_length(str)==strLen
	{
		with oLetter if object_index==oLetter
		{
			active=false;
		}
	}
}