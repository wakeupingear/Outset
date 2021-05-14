

function camX(){
	if !instance_exists(oCamera) return 0;
	return oCamera.x-192;
}
function camY(){
	if !instance_exists(oCamera) return 0;
	return oCamera.y-108;
}