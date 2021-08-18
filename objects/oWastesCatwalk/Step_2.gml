/// @description Ring
if image_index==1
{
	if ring==-1
	{
		ring=instance_create_depth(x,y,depth,oGrappleRing);
		ring.visible=false;
	}
	ring.x=x+round(lengthdir_x(32*image_xscale,image_angle+180-image_xscale*10));
	ring.y=y+round(lengthdir_y(32*image_xscale,image_angle+180-image_xscale*10));
}