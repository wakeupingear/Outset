event_inherited();

isHit=true;
hit=instance_create_depth(x,y,depth,grappleHit);
hit.sprite_index=sprite_index;
hit.visible=true;
hit.image_alpha=1;
updateColl=function(){
	hit.image_xscale=image_xscale;
	hit.image_yscale=image_yscale;
	if image_xscale==0||image_yscale==0 hit.x=-1000;
	else hit.x=x;
	if instance_exists(oGrapple)&&oGrapple.followObj==id resetGrapple();
}


startXS=1;
startYS=0;
endXS=1;
endYS=1;
xSpd=0;
ySpd=0.2;
image_xscale=0;
image_yscale=0;

platform=-1;

resetTime=30;
bounceVsp=-7;