/// @description AI

if global.alive
{
	if mode==0
	{
		if enemActive&&alarm[4]==-1 alarm[4]=xscaleTime;
		if distance_to_object(ply)<triggerDist
		{
			if !enemActive
			{
				if animation.currentAnimation!="rising" image_index=setAnimation("rising",animation);
				if image_index==6
				{
					enemActive=true;
					setAnimation("standing",animation);
				}
			}
			else 
			{
				if animation.currentAnimation!="standing" image_index=setAnimation("standing",animation);
				if sign(x-ply.x)==image_xscale
				{
					if ply.y-y>-24
					{
						mode=0.8;
						alarm[4]=-1;
						alarm[3]=60;
						facePlayer=true;
						image_index=setAnimation("charge",animation);
					}
				}
			}
		}
	}
	else if mode>0 //charge
	{
		if mode==1
		{
			mode=1.8;
			alarm[3]=40;
			facePlayer=false;
		}
		else if mode==2
		{
			move=-image_xscale;
			mode=2.8;
			alarm[3]=60;
		}
		else if mode==3
		{
			move=0;
			image_index=setAnimation("resting",animation);
			mode=0.2;
			alarm[3]=60;
		}
	}
	else //jump
	{
		mode=0	
	}
}
event_inherited();