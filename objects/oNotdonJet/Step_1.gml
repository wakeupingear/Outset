/// @description Movement
if global.alive
{
	if flying&&landingYscale==0
	{
		if true&&isTest&&keyboard_check(ord("M"))
		{
			xTo=oMouse.x;
			yTo=oMouse.y;
		}
		if lastXTo!=xTo||lastYTo!=yTo
		{
			direction=point_direction(x,y,xTo,yTo);
			if spd<maxSpd spd+=acc;
			if distance_to_point(xTo,yTo)<=maxSpd
			{
				lastXTo=xTo;
				lastYTo=yTo;
			}
		}
		else
		{
			if spd>0 
			{
				spd-=acc;
				if spd<acc spd=0;
			}
		}
		x+=lengthdir_x(floor(spd),direction);
		y+=lengthdir_y(floor(spd),direction);
	}
	
	if sitMode!=""
	{
		var _trigger=false;
		for (var i=0;i<array_length(chairs);i++) if chairs[i][0].image_index==1
		{
			_trigger=true;
			break;
		}
		if _trigger 
		{
			conversation(sitMode)
			sitMode=""; //not persisting between room changes?
		}
	}
}

//move objects
if alarm[0]==-1 for (var i=0;i<array_length(followObjs);i++)
{
	var _in=followObjs[i];
	if !instance_exists(_in)
	{
		array_delete(followObjs,i,1);
		i--;
		continue;
	}
	_in.x=x+_in.xOff*image_xscale;
	_in.y=y+_in.yOff*image_yscale;
	_in.image_xscale=_in.xscaleSign*image_xscale;
	_in.image_yscale=_in.yscaleSign*image_yscale;
}