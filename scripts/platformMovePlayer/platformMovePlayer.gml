// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function platformMovePlayer(){
	//ply
	if instance_exists(ply)&&ply.state!=moveState.floating&&ply.state<moveState.pulling{
	if touch
	{
		ply.x=x+plyRelX;
		ply.y=y+plyRelY;
		if buttonPressed(control.jump) ply.jumpAdd=abs(min(0.75*(y-yprevious),0));
		with ply if groundCollision(x,y) hurtPlayer(global.maxDamage,0,0);
	}
	else if place_meeting(x,y,ply)
	{
		if !place_meeting(x,yprevious,ply) hurtPlayer(global.maxDamage,0,0);
		else //can't just use the push() function because of the nonlinear path
		{
			var _dir=sign(x-xprevious);
			if _dir==0 _dir=sign(ply.x-x);
			while place_meeting(x,y,ply)&&global.plyHealth>0
			{
				ply.x=round(ply.x+_dir);
				with ply if groundCollision(x,y)
				{
					if !groundCollision(x,y-maxYChange)
					{
						y-=maxYChange;
						while !groundCollision(x,y+1) y+=0.25;
					}
					else 
					{
						hurtPlayer(global.maxDamage,0,0);
					}
				}
			}
			if sign(ply.hsp)!=_dir&&ply.state==moveState.running&&ply.state!=moveState.floating ply.state=moveState.standing;
			//impulse(ceil(abs(x-xprevious))*_dir,ply.vsp,ply);
			ply.hsp=0;
		}
	}
	}
	
	//npcs
	//tbd if this is needed
}