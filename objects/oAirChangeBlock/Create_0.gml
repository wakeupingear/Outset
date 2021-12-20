event_inherited();
image_speed=0;
hit=instance_create_depth(x,y,depth,hitobj);
hit.sprite_index=sprite_index;
state=image_index;

toggleFunc=function(){
	image_index=!on;
	hit.x=x-4000*(!on);
}