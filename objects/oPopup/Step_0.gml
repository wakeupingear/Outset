/// @description Input
 if mode==0 //wait for advancement
{
	if exiting||(stackType!=1&&buttonPressed(control.confirm)&&!touchingMouseConfirm(camX()+x,camY()+y))
	{
		if stackType==2 //Top of stack
		{
			mode=-2;
			below.stackType=(instance_number(oPopup)>2)*2;
			animMode=1;
		}
		else if instance_exists(oTextbox)&&array_length(oTextbox.text)>oTextbox.diag&&oTextbox.text[oTextbox.diag]=="$popup"
		{
			mode=-2;
			oTextbox.mode=0;
			animMode=1; //move out to right
		}
		else mode=-1;
		
		if below!=-1 createPopupCursor(below);
		else if mode==-1&&instance_exists(oCursor) instance_destroy(oCursor)
	}
}