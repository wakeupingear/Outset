event_inherited();
image_index=4;
xscaleFlip=false;

mode=0;
attacking=false;

animation.standing={type: animType.singleFrame,startFrame: 22};
animation.driving={type: animType.loop,startFrame: 22, endFrame:23,frameTime:7};
stateToAnim[moveState.running]="driving";

bodyAnimation=new Animation();
bodyAnimation.standing={type: animType.loop,startFrame: 4,endFrame:12,frameTime:8};
bodyIndex=4;

headAnimation=new Animation();
headAnimation.standing={type: animType.loop,startFrame: 2,endFrame:3,frameTime:25};
headIndex=2;

armAnimation=new Animation();
armAnimation.standing={type: animType.singleFrame,startFrame: 13};
armAnimation.swinging={type: animType.oneOff,startFrame: 13,endFrame: 20,frameTime: 8};
armIndex=13;
armAngle=0;