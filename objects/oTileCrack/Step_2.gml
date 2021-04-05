/// @description Move
if lastActive!=active
{
	lastActive=active;
	if !active
	{
		alarm[1]=-1;
		y=-20;
		if isHit>0 hit.y=y;
		var _dist=0;
		for (var i=0;i<destFrames[1]-destFrames[0];i++) if parts[i]!=-1
		{
			if instance_exists(parts[i])
			{
				_dist=point_distance(xstart,ystart,parts[i].x,parts[i].y);
			}
			else parts[i]=-1;
		}
		
		for (var i=0;i<destFrames[1]-destFrames[0];i++) if parts[i]==-1
		{
			createParticle(i,partSpd,_dist);
		}
	}
	else
	{
		var _dist=partSpd*(1+ceil(sqrt(sqr(max(xstart,room_width-xstart))+sqr(max(ystart,room_height-ystart)))/partSpd));
		alarm[1]=_dist/partSpd;
		for (var i=0;i<4;i++) 
		{
			createParticle(i,-partSpd,_dist);
		}
	}
}

//if mouse_check_button_pressed(mb_left) active=!active;