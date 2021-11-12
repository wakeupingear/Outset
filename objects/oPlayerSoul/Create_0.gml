global.plyX=x;
global.plyY=y;
event_inherited();
image_alpha=1;
xscale=1;

while groundCollision(x,y) y--;

if !instance_exists(oPlayerCam) instance_create_depth(global.plyX,global.plyY,-10000,oPlayerCam);

aberration=instance_create_layer(0,0,"behindMyko",obj_FTF_chromaticAberration);
blur=instance_create_layer(0,0,"behindMyko",obj_FTF_blur);
//blur.radius=0.5;

if global.roomTime>10 
{
	animateProperty(aberration,"offsetX",TwerpType.out_back,0,aberration.offsetX,0.01,false);
	animateProperty(aberration,"offsetY",TwerpType.out_back,0,aberration.offsetY,0.01,false);
	animateProperty(blur,"alpha",TwerpType.in_cubic,0,1,0.01,false);
	
	particle(x,y,depth+1,sNormalRipple,0,{distort: true,xscale:0.05,yscale:0.05,xscaleSpd:0.03,yscaleSpd:0.03,fade:0.05,alpha:2,alwaysMove: true});
}