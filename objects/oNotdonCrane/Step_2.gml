/// @description Animation
event_inherited();

reactor.x=x+round(lengthdir_x(284*image_xscale,image_angle));
reactor.y=y+round(lengthdir_y(284*image_xscale,image_angle))+67*abs(image_xscale);
reactor.image_xscale=abs(image_xscale);
reactor.image_yscale=reactor.image_xscale;
reactor.image_blend=merge_color(c_black,c_white,abs(image_xscale)*0.7+0.3)
with reactor
{
	savePoint.x=x;
	savePoint.y=y;
}