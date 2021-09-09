/// @description Input
 if mode==0 //wait for advancement
{
	if exiting||(!forceOpen&&stackType!=1&&(buttonPressed(control.grapple)||buttonPressed(control.confirm))&&(!instance_exists(oCursor)||!place_meeting(camX()+x,camY()+y,oMouse)))
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
		
		if mode<0
		{
			switch sprite_index
			{
				case sSolitaireTable:
					if instance_exists(oSolitaireControl) instance_destroy(oSolitaireControl);
					if instance_exists(oCard) with oCard
					{
						var _dir=point_direction(x,y,camX()+192,camY()+108)+180+irandom_range(-30,30);
						target_x=x+lengthdir_x(244,_dir);
						target_y=y+lengthdir_y(140,_dir);
						moving=true;
						alarm[0]=20;
					}
					break;
				default: break;
			}
		}
	}
}

if mode<0
{
	if mouse!=-1
	{
		if below!=-1 createPopupCursor(below);
		else if mode==-1&&instance_exists(oCursor) instance_destroy(oCursor);
		mouse=-1;
	}
}