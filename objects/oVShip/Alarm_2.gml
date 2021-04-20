/// @description Lighting
if lightningFrame==0 lightningFrame=3;
else lightningFrame++;
if lightningFrame>3
{
	var _val=ds_queue_dequeue(lightningQueue);
	if !is_undefined(_val) 
	{
		switch (_val)
		{
			case "rightBarrier":
				var _l=instance_create_layer(rightBar.x,rightBar.y,"people",oLightningBolt);
				eventAddObject(oVBarrier,room,rightBar.x,rightBar.y,"people",[1]); //args is xscale
				var _b=instance_create_layer(rightBar.x,rightBar.y,"people",oVBarrier);
				_l.trigger=_b;
				with _b
				{
					image_alpha=0;
					leftBar.image_alpha=0;
					rightBar.image_alpha=0;
				}
				barriersUp[1]=true;
				barriersPos[1]=0.05;
				break;
			case "leftBarrier":
				var _l=instance_create_layer(leftBar.x,leftBar.y,"people",oLightningBolt);
				eventAddObject(oVBarrier,room,leftBar.x,leftBar.y,"people",[-1]); //args is xscale
				var _b=instance_create_layer(leftBar.x,leftBar.y,"people",oVBarrier);
				_l.trigger=_b;
				with _b
				{
					image_xscale=-1;
					image_alpha=0;
					leftBar.image_alpha=0;
					rightBar.image_alpha=0;
				}
				barriersUp[0]=true;
				barriersPos[0]=0.05;
				break;
			default: break;
		}
		lightningFrame=0;
		if !ds_queue_empty(lightningQueue) alarm[2]=1;
	}
}
else alarm[2]=3;