

function setBGPosition(centerX,centerY){
	if xLerp==1 xOff=centerX;
	else xOff=round(centerX*(1-xLerp)+192*xLerp);
	if yLerp==1 yOff=centerY;
	else yOff=round(centerY*(1-yLerp)+108*yLerp);
}