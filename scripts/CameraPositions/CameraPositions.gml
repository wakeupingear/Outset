

function camX(){
	if !instance_exists(oCamera) return controller.lastCamX;
	return oCamera.x-192;
}
function camY(){
	if !instance_exists(oCamera) return controller.lastCamY;
	return oCamera.y-108;
}