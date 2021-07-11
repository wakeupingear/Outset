/// @description Animation + bounce
event_inherited();

bounce.image_xscale=xscale;
bounce.x=x;
bounce.y=y;
if bounceData[image_index]!=-1
{
	bounce.x+=bounceData[image_index][0]*xscale;
	bounce.y+=bounceData[image_index][1]*yscale;
	bounce.image_index=bounceData[image_index][2];
}