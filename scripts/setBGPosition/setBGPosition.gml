// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function setBGPosition(centerX,centerY){
	xOff=round(centerX*(1-xLerp)+192*xLerp);
	yOff=round(centerY*(1-yLerp)+108*yLerp);
}