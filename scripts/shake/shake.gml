

function shake(shakeX,shakeY,time){
	oCamera.shakeX=shakeX*global.shakeFactor;
	oCamera.shakeY=shakeY*global.shakeFactor;
	oCamera.shakeTime=time;
	rumbleStart(rumbleType.shake);
}