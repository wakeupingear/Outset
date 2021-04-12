if instance_exists(oGrapple)&&oGrapple.state!=0//&&false
{
	if !instance_exists(oGrapplePoint) pixelLine(x,y+oGrapple.grapplePlyYoff,oGrapple.x,oGrapple.y);
	else
	{
		draw_set_color(c_white)
		if !place_meeting(x,y+oGrapple.grapplePlyYoff,oGrapplePoint) ds_list_insert(oGrapple.points,0,instance_create_depth(x,y+oGrapple.grapplePlyYoff,depth+1,oGrapplePoint));
		var _size=ds_list_size(oGrapple.points);
		pixelLine(x,y+oGrapple.grapplePlyYoff,oGrapple.points[|0].x,oGrapple.points[|0].y);
		for (var i=1;i<_size;i++) 
		{
			pixelLine(oGrapple.points[|i-1].x,oGrapple.points[|i-1].y,oGrapple.points[|i].x,oGrapple.points[|i].y);
		}
		pixelLine(oGrapple.points[|_size-1].x,oGrapple.points[|_size-1].y,oGrapple.x,oGrapple.y);
	}
}
draw_sprite_ext(sprite_index,image_index,x,y,xscale,yscale,0,image_blend,image_alpha);