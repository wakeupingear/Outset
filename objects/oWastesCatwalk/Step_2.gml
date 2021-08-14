/// @description Ring
if image_index==1
{
	if ring==-1
	{
		ring=instance_create_depth(x,y,depth,oGrappleRing);
		ring.visible=false;
	}
	ring.x=x+lengthdir_x(32,image_angle+170);
	ring.y=y+lengthdir_y(32,image_angle+170);
}