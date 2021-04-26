/// @description set dialogue
if key!="" text=textLoad(key);

if isHit&&hit==-1
{
	hit=instance_create_layer(x,y,layer,grappleHit);
	hit.sprite_index=sprite_index;
	hit.image_index=image_index;
}