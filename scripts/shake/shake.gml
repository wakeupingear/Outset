// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function shake(shakeX,shakeY,time){
	if ds_list_find_index(global.accessibility,"shake")>-1{
	oCamera.shakeX=shakeX;
	oCamera.shakeY=shakeY;
	oCamera.shakeTime=time;
	}
}