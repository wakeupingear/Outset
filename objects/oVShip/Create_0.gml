event_inherited();
image_speed=0;

xLerp=0.65;
yLerp=0.65;

spd=0.05;
maxChange=8;

guns=[1,1];
fireSide=1; //starts on right because the timing is nice for the prologue - doesn't really matter

hoverPos=new Vector2(x,y);
leftBar= new Vector2(1375,416);
rightBar= new Vector2(1375,416);
if global.roomTime>1
{
	if global.notdonEra==notdonEras.pro1 
	{
		hoverPos=new Vector2(1295,120);
		leftBar= new Vector2(1375,416);
		rightBar= new Vector2(1375,416);
		guns=[3,3];
	}
	else if global.notdonEra==notdonEras.pro2 
	{
		hoverPos=new Vector2(2167,340);
		leftBar= new Vector2(2004,595);
		rightBar= new Vector2(2004,595);
	}
}

if !eventExists(object_index,room,hoverPos.x,hoverPos.y,"bg",[]) eventAddObject(object_index,room,hoverPos.x,hoverPos.y,"bg",[]);
else
{
	alarm[4]=60;
}
moving=false;

yVars=new oscillateVars(240,12)

setPosTo= function(_x,_y){
	setBGPosition(_x,_y);
	xTo=xOff;
	yTo=yOff;
	setBGPosition(xstart,ystart);
}
setPosTo(hoverPos.x,hoverPos.y);

barriersUp=[false,false];
barriersPos=[0,0]; //scale of barrier sprite
alarm[3]=2;

lightningFrame=0;
lightningQueue=ds_queue_create();