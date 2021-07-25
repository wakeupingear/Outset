event_inherited();

animation.standing={type: animType.loop,startFrame:1,endFrame:2,frameTime:10};
attacking=false;

gunAngle=0;
seesPlayer=false;
mode=0;
shootNum=3;
shootCount=0;

if !instance_exists(oSparkleController) instance_create_depth(0,0,layer_get_depth(layer_get_name("people"))+1,oSparkleController);

shimmerDraw=function(){
	draw_sprite_ext(sTurretSmallPath,0,x-camX(),y-camY(),xscale,yscale,image_angle+gunAngle,image_blend,1);
}