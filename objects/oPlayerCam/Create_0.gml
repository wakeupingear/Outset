verticalAmp=5;
yOff=-4;
horiAmpMax=50;
horiAmp=horiAmpMax*ply.xscale;

setPos=function(_x,_y){
	if (image_xscale==1&&horiAmp<horiAmpMax)||(image_xscale==-1&&horiAmp>-horiAmpMax)
	{
		horiAmp+=(1+clamp(abs(ply.hsp-ply.hspMax),0,4))*image_xscale;
	}
	x=_x+horiAmp;
	y=_y+(yOff+ply.vsp)*verticalAmp;
}

setPos(global.plyX,global.plyY);