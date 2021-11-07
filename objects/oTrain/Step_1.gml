/// @description Interact
if global.alive{
if !moving
{
	if instance_exists(ply)&&place_meeting(x,y-1,ply)
	{
		setInteractText(15);
		if buttonPressed(control.confirm)||buttonPressed(control.up)
		{
			moving=true;
			position+=dir;
			if hasData("train") alarm[0]=1;
			else //first time
			{
				addData("train");
				alarm[0]=1;
			}
		}
	}
}
else if alarm[0]==-1
{
	var _arr=points[|position];
	var _dir=point_direction(x,y,_arr[0],_arr[1]);
	var _xChange=lengthdir_x(spd,_dir);
	var _yChange=lengthdir_y(spd,_dir);
	
	var _trackPly=false, _xOff=0,_yOff=0;
	if instance_exists(ply)&&(place_meeting(x,y-1,ply)||place_meeting(x+_xChange,y+_yChange,ply))
	{
		movingPlayer=true;
		_trackPly=true;
		_xOff=x-ply.x;
		_yOff=y-ply.y;
	}
	else movingPlayer=false;
	x+=_xChange;
	y+=_yChange;
	x=round(x);
	y=round(y);
	if point_distance(x,y,_arr[0],_arr[1])<2
	{
		x=_arr[0];
		y=_arr[1];
		if points[|position][2]
		{
			moving=false;
			if position==ds_list_size(points)-1 dir=-1;
			else if position==0 dir=1;
			setPlayerTrack(false);
		}
		else 
		{
			position+=dir;
			setPlayerTrack();
			setXscale();
		}
	}
	
	if _trackPly
	{
		ply.x=x-_xOff;
		ply.y=y-_yOff;
		if buttonPressed(control.jump)&&ply.state<=moveState.running&&ply.state!=moveState.floating
		{
			var _hM=x-xprevious;
			ply.hsp=0.75*ply.hspMax*_hM*(1+((buttonHold(control.right)-buttonHold(control.left))==sign(_hM)));
		}
	}
	
	if !moving
	{
		position+=dir;
		setXscale();
		position-=dir;
	}
}
}