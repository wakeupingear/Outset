/// @description Create wreckage
event_inherited();

wreckage=instance_create_depth(x,y,depth,oInteractable);
wreckage.key="notdon_dummyWreck";
wreckage.isHit=true;
wreckage.sprite_index=sprite_index;
wreckage.image_xscale=xscale;
wreckage.image_speed=0;
wreckage.image_index=0;
wreckage.visible=true;