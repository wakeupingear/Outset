/// @description touch player
if instance_exists(ply)&&distance_to_object(ply)<16&&place_meeting(x,y,ply)
{
	shake(2,2,10);
	rumbleStart(rumbleType.lightPulse);
	particle(x,y,depth+1,sNormalRipple,0,{distort: true,xscale:0.05,yscale:0.05,xscaleSpd:0.025,yscaleSpd:0.025,fade:0.025});
	var _if=instance_create_layer(0,0,"player",oItemFanfare);
	_if.image_index=image_index;
	conversation([
		"$addItem",[item,"text"],
	]);
	instance_destroy();
}