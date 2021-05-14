

function shake(shakeX,shakeY,time){
	if ds_list_find_index(global.accessibility,"shake")>-1{
	oCamera.shakeX=shakeX;
	oCamera.shakeY=shakeY;
	oCamera.shakeTime=time;
	}
}