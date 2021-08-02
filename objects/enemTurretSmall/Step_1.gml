/// @description Movement + AI
simplePhysics();

var _ang=0;
if instance_exists(ply)
{
	_ang=point_direction(x,y,ply.x,ply.y);
	var _calcAng=abs(gunAngle+90-90*xscale-_ang);
	seesPlayer=((distance_to_object(ply)<160)&&(_calcAng<18||_calcAng>342));
}
if global.alive
{
	if mode==0
	{
		if seesPlayer 
		{
			mode=1.7;
			alarm[3]=70;
		}
	}
	else if mode==1.7
	{
		if seesPlayer
		{
			gunAngle=_ang;
		}
	}
	else if mode==2
	{
		mode=2.7;
		alarm[4]=1;
	}
	while gunAngle<0 gunAngle+=360;
	while gunAngle>=360 gunAngle-=360;
}