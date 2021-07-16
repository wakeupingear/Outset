function offscreen(xPos,yPos){
	return xPos<-50||xPos>room_width+50||yPos<-50||yPos>room_height+50;
}