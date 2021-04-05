// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function camX(){
	if !instance_exists(oCamera) return 0;
	return oCamera.x-192;
}
function camY(){
	if !instance_exists(oCamera) return 0;
	return oCamera.y-108;
}