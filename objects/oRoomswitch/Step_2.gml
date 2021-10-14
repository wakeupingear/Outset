/// @description Trigger
if global.alive||true{
if !touch||door{
if mode==0&&!global.menuOpen&&!global.transitioning
{
	if door&&distance_to_object(ply)<sprite_width*image_xscale&&(ply.state==moveState.standing||ply.state==moveState.running)&&place_meeting(x,y,ply)
	{
		global.interactText=check
		if (buttonPressed(control.up)||buttonPressed(control.confirm))
		{
			playSound(sndDoor,false);
			if targetroom==room 
			{
				global.menuOpen=true;
				mode=1;
			}
			else
			{
				ply.move=move;
				if object_index==oRoomswitchZone setTargets();
				roomChange(target_x,target_y,targetroom,transition,move,ymove,xscale);
			}
		}
	}
	else if !door&&place_meeting(x,y,ply)
	{
		ply.move=move;
		if object_index==oRoomswitchZone setTargets();
		roomChange(target_x,target_y,targetroom,transition,move,ymove,xscale);
	}
}
else if mode==1 //door - decrease player alpha
{
	ply.image_alpha-=0.1;
	if ply.image_alpha<=0
	{
		if otherDoor!=-1
		{
			ply.x=otherDoor.x	
			ply.y=otherDoor.y
		}
		else
		{
			ply.x=target_x;
			ply.y=target_y;
		}
		if xscale!=0 
		{
			ply.xscale=xscale;
			//if instance_exists(oPlayerCam) oPlayerCam.xscale
		}
		mode=2;
	}
}
else if mode==2 //door - increase player alpha
{
	ply.image_alpha+=0.1;
	if ply.image_alpha>=1
	{
		global.menuOpen=false;
		mode=0;
	}
}
}
else touch=place_meeting(x,y,ply);
}