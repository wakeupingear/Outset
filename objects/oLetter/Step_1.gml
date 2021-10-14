/// @description Click
if (selected||hover)&&buttonPressed(control.confirm)&&string_length(oKeyboard.str)<oKeyboard.strLen
{
	oKeyboard.str+=letter;
	particle(x,y,depth+1,sprite_index,0,{
		xscaleSpd:0.05,
		yscaleSpd:0.05,
		fade:0.05
	});
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