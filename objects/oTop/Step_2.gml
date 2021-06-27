if riding==0
{
	if !touch
	{
		if distance_to_object(ply)<sprite_width&&place_meeting(x,y,ply)
		{
			ply.state=moveState.floating;
			ply.visible=false;
			riding=1;
			image_index=1;
		}
	}
	else touch=place_meeting(x,y,ply)||place_meeting(x,y-16,ply);
}
else if riding==1
{
	ply.x=x;
	ply.y=y;
	var _dir=buttonPressed(control.left)+buttonPressed(control.right);
	if _dir!=0
	{
		image_xscale=_dir;
		ply.xscale=_dir;
		persistent=true;
		riding=2;
		if place_meeting(x,y+16,oTopStation) with instance_place(x,y+16,oTopStation)
		{
			holdingTop=false;
		}
	}
	else if buttonPressed(control.jump)
	{
		eject(false);
		touch=true;
		riding=0;
	}
}
else if riding>=2
{
	wallclimb=false;
	repeat spd*(global.alive)
	{
		x+=image_xscale;
		if groundCollision(x,y)
		{
			wallclimb=true;
			if !groundCollision(x,y-1) y--;
			else if !groundCollision(x,y+1) y++;
			else
			{
				x--;
				y--;
			}
		}
		else if !groundCollision(x,y+1) y++;
	}
	
	if riding==2
	{
		ply.x=x;
		ply.y=y;
		if !global.alive||global.plyHealth<=0
		{
			eject(false);
		}
		else if groundCollision(x,y)
		{
			var _xMove=0;
			var _yMove=0;
			if wallclimb _yMove=1;
			else _xMove=-image_xscale;
			with ply while groundCollision(x,y)
			{
				x+=_xMove;
				y+=_yMove;
			}
			eject(true);
		}
		else
		{
			if buttonPressed(control.jump)
			{
				ply.state=moveState.jumping;
				eject(false);
			}
		}
	}
	else
	{
		if offscreen(x,y)||groundCollision(x,y) instance_destroy(id,false);
	}
}