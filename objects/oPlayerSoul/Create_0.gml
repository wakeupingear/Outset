global.plyX=x;
global.plyY=y;
event_inherited();
image_alpha=1;
xscale=1;

while groundCollision(x,y) y--;

if !instance_exists(oPlayerCam) instance_create_depth(global.plyX,global.plyY,-10000,oPlayerCam);

if global.roomTime>10 
{
	particle(x,y,depth+1,sNormalRipple,0,{distort: true,xscale:0.05,yscale:0.05,xscaleSpd:0.03,yscaleSpd:0.03,fade:0.05,alpha:2,alwaysMove: true});
}