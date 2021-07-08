event_inherited();
image_speed=0;

enemActive=false;
hspMax*=3;
stateToAnim=[];
myHealth=4;
mode=0;
triggerDist=128;
xscaleTime=120;

animation.hiding={type: animType.singleFrame, startFrame:18};
animation.rising={type: animType.oneOff, startFrame:1, endFrame:6, frameTime: 5};
animation.standing={type: animType.loop, startFrame:6, endFrame:7, frameTime: 15};
animation.charge={type: animType.loop, startFrame:7, endFrame:8, frameTime: 5};
animation.running={type: animType.loop, startFrame:8, endFrame:9, frameTime: 10};
animation.resting={type: animType.loop, startFrame:16, endFrame:17, frameTime: 15};
animation.falling={type: animType.singleFrame, startFrame:10};
animation.sliding={type: animType.singleFrame, startFrame:11};

setAnimation("hiding",animation);