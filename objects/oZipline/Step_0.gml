/// @description Move player
if image_angle!=lastAng setPos() //update with angle changes

if !moving
{
	if touch
	{
		touch=(place_meeting(x,y,ply));
	}
	else if (buttonPressed(control.confirm)||buttonPressed(control.grapple)||(instance_exists(oGrapple)&&oGrapple.state==2))&&(place_meeting(x,y-2,ply)||place_meeting(x,y+5,ply))
	{
		startXS=ply.xscale;
		startZip();
	}
}
else
{
	plyDist+=dir*spd;
	var _spd=spd*dir//*((image_angle>270||image_angle<90)-(image_angle>90&&image_angle<270));
	ply.hsp=round(_spd*cos(image_angle*pi/(180)));
	ply.vsp=round(_spd*sin(image_angle*pi/(180)));
	var _collided=false;
	var _xDist=x+lengthdir_x(plyDist,image_angle)-ply.x;
	ply.x+=_xDist mod 1;
	with ply repeat abs(_xDist)
	{
		x+=sign(_xDist);
		if groundCollision(x,y)
		{
			x-=sign(_xDist);
			_collided=true;
			break;
		}
	}
	var _yDist=y+lengthdir_y(plyDist,image_angle)-ply.y;
	ply.y+=_yDist mod 1;
	with ply repeat abs(_yDist)
	{
		y+=sign(_yDist);
		if groundCollision(x,y)
		{
			y-=sign(_yDist);
			_collided=true;
			break;
		}
	}
	if buttonPressed(control.jump)||(instance_exists(oGrapple)&&oGrapple.state==2)
	{
		moving=false;
		if buttonPressed(control.jump) 
		{
			ply.state=moveState.jumping;
			touch=true;
			ply.jump=1;
			ply.vsp-=5;
		}
		else
		{
			ply.state=moveState.standing;
			ply.vsp=0;
		}
		ply.x=round(ply.x);
		ply.y=round(ply.y);
	}
	else if _collided||buttonPressed(control.down)||!place_meeting(x,y,ply)
	{
		if _collided shake(1,1,10);
		moving=false;
		ply.state=moveState.standing;
		ply.vsp=-1;
		ply.x=round(ply.x);
		ply.y=round(ply.y);
	}
	else
	{
		x-=1000;
		var _startLine=id;
		with ply if place_meeting(x,y,oZipline)
		{
			var _p=instance_place(x,y,oZipline);
			if !_p.touch
			{
				_startLine.moving=false;
				_startLine.touch=true;
				_p.startXS=_startLine.startXS;
				with _p startZip();
			}
		}
		x+=1000;
	}
}