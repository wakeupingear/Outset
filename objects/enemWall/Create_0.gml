event_inherited();

uid="wall"+string(x)+string(y);
if hasData(uid) instance_destroy(id,false);
else
{
	hit=instance_create_depth(x,y,depth,hitobj);
	hit.sprite_index=sprite_index;
	hit.image_index=image_index+1;
}

damage=0;
myHealth=1;
animation.standing={type: animType.singleFrame,startFrame: image_index};
state=moveState.floating;