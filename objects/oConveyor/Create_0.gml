spd=2;
spr=sConveyor;
sprW=sprite_get_width(spr);
sprH=sprite_get_height(spr);

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
		with _i
		{
			x+=_yDir;
			y+=_xDir;
			if object_index==oGrapple&&place_meeting(x,y,oConveyor)
			{
				while place_meeting(x,y-2000,oConveyor) 
				{
					x-=_xDir*2;
					y-=_yDir*2;
				}
				xDir=_yDir;
				yDir=-_xDir;
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