/// @description Trail+hook
if state!=0
{
	if !instance_exists(oGrapplePoint) pixelLine(ply.x,ply.y+grapplePlyYoff,x,y);
	else
	{
		with ply if !place_meeting(x,y+oGrapple.grapplePlyYoff,oGrapplePoint) ds_list_insert(oGrapple.points,0,instance_create_depth(x,y+oGrapple.grapplePlyYoff,depth+1,oGrapplePoint));
		var _size=ds_list_size(points);
		pixelLine(ply.x,ply.y+grapplePlyYoff,points[|0].x,points[|0].y);
		for (var i=1;i<_size;i++) 
		{
			pixelLine(points[|i-1].x,points[|i-1].y,points[|i].x,points[|i].y);
		}
		//pixelLine(points[|_size-1].x,points[|_size-1].y,ply.x,ply.y);
	}
}

draw_self();
