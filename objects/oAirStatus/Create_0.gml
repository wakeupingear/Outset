event_inherited();
image_speed=0;

flipAnimation=new Animation();
flipAnimation.on={type: animType.oneOff,startFrame:0,endFrame:2,frameTime:4};
flipAnimation.off={type: animType.oneOff,startFrame:flipAnimation.on.endFrame,endFrame:0,frameTime:flipAnimation.on.frameTime};

toggleFunc=function(){
	if on setAnimation("on",flipAnimation);
	else setAnimation("off",flipAnimation);
}