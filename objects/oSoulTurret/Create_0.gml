event_inherited();

mask_index=sMykoTurretAim;

isHit=true;
hit=instance_create_depth(x,y,depth+1,hitobj);
hit.sprite_index=sMykoTurretColl;
updateColl=function(){
	hit.image_xscale=image_xscale;
	hit.image_yscale=image_yscale;
}

firing=false;
fireMode=0;