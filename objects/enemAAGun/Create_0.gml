 event_inherited();

animation.standing={type: animType.singleFrame, startFrame:0};
attacking=false;
myHealth=3;

mode=0;
gunBlend=c_white;

if !instance_exists(oSparkleController) instance_create_depth(0,0,layer_get_depth(layer_get_name("people"))+1,oSparkleController);
shimmerDraw=function(){
	var _x=x-camX();
	var _y=y-camY();
	draw_sprite_ext(sAAGunScope,0,_x,_y,xscale,yscale,image_angle,gunBlend,1);
	/*draw_set_color(gunBlend);
	draw_primitive_begin(pr_trianglelist);
	draw_vertex(_x,_y);
	draw_vertex(_x+600,_y-600);
	draw_vertex(_x-5,_y-5);
	draw_vertex(_x+600-5,_y-600-5);
	draw_primitive_end();
	draw_set_color(c_white);*/
}

shimmerPostDraw=function(){
	draw_set_color(gunBlend);
	shimmerDraw();
	draw_set_color(c_white);
}