verticalAmp=5;
yOff=-4;
horiAmpMax=50;

setParent=function(){
	if instance_exists(oPlayerSoul) parentObj=oPlayerSoul;
	else parentObj=ply;
}
setParent();

horiAmp=horiAmpMax*parentObj.xscale;

setPos=function(_x,_y){
	if !instance_exists(parentObj) setParent();
	if (image_xscale==1&&horiAmp<horiAmpMax)||(image_xscale==-1&&horiAmp>-horiAmpMax)
	{
		horiAmp+=(1+clamp(abs(parentObj.hsp-parentObj.hspMax),0,4))*image_xscale;
	}
	x=_x+horiAmp;
	y=_y+(yOff+parentObj.vsp)*verticalAmp;
}

setPos(global.plyX,global.plyY);