event_inherited();
image_speed=0;

animation.standing={type: animType.singleFrame,startFrame: 1};
animation.walking={type: animType.pingPong,startFrame: 0,endFrame: 2,frameTime: 10};

sideFrame=3;
topFrame=5;

flipAnimation=new Animation();
flipAnimation.flipUp={type: animType.oneOff,startFrame:sideFrame,endFrame:topFrame,frameTime:13};
flipAnimation.flipDown={type: animType.oneOff,startFrame:topFrame,endFrame:sideFrame,frameTime:13};
flipIndex=sideFrame;
flipAnimation.animating=false;