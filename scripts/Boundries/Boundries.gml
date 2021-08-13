function offscreen(xPos,yPos){
	return xPos<-50||xPos>room_width+50||yPos<-50||yPos>room_height+50;
}

function inFrame(xPos,yPos){ //BACKGROUNDS ONLY
	return x>camX()-384*2&&x<camX()+384*3&&y>camY()-216*2&&y<camY()+216*3;
}