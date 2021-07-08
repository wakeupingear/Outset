/// @description Move
if global.alive
{	
	if !riding
	{
		if instance_exists(ply)&&ply.state<=moveState.running&&place_meeting(x,y,ply) 
		{
			global.interactText=11;
			if (buttonPressed(control.up)||buttonPressed(control.confirm))
			{
				riding=true;
				ply.visible=false;
				ply.state=moveState.floating;
				resetGrapple();
			}
		}
	}
	
	physics();
	
	var _stop=-1;
	var _xChange=(x-xprevious);
	for (var i=0;i<array_length(wheels);i++) with wheels[i]
	{
		if _stop==-1 repeat abs(_xChange)
		{
			x+=sign(_xChange)
			if groundCollision(x,y)
			{
				if !groundCollision(x,y-maxYChange)
				{
					y-=maxYChange;
					while !groundCollision(x,y+1) y++;
				}
				else
				{
					x-=sign(_xChange);
					_stop=i;
					break;
				}
			}
		}
		
		physics();
	}
	
	if _stop>-1
	{
		var _xMove=wheels[_stop].x-wheels[_stop].xprevious;
		with wheels[!_stop] x=xprevious+_xMove;
		x=xprevious+_xMove;
		if abs(hsp)>=hspMax/2 shake(2,2,15);
		hsp=0;
	}
	else with oWastesCarWheel image_angle-=(x-xprevious)*6;
	
	if riding
	{
		move=(buttonHold(control.right)-buttonHold(control.left));
		
		ply.x=x;
		ply.y=y-10;
	
		if global.plyHealth<=0 eject(true);
		else if buttonPressed(control.jump)||buttonPressed(control.down)||oGrapple.state>1 eject(false);
	}
}