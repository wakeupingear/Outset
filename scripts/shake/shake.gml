

function shake(shakeX,shakeY,time){
	if instance_exists(oCamera)
	{
		oCamera.shakeX=shakeX*global.shakeFactor;
		oCamera.shakeY=shakeY*global.shakeFactor;
		oCamera.shakeTime=time;
	}
	rumbleStart(rumbleType.shake);
}