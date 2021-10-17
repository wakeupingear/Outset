/// @description Animation specifics
event_inherited();

//need to set animations here since the struct and event both happen in the inherited Create event
animation.buried={type: animType.singleFrame,startFrame:3};
animation.popUp={type: animType.oneOff,startFrame:3,endFrame:8,frameTime:3};
if room==rWastesCrater&&location=="wastes_buried" image_index=setAnimation("buried",animation);
if animation.currentAnimation!="standing" useDefaultAnimations=false;