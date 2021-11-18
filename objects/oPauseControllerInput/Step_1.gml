/// @description Inputs
if selected&&!destroy
{
	if selectedSlide<20 selectedSlide+=4;
}
else
{
	if selectedSlide>0 selectedSlide-=2;
}

if !destroy
{
	if image_alpha<1 image_alpha+=0.1;
	if selected
	{
		var _dir=getKeyDir();
		if buttonPressed(control.confirm)
		{
			
		}
		else if _dir!=-1
		{
			if inputs[_dir][mode]!=-1
			{
				var _id=inputs[_dir][mode];
				selected=false;
				with oPauseControllerInput if pos==_id selected=true;
				buttonIncrement(_dir);
			}
		}
	}
	else if place_meeting(x+camX(),y+camY(),oCursor) //not working
	{
		with oPauseControllerInput selected=false;
		selected=true;
	}
}
else
{
	image_alpha-=0.1;
	if image_alpha<=0 instance_destroy();
}
printCoords(x,y)