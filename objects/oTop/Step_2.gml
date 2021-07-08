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
			image_xscale=ply.xscale;
		}
	}
	else touch=place_meeting(x,y,ply)||place_meeting(x,y-16,ply);
}
else if riding==1
{
	ply.x=x;
	ply.y=y;
	var _dir=buttonPressed(control.right)-buttonPressed(control.left);
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
		checkCollision();
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
	}
	if !wallclimb
	{
		if !groundCollision(x,y+1)
		{
			if vsp<vspMax vsp+=global.grav*2;
			repeat abs(round(vsp))
			{
				y++;
				if groundCollision(x,y+1) break;
			}
		}
		else vsp=0;
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
			var _yMove=0;
			if wallclimb _yMove=1;
			eject(true);
			ply.x=xprevious;
			with ply while groundCollision(x,y)
			{
				y+=_yMove;
				x-=image_xscale
			}
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