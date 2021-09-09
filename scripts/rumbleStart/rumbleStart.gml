enum rumbleType{
	deepPulse,
	heavyPulse,
	lightPulse,
	lighterPulse,
	shake
}

function rumbleStart(key){
	if !isHtml&&global.controllerConnected with controller{
		alarm[1]=1;
	switch (key)
	{
		case rumbleType.lightPulse:
			rumble[0]=0.5;
			rumble[1]=0.5;
			rumbleStep=5;
			rumbleDown=[rumble[0]/2,rumble[0]/2];
			break;
		case rumbleType.lighterPulse:
			rumble[0]=0.07;
			rumble[1]=0.07;
			rumbleStep=6;
			rumbleDown=[rumble[0],rumble[1]];
			break;
		case rumbleType.heavyPulse:
			rumble[0]=0.8;
			rumble[1]=0.8;
			rumbleStep=8;
			rumbleDown=[rumble[0]/4,rumble[1]/4];
			break;
		case rumbleType.deepPulse:
			rumble[0]=1;
			rumble[1]=1;
			rumbleStep=9;
			rumbleDown=[rumble[0]/5,rumble[1]/5];
			break;
		case rumbleType.shake:
			rumble[0]=1;
			rumble[1]=1;
			rumbleStep=oCamera.shakeTime;
			rumbleDown=[1,1];
			break;
		default: 
			alarm[1]=-1;
			break;
	}
	}
}