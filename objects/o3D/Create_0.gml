frameFunc=-1;
//frameFunc=function(_i,num){ return 1+((round(_i)%(num/(subNum)))<=num*subScale);}
obj=-1;

startObj=-1;
startXScale=0.75;
startYScale=0.75;
startXOff=0;
startYOff=0;
startScale=0.5;

objSpr=sBarrelRadius;
objIndex=0;
extraSprites=[];
isShaded=true;
alwaysUpdate=false;
num=20;
smallScale=0.5;
objColor=-1;
objAngle=0;
objAlpha=1;
drawDir=1;

event_user(0);
/*[[[sReactorTunnelPylon,0,-1,0,1],0.2],
[[sReactorTunnelPylon,0,-1,0,1],0.45],
[[sReactorTunnelPylon,0,-1,0,1],0.7]]*/