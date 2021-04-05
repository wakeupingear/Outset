image_speed=0;
ind=1; //image_index not working?

xSpd=0;
ySpd=0;
startXS=image_xscale;
startYS=image_yscale;
endXS=image_xscale;
endYS=image_yscale;
active=false;
autoParent=-1;
if abs(image_xscale)>abs(image_yscale)
{
	xSpd=sign(image_xscale);
	startXS=0;
}
else
{
	ySpd=sign(image_yscale);
	startYS=0;
}

image_xscale=startXS;
image_yscale=startYS;

spd=4
xSpd*=spd;
ySpd*=spd;

//parent=-1;
children=[];
parentPlat=-1

isHit=false;
stop=-1;