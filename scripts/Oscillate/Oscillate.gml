

function oscillateVars(period,vAmp) constructor{
	pos=0;
	step=2*pi/period;
	amp=vAmp;
}

function oscillate(vars,axis,reset,onlyAlive){
	if argument_count>2&&reset
	{
		if axis=="x" x-=round(sin(vars.pos)*vars.amp);
		else if axis=="y" y-=round(sin(vars.pos)*vars.amp);
	}
	var _newPos=vars.pos;
	if global.alive||!onlyAlive _newPos=(_newPos+vars.step) mod (2*pi);
	if argument_count>1
	{
		if axis=="x" x+=round(sin(_newPos)*vars.amp);
		else if axis=="y" y+=round(sin(_newPos)*vars.amp);
	}
	return _newPos;
}