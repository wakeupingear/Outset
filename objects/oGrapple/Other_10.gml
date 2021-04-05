/// @description Set upgrade
active=hasItem("iGrapple");
upgrades=[true,hasItem("iGrappleArc"),hasItem("iGrappleSwing"),hasItem("iGrappleDown"),hasItem("iGrappleAir")];

collPointX=[];
collPointY=[];
if !is_undefined(global.physCollPoints[?sprite_get_name(sprite_index)]) //import the sprite's coordinates if it exists
{
	collPointX=global.physCollPoints[?sprite_get_name(sprite_index)][0];
	collPointY=global.physCollPoints[?sprite_get_name(sprite_index)][1];
}