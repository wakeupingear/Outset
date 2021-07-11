/// @description Attacks
event_inherited();

if global.alive&&instance_exists(ply)
{	
	if mode==0
	{
		if ply.x>x xscale=1;
		else xscale=-1;
		if distance_to_object(ply)<100
		{
			mode=1;
			setAnimation("swinging",armAnimation);
		}
	}
	else if mode==1
	{
		armAngle-=7;
		move=-xscale;
		if armAngle<-140
		{
			move=0;
			mode=1.8;
			alarm[3]=45;
		}
	}
	else if mode=2
	{
		attacking=true;
		move=xscale;
		armAngle+=5;
		if armAngle>60
		{
			move=0;
			mode=2.8;
			alarm[3]=45;
		}
	}
	else if mode=3
	{
		setAnimation("standing",armAnimation);
		attacking=false;
		armAngle-=3;
		if armAngle<0
		{
			mode=0.2;
			alarm[3]=60;
			armAngle=0;
		}
	}
}