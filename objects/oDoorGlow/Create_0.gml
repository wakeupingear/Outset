image_speed=0;
image_alpha=0;

if !instance_exists(oSparkleController) instance_create_depth(0,0,layer_get_depth(layer_get_name("people"))+1,oSparkleController);
scale=1;
osci=0;
if global.rooms[$ room_get_name(room)].region==worldRegion.west image_blend=c_yellow;
shimmerDraw=function(){
	if image_alpha<1 image_alpha+=0.05;
	if global.alive osci=(osci+0.05)%(2*pi);
	scale=1+max(0,sin(osci))*0.3;
	draw_sprite_ext(sprite_index,image_index,x-camX(),y-camY(),image_xscale*scale,image_yscale*scale,image_angle,image_blend,image_alpha);
}