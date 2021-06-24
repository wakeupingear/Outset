event_inherited();

moving=false;
touch=false;
plyDist=0;
spd=4;
dir=0;

while image_angle<0 image_angle+=360;
while image_angle>=360 image_angle-=360;

yOff=round(abs(image_yscale)/1.5)*sign(image_yscale)*((image_angle>270||image_angle<90)-(image_angle>90&&image_angle<270));

setPos=function(){
	lastAng=image_angle;
	if image_angle<180
	{
		lowX=x;
		lowY=y;
		highX=x+lengthdir_x(image_xscale,image_angle);
		highY=y+lengthdir_y(image_xscale,image_angle);
	}
	else
	{
		highX=x;
		highY=y;
		lowX=x+lengthdir_x(image_xscale,image_angle);
		lowY=y+lengthdir_y(image_xscale,image_angle);
	}
}
setPos();

startXS=0;
startZip=function(){
	moving=true;
	ply.state=moveState.zipline;
	plyDist=point_distance(x,y,ply.x,ply.y);
	if x>ply.x
	{
		dir=-startXS;
	}
	else if x<ply.x
	{
		dir=startXS;
	}
	ply.x=x+round(lengthdir_x(plyDist,image_angle));
	ply.y=y+round(lengthdir_y(plyDist,image_angle))+yOff;
	if instance_exists(oGrapple)
	{
		resetGrapple();
		oGrapple.x=ply.x;
		oGrapple.y=ply.y;
	}
}