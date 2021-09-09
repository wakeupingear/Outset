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
		var _falling=(state==moveState.falling&&vsp>vspMax*0.75);
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
		
		if _falling&&state<moveState.falling shake(2,2,10);
		
		var _wDist=70;
		var _other=instance_furthest(x,y,oWastesCarWheel);
		while y>_other.y&&point_distance(x,y,_other.x,_other.y)>_wDist y--;
	}
	
	if array_length(wheels)==2&&(wheels[0].state>moveState.running||wheels[1].state>moveState.running)&&point_distance(wheels[0].x,wheels[0].y,wheels[1].x,wheels[1].y)>_wDist
	{
		var _w=wheels[0];
		if wheels[1].vsp!=0&&wheels[1].state>moveState.running _w=wheels[1];
		while point_distance(wheels[0].x,wheels[0].y,wheels[1].x,wheels[1].y)>_wDist _w.y--;
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