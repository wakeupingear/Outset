// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function offscreen(xPos,yPos){
	return xPos<-50||xPos>room_width+50||yPos<-50||yPos>room_height+50;
}