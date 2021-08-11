/// @description Move
if global.alive&&mode>-1
{
	if mode==0
	{
		if !instance_exists(leg)
		{
			mode=0.8;
			alarm[0]=60;
		}
	}
	else if mode==1
	{
		setAnimation("tipping",animation);
		mode=1.8;
		alarm[0]=60;
	}
	else if mode==2
	{
		image_index=setAnimation("falling",animation);
		mode=3;
	}
	else if mode==3
	{
		angSpd+=0.25;
		image_angle+=floor(angSpd);
		if image_angle>90
		{
			image_angle=90;
			shake(2,2,20);
			var _b=instance_create_layer(x+lengthdir_x(105,image_angle+90),y+lengthdir_y(105,image_angle+90),"people",oExplosiveBarrel);
			_b.move=-1;
			mode=4;
		}
	}
	else if mode==4
	{
		if !instance_exists(oWastesCrate)
		{
			mode=4.8;
			alarm[0]=60;
			addData("wBRack");
			if !global.menuOpen save();
		}
	}
}