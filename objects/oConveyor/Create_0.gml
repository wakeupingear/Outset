spd=2;
spr=sConveyor;
sprW=sprite_get_width(spr);
sprH=sprite_get_height(spr);
playerMoved=false;

objs=ds_list_create();

moveObjects=function(_xDir,_yDir) {
	ds_list_clear(objs);
	instance_place_list(x+_xDir,y+_yDir,oPhysicsObj,objs,false);
	if instance_exists(oGrapple)&&oGrapple.state>0&&place_meeting(x,y,oGrapple)
	{
		if oGrapple.xDir==-_xDir&&oGrapple.yDir==-_yDir ds_list_add(objs,instance_nearest(x,y,oGrapple));
	}
	_xDir*=image_speed;
	_yDir*=-image_speed;
	y-=2000;
	for (var i=0;i<ds_list_size(objs);i++)
	{
		var _i=objs[|i];
		if sign(_yDir)==-1&&isObj(_i,ply) //stop adjacent conveyors from moving the player multiple times
		{
			if playerMoved continue;
			with oConveyor playerMoved=true;
		}
		with _i
		{
			x+=_yDir;
			y+=_xDir;
			if object_index==oGrapple&&place_meeting(x,y,oConveyor)
			{
				var _c=instance_place(x,y,oConveyor);
				while place_meeting(x,y,_c)
				{
					x-=sign(_yDir);
					y-=sign(_xDir);
				}
				xDir=0;
				yDir=0;
				with _c
				{
					if place_meeting(x,y-1,oGrapple) oGrapple.yDir=1;
					else if place_meeting(x,y+1,oGrapple) oGrapple.yDir=-1;
					else if place_meeting(x-1,y,oGrapple) oGrapple.xDir=1;
					else oGrapple.xDir=-1;
				}
				show_message("X: "+string(xDir)+"; Y: "+string(yDir));
				while place_meeting(x,y-2000,oConveyor) 
				{
					x+=xDir;
					y+=yDir;
				}
				ply.hsp=0;
				ply.vsp=0;
			}
			else while groundCollision(x,y)
			{
				x-=sign(_yDir);
				y-=sign(_xDir);
			}
		}
	}
	y+=2000;
}