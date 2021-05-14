

function guiX(){
	return global.guiScale*1920/384;
}

function guiY(){
	return global.guiScale*1080/216;
}

function toGuiX(xPos){
	return (xPos-camX())*guiX()
}

function toGuiY(yPos){
	return (yPos-camY())*guiY()
}