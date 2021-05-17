

function oscillateVars(period,vAmp) constructor{
	pos=0;
	step=2*pi/period/60;
	amp=vAmp;
	change=0;
}

function oscillate(vars,axis,reset,onlyAlive){
	if argument_count>2&&reset
	{
		if axis=="x" x-=round(sin(vars.pos)*vars.amp);
		else if axis=="y" y-=round(sin(vars.pos)*vars.amp);
	}
	if global.alive||!onlyAlive vars.pos=(vars.pos+vars.step) mod (2*pi);
	if argument_count>1
	{
		change=round(sin(vars.pos)*vars.amp);
		if axis=="x" x+=change;
		else if axis=="y" y+=change;
	}
	return vars;
}