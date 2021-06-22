/// @description Press
if global.alive
{
	if (pressed||(distance_to_object(ply)<8&&place_meeting(x,y,ply)))&&roomHasPower()
	{
		global.interactText=check;
		if (pressed||buttonPressed(control.confirm)||buttonPressed(control.up))
		{
			pressed=false;
			if platform.moving||platform.moveDir==moveDir
			{
				platform.moveDir=moveDir;
				platform.moving=true;
				if platform.y<camY()&&moveDir==1 platform.y=floor((camY()-24)/platform.ySpd)*platform.ySpd; //doesn't work for diagonal stuff
				if platform.y>camY()+216&&moveDir==-1 platform.y=floor((camY()+240)/platform.ySpd)*platform.ySpd;
			}
		}
	}
}