function runTrail(freq){
	if hsp!=0&&global.roomTime%round(freq*hspMax/hsp)==0 
	{
		var _scale=1+(global.roomTime%3==0);
		particle(x-xscale*(2+irandom(2)),y+collPointY[0]-irandom(2),depth-1,sPlaceholderPixelW,0,{spd:1.5,dir:90+90*xscale-xscale*irandom_range(0,50),alpha:1.5+0.3*abs(hsp)/hspMax,fade:0.2,xscale: _scale,yscale: _scale});
	}
}