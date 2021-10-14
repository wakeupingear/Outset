event_inherited();

xLerp=0.55;
yLerp=0.55;

setBGPosition(xstart,ystart);
if global.notdonEra<notdonEras.present yOff+=600//visible=false;

//tunnel
num=160;
subNum=4;
subScale=0.1;
standPos=[0.1,0.3,0.5];
tunnel= -1;
tunnelFunc=-1;

hoverOsci=new oscillateVars(6,4);
hoverOsci.pos=x%256;