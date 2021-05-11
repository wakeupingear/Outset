image_speed=3;
spr=sConveyor;
sprW=sprite_get_width(spr);
sprH=sprite_get_height(spr);

objs=ds_list_create();

function moveObjects(xDir,yDir) {
	ds_list_clear(objs);
	instance_place_list(x+xDir,y+yDir,oPhysicsObj,objs,false);
	if instance_exists(oGrapple)&&oGrapple.state>0&&place_meeting(x,y,oGrapple)
	{
		if oGrapple.xDir==-xDir&&oGrapple.yDir==-yDir ds_list_add(objs,instance_nearest(x,y,oGrapple));
	}
	xDir*=image_speed;
	yDir*=-image_speed;
	y-=2000;
	for (var i=0;i<ds_list_size(objs);i++)
	{
		var _i=objs[|i];
		with _i
		{
			x+=yDir;
			y+=xDir;
			while groundCollision(x,y)
			{
				x-=sign(yDir);
				y-=sign(xDir);
			}
		}
	}
	y+=2000;
}