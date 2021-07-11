event_inherited();
image_speed=0;
image_index=18;

enemActive=false;
hspMax*=3;
stateToAnim=[];
myHealth=4;
mode=0;
triggerDist=128;
xscaleTime=120;

canRise=hasData("wRain");

bounce=instance_create_depth(x,y,depth+1,enemGreemerBounce);
bounce.parent=id;
bounceData=array_create(image_number,-1);

animation.hiding={type: animType.singleFrame, startFrame:18};
bounceData[18]=[0,8,2];
animation.rising={type: animType.oneOff, startFrame:1, endFrame:6, frameTime: 5};
bounceData[1]=[0,7,2];
bounceData[2]=[0,5,2];
bounceData[3]=[-1,-5,0];
bounceData[4]=[-1,-7,0];
bounceData[5]=[-1,-8,0];
animation.standing={type: animType.loop, startFrame:6, endFrame:7, frameTime: 15};
bounceData[6]=[-2,-9,0];
bounceData[7]=[-3,-9,0];
animation.charge={type: animType.loop, startFrame:7, endFrame:8, frameTime: 5};
bounceData[8]=[-2,-9,0];
animation.running={type: animType.loop, startFrame:8, endFrame:9, frameTime: 10};
animation.resting={type: animType.loop, startFrame:16, endFrame:17, frameTime: 15};
bounceData[16]=[-2,-8,0];
bounceData[17]=[-3,-7,0];
animation.falling={type: animType.singleFrame, startFrame:10};
bounceData[10]=[0,-2,2];
animation.sliding={type: animType.singleFrame, startFrame:11};
bounceData[11]=[-1,-2,2];

setAnimation("hiding",animation);