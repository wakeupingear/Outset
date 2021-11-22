

function guiX(){
	return controller.hudResolution[global.guiScale][0]/384;
}

function guiY(){
	return controller.hudResolution[global.guiScale][1]/216;
}

function toGuiX(xPos){
	return (xPos-camX())*guiX();
}

function toGuiY(yPos){
	return (yPos-camY())*guiY();
}