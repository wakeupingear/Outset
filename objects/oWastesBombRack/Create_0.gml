image_speed=0;
animation=new Animation();
animation.standing={type: animType.singleFrame,startFrame:7};
animation.tipping={type: animType.pingPong,startFrame:6,endFrame:8,frameTime:7};
animation.falling={type: animType.singleFrame,startFrame:6};

mode=-1;
if hasData("wBRack")
{
	image_index=setAnimation("falling",animation);
	image_angle=90;
}
else
{
	image_index=setAnimation("standing",animation);
	angSpd=0;
	mode=0;
	leg=instance_create_depth(x,y,depth,enemWall);
	leg.myHealth=1;
	leg.sprite_index=sprite_index;
	leg.animation.standing.startFrame=2;
	leg.canDropSoul=false;
	if leg.hit!=noone
	{
		leg.hit.sprite_index=sprite_index;
		leg.hit.image_index=1;
	}
}